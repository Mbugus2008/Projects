using Logging;
using RunCodunit.Embassava_CustomerStatistics;
using RunCodunit.Embassava_Trans;
using RunCodunit.Embassava_VehicleStatistics;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace RunCodunit.Clients
{
    public class Embassava : Iclient
    {
        Transactions_Service transactions;
        CustomerStatistics_Service Customerservice;
        VehicleStatistics_Service Vehicleservice;
        logs logs; settings.NAV sss;

        NetworkCredential cd;

        public void start(settings.NAV ss)
        {
            cd = new NetworkCredential(ss.Username, ss.pass, ss.domain);
            transactions = new Transactions_Service() { Url = geturl(ss, transactions.Url), PreAuthenticate = true, Credentials = cd };
            Customerservice = new CustomerStatistics_Service() { Url = geturl(ss, transactions.Url), PreAuthenticate = true, Credentials = cd };
            Vehicleservice = new VehicleStatistics_Service() { Url = geturl(ss, transactions.Url), PreAuthenticate = true, Credentials = cd };



        }
        public void distribute(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            var tr = transactions.ReadMultiple(new Transactions_Filter[] {
                new Transactions_Filter { Criteria = "SERVICE FEE PAID", Field = Transactions_Fields.Type },
                new Transactions_Filter { Criteria = "No", Field = Transactions_Fields.Posted },
            }, null, 10);
            foreach (Embassava_Trans.Transactions t in tr)
            {
                decimal amount = t.Amount;

                switch (t.Amount)
                {
                    case 1300: t.Amount = 500; break;
                    case 1000: t.Amount = 350; break;
                    case 600: t.Amount = 200; break;

                }
                amount -= t.Amount;

                Vehicleservice = new VehicleStatistics_Service() { Url = geturl(sss, Vehicleservice.Url, Companies.LEGAL.ToString()), PreAuthenticate = true, Credentials = cd };

                var vehicle = Vehicleservice.ReadMultiple(new VehicleStatistics_Filter[] {
                    new VehicleStatistics_Filter { Criteria = t.Loan_No, Field = VehicleStatistics_Fields.Vehicle_Number },
                    new VehicleStatistics_Filter { Criteria = string.Format("{0}..{1}",new DateTime( t.Transaction_Date.Year,t.Transaction_Date.Month,1),new DateTime(t.Transaction_Date.Year,t.Transaction_Date.Month, 1).AddMonths(1).AddDays(-1)), Field = VehicleStatistics_Fields.Date_Filter }
                    }, null, 0).FirstOrDefault();

                if (vehicle != null)
                {
                    if (vehicle.Legal < 2000)
                    {
                        Embassava_Trans.Transactions legal = t.ShallowCopy();
                        legal.Key = null;
                        legal.Type = "LEGAL";
                        legal.Document_No = $"{legal.Document_No}L";
                        legal.Amount = 2000 - vehicle.Legal;
                        if (legal.Amount > amount) legal.Amount = amount;
                        legal.Company = Companies.LEGAL.ToString();
                        legal.AmountSpecified = true;
                        transactions.Create(ref legal);
                        amount -= legal.Amount;
                    }
                }
                if (amount > 0)
                {
                    Embassava_Trans.Transactions legal = t.ShallowCopy();
                    legal.Key = null;
                    legal.Type = "DEPOSIT PAYMENT";
                    legal.Document_No = $"{legal.Document_No}SS";
                    legal.Amount = amount;
                    legal.Company = Companies.SACCO.ToString();
                    legal.AmountSpecified = true;
                    transactions.Create(ref legal);
                }

                t.Company= Companies.OPERATION.ToString();
                t.Distributed = true;
                t.DistributedSpecified = true;

                Embassava_Trans.Transactions tt = t;
                transactions.Update( ref tt);
            }
        }
        public static string geturl(settings.NAV ss, string page)
        {

            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Serverip, ss.Companyname, ss.Instance, ss.Port,
              Logging.misc.getpage(page));
        }
        public static string geturl(settings.NAV ss, string page, string company)
        {
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Serverip, company, ss.Instance, ss.Port,
              Logging.misc.getpage(page));
        }
    }
    enum Companies
    {
        //[Description("OPERAT")]
        OPERATION,
        SACCO,
        LEGAL,
        INSURANCE,
    }
}

namespace RunCodunit.Embassava_Trans
{ 
public partial class Transactions
    {
        public Transactions ShallowCopy()
        {
            return (Transactions)this.MemberwiseClone();
        }
    }
}
