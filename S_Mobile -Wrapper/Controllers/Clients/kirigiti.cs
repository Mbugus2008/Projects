using Logging;
using S_Mobile.Districts;
using S_Mobile.Mpesa_Transactions;
using S_Mobile.Purpose;
using Serilog;
using System;
using System.Linq;

namespace S_Mobile.Controllers.Clients
{
    public class kirigiti : Iclient
    {
        public kirigiti() {
        
        }
        public Results<Mpesa_Transactions.Mpesa_Transactions> Mpesa(Mpesa_Transactions.Mpesa_Transactions mpesa)
        {
            Results<Mpesa_Transactions.Mpesa_Transactions> r = new Results<Mpesa_Transactions.Mpesa_Transactions>();
            try
            {
                mpesa.Transaction_DateSpecified = true;
                mpesa.Paid_InSpecified = true;
                mpesa.TranstypeSpecified = true;
                mpesa.Completion_TimeSpecified = true;
                mpesa.ChargeSpecified = true;
                // 1767371#Jerusalem-O
                var mp = new Mpesa_Transactions_Service(WebApiApplication.currentclient).Read(mpesa.Receipt_No);
                if (mp == null)
                {
                    new Mpesa_Transactions_Service(WebApiApplication.currentclient).Create(ref mpesa);

                    char[] delimiter = { '#' };
                    string[] acc = mpesa.A_C_No.Split(delimiter, StringSplitOptions.RemoveEmptyEntries);
                    switch (acc.Length)
                    {
                        case 1:
                            mpesa.Purpose = "UNDEFINED";
                            break;

                        case 2:
                            char[] del = { '/', '-', '_', ' ' };
                            string[] dis = acc[1].Split(del, StringSplitOptions.RemoveEmptyEntries);
                            var districts = new Districts_Service(WebApiApplication.s).ReadMultiple(new Districts_Filter[] { }, null, 0);
                            if (dis[0].Length > 1)
                            {
                                var dist = districts.Where(o => o.Possible_entry_values.ToLower().Contains(dis[0].ToLower().Trim())).FirstOrDefault();
                                if (dist != null)
                                {
                                    mpesa.District = dist.Code;
                                }
                                else
                                    mpesa.District = "UNDEFINED";
                            }
                            else
                            {
                                mpesa.District = "UNDEFINED";
                                var pp = new Purpose_Service(WebApiApplication.s).ReadMultiple(new Purpose_Filter[] { }, null, 0);
                                var pup = pp.Where(person => person.Possible_entry_values.Split(',').Select(name => name.Trim()).Contains(dis[1])).FirstOrDefault();
                                ;//Where(o => o.Possible_entry_values.ToLower().Contains(dis[0].ToLower().Trim())).FirstOrDefault();
                                if (pup != null)
                                {
                                    mpesa.Purpose = pup.Code;
                                }
                                else
                                    mpesa.Purpose = "UNDEFINED";
                            }
                            switch (dis.Length)
                            {
                                case 2:
                                    var pp = new Purpose_Service(WebApiApplication.s).ReadMultiple(new Purpose_Filter[] { }, null, 0);
                                    var pup = pp.Where(person => person.Possible_entry_values.Split(',').Select(name => name.Trim()).Contains(dis[1])).FirstOrDefault();

                                    //var ddd =pp.Where(o => o.Possible_entry_values.ToLower().Contains(dis[1].ToLower().Trim())).FirstOrDefault();
                                    if (pup != null)
                                    {
                                        mpesa.Purpose = pup.Code;
                                    }
                                    else
                                        mpesa.Purpose = "UNDEFINED";
                                    break;
                            }
                            break;

                        default:
                            districts = new Districts_Service(WebApiApplication.s).ReadMultiple(new Districts_Filter[] { }, null, 0);
                            var distt = districts.Where(o => o.Possible_entry_values.ToLower().Contains(acc[1].ToLower().Trim())).FirstOrDefault();
                            if (distt != null)
                            {
                                mpesa.District = distt.Code;
                            }
                            else
                                mpesa.District = "UNDEFINED";

                            var ppp = new Purpose_Service(WebApiApplication.s).ReadMultiple(new Purpose_Filter[] { }, null, 0);
                            var puup = ppp.Where(person => person.Possible_entry_values.Split(',').Select(name => name.Trim()).Contains(acc[2])).FirstOrDefault();

                            //var ddd =pp.Where(o => o.Possible_entry_values.ToLower().Contains(dis[1].ToLower().Trim())).FirstOrDefault();
                            if (puup != null) { mpesa.Purpose = puup.Code; }
                            else
                                mpesa.Purpose = "UNDEFINED";
                            break;
                    }
                    //"Paybill - ${tr!.Name} - Ref:${tr!.Receipt_No} - ${tr!.Purpose}";
                    mpesa.Detaills = String.Format("Paybill - {0} - {1} Ref. {2} -{3} ", mpesa.Purpose, mpesa.Name, mpesa.Receipt_No, mpesa.District);
                    // new Mpesa_Transactions_Service(WebApiApplication.s).Create(ref mpesa);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Kanisa");
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            finally
            {
                //  new Mpesa_Transactions_Service(WebApiApplication.currentclient).Create(ref mpesa);
                r.Contents = mpesa;
            }
            return r;
        }
    }
}