using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Logging;
using Matatu_Rest.Teller_Transactions;

namespace Matatu_Rest.Controllers
{
    public class TellerController : ApiController
    {
        [HttpGet]
        [Route("api/gettellertrans")]
        public Results<Teller_Transactions.Teller_Transactions[]> Transactions(string Agent)
        {
            try
            {
                return new Results<Teller_Transactions.Teller_Transactions[]>()
                {
                    Contents = new Teller_Transactions_Service(my_app.Settings).ReadMultiple(
                        new Teller_Transactions_Filter[]
                        {
                            new Teller_Transactions_Filter()
                                { Criteria = Agent, Field = Teller_Transactions_Fields.From_Account }
                        }, null, 0)
                };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Teller_Transactions.Teller_Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/tellertrans")]
        public Results<Teller_Transactions.Teller_Transactions> update(Teller_Transactions.Teller_Transactions teller_transactions)
        {
            try
            {
                teller_transactions.Date_Issued = DateTime.Now;
                teller_transactions.Date_IssuedSpecified = true;
                teller_transactions.Date_Received = DateTime.Now;
                teller_transactions.Date_ReceivedSpecified = true;
                teller_transactions.Transaction_TypeSpecified = true;
                teller_transactions.Transaction_DateSpecified = true;
                Teller_Transactions_Service tt = new Teller_Transactions_Service(my_app.Settings);
                if (teller_transactions.No != null)
                {
                    Teller_Transactions.Teller_Transactions tr = tt.Read(teller_transactions.No);
                    if (tr == null)
                        tt.Create(ref teller_transactions);
                    else
                    {
                        teller_transactions.Key = tr.Key;
                        tt.Update(ref teller_transactions);
                    }
                }
                else
                {
                    tt.Create(ref teller_transactions);

                }
                return new Results<Teller_Transactions.Teller_Transactions>() { Contents = teller_transactions };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Teller_Transactions.Teller_Transactions>() { Code = -1, Desc = e.Message };
            }
        }
    }
}