using System;
using System.Collections.Generic;
using System.Linq;

namespace Coffee
{
    public partial class Coffee_summary

    {
        public static void insertcoffeesummary(server.Member_Collection_Summary l)
        {
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                try { 
                Coffee_summary f = db.Coffee_summaries.FirstOrDefault(o => o.Member_No == l.Member_No && o.Crop == l.Crop && o.Coffee_Type == (int)l.CoffeeType);
                if (f == null)
                {
                    f = new Coffee_summary();
                    f.Member_No = l.Member_No;
                    f.Crop = l.Crop;
                    f.Coffee_Type =(int) l.CoffeeType;

                    db.Coffee_summaries.Add(f);
                }
                f.toloan(ref f, l);

                db.SaveChanges();
            }catch (Exception ex) { Logging.Logging.ReportError(ex); }
        }
        }

        public static void insertcoffeesummarys(List<server.Member_Collection_Summary> ff)
        {
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                foreach (var l in ff)
                {
                    try { 
                    Coffee_summary f = db.Coffee_summaries.FirstOrDefault(o => o.Member_No == l.Member_No && o.Crop == l.Crop && o.Coffee_Type == (int)l.CoffeeType);
                    if (f == null)
                    {
                        f = new Coffee_summary();
                        f.Member_No = l.Member_No;
                        f.Crop = l.Crop;
                        f.Coffee_Type =(int) l.CoffeeType;

                        db.Coffee_summaries.Add(f);
                    }
                    f.toloan(ref f, l);
db.SaveChanges();

                }catch (Exception ex) { Logging.Logging.ReportError(ex); }
            }
                
            }
        }
        public void toloan(ref Coffee_summary f, server.Member_Collection_Summary l)
        {
            f.Total_Kg = (double)l.Total_Kg;

        }

    }
}
