using System.Collections.Concurrent;
using System.Globalization;
using System.Net;
using System.Text.Json;
using Matatu_Dashboard.Models;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Options;

namespace Matatu_Dashboard.Services;

public sealed class BusinessCentralDashboardService
{
    private static readonly ConcurrentDictionary<string, SemaphoreSlim> CacheLocks = new(StringComparer.OrdinalIgnoreCase);

    private static readonly string[] TypeFieldCandidates = [
        "Type",
        "Transaction_Type",
        "Transaction Type",
        "Transtype",
        "Trans Type",
        "Trans_Type",
        "Type_Summary",
        "Entry_Type",
        "Fuel_Type"
    ];

    private static readonly string[] AgentFieldCandidates = [
        "Agent",
        "Agent_Code",
        "Agent_No",
        "Fuel_Agent",
        "Agent Name",
        "Agent_Name",
        "Created_By",
        "User_ID",
        "User Id"
    ];

    private static readonly string[] AccountFieldCandidates = [
        "Account_No",
        "Account No",
        "Account_Name",
        "Account Name",
        "Customer_No",
        "Customer_Name",
        "Customer Name"
    ];

    private static readonly string[] DocumentFieldCandidates = [
        "Document_No",
        "Document No",
        "Document",
        "Doc_No"
    ];

    private static readonly string[] ReferenceFieldCandidates = [
        "OTTN",
        "Reference_No",
        "Reference No",
        "Receipt_No",
        "Receipt No"
    ];

    private static readonly string[] PreferredSummaryFields = [
        "Mpesa",
        "Cash",
        "Offload",
        "Operation",
        "Management",
        "Daily_Contribution",
        "Fuel_Amount",
        "Cost",
        "Quantity",
        "Qty",
        "Litres",
        "Ltrs"
    ];

    private static readonly string[] AmountFieldCandidates = [
        "Amount_Paid",
        "Amount",
        "Transaction_Amount",
        "Total_Amount",
        "Net_Amount",
        "Credit_Amount",
        "Debit_Amount",
        "Fuel_Amount",
        "Cost"
    ];

    private static readonly string[] TotalLitresFieldCandidates = [
        "Total_Litres",
        "Total Litres",
        "TotalLitres",
        "Litres",
        "Ltrs",
        "Quantity",
        "Qty"
    ];

    private static readonly string[] DateFieldCandidates = [
        "Transaction_Date",
        "Posting_Date",
        "Date",
        "Created_At",
        "Created_Date",
        "Document_Date"
    ];

    private static readonly string[] VehicleFieldCandidates = [
        "Loan_No",
        "Vehicle_Number",
        "Vehicle_No",
        "Vehicle No",
        "Vehicle",
        "Fleet_No",
        "Registration_No"
    ];

    private readonly BusinessCentralDashboardOptions _options;
    private readonly IMemoryCache _cache;
    private readonly ILogger<BusinessCentralDashboardService> _logger;

    public BusinessCentralDashboardService(
        IOptions<BusinessCentralDashboardOptions> options,
        IMemoryCache cache,
        ILogger<BusinessCentralDashboardService> logger)
    {
        _options = options.Value;
        _cache = cache;
        _logger = logger;
    }

    public async Task<BusinessCentralDashboardViewModel> GetDashboardAsync(string? range, CancellationToken cancellationToken = default)
    {
        return await GetOrCreateDashboardAsync(range, transactionsOnly: false, cancellationToken);
    }

    public async Task<BusinessCentralDashboardViewModel> GetShareDashboardAsync(string? range, CancellationToken cancellationToken = default)
    {
        return await GetOrCreateDashboardAsync(range, transactionsOnly: true, cancellationToken);
    }

    public async Task WarmShareDashboardAsync(IEnumerable<string>? ranges = null, CancellationToken cancellationToken = default)
    {
        var normalizedRanges = (ranges ?? ["today"])
            .Select(NormalizeRange)
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();

        foreach (var range in normalizedRanges)
        {
            await GetOrCreateDashboardAsync(range, transactionsOnly: true, cancellationToken);
        }
    }

    public async Task<DashboardSectionViewModel> GetSourceSectionAsync(string sourceName, string? range, CancellationToken cancellationToken = default)
    {
        var selectedRange = NormalizeRange(range);
        var cacheKey = $"section:{NormalizeSourceName(sourceName)}:{selectedRange}";

        if (_cache.TryGetValue<DashboardSectionViewModel>(cacheKey, out var cachedSection) && cachedSection is not null)
        {
            return cachedSection;
        }

        var cacheLock = CacheLocks.GetOrAdd(cacheKey, static _ => new SemaphoreSlim(1, 1));
        await cacheLock.WaitAsync(cancellationToken);

        try
        {
            if (_cache.TryGetValue<DashboardSectionViewModel>(cacheKey, out cachedSection) && cachedSection is not null)
            {
                return cachedSection;
            }

            var section = await BuildSourceSectionAsync(sourceName, selectedRange, cancellationToken);
            _cache.Set(cacheKey, section, TimeSpan.FromSeconds(Math.Max(5, _options.ShareCacheSeconds)));
            return section;
        }
        finally
        {
            cacheLock.Release();
        }
    }

    private async Task<BusinessCentralDashboardViewModel> GetOrCreateDashboardAsync(string? range, bool transactionsOnly, CancellationToken cancellationToken)
    {
        var selectedRange = NormalizeRange(range);
        var cacheKey = CreateCacheKey(selectedRange, transactionsOnly);

        if (_cache.TryGetValue<BusinessCentralDashboardViewModel>(cacheKey, out var cachedModel) && cachedModel is not null)
        {
            return cachedModel;
        }

        var cacheLock = CacheLocks.GetOrAdd(cacheKey, static _ => new SemaphoreSlim(1, 1));
        await cacheLock.WaitAsync(cancellationToken);

        try
        {
            if (_cache.TryGetValue<BusinessCentralDashboardViewModel>(cacheKey, out cachedModel) && cachedModel is not null)
            {
                return cachedModel;
            }

            var cacheSeconds = transactionsOnly ? _options.ShareCacheSeconds : _options.CacheSeconds;
            var model = await BuildDashboardAsync(selectedRange, transactionsOnly, cancellationToken);
            _cache.Set(cacheKey, model, TimeSpan.FromSeconds(Math.Max(5, cacheSeconds)));
            return model;
        }
        finally
        {
            cacheLock.Release();
        }
    }

    private async Task<DashboardSectionViewModel> BuildSourceSectionAsync(string sourceName, string selectedRange, CancellationToken cancellationToken)
    {
        var sectionTitle = GetSectionDisplayTitle(sourceName);

        if (string.IsNullOrWhiteSpace(_options.Username) || string.IsNullOrWhiteSpace(_options.Password))
        {
            return new DashboardSectionViewModel
            {
                Title = sectionTitle,
                ErrorMessage = "Business Central credentials are missing in appsettings.json."
            };
        }

        var source = _options.Sources.FirstOrDefault(candidate => string.Equals(NormalizeSourceName(candidate.Name), NormalizeSourceName(sourceName), StringComparison.OrdinalIgnoreCase));
        if (source is null)
        {
            return new DashboardSectionViewModel
            {
                Title = sectionTitle,
                ErrorMessage = $"The {sectionTitle} source is not configured."
            };
        }

        return await BuildSectionAsync(source, selectedRange, cancellationToken, source.MaxItemsToLoad);
    }

    private async Task<BusinessCentralDashboardViewModel> BuildDashboardAsync(string selectedRange, bool transactionsOnly, CancellationToken cancellationToken)
    {
        var model = new BusinessCentralDashboardViewModel
        {
            RetrievedAt = DateTime.Now,
            SelectedRange = selectedRange
        };

        if (string.IsNullOrWhiteSpace(_options.Username) || string.IsNullOrWhiteSpace(_options.Password))
        {
            model.ErrorMessage = "Business Central credentials are missing in appsettings.json.";
            return model;
        }

        if (_options.Sources.Count == 0)
        {
            model.ErrorMessage = "No Business Central dashboard sources are configured.";
            return model;
        }

        var sources = _options.Sources
            .Where(source => !transactionsOnly || string.Equals(source.Name, "Transactions", StringComparison.OrdinalIgnoreCase))
            .OrderBy(source => !string.Equals(source.Name, "Transactions", StringComparison.OrdinalIgnoreCase))
            .ThenBy(source => source.Name)
            .ToList();

        if (sources.Count == 0)
        {
            model.ErrorMessage = transactionsOnly
                ? "Transactions source is not configured for the public dashboard."
                : "No Business Central dashboard sources are configured.";
            return model;
        }

        var sections = await Task.WhenAll(sources.Select(source => BuildSectionAsync(source, selectedRange, cancellationToken, source.MaxItemsToLoad)));
        model.Sections.AddRange(sections);

        return model;
    }

    private static string CreateCacheKey(string selectedRange, bool transactionsOnly)
    {
        return $"dashboard:{(transactionsOnly ? "share" : "full")}:{selectedRange}";
    }

    private async Task<DashboardSectionViewModel> BuildSectionAsync(BusinessCentralDashboardSourceOptions source, string selectedRange, CancellationToken cancellationToken, int? maxItemsToLoad = null)
    {
        var requestUrl = BuildRequestUrl(source, selectedRange);
        var section = new DashboardSectionViewModel
        {
            Title = GetSectionDisplayTitle(source.Name),
            ServiceUrl = requestUrl,
            FilterDescription = BuildFilterDescription(source, selectedRange)
        };

        try
        {
            using var handler = new HttpClientHandler
            {
                PreAuthenticate = true,
                UseDefaultCredentials = _options.UseDefaultCredentials
            };

            handler.Credentials = _options.UseDefaultCredentials
                ? CredentialCache.DefaultNetworkCredentials
                : CreateCredentialCache(requestUrl);

            using var httpClient = new HttpClient(handler);
            var items = await LoadAllItemsAsync(httpClient, requestUrl, cancellationToken, maxItemsToLoad);
            var columns = items
                .SelectMany(GetPropertyNames)
                .Distinct(StringComparer.OrdinalIgnoreCase)
                .ToList();

            section.TotalRecords = items.Count;
            section.Columns = columns;
            section.Rows = items
                .Take(Math.Max(1, _options.MaxRows))
                .Select(item => CreateRow(item, columns))
                .ToList();

            BuildMetrics(section, items);
            BuildCharts(section, items);
            BuildHighlights(section, items);
            BuildManagement(section, items, selectedRange);
        }
        catch (Exception ex)
        {
            section.ErrorMessage = ex.Message;
            _logger.LogError(ex, "Failed to load dashboard section {Section}", source.Name);
        }

        return section;
    }

    private async Task<List<JsonElement>> LoadAllItemsAsync(HttpClient httpClient, string requestUrl, CancellationToken cancellationToken, int? maxItemsToLoad = null)
    {
        var items = new List<JsonElement>();
        string? nextUrl = requestUrl;
        var maxItems = Math.Max(0, maxItemsToLoad ?? 0);

        while (!string.IsNullOrWhiteSpace(nextUrl))
        {
            using var request = new HttpRequestMessage(HttpMethod.Get, nextUrl);
            request.Headers.Accept.ParseAdd("application/json");
            request.Headers.TryAddWithoutValidation("Prefer", $"odata.maxpagesize={Math.Max(1, _options.PageSize)}");

            using var response = await httpClient.SendAsync(request, cancellationToken);
            var payload = await response.Content.ReadAsStringAsync(cancellationToken);

            if (!response.IsSuccessStatusCode)
            {
                _logger.LogWarning("Business Central request failed for {Url}: {StatusCode} {Payload}", nextUrl, response.StatusCode, payload);
                throw new InvalidOperationException($"Business Central returned {(int)response.StatusCode} {response.ReasonPhrase}.");
            }

            using var document = JsonDocument.Parse(payload);
            if (!document.RootElement.TryGetProperty("value", out var valueElement) || valueElement.ValueKind != JsonValueKind.Array)
            {
                throw new InvalidOperationException("Business Central response did not contain an OData value array.");
            }

            var pageItems = valueElement.EnumerateArray().Select(item => item.Clone()).ToList();
            if (maxItems > 0)
            {
                var remaining = maxItems - items.Count;
                if (remaining <= 0)
                {
                    break;
                }

                if (pageItems.Count > remaining)
                {
                    pageItems = pageItems.Take(remaining).ToList();
                }
            }

            items.AddRange(pageItems);

            if (maxItems > 0 && items.Count >= maxItems)
            {
                break;
            }

            nextUrl = document.RootElement.TryGetProperty("@odata.nextLink", out var nextLinkElement)
                ? nextLinkElement.GetString()
                : null;
        }

        return items;
    }

    private static IEnumerable<string> GetPropertyNames(JsonElement item)
    {
        foreach (var property in item.EnumerateObject())
        {
            yield return property.Name;
        }
    }

    private static void BuildCharts(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        if (IsTransactionsSection(section))
        {
            AddTopVehiclesChart(section, items);
            AddChart(section, items, TypeFieldCandidates, "Type Summary", "type");
            AddChart(section, items, AgentFieldCandidates, "Agent Summary", "agent");
            AddTopAgentsChart(section, items);
            AddBiggestAmountsChart(section, items);
            AddDailyCollectionsTrendChart(section, items);
            return;
        }

        if (!IsFuelSection(section))
        {
            return;
        }

        AddTopVehiclesChart(section, items);
        AddChart(section, items, AgentFieldCandidates, "Fuel Agent Summary", "fuel-agent");
        AddChart(section, items, TypeFieldCandidates, "Fuel Type Summary", "fuel-type");
        AddBiggestAmountsChart(section, items, "Highest Fuel Payments", "fuel-biggest-amounts");
        AddDailyCollectionsTrendChart(section, items, "Fuel Spend Trend", "fuel-daily-trend");
    }

    private static void AddChart(
        DashboardSectionViewModel section,
        IReadOnlyCollection<JsonElement> items,
        IEnumerable<string> candidates,
        string title,
        string idSuffix)
    {
        var fieldName = FindBestGroupingField(items, candidates, idSuffix);
        if (fieldName is null)
        {
            return;
        }

        var summary = BuildCountSummary(items, fieldName);
        if (summary.Count == 0)
        {
            return;
        }

        section.Charts.Add(new DashboardChartViewModel
        {
            Id = $"{section.Title}-{idSuffix}".Replace(' ', '-').ToLowerInvariant(),
            Title = title,
            Type = "doughnut",
            Labels = summary.Select(item => item.Label).ToList(),
            Values = summary.Select(item => item.Value).ToList()
        });
    }

    private static void AddDailyCollectionsTrendChart(
        DashboardSectionViewModel section,
        IReadOnlyCollection<JsonElement> items,
        string title = "Daily Collections Trend",
        string idSuffix = "daily-trend")
    {
        var dateField = FindFirstMatchingField(items, DateFieldCandidates);
        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);

        if (dateField is null || amountField is null)
        {
            return;
        }

        var trend = items
            .Where(item => item.TryGetProperty(dateField, out _))
            .Select(item => new
            {
                Date = ParseDate(item.GetProperty(dateField).ToString()),
                Amount = GetAmount(item, amountField)
            })
            .Where(item => item.Date.HasValue && item.Amount > 0)
            .GroupBy(item => item.Date!.Value.Date)
            .Select(group => new
            {
                Date = group.Key,
                Amount = group.Sum(item => item.Amount)
            })
            .OrderBy(item => item.Date)
            .ToList();

        if (trend.Count <= 1)
        {
            return;
        }

        section.Charts.Add(new DashboardChartViewModel
        {
            Id = $"{section.Title}-{idSuffix}".Replace(' ', '-').ToLowerInvariant(),
            Title = title,
            Type = "line",
            Labels = trend.Select(item => item.Date.ToString("dd MMM")).ToList(),
            Values = trend.Select(item => Convert.ToInt32(Math.Round(item.Amount, MidpointRounding.AwayFromZero))).ToList()
        });
    }

    private static void AddTopVehiclesChart(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        var vehicleField = FindVehicleField(section, items);
        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);

        if (vehicleField is null || amountField is null)
        {
            return;
        }

        var topVehicles = items
            .Where(item => item.TryGetProperty(vehicleField, out _))
            .Select(item => new
            {
                Vehicle = item.GetProperty(vehicleField).ToString(),
                Amount = GetAmount(item, amountField)
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.Vehicle) && item.Amount > 0)
            .GroupBy(item => item.Vehicle!, StringComparer.OrdinalIgnoreCase)
            .Select(group => new
            {
                Vehicle = group.Key,
                Amount = group.Sum(item => item.Amount)
            })
            .OrderByDescending(item => item.Amount)
            .Take(5)
            .ToList();

        if (topVehicles.Count == 0)
        {
            return;
        }

        section.Charts.Add(new DashboardChartViewModel
        {
            Id = $"{section.Title}-top-vehicles".Replace(' ', '-').ToLowerInvariant(),
            Title = "Top 5 Vehicles by Collection",
            Type = "bar",
            Labels = topVehicles.Select(item => item.Vehicle).ToList(),
            Values = topVehicles.Select(item => Convert.ToInt32(Math.Round(item.Amount, MidpointRounding.AwayFromZero))).ToList()
        });
    }

    private static void AddTopAgentsChart(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        var agentField = FindBestGroupingField(items, AgentFieldCandidates, "agent");
        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);

        if (agentField is null || amountField is null)
        {
            return;
        }

        var topAgents = items
            .Where(item => item.TryGetProperty(agentField, out _))
            .Select(item => new
            {
                Agent = item.GetProperty(agentField).ToString(),
                Amount = GetAmount(item, amountField)
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.Agent) && item.Amount > 0)
            .GroupBy(item => item.Agent!, StringComparer.OrdinalIgnoreCase)
            .Select(group => new
            {
                Agent = group.Key,
                Amount = group.Sum(item => item.Amount)
            })
            .OrderByDescending(item => item.Amount)
            .Take(5)
            .ToList();

        if (topAgents.Count == 0)
        {
            return;
        }

        section.Charts.Add(new DashboardChartViewModel
        {
            Id = $"{section.Title}-top-agents".Replace(' ', '-').ToLowerInvariant(),
            Title = "Top 5 Agents by Collection",
            Type = "bar",
            Labels = topAgents.Select(item => item.Agent).ToList(),
            Values = topAgents.Select(item => Convert.ToInt32(Math.Round(item.Amount, MidpointRounding.AwayFromZero))).ToList()
        });
    }

    private static void AddBiggestAmountsChart(
        DashboardSectionViewModel section,
        IReadOnlyCollection<JsonElement> items,
        string title = "Biggest Amounts",
        string idSuffix = "biggest-amounts")
    {
        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);
        if (amountField is null)
        {
            return;
        }

        var labelField = FindFirstMatchingField(items, VehicleFieldCandidates)
            ?? FindBestGroupingField(items, AgentFieldCandidates, "agent")
            ?? FindBestGroupingField(items, TypeFieldCandidates, "type");

        var biggestAmounts = items
            .Select((item, index) => new SummaryCountItem(BuildAmountLabel(item, labelField, index), Convert.ToInt32(Math.Round(GetAmount(item, amountField), MidpointRounding.AwayFromZero))))
            .Where(item => item.Value > 0)
            .OrderByDescending(item => item.Value)
            .Take(7)
            .ToList();

        if (biggestAmounts.Count == 0)
        {
            return;
        }

        section.Charts.Add(new DashboardChartViewModel
        {
            Id = $"{section.Title}-{idSuffix}".Replace(' ', '-').ToLowerInvariant(),
            Title = title,
            Type = "bar",
            Labels = biggestAmounts.Select(item => item.Label).ToList(),
            Values = biggestAmounts.Select(item => item.Value).ToList()
        });
    }

    private static Dictionary<string, string> CreateRow(JsonElement item, IEnumerable<string> columns)
    {
        var row = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

        foreach (var column in columns)
        {
            row[column] = item.TryGetProperty(column, out var value) ? FormatValue(value) : string.Empty;
        }

        return row;
    }

    private static string FormatValue(JsonElement value)
    {
        return value.ValueKind switch
        {
            JsonValueKind.Null => string.Empty,
            JsonValueKind.String when DateTime.TryParse(value.GetString(), out var date) => date.ToString("dd MMM yyyy HH:mm"),
            JsonValueKind.String => value.GetString() ?? string.Empty,
            _ => value.ToString()
        };
    }

    private static void BuildMetrics(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        if (IsFuelSection(section))
        {
            BuildFuelMetrics(section, items);
            return;
        }

        section.Metrics.Add(new DashboardMetricViewModel
        {
            Label = "Records",
            Value = items.Count.ToString("N0", CultureInfo.InvariantCulture)
        });

        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);
        if (amountField is not null)
        {
            var amounts = GetAmounts(items, amountField).ToList();

            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = amountField,
                Value = amounts.Sum().ToString("N2", CultureInfo.InvariantCulture)
            });

            if (amounts.Count != 0)
            {
                section.Metrics.Add(new DashboardMetricViewModel
                {
                    Label = "Biggest Amount",
                    Value = amounts.Max().ToString("N2", CultureInfo.InvariantCulture)
                });

                section.Metrics.Add(new DashboardMetricViewModel
                {
                    Label = "Average Amount",
                    Value = amounts.Average().ToString("N2", CultureInfo.InvariantCulture)
                });
            }
        }

        var vehicleField = FindVehicleField(section, items);
        if (vehicleField is not null && IsTransactionsSection(section))
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = "Total Vehicles",
                Value = CountDistinct(items, vehicleField).ToString("N0", CultureInfo.InvariantCulture)
            });
        }

        var dateField = FindFirstMatchingField(items, DateFieldCandidates);
        var latestDate = dateField is null ? null : GetLatestDate(items, dateField);
        if (latestDate.HasValue)
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = "Latest Date",
                Value = latestDate.Value.ToString("dd MMM yyyy")
            });
        }

        foreach (var field in PreferredSummaryFields)
        {
            if (section.Metrics.Any(metric => string.Equals(metric.Label, field, StringComparison.OrdinalIgnoreCase)))
            {
                continue;
            }

            if (FindFirstMatchingField(items, [field]) is null)
            {
                continue;
            }

            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = FormatMetricLabel(field),
                Value = SumField(items, field).ToString("N2", CultureInfo.InvariantCulture)
            });
        }

        if (section.Metrics.Count > 6)
        {
            section.Metrics = section.Metrics.Take(6).ToList();
        }
    }

    private static void BuildFuelMetrics(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        section.Metrics.Add(new DashboardMetricViewModel
        {
            Label = "Records",
            Value = items.Count.ToString("N0", CultureInfo.InvariantCulture)
        });

        var totalPaidField = FindFirstMatchingField(items, ["Amount_Paid", "Amount Paid", "AmountPaid"])
            ?? FindFirstMatchingField(items, AmountFieldCandidates);
        var totalLitresField = FindFirstMatchingField(items, TotalLitresFieldCandidates);
        var managementField = FindFirstMatchingField(items, ["Management", "Management Amount", "Management_Amount"]);
        var fallbackSummaryField = FindFirstMatchingField(items, ["Offload", "Balance"]);

        var totalPaid = totalPaidField is null ? 0 : SumField(items, totalPaidField);
        var totalLitres = totalLitresField is null ? 0 : SumField(items, totalLitresField);

        if (totalPaidField is not null)
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = "Total Paid",
                Value = totalPaid.ToString("N2", CultureInfo.InvariantCulture),
                Note = "Sum of paid fuel value in the current slice."
            });
        }

        if (totalLitresField is not null)
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = "Total Litres",
                Value = totalLitres.ToString("N2", CultureInfo.InvariantCulture),
                Note = "Sum of total litres in the current fuel slice."
            });
        }

        if (totalPaidField is not null && totalLitresField is not null)
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = "Total From Offload",
                Value = (totalLitres - totalPaid).ToString("N2", CultureInfo.InvariantCulture),
                Note = "Calculated as total litres minus total paid."
            });
        }

        var dateField = FindFirstMatchingField(items, DateFieldCandidates);
        var latestDate = dateField is null ? null : GetLatestDate(items, dateField);
        if (latestDate.HasValue)
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = "Latest Date",
                Value = latestDate.Value.ToString("dd MMM yyyy")
            });
        }

        if (managementField is not null)
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = "Management",
                Value = SumField(items, managementField).ToString("N2", CultureInfo.InvariantCulture)
            });
        }
        else if (fallbackSummaryField is not null)
        {
            section.Metrics.Add(new DashboardMetricViewModel
            {
                Label = FormatMetricLabel(fallbackSummaryField),
                Value = SumField(items, fallbackSummaryField).ToString("N2", CultureInfo.InvariantCulture)
            });
        }

        if (section.Metrics.Count > 6)
        {
            section.Metrics = section.Metrics.Take(6).ToList();
        }
    }

    private static void BuildHighlights(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        if (IsTransactionsSection(section))
        {
            BuildTransactionHighlights(section, items);
            return;
        }

        if (!IsFuelSection(section))
        {
            return;
        }

        BuildFuelHighlights(section, items);
    }

    private static void BuildTransactionHighlights(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);
        if (amountField is null)
        {
            return;
        }

        var vehicleField = FindVehicleField(section, items);
        var agentField = FindBestGroupingField(items, AgentFieldCandidates, "agent");

        if (vehicleField is not null)
        {
            var topVehicle = items
                .Where(item => item.TryGetProperty(vehicleField, out _))
                .Select(item => new
                {
                    Vehicle = item.GetProperty(vehicleField).ToString(),
                    Amount = GetAmount(item, amountField)
                })
                .Where(item => !string.IsNullOrWhiteSpace(item.Vehicle) && item.Amount > 0)
                .GroupBy(item => item.Vehicle!, StringComparer.OrdinalIgnoreCase)
                .Select(group => new
                {
                    Vehicle = group.Key,
                    Amount = group.Sum(item => item.Amount)
                })
                .OrderByDescending(item => item.Amount)
                .FirstOrDefault();

            if (topVehicle is not null)
            {
                section.Highlights.Add(new DashboardHighlightViewModel
                {
                    Label = "Top Vehicle",
                    Title = topVehicle.Vehicle,
                    Value = topVehicle.Amount.ToString("N2", CultureInfo.InvariantCulture)
                });
            }
        }

        var topItems = items
            .Select((item, index) => new
            {
                Index = index,
                Amount = GetAmount(item, amountField),
                Vehicle = GetStringValue(item, vehicleField),
                Agent = GetStringValue(item, agentField)
            })
            .Where(item => item.Amount > 0)
            .OrderByDescending(item => item.Amount)
            .Take(3)
            .ToList();

        for (var i = 0; i < topItems.Count; i++)
        {
            var topItem = topItems[i];
            section.Highlights.Add(new DashboardHighlightViewModel
            {
                Label = i switch
                {
                    0 => "Highest",
                    1 => "Second",
                    _ => "Third"
                },
                Title = FirstNonEmpty(topItem.Vehicle, topItem.Agent, $"Record #{topItem.Index + 1}"),
                Value = topItem.Amount.ToString("N2", CultureInfo.InvariantCulture)
            });
        }
    }

    private static void BuildFuelHighlights(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items)
    {
        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);
        if (amountField is null)
        {
            return;
        }

        var vehicleField = FindVehicleField(section, items);
        var typeField = FindBestGroupingField(items, TypeFieldCandidates, "type");
        if (vehicleField is not null)
        {
            var topVehicle = items
                .Where(item => item.TryGetProperty(vehicleField, out _))
                .Select(item => new
                {
                    Vehicle = item.GetProperty(vehicleField).ToString(),
                    Amount = GetAmount(item, amountField)
                })
                .Where(item => !string.IsNullOrWhiteSpace(item.Vehicle) && item.Amount > 0)
                .GroupBy(item => item.Vehicle!, StringComparer.OrdinalIgnoreCase)
                .Select(group => new
                {
                    Vehicle = group.Key,
                    Amount = group.Sum(item => item.Amount)
                })
                .OrderByDescending(item => item.Amount)
                .FirstOrDefault();

            if (topVehicle is not null)
            {
                section.Highlights.Add(new DashboardHighlightViewModel
                {
                    Label = "Top Vehicle",
                    Title = topVehicle.Vehicle,
                    Value = topVehicle.Amount.ToString("N2", CultureInfo.InvariantCulture)
                });
            }
        }
        else if (typeField is not null)
        {
            var topType = items
                .Where(item => item.TryGetProperty(typeField, out _))
                .Select(item => new
                {
                    Type = item.GetProperty(typeField).ToString(),
                    Amount = GetAmount(item, amountField)
                })
                .Where(item => !string.IsNullOrWhiteSpace(item.Type) && item.Amount > 0)
                .GroupBy(item => item.Type!, StringComparer.OrdinalIgnoreCase)
                .Select(group => new
                {
                    Type = group.Key,
                    Amount = group.Sum(item => item.Amount)
                })
                .OrderByDescending(item => item.Amount)
                .FirstOrDefault();

            if (topType is not null)
            {
                section.Highlights.Add(new DashboardHighlightViewModel
                {
                    Label = "Top Fuel Type",
                    Title = topType.Type,
                    Value = topType.Amount.ToString("N2", CultureInfo.InvariantCulture)
                });
            }
        }

        var topItems = items
            .Select((item, index) => new
            {
                Index = index,
                Amount = GetAmount(item, amountField),
                Type = GetStringValue(item, typeField)
            })
            .Where(item => item.Amount > 0)
            .OrderByDescending(item => item.Amount)
            .Take(2)
            .ToList();

        for (var i = 0; i < topItems.Count; i++)
        {
            var topItem = topItems[i];
            section.Highlights.Add(new DashboardHighlightViewModel
            {
                Label = i == 0 ? "Highest Entry" : "Second Entry",
                Title = FirstNonEmpty(topItem.Type, $"Fuel Record #{topItem.Index + 1}"),
                Value = topItem.Amount.ToString("N2", CultureInfo.InvariantCulture)
            });
        }
    }

    private static void BuildManagement(DashboardSectionViewModel section, IReadOnlyCollection<JsonElement> items, string selectedRange)
    {
        if (!IsTransactionsSection(section))
        {
            return;
        }

        var amountField = FindFirstMatchingField(items, AmountFieldCandidates);
        var dateField = FindFirstMatchingField(items, DateFieldCandidates);
        var vehicleField = FindVehicleField(section, items);
        var agentField = FindBestGroupingField(items, AgentFieldCandidates, "agent");
        var typeField = FindFirstMatchingField(items, TypeFieldCandidates);
        var accountField = FindFirstMatchingField(items, AccountFieldCandidates);
        var documentField = FindFirstMatchingField(items, DocumentFieldCandidates);
        var referenceField = FindFirstMatchingField(items, ReferenceFieldCandidates);

        var topMatatus = BuildAmountRankings(items, vehicleField, amountField, take: 5, descending: true);
        var bottomMatatus = BuildAmountRankings(items, vehicleField, amountField, take: 5, descending: false);
        var agentPerformance = BuildAgentPerformance(items, agentField, amountField, take: 5);

        section.Management = new TransactionManagementViewModel
        {
            Overview = BuildManagementOverview(section, items, amountField, vehicleField, agentPerformance),
            CollectionsTrendChart = BuildCollectionsTrendChart(section, items, dateField, amountField, selectedRange),
            TopMatatusChart = BuildRankingChart(section, topMatatus.Take(8).ToList(), "Top Matatus by Collection", "management-top-matatus"),
            AgentPerformanceChart = BuildAgentPerformanceChart(section, agentPerformance),
            TypeMixChart = BuildTypeMixChart(section, items, typeField, amountField),
            TopMatatus = topMatatus
                .Select(item => new ManagementRankingItemViewModel
                {
                    Label = item.Key,
                    Value = item.TotalAmount.ToString("N2", CultureInfo.InvariantCulture),
                    Note = $"{item.Count:N0} transaction(s)"
                })
                .ToList(),
            BottomMatatus = bottomMatatus
                .Select(item => new ManagementRankingItemViewModel
                {
                    Label = item.Key,
                    Value = item.TotalAmount.ToString("N2", CultureInfo.InvariantCulture),
                    Note = $"{item.Count:N0} transaction(s)"
                })
                .ToList(),
            AgentPerformance = agentPerformance
                .Select(item => new AgentPerformanceItemViewModel
                {
                    Agent = item.Key,
                    TotalAmount = item.TotalAmount.ToString("N2", CultureInfo.InvariantCulture),
                    TransactionCount = item.Count.ToString("N0", CultureInfo.InvariantCulture),
                    AverageTicket = item.AverageAmount.ToString("N2", CultureInfo.InvariantCulture)
                })
                .ToList(),
            Exceptions = BuildManagementExceptions(items, amountField, vehicleField, agentField, accountField, documentField, referenceField),
            RecentTransactions = BuildRecentTransactions(items, dateField, vehicleField, agentField, typeField, amountField, accountField, documentField)
        };
    }

    private static List<DashboardMetricViewModel> BuildManagementOverview(
        DashboardSectionViewModel section,
        IReadOnlyCollection<JsonElement> items,
        string? amountField,
        string? vehicleField,
        IReadOnlyList<RankingAmountItem> agentPerformance)
    {
        var totalAmount = amountField is null ? 0 : GetAmounts(items, amountField).Sum();
        var totalVehicles = string.IsNullOrWhiteSpace(vehicleField) ? 0 : CountDistinct(items, vehicleField);
        var averagePerVehicle = totalVehicles == 0 ? 0 : totalAmount / totalVehicles;
        var largestItem = amountField is null
            ? null
            : items
                .Select(item => new
                {
                    Amount = GetAmount(item, amountField),
                    Vehicle = GetStringValue(item, vehicleField),
                    Agent = GetStringValue(item, FindBestGroupingField(items, AgentFieldCandidates, "agent"))
                })
                .Where(item => item.Amount > 0)
                .OrderByDescending(item => item.Amount)
                .FirstOrDefault();

        var topAgent = agentPerformance.FirstOrDefault();

        return new List<DashboardMetricViewModel>
        {
            new()
            {
                Label = "Total Collections",
                Value = totalAmount.ToString("N2", CultureInfo.InvariantCulture),
                Note = section.FilterDescription ?? "Current filtered period"
            },
            new()
            {
                Label = "Active Matatus",
                Value = totalVehicles.ToString("N0", CultureInfo.InvariantCulture),
                Note = "Distinct units posting collections"
            },
            new()
            {
                Label = "Avg / Matatu",
                Value = averagePerVehicle.ToString("N2", CultureInfo.InvariantCulture),
                Note = "Collection efficiency per active matatu"
            },
            new()
            {
                Label = "Transactions",
                Value = items.Count.ToString("N0", CultureInfo.InvariantCulture),
                Note = "Loaded filtered transaction count"
            },
            new()
            {
                Label = "Top Agent",
                Value = topAgent?.Key ?? "N/A",
                Note = topAgent is null
                    ? "No agent data available"
                    : topAgent.TotalAmount.ToString("N2", CultureInfo.InvariantCulture)
            },
            new()
            {
                Label = "Largest Ticket",
                Value = largestItem?.Amount.ToString("N2", CultureInfo.InvariantCulture) ?? "0.00",
                Note = FirstNonEmpty(largestItem?.Vehicle, largestItem?.Agent, "No transaction label")
            }
        };
    }

    private static DashboardChartViewModel? BuildCollectionsTrendChart(
        DashboardSectionViewModel section,
        IReadOnlyCollection<JsonElement> items,
        string? dateField,
        string? amountField,
        string selectedRange)
    {
        if (string.IsNullOrWhiteSpace(dateField) || string.IsNullOrWhiteSpace(amountField))
        {
            return null;
        }

        var parsed = items
            .Where(item => item.TryGetProperty(dateField, out _))
            .Select(item => new
            {
                Date = ParseDate(item.GetProperty(dateField).ToString()),
                Amount = GetAmount(item, amountField)
            })
            .Where(item => item.Date.HasValue && item.Amount > 0)
            .Select(item => new { item.Date!.Value, item.Amount })
            .ToList();

        if (parsed.Count == 0)
        {
            return null;
        }

        var daily = parsed
            .GroupBy(item => item.Value.Date)
            .Select(group => new { Label = group.Key.ToString("dd MMM"), Sort = group.Key, Amount = group.Sum(item => item.Amount) })
            .OrderBy(item => item.Sort)
            .ToList();

        if (daily.Count > 1)
        {
            return new DashboardChartViewModel
            {
                Id = BuildChartId(section, "management-trend"),
                Title = "Collections Trend",
                Type = "line",
                Labels = daily.Select(item => item.Label).ToList(),
                Values = daily.Select(item => Convert.ToInt32(Math.Round(item.Amount, MidpointRounding.AwayFromZero))).ToList()
            };
        }

        var hourly = parsed
            .GroupBy(item => new DateTime(item.Value.Year, item.Value.Month, item.Value.Day, item.Value.Hour, 0, 0))
            .Select(group => new { Label = group.Key.ToString("HH:mm"), Sort = group.Key, Amount = group.Sum(item => item.Amount) })
            .OrderBy(item => item.Sort)
            .ToList();

        if (hourly.Count > 1)
        {
            return new DashboardChartViewModel
            {
                Id = BuildChartId(section, "management-pace"),
                Title = string.Equals(selectedRange, "yesterday", StringComparison.OrdinalIgnoreCase)
                    ? "Collections Pace Yesterday"
                    : "Collections Pace Today",
                Type = "line",
                Labels = hourly.Select(item => item.Label).ToList(),
                Values = hourly.Select(item => Convert.ToInt32(Math.Round(item.Amount, MidpointRounding.AwayFromZero))).ToList()
            };
        }

        return null;
    }

    private static DashboardChartViewModel? BuildRankingChart(
        DashboardSectionViewModel section,
        IReadOnlyList<RankingAmountItem> rankings,
        string title,
        string idSuffix)
    {
        if (rankings.Count == 0)
        {
            return null;
        }

        return new DashboardChartViewModel
        {
            Id = BuildChartId(section, idSuffix),
            Title = title,
            Type = "bar",
            Labels = rankings.Select(item => item.Key).ToList(),
            Values = rankings.Select(item => Convert.ToInt32(Math.Round(item.TotalAmount, MidpointRounding.AwayFromZero))).ToList()
        };
    }

    private static DashboardChartViewModel? BuildAgentPerformanceChart(
        DashboardSectionViewModel section,
        IReadOnlyList<RankingAmountItem> agentPerformance)
    {
        return BuildRankingChart(section, agentPerformance.Take(6).ToList(), "Agent Performance", "management-agent-performance");
    }

    private static DashboardChartViewModel? BuildTypeMixChart(
        DashboardSectionViewModel section,
        IReadOnlyCollection<JsonElement> items,
        string? typeField,
        string? amountField)
    {
        if (string.IsNullOrWhiteSpace(typeField) || string.IsNullOrWhiteSpace(amountField))
        {
            return null;
        }

        var groups = items
            .Where(item => item.TryGetProperty(typeField, out _))
            .Select(item => new
            {
                Type = item.GetProperty(typeField).ToString(),
                Amount = GetAmount(item, amountField)
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.Type) && item.Amount > 0)
            .GroupBy(item => item.Type!, StringComparer.OrdinalIgnoreCase)
            .Select(group => new RankingAmountItem(group.Key, group.Sum(item => item.Amount), group.Count()))
            .OrderByDescending(item => item.TotalAmount)
            .ToList();

        if (groups.Count == 0)
        {
            return null;
        }

        if (groups.Count > 6)
        {
            groups = groups.Take(5)
                .Append(new RankingAmountItem("Others", groups.Skip(5).Sum(item => item.TotalAmount), groups.Skip(5).Sum(item => item.Count)))
                .ToList();
        }

        return new DashboardChartViewModel
        {
            Id = BuildChartId(section, "management-type-mix"),
            Title = "Collection Mix by Type",
            Type = "doughnut",
            Labels = groups.Select(item => item.Key).ToList(),
            Values = groups.Select(item => Convert.ToInt32(Math.Round(item.TotalAmount, MidpointRounding.AwayFromZero))).ToList()
        };
    }

    private static List<ManagementExceptionViewModel> BuildManagementExceptions(
        IReadOnlyCollection<JsonElement> items,
        string? amountField,
        string? vehicleField,
        string? agentField,
        string? accountField,
        string? documentField,
        string? referenceField)
    {
        var exceptions = new List<ManagementExceptionViewModel>();

        if (!string.IsNullOrWhiteSpace(amountField))
        {
            var amounts = items.Select(item => GetAmount(item, amountField)).Where(amount => amount > 0).ToList();
            if (amounts.Count > 0)
            {
                var averageAmount = amounts.Average();
                var threshold = Math.Max(averageAmount * 2.5m, 2500m);
                var highValueCount = amounts.Count(amount => amount >= threshold);
                if (highValueCount > 0)
                {
                    exceptions.Add(new ManagementExceptionViewModel
                    {
                        Severity = "high",
                        Title = "High-value tickets",
                        Value = highValueCount.ToString("N0", CultureInfo.InvariantCulture),
                        Detail = $"Threshold {threshold:N2}; peak {amounts.Max():N2}"
                    });
                }
            }
        }

        if (!string.IsNullOrWhiteSpace(agentField))
        {
            var missingAgents = items.Count(item => string.IsNullOrWhiteSpace(GetStringValue(item, agentField)));
            if (missingAgents > 0)
            {
                exceptions.Add(new ManagementExceptionViewModel
                {
                    Severity = "medium",
                    Title = "Missing agent attribution",
                    Value = missingAgents.ToString("N0", CultureInfo.InvariantCulture),
                    Detail = "Transactions posted without agent code"
                });
            }
        }

        AddDuplicateException(exceptions, items, documentField, "Duplicate document numbers", "high");
        AddDuplicateException(exceptions, items, referenceField, "Duplicate OTTN / references", "medium");

        if (!string.IsNullOrWhiteSpace(vehicleField))
        {
            var lowActivityCount = items
                .Where(item => item.TryGetProperty(vehicleField, out _))
                .Select(item => item.GetProperty(vehicleField).ToString())
                .Where(value => !string.IsNullOrWhiteSpace(value))
                .GroupBy(value => value!, StringComparer.OrdinalIgnoreCase)
                .Count(group => group.Count() == 1);

            if (lowActivityCount > 0)
            {
                exceptions.Add(new ManagementExceptionViewModel
                {
                    Severity = "low",
                    Title = "Low-activity matatus",
                    Value = lowActivityCount.ToString("N0", CultureInfo.InvariantCulture),
                    Detail = "Matatus with a single transaction in the selected period"
                });
            }
        }

        if (!string.IsNullOrWhiteSpace(accountField) && !string.IsNullOrWhiteSpace(amountField))
        {
            var totalsByAccount = items
                .Where(item => item.TryGetProperty(accountField, out _))
                .Select(item => new
                {
                    Account = item.GetProperty(accountField).ToString(),
                    Amount = GetAmount(item, amountField)
                })
                .Where(item => !string.IsNullOrWhiteSpace(item.Account) && item.Amount > 0)
                .GroupBy(item => item.Account!, StringComparer.OrdinalIgnoreCase)
                .Select(group => group.Sum(item => item.Amount))
                .OrderByDescending(amount => amount)
                .ToList();

            var grandTotal = totalsByAccount.Sum();
            if (grandTotal > 0 && totalsByAccount.Count > 0)
            {
                var topThreeShare = totalsByAccount.Take(3).Sum() / grandTotal * 100m;
                exceptions.Add(new ManagementExceptionViewModel
                {
                    Severity = topThreeShare >= 45m ? "high" : "medium",
                    Title = "Account concentration",
                    Value = $"{topThreeShare:N1}%",
                    Detail = "Share of collections contributed by top 3 accounts"
                });
            }
        }

        return exceptions.Take(4).ToList();
    }

    private static void AddDuplicateException(
        ICollection<ManagementExceptionViewModel> exceptions,
        IEnumerable<JsonElement> items,
        string? fieldName,
        string title,
        string severity)
    {
        if (string.IsNullOrWhiteSpace(fieldName))
        {
            return;
        }

        var duplicates = items
            .Where(item => item.TryGetProperty(fieldName, out _))
            .Select(item => item.GetProperty(fieldName).ToString())
            .Where(value => !string.IsNullOrWhiteSpace(value))
            .GroupBy(value => value!, StringComparer.OrdinalIgnoreCase)
            .Where(group => group.Count() > 1)
            .OrderByDescending(group => group.Count())
            .ToList();

        if (duplicates.Count == 0)
        {
            return;
        }

        var topDuplicate = duplicates.First();
        exceptions.Add(new ManagementExceptionViewModel
        {
            Severity = severity,
            Title = title,
            Value = duplicates.Count.ToString("N0", CultureInfo.InvariantCulture),
            Detail = $"Top duplicate {topDuplicate.Key} appears {topDuplicate.Count()} times"
        });
    }

    private static List<Dictionary<string, string>> BuildRecentTransactions(
        IReadOnlyCollection<JsonElement> items,
        string? dateField,
        string? vehicleField,
        string? agentField,
        string? typeField,
        string? amountField,
        string? accountField,
        string? documentField)
    {
        var ordered = items
            .Select(item => new
            {
                Item = item,
                Date = string.IsNullOrWhiteSpace(dateField) ? null : ParseDate(GetStringValue(item, dateField))
            })
            .OrderByDescending(item => item.Date ?? DateTime.MinValue)
            .Take(6)
            .ToList();

        return ordered
            .Select(entry => new Dictionary<string, string>
            {
                ["Date"] = entry.Date?.ToString("dd MMM HH:mm") ?? string.Empty,
                ["Matatu"] = FirstNonEmpty(GetStringValue(entry.Item, vehicleField), "-"),
                ["Agent"] = FirstNonEmpty(GetStringValue(entry.Item, agentField), "-"),
                ["Type"] = FirstNonEmpty(GetStringValue(entry.Item, typeField), "-"),
                ["Amount"] = string.IsNullOrWhiteSpace(amountField)
                    ? "0.00"
                    : GetAmount(entry.Item, amountField).ToString("N2", CultureInfo.InvariantCulture),
                ["Account"] = FirstNonEmpty(GetStringValue(entry.Item, accountField), "-"),
                ["Document"] = FirstNonEmpty(GetStringValue(entry.Item, documentField), "-")
            })
            .ToList();
    }

    private static List<RankingAmountItem> BuildAmountRankings(
        IEnumerable<JsonElement> items,
        string? fieldName,
        string? amountField,
        int take,
        bool descending)
    {
        if (string.IsNullOrWhiteSpace(fieldName) || string.IsNullOrWhiteSpace(amountField))
        {
            return [];
        }

        var grouped = items
            .Where(item => item.TryGetProperty(fieldName, out _))
            .Select(item => new
            {
                Key = item.GetProperty(fieldName).ToString(),
                Amount = GetAmount(item, amountField)
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.Key) && item.Amount > 0)
            .GroupBy(item => item.Key!, StringComparer.OrdinalIgnoreCase)
            .Select(group => new RankingAmountItem(group.Key, group.Sum(item => item.Amount), group.Count()))
            .ToList();

        return (descending
                ? grouped.OrderByDescending(item => item.TotalAmount).ThenBy(item => item.Key)
                : grouped.OrderBy(item => item.TotalAmount).ThenBy(item => item.Key))
            .Take(take)
            .ToList();
    }

    private static List<RankingAmountItem> BuildAgentPerformance(
        IEnumerable<JsonElement> items,
        string? agentField,
        string? amountField,
        int take)
    {
        if (string.IsNullOrWhiteSpace(agentField) || string.IsNullOrWhiteSpace(amountField))
        {
            return [];
        }

        return items
            .Where(item => item.TryGetProperty(agentField, out _))
            .Select(item => new
            {
                Agent = item.GetProperty(agentField).ToString(),
                Amount = GetAmount(item, amountField)
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.Agent) && item.Amount > 0)
            .GroupBy(item => item.Agent!, StringComparer.OrdinalIgnoreCase)
            .Select(group => new RankingAmountItem(group.Key, group.Sum(item => item.Amount), group.Count()))
            .OrderByDescending(item => item.TotalAmount)
            .ThenBy(item => item.Key)
            .Take(take)
            .ToList();
    }

    private static string BuildChartId(DashboardSectionViewModel section, string suffix)
    {
        return $"{section.Title}-{suffix}".Replace(' ', '-').ToLowerInvariant();
    }

    private static string BuildRequestUrl(BusinessCentralDashboardSourceOptions source, string selectedRange)
    {
        if (string.IsNullOrWhiteSpace(source.DateField))
        {
            return source.Url;
        }

        var range = GetRangeDates(source, selectedRange);
        if (range is null)
        {
            return source.Url;
        }

        var separator = source.Url.Contains('?') ? "&" : "?";
        var filterExpression = $"{source.DateField} ge {range.Value.Start:yyyy-MM-dd} and {source.DateField} le {range.Value.End:yyyy-MM-dd}";
        var filter = $"$filter={Uri.EscapeDataString(filterExpression)}";
        return $"{source.Url}{separator}{filter}";
    }

    private static string? BuildFilterDescription(BusinessCentralDashboardSourceOptions source, string selectedRange)
    {
        var range = GetRangeDates(source, selectedRange);
        if (range is null)
        {
            return null;
        }

        return selectedRange switch
        {
            "yesterday" => $"Filtered to yesterday ({range.Value.Start:dd MMM yyyy})",
            "week" => $"Filtered to this week ({range.Value.Start:dd MMM} - {range.Value.End:dd MMM})",
            "month" => $"Filtered to this month ({range.Value.Start:dd MMM} - {range.Value.End:dd MMM})",
            _ => $"Filtered to today ({range.Value.Start:dd MMM yyyy})"
        };
    }

    private static (DateTime Start, DateTime End)? GetRangeDates(BusinessCentralDashboardSourceOptions source, string selectedRange)
    {
        if (string.IsNullOrWhiteSpace(source.DateField))
        {
            return null;
        }

        var today = DateTime.Today;
        var yesterday = today.AddDays(-1);
        return selectedRange switch
        {
            "week" => (today.AddDays(-((7 + (int)today.DayOfWeek - (int)DayOfWeek.Monday) % 7)), today),
            "month" => (new DateTime(today.Year, today.Month, 1), today),
            "yesterday" => (yesterday, yesterday),
            "today" => (today, today),
            _ when source.FilterToToday => (today, today),
            _ => null
        };
    }

    private static string NormalizeRange(string? range)
    {
        return range?.Trim().ToLowerInvariant() switch
        {
            "yesterday" => "yesterday",
            "week" => "week",
            "month" => "month",
            _ => "today"
        };
    }

    private static string FormatMetricLabel(string fieldName)
    {
        return fieldName.Replace('_', ' ');
    }

    private static decimal GetAmount(JsonElement item, string fieldName)
    {
        if (!item.TryGetProperty(fieldName, out var value))
        {
            return 0;
        }

        var raw = value.ToString();
        if (decimal.TryParse(raw, NumberStyles.Any, CultureInfo.InvariantCulture, out var amount) ||
            decimal.TryParse(raw, NumberStyles.Any, CultureInfo.CurrentCulture, out amount))
        {
            return amount;
        }

        return 0;
    }

    private static DateTime? ParseDate(string? rawValue)
    {
        if (string.IsNullOrWhiteSpace(rawValue))
        {
            return null;
        }

        return DateTime.TryParse(rawValue, out var parsed) ? parsed : null;
    }

    private static IEnumerable<decimal> GetAmounts(IEnumerable<JsonElement> items, string fieldName)
    {
        return items
            .Select(item => GetAmount(item, fieldName))
            .Where(amount => amount > 0);
    }

    private static string BuildAmountLabel(JsonElement item, string? labelField, int index)
    {
        var primary = GetStringValue(item, labelField);
        var backup = FirstNonEmpty(
            GetStringValue(item, FindBestPropertyName(item, VehicleFieldCandidates)),
            GetStringValue(item, FindBestPropertyName(item, AgentFieldCandidates)),
            $"Record #{index + 1}");

        return FirstNonEmpty(primary, backup, $"Record #{index + 1}");
    }

    private static string? FindVehicleField(DashboardSectionViewModel section, IEnumerable<JsonElement> items)
    {
        if (IsTransactionsSection(section))
        {
            var transactionVehicleField = FindFirstMatchingField(items, ["Loan_No"]);
            if (!string.IsNullOrWhiteSpace(transactionVehicleField))
            {
                return transactionVehicleField;
            }
        }

        return FindFirstMatchingField(items, VehicleFieldCandidates);
    }

    private static string? FindBestPropertyName(JsonElement item, IEnumerable<string> candidates)
    {
        var properties = item.EnumerateObject().Select(property => property.Name).ToList();
        return candidates.FirstOrDefault(candidate => properties.Contains(candidate, StringComparer.OrdinalIgnoreCase));
    }

    private static string? GetStringValue(JsonElement item, string? fieldName)
    {
        if (string.IsNullOrWhiteSpace(fieldName) || !item.TryGetProperty(fieldName, out var value))
        {
            return null;
        }

        var text = value.ToString();
        return string.IsNullOrWhiteSpace(text) ? null : text;
    }

    private static string FirstNonEmpty(params string?[] values)
    {
        return values.FirstOrDefault(value => !string.IsNullOrWhiteSpace(value)) ?? string.Empty;
    }

    private static string? FindBestGroupingField(IEnumerable<JsonElement> items, IEnumerable<string> candidates, string groupingKind)
    {
        var exact = FindFirstMatchingField(items, candidates);
        if (!string.IsNullOrWhiteSpace(exact))
        {
            return exact;
        }

        var fields = items
            .SelectMany(GetPropertyNames)
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();

        var keywordMatches = groupingKind switch
        {
            "type" => fields.Where(field => ContainsAnyToken(field, "type", "trans", "entry")),
            "agent" => fields.Where(field => ContainsAnyToken(field, "agent", "user", "createdby", "creator")),
            _ => []
        };

        return keywordMatches
            .OrderBy(field => field.Length)
            .FirstOrDefault();
    }

    private static bool ContainsAnyToken(string fieldName, params string[] tokens)
    {
        var normalized = NormalizeFieldName(fieldName);
        return tokens.Any(token => normalized.Contains(token, StringComparison.OrdinalIgnoreCase));
    }

    private static string NormalizeFieldName(string fieldName)
    {
        return fieldName
            .Replace("_", string.Empty)
            .Replace(" ", string.Empty)
            .Replace("-", string.Empty);
    }

    private static bool IsTransactionsSection(DashboardSectionViewModel section)
    {
        return string.Equals(section.Title, "Transactions", StringComparison.OrdinalIgnoreCase);
    }

    private static bool IsFuelSection(DashboardSectionViewModel section)
    {
        return IsFuelSourceName(section.Title);
    }

    private static bool IsFuelSourceName(string? sourceName)
    {
        return string.Equals(NormalizeSourceName(sourceName ?? string.Empty), "depotfuel", StringComparison.OrdinalIgnoreCase);
    }

    private static string GetSectionDisplayTitle(string sourceName)
    {
        return IsFuelSourceName(sourceName) ? "Depot Fuel" : sourceName;
    }

    private static string NormalizeSourceName(string sourceName)
    {
        return NormalizeFieldName(sourceName)
            .Replace("deport", "depot", StringComparison.OrdinalIgnoreCase);
    }

    private static List<SummaryCountItem> BuildCountSummary(IEnumerable<JsonElement> items, string fieldName)
    {
        var groups = items
            .Where(item => item.TryGetProperty(fieldName, out _))
            .Select(item => item.GetProperty(fieldName).ToString())
            .Where(value => !string.IsNullOrWhiteSpace(value))
            .GroupBy(value => value!, StringComparer.OrdinalIgnoreCase)
            .Select(group => new SummaryCountItem(group.Key, group.Count()))
            .OrderByDescending(item => item.Value)
            .ThenBy(item => item.Label)
            .ToList();

        if (groups.Count <= 6)
        {
            return groups;
        }

        var top = groups.Take(5).ToList();
        top.Add(new SummaryCountItem("Others", groups.Skip(5).Sum(item => item.Value)));
        return top;
    }

    private static string? FindFirstMatchingField(IEnumerable<JsonElement> items, IEnumerable<string> candidates)
    {
        var fields = items
            .SelectMany(GetPropertyNames)
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToHashSet(StringComparer.OrdinalIgnoreCase);

        return candidates.FirstOrDefault(fields.Contains);
    }

    private static decimal SumField(IEnumerable<JsonElement> items, string fieldName)
    {
        return GetAmounts(items, fieldName).Sum();
    }

    private static int CountDistinct(IEnumerable<JsonElement> items, string fieldName)
    {
        return items
            .Where(item => item.TryGetProperty(fieldName, out _))
            .Select(item => item.GetProperty(fieldName).ToString())
            .Where(value => !string.IsNullOrWhiteSpace(value))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .Count();
    }

    private static DateTime? GetLatestDate(IEnumerable<JsonElement> items, string fieldName)
    {
        var dates = items
            .Where(item => item.TryGetProperty(fieldName, out _))
            .Select(item => item.GetProperty(fieldName).ToString())
            .Select(value => DateTime.TryParse(value, out var parsed) ? parsed : (DateTime?)null)
            .Where(value => value.HasValue)
            .Select(value => value!.Value)
            .ToList();

        return dates.Count == 0 ? null : dates.Max();
    }

    private CredentialCache CreateCredentialCache(string url)
    {
        var uri = new Uri(url);
        var credential = string.IsNullOrWhiteSpace(_options.Domain)
            ? new NetworkCredential(_options.Username, _options.Password)
            : new NetworkCredential(_options.Username, _options.Password, _options.Domain);

        var cache = new CredentialCache
        {
            { uri, "Negotiate", credential },
            { uri, "NTLM", credential }
        };

        return cache;
    }

    private sealed record SummaryCountItem(string Label, int Value);
    private sealed record RankingAmountItem(string Key, decimal TotalAmount, int Count)
    {
        public decimal AverageAmount => Count == 0 ? 0 : TotalAmount / Count;
    }
}

public sealed class BusinessCentralDashboardOptions
{
    public string Username { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    public string? Domain { get; set; }
    public bool UseDefaultCredentials { get; set; }
    public int PageSize { get; set; } = 1000;
    public int CacheSeconds { get; set; } = 60;
    public int ShareCacheSeconds { get; set; } = 300;
    public bool EnableSharePrewarm { get; set; } = true;
    public int ShareWarmLeadSeconds { get; set; } = 60;
    public List<string> ShareWarmRanges { get; set; } = ["today", "yesterday"];
    public int MaxRows { get; set; } = 100;
    public List<BusinessCentralDashboardSourceOptions> Sources { get; set; } = [];
}

public sealed class BusinessCentralDashboardSourceOptions
{
    public string Name { get; set; } = string.Empty;
    public string Url { get; set; } = string.Empty;
    public bool FilterToToday { get; set; }
    public string? DateField { get; set; }
    public int? MaxItemsToLoad { get; set; }
}
