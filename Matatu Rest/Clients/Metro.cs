using Logging;
using Matatu_Rest.Transactions;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Matatu_Rest.Clients
{
    public class Metro : Iclient
    {
        public Metro() { }
        public  Results<Transactions.Transactions> SetTransactions(Transactions.Transactions trans)
        {
            try
            {
                //if (transaction is Transactions.Transactions trans)
                //{

                    using (var service = new Transactions_Service(my_app.Settings))
                    {
                        if (string.IsNullOrEmpty(trans.Document_No)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Document No Required" }; }
                        if (string.IsNullOrEmpty(trans.Loan_No)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Vehicle No Required" }; }
                        if (trans.Amount == 0) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Amount must have a Value" }; }
                        if (string.IsNullOrEmpty(trans.Type)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Type Required" }; }

                        //if (trans.Transaction_Date < DateTime.Now.AddDays(-2)) { trans.Transaction_Date = DateTime.Today.Date; }// return new Results<Transactions.Transactions>() { Code = -1, Desc = "Transaction Date Required" }; }
                        if (string.IsNullOrEmpty(trans.Agent_Code)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Agent Code Required" }; }
                        //if (trans.Transaction_Time < DateTime.Now.AddDays(-2)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Transaction Time Required" }; }
                        trans.Transaction_DateSpecified = true;
                        trans.AmountSpecified = true;
                        trans.Transaction_Time = new DateTime(trans.Transaction_Date.Year, trans.Transaction_Date.Month, trans.Transaction_Date.Day, trans.Transaction_Time.Hour, trans.Transaction_Time.Minute, trans.Transaction_Time.Second);

                        trans.Transaction_TimeSpecified = true;
                        var t = service.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = trans.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = trans.OTTN, Field = Transactions_Fields.OTTN } }, null, 0).FirstOrDefault();
                        if (t == null)
                            service.Create(ref trans);
                        else
                            return new Results<Transactions.Transactions>() { Contents = t as Transactions.Transactions };

                        return new Results<Transactions.Transactions>()
                        {
                            Contents = trans
                        };
                    }
                //}
            }
            catch (Exception e)
            {
                Log.Error(e, "transactions");
                return new Results<Transactions.Transactions>() { Code = -1, Desc = e.Message };
            }

        }public Results<Transactions.Transactions> settransactions2(Transactions.Transactions trans)
        {
            try
            {
                using (var service = new Transactions_Service(my_app.Settings))
                {
                    if (string.IsNullOrEmpty(trans.Document_No)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Document No Required" }; }
                    if (string.IsNullOrEmpty(trans.Loan_No)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Vehicle No Required" }; }
                    if (trans.Amount == 0) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Amount must have a Value" }; }
                    if (string.IsNullOrEmpty(trans.Type)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Type Required" }; }

                    //if (trans.Transaction_Date < DateTime.Now.AddDays(-2)) { trans.Transaction_Date = DateTime.Today.Date; }// return new Results<Transactions.Transactions>() { Code = -1, Desc = "Transaction Date Required" }; }
                    if (string.IsNullOrEmpty(trans.Agent_Code)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Agent Code Required" }; }
                    //if (trans.Transaction_Time < DateTime.Now.AddDays(-2)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Transaction Time Required" }; }
                    trans.Transaction_DateSpecified = true;
                    trans.AmountSpecified = true;
                    trans.Transaction_Time = new DateTime(trans.Transaction_Date.Year, trans.Transaction_Date.Month, trans.Transaction_Date.Day, trans.Transaction_Time.Hour, trans.Transaction_Time.Minute, trans.Transaction_Time.Second);

                    trans.Transaction_TimeSpecified = true;
                    var t = service.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = trans.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = trans.OTTN, Field = Transactions_Fields.OTTN } }, null, 0).FirstOrDefault();
                    if (t == null)
                        service.Create(ref trans);
                    else
                        return new Results<Transactions.Transactions>() { Contents = t };

                    return new Results<Transactions.Transactions>()
                    {
                        Contents = trans
                    };
                }
            }
            catch (Exception e)
            {
                Log.Error(e, "transactions");
                return new Results<Transactions.Transactions>() { Code = -1, Desc = e.Message };
            }

        }
    }
}