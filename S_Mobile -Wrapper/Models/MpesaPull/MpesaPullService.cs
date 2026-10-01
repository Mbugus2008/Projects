using S_Mobile.Models.Paybill;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace S_Mobile.Models.MpesaPull
{
    /// <summary>
    /// Detects missed M-Pesa C2B transactions from the running-balance chain in
    /// [MPESA Transactions] and recovers them via the Safaricom Pull Transactions API.
    ///
    /// Detection rule (per paybill): Balance - PaidIn must equal the previous
    /// transaction's Balance. A positive residual means one or more credits are missing.
    ///
    /// Notes:
    ///  - Balances are swept overnight, so the chain restarts every day; misses late in
    ///    the day can only be seen via the Pull API (48 hour retrieval window).
    ///  - Transactions sharing the same second can create cancelling artifacts
    ///    (+x / -2x / +x). Those simply produce no recoverable transactions when pulled.
    /// </summary>
    public class MpesaPullService
    {
        private const string GapsSql = @"
;WITH t AS (
    SELECT [Receipt No_] AS Receipt, [Paybil Number] AS Paybill, [Completion Time] AS Completed,
           CAST([Paid In] AS decimal(18,2)) AS PaidIn, CAST([Balance] AS decimal(18,2)) AS Bal,
           LAG([Receipt No_]) OVER (PARTITION BY [Paybil Number] ORDER BY [Completion Time], [Receipt No_]) AS PrevReceipt,
           LAG(CAST([Balance] AS decimal(18,2))) OVER (PARTITION BY [Paybil Number] ORDER BY [Completion Time], [Receipt No_]) AS PrevBal,
           LAG([Completion Time]) OVER (PARTITION BY [Paybil Number] ORDER BY [Completion Time], [Receipt No_]) AS PrevTime
    FROM [MPESA Transactions]
    WHERE (@p0 IS NULL OR [Paybil Number] = @p0)
      AND [Completion Time] >= @p1 AND [Completion Time] < DATEADD(DAY, 1, @p1)
)
SELECT Receipt, Paybill, Completed, PaidIn, Bal, PrevReceipt, PrevBal, PrevTime,
       Bal - PaidIn - PrevBal AS Gap
FROM t
WHERE PrevBal IS NOT NULL AND Bal - PaidIn - PrevBal <> 0
ORDER BY Paybill, Completed";

        private readonly MobileEntities context;

        public MpesaPullService(MobileEntities context)
        {
            this.context = context;
        }

        /// <summary>Lists running-balance gaps (candidate missed transactions) for a paybill/date.</summary>
        public Logging.Results<List<MpesaGap>> CheckGaps(string paybill = null, DateTime? date = null)
        {
            var results = new Logging.Results<List<MpesaGap>>();
            try
            {
                object paybillParam = (object)paybill ?? DBNull.Value;
                object dateParam = (date ?? DateTime.Today).Date;
                results.Contents = context.Database.SqlQuery<MpesaGap>(GapsSql, paybillParam, dateParam).ToList();
            }
            catch (Exception ex)
            {
                results.Code = -1;
                results.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return results;
        }

        /// <summary>Pulls the transactions Safaricom holds for one gap window.</summary>
        public Logging.Results<List<PullTransaction>> PullGap(MpesaGap gap)
        {
            var results = new Logging.Results<List<PullTransaction>>();
            try
            {
                if (gap == null || string.IsNullOrEmpty(gap.Paybill) || !gap.PrevTime.HasValue || !gap.Completed.HasValue)
                {
                    results.Code = -1;
                    results.Desc = "Gap is missing the paybill/timestamps needed to build the pull window.";
                    return results;
                }

                var config = GetConfig(gap.Paybill);
                if (config == null)
                {
                    results.Code = -1;
                    results.Desc = string.Format("No credentials found in [Subscription Mpesa Config] for shortcode {0}.", gap.Paybill);
                    return results;
                }

                var client = new MpesaPullClient(config.Consumer_Key, config.Consumer_Secret);
                var query = client.Query(gap.Paybill, gap.PrevTime.Value.AddSeconds(-1), gap.Completed.Value.AddSeconds(1));
                if (query.Code != 0)
                {
                    results.Code = query.Code;
                    results.Desc = query.Desc;
                    return results;
                }

                var known = new HashSet<string>(
                    context.MPESA_Transactions.Where(t => t.Paybil_Number == gap.Paybill).Select(t => t.Receipt_No_),
                    StringComparer.OrdinalIgnoreCase);

                var all = query.Contents.Transactions;
                results.Contents = all
                    .Where(t => !string.IsNullOrEmpty(t.transactionId) && !known.Contains(t.transactionId))
                    .OrderBy(t => t.trxDate)
                    .ToList();
                results.Desc = string.Format("Pull {0}: {1} transaction(s) in window, {2} not yet in the database.",
                    gap.Paybill, all.Count, results.Contents.Count);
            }
            catch (Exception ex)
            {
                results.Code = -1;
                results.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return results;
        }

        /// <summary>
        /// Full flow: find gaps, pull each window, insert what is missing and hand the
        /// recovered transactions to the same paybill processing used by /api/confirm.
        /// </summary>
        public Logging.Results<MpesaPullRunResult> Recover(string paybill = null, DateTime? date = null)
        {
            var results = new Logging.Results<MpesaPullRunResult>();
            var run = new MpesaPullRunResult();
            results.Contents = run;
            try
            {
                var gaps = CheckGaps(paybill, date);
                if (gaps.Code != 0)
                {
                    results.Code = gaps.Code;
                    results.Desc = gaps.Desc;
                    return results;
                }

                run.Gaps = gaps.Contents;
                foreach (var gap in gaps.Contents.Where(g => g.Gap.GetValueOrDefault() > 0.009m))
                {
                    var pulled = PullGap(gap);
                    if (pulled.Code != 0)
                    {
                        run.Errors.Add(string.Format("{0} {1:HH:mm:ss}-{2:HH:mm:ss}: {3}", gap.Paybill, gap.PrevTime, gap.Completed, pulled.Desc));
                        continue;
                    }

                    run.Pulled += pulled.Contents.Count;
                    if (pulled.Contents.Count == 0)
                    {
                        run.Unresolved.Add(gap);
                        continue;
                    }

                    Reinsert(gap, pulled.Contents, run);
                }
            }
            catch (Exception ex)
            {
                results.Code = -1;
                results.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return results;
        }

        private void Reinsert(MpesaGap gap, List<PullTransaction> transactions, MpesaPullRunResult run)
        {
            var repo = new Localdb(context);
            var runningBalance = gap.PrevBal;
            var inserted = new List<MPESA_Transaction>();

            foreach (var t in transactions)
            {
                decimal amount;
                if (!decimal.TryParse(t.amount, NumberStyles.Any, CultureInfo.InvariantCulture, out amount))
                {
                    run.Errors.Add(string.Format("Could not parse amount '{0}' for {1}.", t.amount, t.transactionId));
                    continue;
                }

                var when = ParseTrxDate(t.trxDate);
                if (runningBalance.HasValue)
                {
                    runningBalance += amount;
                }

                var txn = new MPESA_Transaction()
                {
                    Receipt_No_ = t.transactionId,
                    Transaction_Type = t.transactiontype,
                    Completion_Time = when,
                    Paid_In = amount,
                    Paybil_Number = gap.Paybill,
                    A_C_No_ = t.billreference,
                    Balance = runningBalance,
                    Phone = HashPhone(t.msisdn),
                    Name = t.sender,
                    Transaction_Date = when,
                    Sent = false,
                    Comments = "Recovered via Pull Transactions API"
                };

                repo.Add(txn);
                inserted.Add(txn);
                run.Recovered.Add(txn.Receipt_No_);
            }

            repo.SaveChanges();
            Logging.Logging.LogEntryOnFile(string.Format("MpesaPull recovered {0} transaction(s) for paybill {1} ({2}).",
                inserted.Count, gap.Paybill, string.Join(",", inserted.Select(i => i.Receipt_No_))));

            // Hand recovered transactions to the paybill processing, same as /api/confirm does.
            foreach (var txn in inserted)
            {
                var clientPaybill = repo.where<Client_Paybill>(c => c.PayBill == txn.Paybil_Number).FirstOrDefault();
                if (clientPaybill == null)
                {
                    Logging.Logging.LogEntryOnFile(string.Format("MpesaPull: no Client_Paybill mapping for {0}; recovered {1} stored but not processed.",
                        txn.Paybil_Number, txn.Receipt_No_));
                    continue;
                }

                Ipaybill processor = new paybill().GetClientInstance(clientPaybill);
                if (processor == null)
                {
                    Logging.Logging.LogEntryOnFile(string.Format("MpesaPull: no processor for client {0}; recovered {1} stored but not processed.",
                        clientPaybill.Client, txn.Receipt_No_));
                    continue;
                }

                var toProcess = txn;
                Task.Run(() => processor.ConfirmC2BPayment(toProcess));
            }
        }

        private MpesaConfigRow GetConfig(string shortCode)
        {
            return context.Database.SqlQuery<MpesaConfigRow>(
                "SELECT [Consumer Key] AS Consumer_Key, [Consumer Secret] AS Consumer_Secret, [Short Code] AS Short_Code, [Environment] AS Environment FROM [Subscription Mpesa Config] WHERE [Short Code] = @p0",
                shortCode).FirstOrDefault();
        }

        private static DateTime ParseTrxDate(string value)
        {
            try
            {
                return DateTime.Parse(value, CultureInfo.InvariantCulture, DateTimeStyles.RoundtripKind).ToLocalTime();
            }
            catch
            {
                return DateTime.Now;
            }
        }

        /// <summary>
        /// Hashes MSISDN the same way Safaricom's confirmation callbacks deliver it:
        /// lowercase SHA-256 hex of the number in 2547XXXXXXXX format.
        /// </summary>
        private static string HashPhone(string msisdn)
        {
            if (string.IsNullOrEmpty(msisdn))
            {
                return null;
            }

            var digits = new string(msisdn.Where(char.IsDigit).ToArray());
            if (digits.StartsWith("0"))
            {
                digits = "254" + digits.Substring(1);
            }
            else if (!digits.StartsWith("254"))
            {
                digits = "254" + digits;
            }

            using (var sha = SHA256.Create())
            {
                var hash = sha.ComputeHash(Encoding.ASCII.GetBytes(digits));
                return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
            }
        }
    }

    /// <summary>Request body for the api/mpesapull endpoints.</summary>
    public class MpesaPullRequest
    {
        public string Paybill { get; set; }
        public DateTime? Date { get; set; }
    }

    /// <summary>One running-balance gap between two consecutive transactions.</summary>
    public class MpesaGap
    {
        public string Receipt { get; set; }
        public string Paybill { get; set; }
        public DateTime? Completed { get; set; }
        public decimal? PaidIn { get; set; }
        public decimal? Bal { get; set; }
        public string PrevReceipt { get; set; }
        public decimal? PrevBal { get; set; }
        public DateTime? PrevTime { get; set; }
        public decimal? Gap { get; set; }
    }

    /// <summary>Result of a recovery run.</summary>
    public class MpesaPullRunResult
    {
        public List<MpesaGap> Gaps { get; set; } = new List<MpesaGap>();
        public List<MpesaGap> Unresolved { get; set; } = new List<MpesaGap>();
        public int Pulled { get; set; }
        public List<string> Recovered { get; set; } = new List<string>();
        public List<string> Errors { get; set; } = new List<string>();
    }

    /// <summary>Row of [Subscription Mpesa Config].</summary>
    public class MpesaConfigRow
    {
        public string Consumer_Key { get; set; }
        public string Consumer_Secret { get; set; }
        public string Short_Code { get; set; }
        public string Environment { get; set; }
    }
}
