using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coffee
{
    public partial class Loan

    {
        public static void insertloan(server.Loans l)
        {
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                try
                {
                    Loan f = db.Loans.FirstOrDefault(o => o.Loan_No_ == l.Loan_No);
                if (f == null)
                {
                    f = new Loan();
                    f.Loan_No_ = l.Loan_No;

                    db.Loans.Add(f);
                }
                f.toloan(ref f, l);

                db.SaveChanges();
                }
                catch (Exception ex) { Logging.Logging.ReportError(ex); }
            }
        }

        public static void insertloans(List<server.Loans> ff)
        {
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                foreach (var l in ff)
                {
                    try
                    {
                        Loan f = db.Loans.FirstOrDefault(o => o.Loan_No_ == l.Loan_No);
                        if (f == null)
                        {
                            f = new Loan();
                            f.Loan_No_ = l.Loan_No;
                            db.Loans.Add(f);
                        }
                        f.toloan(ref f, l);

                        db.SaveChanges();
                    }catch(Exception ex) { Logging.Logging.ReportError(ex); }
                }
                
            }
        }
        public void toloan(ref Loan f, server.Loans l)
        {
            f.Application_Date = l.Application_Date;
            f.Loan_Type = l.Loan_Type;
            f.Balance = (double)l.Outstanding_Balance;f.Client_Code = l.Client_Code;
        }

    }
}
