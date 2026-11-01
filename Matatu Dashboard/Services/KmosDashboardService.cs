using System.Globalization;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Text.Json;
using Matatu_Dashboard.Models;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Options;

namespace Matatu_Dashboard.Services;

/// <summary>
/// Reads the KMOS NAV instance (KmoService / company KMO) over OData.
///
/// This is a DIFFERENT Business Central install from the CityServices one behind the rest of the
/// dashboard, so nothing here shares state with <see cref="BusinessCentralDashboardService"/>:
/// its own options section ("Kmos"), its own cache keys and its own HTTP calls.
///
/// NAV's OData endpoint is the OData **v3** flavour and has a few hard limitations that shape the
/// code below:
///   * $count / $inlinecount are rejected outright ("not supported by NAV OData web services");
///   * $orderby is accepted but ignored, so every ordering is done after the rows are read;
///   * paging comes back as "odata.nextLink" (no leading @);
///   * every Edm.Decimal arrives as a JSON **string** (e.g. "300"), so amounts are parsed, not read.
/// Date ranges are therefore pushed into $filter and the aggregation happens in memory.
/// </summary>
public sealed class KmosDashboardService
{
    private readonly KmosOptions _options;
    private readonly BusinessCentralDashboardOptions _credentials;
    private readonly IMemoryCache _cache;
    private readonly ILogger<KmosDashboardService> _logger;

    public KmosDashboardService(
        IOptions<KmosOptions> options,
        IOptions<BusinessCentralDashboardOptions> credentials,
        IMemoryCache cache,
        ILogger<KmosDashboardService> logger)
    {
        _options = options.Value;
        _credentials = credentials.Value;
        _cache = cache;
        _logger = logger;
    }

    public async Task<KmosDashboardViewModel> GetDashboardAsync(string? range, CancellationToken cancellationToken = default)
    {
        var selectedRange = NormalizeRange(range);
        var cacheKey = $"kmos:{selectedRange}";

        if (_options.CacheSeconds > 0 && _cache.TryGetValue<KmosDashboardViewModel>(cacheKey, out var cached) && cached is not null)
        {
            return cached;
        }

        var model = await BuildAsync(selectedRange, cancellationToken);

        if (_options.CacheSeconds > 0 && string.IsNullOrWhiteSpace(model.ErrorMessage))
        {
            _cache.Set(cacheKey, model, TimeSpan.FromSeconds(_options.CacheSeconds));
        }

        return model;
    }

    private async Task<KmosDashboardViewModel> BuildAsync(string selectedRange, CancellationToken cancellationToken)
    {
        var (start, end, label) = ResolveRange(selectedRange);
        var model = new KmosDashboardViewModel
        {
            Range = selectedRange,
            RangeLabel = label,
            RangeStart = start,
            RangeEnd = end,
            RetrievedAt = DateTime.Now,
            ServiceUrl = _options.BaseUrl
        };

        try
        {
            using var handler = CreateHandler();
            using var httpClient = new HttpClient(handler) { Timeout = TimeSpan.FromSeconds(Math.Max(30, _options.TimeoutSeconds)) };

            var truncation = new TruncationFlag();
            var transactionFilter = BuildDateFilter("Transaction_Date", start, end);
            var smsFilter = BuildDateFilter("Date_Sent_to_Server", start, end);

            var membersTask = LoadAsync(httpClient, "Members", null, _options.MaxMasterRows, truncation, cancellationToken);
            var creditsTask = LoadAsync(httpClient, "Credits", null, _options.MaxMasterRows, truncation, cancellationToken);
            var vehiclesTask = LoadAsync(httpClient, "Vehicles", null, _options.MaxMasterRows, truncation, cancellationToken);
            var usersTask = LoadAsync(httpClient, "Users", null, _options.MaxMasterRows, truncation, cancellationToken);
            var transtypesTask = LoadAsync(httpClient, "Transtypes", null, _options.MaxMasterRows, truncation, cancellationToken);
            var transactionsTask = LoadAsync(httpClient, "Transactions", transactionFilter, _options.MaxTransactionRows, truncation, cancellationToken);
            var smsTask = LoadAsync(httpClient, "Sms", smsFilter, _options.MaxSmsRows, truncation, cancellationToken);

            // Seven-day collections strip: always the last seven days, whatever period is selected.
            var weekStart = DateTime.Today.AddDays(-6);
            var weeklyTransactionsTask = LoadAsync(
                httpClient,
                "Transactions",
                BuildDateFilter("Transaction_Date", weekStart, DateTime.Today.AddDays(1)),
                _options.MaxTransactionRows,
                new TruncationFlag(),
                cancellationToken);

            await Task.WhenAll(membersTask, creditsTask, vehiclesTask, usersTask, transtypesTask, transactionsTask, smsTask, weeklyTransactionsTask);

            BuildTranstypes(model, await transtypesTask);
            var (memberActivity, plateActivity) = BuildTransactions(model, await transactionsTask, await usersTask, start, end);
            BuildMembers(model, await membersTask, memberActivity);
            BuildCredits(model, await creditsTask);
            BuildVehicles(model, await vehiclesTask, plateActivity);
            BuildWeeklyCollections(model, await weeklyTransactionsTask, weekStart);
            BuildSms(model, await smsTask);

            model.Truncated = truncation.Value;
            BuildTiles(model);
        }
        catch (Exception ex)
        {
            model.ErrorMessage = ex.Message;
            _logger.LogError(ex, "Failed to load the KMOS dashboard for range {Range}", selectedRange);
        }

        return model;
    }

    // ---------------------------------------------------------------- sections

    private static void BuildMembers(KmosDashboardViewModel model, List<JsonElement> members, IReadOnlyDictionary<string, int> activity)
    {
        model.MemberCount = members.Count;
        model.ActiveMemberCount = members.Count(member => string.Equals(Str(member, "Status"), "Active", StringComparison.OrdinalIgnoreCase));
        model.MembersWithActivity = members.Count(member => activity.ContainsKey(ActivityKey(Str(member, "No"))));

        foreach (var member in members)
        {
            model.LoanArrearsTotal += Dec(member, "Loan_Arrears");
            model.PenaltyTotal += Dec(member, "Outstanding_Penalty");
            model.DailyRepaymentTotal += Dec(member, "dailyrepayment");
            model.SavingsTotal += Dec(member, "Savings");
            model.XmasTotal += Dec(member, "Xmas");
        }

        model.MemberStatuses = members
            .GroupBy(member => Blank(Str(member, "Status")) is { Length: > 0 } status ? status : "Unknown")
            .Select(group => new { Label = group.Key, Count = group.Count() })
            .OrderByDescending(entry => entry.Count)
            .Select(entry => new KmosBarViewModel(entry.Label, entry.Count, entry.Count.ToString("N0", CultureInfo.InvariantCulture)))
            .ToList();

        // Only members who actually transacted in the selected period - the arrears balance alone
        // says nothing about what happened today.
        model.TopDebtors = members
            .Select(member => new { Member = member, Key = ActivityKey(Str(member, "No")) })
            .Where(entry => entry.Key.Length > 0 && activity.ContainsKey(entry.Key))
            .Where(entry => Dec(entry.Member, "Loan_Arrears") > 0)
            .OrderByDescending(entry => Dec(entry.Member, "Loan_Arrears"))
            .Take(12)
            .Select(entry => new KmosDebtorViewModel(
                Blank(Str(entry.Member, "No")),
                Blank(Str(entry.Member, "Name")),
                Blank(Str(entry.Member, "Phone_No")),
                Blank(Str(entry.Member, "Status")),
                Dec(entry.Member, "Loan_Arrears"),
                Dec(entry.Member, "Outstanding_Penalty"),
                Dec(entry.Member, "dailyrepayment"),
                activity.GetValueOrDefault(entry.Key)))
            .ToList();
    }

    private static void BuildCredits(KmosDashboardViewModel model, List<JsonElement> credits)
    {
        model.CreditCount = credits.Count;

        model.LoanTypes = credits
            .GroupBy(credit => Blank(Str(credit, "Loan")) is { Length: > 0 } loan ? loan : "Unspecified")
            .Select(group => new { Label = group.Key, Count = group.Count() })
            .OrderByDescending(entry => entry.Count)
            .Select(entry => new KmosBarViewModel(entry.Label, entry.Count, entry.Count.ToString("N0", CultureInfo.InvariantCulture)))
            .ToList();
    }

    private static void BuildVehicles(KmosDashboardViewModel model, List<JsonElement> vehicles, IReadOnlyDictionary<string, int> activity)
    {
        model.VehicleCount = vehicles.Count;
        model.VehiclesWithActivity = vehicles.Count(vehicle => activity.ContainsKey(ActivityKey(Str(vehicle, "Vehicle_Number"))));

        foreach (var vehicle in vehicles)
        {
            model.VehicleArrearsTotal += Dec(vehicle, "Arrears");
            model.VehiclePenaltyTotal += Dec(vehicle, "Penalty");
        }

        model.VehicleTypes = vehicles
            .GroupBy(vehicle => Blank(Str(vehicle, "Vehicle_Type")) is { Length: > 0 } type ? type : "Unspecified")
            .Select(group => new { Label = group.Key, Count = group.Count() })
            .OrderByDescending(entry => entry.Count)
            .Select(entry => new KmosBarViewModel(entry.Label, entry.Count, entry.Count.ToString("N0", CultureInfo.InvariantCulture)))
            .ToList();

        // Same rule as the members list: only units that moved money in the selected period.
        model.VehicleArrears = vehicles
            .Select(vehicle => new { Vehicle = vehicle, Key = ActivityKey(Str(vehicle, "Vehicle_Number")) })
            .Where(entry => entry.Key.Length > 0 && activity.ContainsKey(entry.Key))
            .Where(entry => Dec(entry.Vehicle, "Arrears") > 0 || Dec(entry.Vehicle, "Penalty") > 0)
            .OrderByDescending(entry => Dec(entry.Vehicle, "Arrears"))
            .Take(12)
            .Select(entry => new KmosVehicleRowViewModel(
                Blank(Str(entry.Vehicle, "Vehicle_Number")),
                Blank(Str(entry.Vehicle, "Vehicle_Type")),
                Dec(entry.Vehicle, "Arrears"),
                Dec(entry.Vehicle, "Penalty"),
                Dec(entry.Vehicle, "Daily_Contribution"),
                activity.GetValueOrDefault(entry.Key)))
            .ToList();
    }

    private static void BuildTranstypes(KmosDashboardViewModel model, List<JsonElement> transtypes)
    {
        model.TranstypeCount = transtypes.Count;
        model.TranstypeLegend = transtypes
            .OrderBy(type => Int(type, "Order"))
            .Select(type => new KmosButtonViewModel(
                Blank(Str(type, "Code")),
                Blank(Str(type, "Name")) is { Length: > 0 } name ? name : Blank(Str(type, "Code")),
                Bool(type, "Active")))
            .ToList();
    }

    private (Dictionary<string, int> Members, Dictionary<string, int> Plates) BuildTransactions(
        KmosDashboardViewModel model,
        List<JsonElement> transactions,
        List<JsonElement> users,
        DateTime start,
        DateTime end)
    {
        var typeNames = model.TranstypeLegend.ToDictionary(type => type.Code, type => type.Name, StringComparer.OrdinalIgnoreCase);
        var agentNames = users
            .GroupBy(user => Blank(Str(user, "Agent_Code")), StringComparer.OrdinalIgnoreCase)
            .Where(group => group.Key.Length > 0)
            .ToDictionary(group => group.Key, group => Blank(Str(group.First(), "Name")), StringComparer.OrdinalIgnoreCase);

        model.AgentCount = agentNames.Count;
        model.TransactionCount = transactions.Count;

        var counted = new List<JsonElement>(transactions.Count);
        var memberActivity = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        var plateActivity = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);

        foreach (var transaction in transactions)
        {
            if (Bool(transaction, "Reversed"))
            {
                model.ReversedCount++;
                continue;
            }

            counted.Add(transaction);
            model.CollectedTotal += Dec(transaction, "Amount");

            var account = ActivityKey(Str(transaction, "Account_No"));
            if (account.Length > 0)
            {
                memberActivity[account] = memberActivity.GetValueOrDefault(account) + 1;
            }

            var plate = ActivityKey(Str(transaction, "Loan_No"));
            if (plate.Length > 0)
            {
                plateActivity[plate] = plateActivity.GetValueOrDefault(plate) + 1;
            }
        }

        model.TypeMix = counted
            .GroupBy(transaction => Blank(Str(transaction, "Type")) is { Length: > 0 } code ? code : "UNSPECIFIED")
            .Select(group => new
            {
                Code = group.Key,
                Count = group.Count(),
                Amount = group.Sum(transaction => Dec(transaction, "Amount"))
            })
            .OrderByDescending(entry => entry.Amount)
            .Select(entry => new KmosTypeViewModel(
                entry.Code,
                typeNames.TryGetValue(entry.Code, out var friendly) ? friendly : TitleCase(entry.Code),
                entry.Count,
                entry.Amount,
                model.CollectedTotal == 0 ? 0 : (double)(entry.Amount / model.CollectedTotal) * 100))
            .ToList();

        model.CollectionsTrend = BuildTrend(counted, start, end);
        model.CollectionsTrendTitle = (end - start).TotalDays <= 1.01 ? "Collections per hour" : "Collections per day";

        model.TopAgents = counted
            .GroupBy(transaction => Blank(Str(transaction, "Agent_Code")))
            .Select(group => new
            {
                Code = group.Key,
                Count = group.Count(),
                Amount = group.Sum(transaction => Dec(transaction, "Amount"))
            })
            .OrderByDescending(entry => entry.Amount)
            .Take(10)
            .Select(entry => new KmosRankViewModel(
                entry.Code.Length == 0 ? "Unassigned" : entry.Code,
                entry.Code.Length == 0
                    ? "Unassigned"
                    : agentNames.TryGetValue(entry.Code, out var name) && name.Length > 0 ? name : TitleCase(entry.Code),
                entry.Count,
                entry.Amount))
            .ToList();

        model.TopVehicles = counted
            .Select(transaction => new { Plate = Blank(Str(transaction, "Loan_No")), Amount = Dec(transaction, "Amount") })
            .Where(entry => entry.Plate.Length > 0)
            .GroupBy(entry => entry.Plate, StringComparer.OrdinalIgnoreCase)
            .Select(group => new
            {
                Plate = group.Key,
                Count = group.Count(),
                Amount = group.Sum(entry => entry.Amount)
            })
            .OrderByDescending(entry => entry.Amount)
            .Take(10)
            .Select(entry => new KmosRankViewModel(entry.Plate, entry.Plate, entry.Count, entry.Amount))
            .ToList();

        model.RecentTransactions = counted
            .Select(transaction => new
            {
                Item = transaction,
                Date = ParseDate(Str(transaction, "Transaction_Date")),
                Time = TransactionTime(transaction)
            })
            .OrderByDescending(entry => entry.Date ?? DateTime.MinValue)
            .ThenByDescending(entry => entry.Time, StringComparer.Ordinal)
            .Take(25)
            .Select(entry =>
            {
                var typeCode = Blank(Str(entry.Item, "Type"));
                return new KmosTransactionRowViewModel(
                    Blank(Str(entry.Item, "Document_No")),
                    entry.Date,
                    entry.Time,
                    typeNames.TryGetValue(typeCode, out var friendly) ? friendly : TitleCase(typeCode),
                    Blank(Str(entry.Item, "Account_Name")),
                    Blank(Str(entry.Item, "Loan_No")),
                    Blank(Str(entry.Item, "Agent_Code")),
                    Dec(entry.Item, "Amount"),
                    Bool(entry.Item, "Reversed"));
            })
            .ToList();

        return (memberActivity, plateActivity);
    }

    /// <summary>
    /// Collections for the last seven days, independent of the selected period - a fixed strip so
    /// the trend is comparable whatever range the visitor is looking at.
    /// </summary>
    private static void BuildWeeklyCollections(KmosDashboardViewModel model, List<JsonElement> transactions, DateTime weekStart)
    {
        var totals = new Dictionary<DateTime, decimal>();

        foreach (var transaction in transactions)
        {
            if (Bool(transaction, "Reversed"))
            {
                continue;
            }

            var date = ParseDate(Str(transaction, "Transaction_Date"));
            if (!date.HasValue)
            {
                continue;
            }

            totals[date.Value.Date] = totals.GetValueOrDefault(date.Value.Date) + Dec(transaction, "Amount");
        }

        model.WeeklyCollections = Enumerable.Range(0, 7)
            .Select(offset => weekStart.AddDays(offset))
            .Select(day =>
            {
                var amount = totals.TryGetValue(day, out var total) ? total : 0m;
                return new KmosBarViewModel(
                    day.ToString("ddd dd", CultureInfo.InvariantCulture),
                    (double)amount,
                    $"KES {amount:N0}",
                    day == DateTime.Today ? "today" : string.Empty);
            })
            .ToList();
    }

    private static void BuildSms(KmosDashboardViewModel model, List<JsonElement> sms)
    {
        model.SmsCount = sms.Count;

        model.RecentSms = sms
            .OrderByDescending(message => Int(message, "Entry_No"))
            .Take(15)
            .Select(message => new KmosSmsRowViewModel(
                Int(message, "Entry_No"),
                ParseDate(Str(message, "Date_Sent_to_Server")),
                Blank(Str(message, "Telephone_No")),
                Blank(Str(message, "SMS_Message")),
                Blank(Str(message, "Sent_To_Server"))))
            .ToList();
    }

    /// <summary>
    /// Hourly bars when the range is a single day, daily bars otherwise - a one-day range read as a
    /// single bar says nothing, and thirty hourly bars would be unreadable.
    /// </summary>
    private static List<KmosBarViewModel> BuildTrend(List<JsonElement> transactions, DateTime start, DateTime end)
    {
        var singleDay = (end - start).TotalDays <= 1.01;

        if (singleDay)
        {
            var buckets = transactions
                .Select(transaction => TransactionTime(transaction))
                .Where(time => time.Length >= 2 && int.TryParse(time[..2], NumberStyles.Integer, CultureInfo.InvariantCulture, out _))
                .Select(time => int.Parse(time[..2], CultureInfo.InvariantCulture))
                .GroupBy(hour => hour)
                .ToDictionary(group => group.Key, group => group.Count());

            return Enumerable.Range(0, 24)
                .Where(hour => buckets.ContainsKey(hour))
                .Select(hour => new KmosBarViewModel(
                    $"{hour:00}:00",
                    buckets[hour],
                    buckets[hour].ToString("N0", CultureInfo.InvariantCulture)))
                .ToList();
        }

        var days = transactions
            .Select(transaction => ParseDate(Str(transaction, "Transaction_Date")))
            .Where(date => date.HasValue)
            .Select(date => date!.Value.Date)
            .GroupBy(date => date)
            .ToDictionary(group => group.Key, group => group.Count());

        var result = new List<KmosBarViewModel>();
        for (var day = start.Date; day < end.Date; day = day.AddDays(1))
        {
            var count = days.TryGetValue(day, out var value) ? value : 0;
            result.Add(new KmosBarViewModel(day.ToString("dd MMM", CultureInfo.InvariantCulture), count, count.ToString("N0", CultureInfo.InvariantCulture)));
        }

        return result;
    }

    private static void BuildTiles(KmosDashboardViewModel model)
    {
        model.Tiles =
        [
            new KmosTileViewModel(
                "Members",
                model.MemberCount.ToString("N0", CultureInfo.InvariantCulture),
                $"{model.ActiveMemberCount:N0} active"),
            new KmosTileViewModel(
                "Vehicles",
                model.VehicleCount.ToString("N0", CultureInfo.InvariantCulture),
                model.VehicleTypes.Count > 0 ? $"Largest: {model.VehicleTypes[0].Label}" : "No fleet data"),
            new KmosTileViewModel(
                "Active credits",
                model.CreditCount.ToString("N0", CultureInfo.InvariantCulture),
                model.LoanTypes.Count > 0 ? $"Largest: {model.LoanTypes[0].Label}" : "No loan data"),
            new KmosTileViewModel(
                "Transactions",
                model.TransactionCount.ToString("N0", CultureInfo.InvariantCulture),
                model.Truncated ? $"{model.RangeLabel} (capped)" : model.RangeLabel),
            new KmosTileViewModel(
                "Collected",
                $"KES {model.CollectedTotal:N0}",
                $"{model.TypeMix.Count} types" + (model.ReversedCount > 0 ? $" · {model.ReversedCount} reversed" : string.Empty),
                "good"),
            new KmosTileViewModel(
                "SMS sent",
                model.SmsCount.ToString("N0", CultureInfo.InvariantCulture),
                model.RangeLabel,
                "info"),
            new KmosTileViewModel(
                "Loan arrears",
                $"KES {model.LoanArrearsTotal:N0}",
                $"Penalties KES {model.PenaltyTotal:N0}",
                model.LoanArrearsTotal > 0 ? "warn" : "neutral"),
            new KmosTileViewModel(
                "Vehicle arrears",
                $"KES {model.VehicleArrearsTotal:N0}",
                $"Penalties KES {model.VehiclePenaltyTotal:N0}",
                model.VehicleArrearsTotal > 0 ? "warn" : "neutral")
        ];
    }

    // ---------------------------------------------------------------- plumbing

    private async Task<List<JsonElement>> LoadAsync(
        HttpClient httpClient,
        string entity,
        string? filter,
        int maxRows,
        TruncationFlag truncation,
        CancellationToken cancellationToken)
    {
        var items = new List<JsonElement>();
        var url = BuildUrl(entity, filter);
        var pages = 0;

        while (!string.IsNullOrWhiteSpace(url) && pages++ < Math.Max(1, _options.MaxPages))
        {
            using var request = new HttpRequestMessage(HttpMethod.Get, url);
            request.Headers.Accept.ParseAdd("application/json");

            using var response = await httpClient.SendAsync(request, cancellationToken);
            var payload = await response.Content.ReadAsStringAsync(cancellationToken);

            if (!response.IsSuccessStatusCode)
            {
                _logger.LogWarning("KMOS request failed for {Url}: {StatusCode} {Payload}", url, response.StatusCode, payload);
                throw new InvalidOperationException($"KMOS returned {(int)response.StatusCode} {response.ReasonPhrase} for {entity}.");
            }

            using var document = JsonDocument.Parse(payload);
            if (!document.RootElement.TryGetProperty("value", out var valueElement) || valueElement.ValueKind != JsonValueKind.Array)
            {
                throw new InvalidOperationException($"KMOS response for {entity} did not contain an OData value array.");
            }

            foreach (var item in valueElement.EnumerateArray())
            {
                items.Add(item.Clone());
                if (items.Count >= maxRows)
                {
                    truncation.Value = true;
                    return items;
                }
            }

            url = NextLink(document.RootElement);
        }

        if (!string.IsNullOrWhiteSpace(url))
        {
            truncation.Value = true;
        }

        return items;
    }

    private static string? NextLink(JsonElement root)
    {
        // NAV's OData v3 emits "odata.nextLink"; the v4 spelling is checked for safety.
        if (root.TryGetProperty("odata.nextLink", out var v3) && v3.ValueKind == JsonValueKind.String)
        {
            return v3.GetString();
        }

        if (root.TryGetProperty("@odata.nextLink", out var v4) && v4.ValueKind == JsonValueKind.String)
        {
            return v4.GetString();
        }

        return null;
    }

    private string BuildUrl(string entity, string? filter)
    {
        var builder = new StringBuilder(_options.BaseUrl.TrimEnd('/')).Append('/').Append(entity);

        if (!string.IsNullOrWhiteSpace(filter))
        {
            builder.Append("?$filter=").Append(Uri.EscapeDataString(filter));
        }

        return builder.ToString();
    }

    /// <summary>
    /// NAV wants Edm.DateTime literals as datetime'yyyy-MM-ddTHH:mm:ss' and evaluates them in
    /// en-US, so the range is always formatted invariantly.
    /// </summary>
    private static string BuildDateFilter(string field, DateTime start, DateTime end)
    {
        return $"{field} ge {DateTimeLiteral(start)} and {field} lt {DateTimeLiteral(end)}";

        static string DateTimeLiteral(DateTime value) => $"datetime'{value.ToString("yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture)}'";
    }

    private CredentialCache CreateCredentialCache()
    {
        var username = string.IsNullOrWhiteSpace(_options.Username) ? _credentials.Username : _options.Username;
        var password = string.IsNullOrWhiteSpace(_options.Password) ? _credentials.Password : _options.Password;
        var domain = string.IsNullOrWhiteSpace(_options.Domain) ? _credentials.Domain : _options.Domain;

        var credential = string.IsNullOrWhiteSpace(domain)
            ? new NetworkCredential(username, password)
            : new NetworkCredential(username, password, domain);

        var cache = new CredentialCache
        {
            { new Uri(_options.BaseUrl), "Negotiate", credential },
            { new Uri(_options.BaseUrl), "NTLM", credential }
        };

        return cache;
    }

    /// <summary>
    /// The box that hosts KMOS publishes a NAT64 (64:ff9b::) AAAA record next to its A record.
    /// .NET picks the IPv6 address, the NAT64 route is unreachable, and the request dies with
    /// "A socket operation was attempted to an unreachable network" before IPv4 is ever tried.
    /// Connecting through an explicit IPv4-first connect callback keeps the configured host name
    /// (so the URI, credentials and logs stay meaningful) while skipping the dead address family.
    /// </summary>
    private SocketsHttpHandler CreateHandler()
    {
        return new SocketsHttpHandler
        {
            PreAuthenticate = true,
            ConnectTimeout = TimeSpan.FromSeconds(30),
            Credentials = _options.UseDefaultCredentials
                ? CredentialCache.DefaultNetworkCredentials
                : CreateCredentialCache(),
            ConnectCallback = async (context, cancellationToken) =>
            {
                var addresses = await Dns.GetHostAddressesAsync(context.DnsEndPoint.Host, cancellationToken);
                var ordered = addresses
                    .OrderBy(address => address.AddressFamily == AddressFamily.InterNetwork ? 0 : 1)
                    .ToList();

                Exception? lastError = null;
                foreach (var address in ordered)
                {
                    var socket = new Socket(address.AddressFamily, SocketType.Stream, ProtocolType.Tcp) { NoDelay = true };
                    try
                    {
                        await socket.ConnectAsync(new IPEndPoint(address, context.DnsEndPoint.Port), cancellationToken);
                        return new NetworkStream(socket, ownsSocket: true);
                    }
                    catch (Exception ex)
                    {
                        lastError = ex;
                        socket.Dispose();
                        if (cancellationToken.IsCancellationRequested)
                        {
                            throw;
                        }
                    }
                }

                throw lastError ?? new IOException($"Could not connect to {context.DnsEndPoint}.");
            }
        };
    }

    private static string NormalizeRange(string? range) => range?.Trim().ToLowerInvariant() switch
    {
        "yesterday" => "yesterday",
        "week" => "week",
        "month" => "month",
        _ => "today"
    };

    private static (DateTime Start, DateTime End, string Label) ResolveRange(string range)
    {
        var today = DateTime.Today;

        return range switch
        {
            "yesterday" => (today.AddDays(-1), today, "Yesterday"),
            "week" => (StartOfWeek(today), today.AddDays(1), "This week"),
            "month" => (new DateTime(today.Year, today.Month, 1), today.AddDays(1), "This month"),
            _ => (today, today.AddDays(1), "Today")
        };

        static DateTime StartOfWeek(DateTime day)
        {
            var delta = ((int)day.DayOfWeek + 6) % 7;
            return day.AddDays(-delta);
        }
    }

    // -------------------------------------------------------------- json access

    private static string Str(JsonElement item, string property)
    {
        if (!item.TryGetProperty(property, out var value))
        {
            return string.Empty;
        }

        return value.ValueKind switch
        {
            JsonValueKind.String => value.GetString() ?? string.Empty,
            JsonValueKind.Number => value.ToString(),
            JsonValueKind.True => "true",
            JsonValueKind.False => "false",
            _ => string.Empty
        };
    }

    private static decimal Dec(JsonElement item, string property)
    {
        var raw = Str(item, property);
        return decimal.TryParse(raw, NumberStyles.Any, CultureInfo.InvariantCulture, out var value) ? value : 0m;
    }

    private static int Int(JsonElement item, string property)
    {
        var raw = Str(item, property);
        return int.TryParse(raw, NumberStyles.Any, CultureInfo.InvariantCulture, out var value) ? value : 0;
    }

    private static bool Bool(JsonElement item, string property)
    {
        if (!item.TryGetProperty(property, out var value))
        {
            return false;
        }

        return value.ValueKind switch
        {
            JsonValueKind.True => true,
            JsonValueKind.False => false,
            JsonValueKind.String => bool.TryParse(value.GetString(), out var parsed) && parsed,
            _ => false
        };
    }

    private static string Blank(string value) => value.Trim();

    /// <summary>Account numbers and plates arrive with inconsistent padding and case.</summary>
    private static string ActivityKey(string value) =>
        string.Join(' ', value.Trim().ToUpperInvariant().Split(' ', StringSplitOptions.RemoveEmptyEntries));

    private static string TransactionTime(JsonElement transaction)
    {
        var created = Str(transaction, "Creation_time");
        if (created.Length >= 8 && created.Contains(':'))
        {
            return created[..8];
        }

        var stamp = Str(transaction, "Transaction_Time");
        var date = ParseDate(stamp);
        if (date.HasValue && date.Value.TimeOfDay > TimeSpan.Zero)
        {
            return date.Value.ToString("HH:mm:ss", CultureInfo.InvariantCulture);
        }

        return date.HasValue ? "00:00:00" : string.Empty;
    }

    private static DateTime? ParseDate(string? raw)
    {
        if (string.IsNullOrWhiteSpace(raw))
        {
            return null;
        }

        if (!DateTime.TryParse(raw, CultureInfo.InvariantCulture, DateTimeStyles.None, out var value))
        {
            return null;
        }

        return value.Year <= 1900 ? null : value;
    }

    private static string TitleCase(string code)
    {
        if (string.IsNullOrWhiteSpace(code))
        {
            return "Unspecified";
        }

        var words = code.ToLowerInvariant().Split(' ', StringSplitOptions.RemoveEmptyEntries);
        return string.Join(' ', words.Select(word => char.ToUpperInvariant(word[0]) + word[1..]));
    }

    private sealed class TruncationFlag
    {
        public bool Value { get; set; }
    }
}

public sealed class KmosOptions
{
    /// <summary>OData base of the KMOS instance, up to and including the company segment.</summary>
    public string BaseUrl { get; set; } = "http://trimline.co.ke:5760/KmoService/OData/Company('KMO')";

    /// <summary>
    /// Left empty on purpose: the service falls back to the BusinessCentral credentials, so a
    /// deployment that does not ship this config section still authenticates.
    /// </summary>
    public string Username { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    public string? Domain { get; set; }
    public bool UseDefaultCredentials { get; set; }

    public int CacheSeconds { get; set; } = 120;
    public int TimeoutSeconds { get; set; } = 120;

    /// <summary>Members / Credits / Vehicles / Users / Transtypes are small; this is only a guard.</summary>
    public int MaxMasterRows { get; set; } = 20000;

    /// <summary>Cap for one period's transactions - a month of KMOS traffic fits comfortably.</summary>
    public int MaxTransactionRows { get; set; } = 20000;

    public int MaxSmsRows { get; set; } = 5000;
    public int MaxPages { get; set; } = 40;
}
