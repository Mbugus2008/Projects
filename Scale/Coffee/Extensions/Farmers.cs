using DevExpress.XtraRichEdit.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coffee
{
    public partial class Farmer
    {
        public Daily_Collections_Detail[] collections
        {
            get
            {
                return coffee.loaddb().Daily_Collections_Details.Where(o => o.Farmers_Number == No).ToArray();
            }
        }

        public Store[] Store
        {
            get
            {
                var sum = coffee.store.Where(o => o.Client == No).ToArray();
                return sum;
            }
        }
        public double Cherry
        {
            get
            {
                var sum = (double)coffee.loaddb().Daily_Collections_Details.Where(o => o.Farmers_Number == No && o.Crop == coffee.setup.Current_crop && (o.Coffee_Type == "0" || o.Coffee_Type == "1") && (o.Updated == false || o.Updated == null)).Select(l => l.Kg__Collected)
                        .DefaultIfEmpty(0)
                        .Sum();
                return sum;
            }
        }
        public double Mbuni
        {
            get
            {
                var sum = (double)coffee.loaddb().Daily_Collections_Details.Where(o => o.Farmers_Number == No && o.Crop == coffee.setup.Current_crop && o.Coffee_Type == "2" && (o.Updated == false || o.Updated == null)).Select(l => l.Kg__Collected)
                        .DefaultIfEmpty(0)
                        .Sum();
                return sum;
            }
        }
        public double Cherry_cumm
        {
            get
            {
                var sum = (double)coffee.loaddb().Daily_Collections_Details.Where(o => o.Farmers_Number == No && o.Crop == coffee.setup.Current_crop && (o.Coffee_Type == "0" || o.Coffee_Type == "1")).Select(l => l.Kg__Collected)
                        .DefaultIfEmpty(0)
                        .Sum();
                return sum;
            }
        }
        public double Mbuni_cumm
        {
            get
            {
                var sum = (double)coffee.loaddb().Daily_Collections_Details.Where(o => o.Farmers_Number == No && o.Crop == coffee.setup.Current_crop && o.Coffee_Type == "2").Select(l => l.Kg__Collected)
                        .DefaultIfEmpty(0)
                        .Sum();
                return sum;
            }
        }
        public Double Store_Total
        {
            get
            {
                var sum = coffee.store.Where(o => o.Client == No).Sum(o => o.Line_total);
                return (double)(sum == null ? 0 : sum);
            }
        }
        public double? Unposted_store
        {
            get
            {
                var sum = coffee.loaddb().Stores_headers.Where(o => o.Client == No && o.Crop_Year == coffee.setup.Current_crop && (o.Sent == false || o.Sent == null) && o.Posted == true).Select(l => l.Credit_Amount)
                             .DefaultIfEmpty(0)
                             .Sum().GetValueOrDefault(); ;
                return (double)sum;
            }
        }

        public Double Stores_Limit_available
        {
            get
            {
                return (double)(Limit - (Total_Stores + Unposted_store));
            }
        }
        public Double TotalStores
        {
            get
            {
                return (double)(Total_Stores ?? 0 + Unposted_store);
            }
        }
        public Loan[] loans { get {return  coffee.loaddb().Loans.Where(o=> o.Client_Code == No).ToArray(); } }
        public Coffee_summary[] coffee_Summaries { get {return  coffee.loaddb().Coffee_summaries.Where(o=> o.Member_No == No).ToArray(); } }
        public void tofarmer(ref Farmer f, server.Vendor farmer)
        {
            f.Name = farmer.Name;
            f.Phone = farmer.Phone_No;
            f.ID_No = farmer.ID_No;
            f.Account_Category = (int)farmer.Account_Category;
            f.Bank_Code = farmer.Bank_Code;
            f.Bank_Name = farmer.Bank_Name;
            f.Factory = farmer.Factory;
            
            f.Other_Loans = (double)farmer.Total_Loans;
            f.Limit_percentage = (double)farmer.Limit_percentage;
          
            f.Previous_Crop_collection = (double)farmer.Previous_Crop_Coffee;
            f.Limit = (double)farmer.Limit;
           
            f.Current_Crop_collection_Cherry_1 = (double)farmer.Current_Collection_Grade_1;
            f.Current_Crop_collection_Cherry_2 = (double)farmer.Current_Collection_Grade_2;
            f.Cum_Mbuni = (double)farmer.Current_Collection_Mbuni;
  f.Total_Stores = (double)(farmer.Total_Stores + farmer.Unposted_Store);
          

        }

        public static void insertfarmers(List<server.Vendor> ff)
        {
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                foreach (var farmer in ff)
                {
                    Farmer f = db.Farmers.FirstOrDefault(o => o.No == farmer.No);
                    if (f == null)
                    {
                        f = new Farmer();
                        f.No = farmer.No;
                        f.Cum_Cherry = 0;
                        f.Cum_Mbuni = 0;
                        db.Farmers.Add(f);
                    }
                    f.tofarmer(ref f, farmer);

                    var cl = db.Daily_Collections_Details.Where(x => x.Farmers_Number == f.No && (x.Updated == false || x.Updated == null));
                    foreach (var item in cl.ToList())
                    {
                        item.Updated = true;
                    }

                }
                db.SaveChanges();
            }
        }
        public static void insertfarmer(server.Vendor farmer)
        {
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {

                Farmer f = db.Farmers.FirstOrDefault(o => o.No == farmer.No);
                if (f == null)
                {
                    f = new Farmer();
                    f.No = farmer.No;
                    f.Cum_Cherry = 0;
                    f.Cum_Mbuni = 0;
                    db.Farmers.Add(f);
                }
                f.tofarmer(ref f, farmer);

                var cl = db.Daily_Collections_Details.Where(x => x.Farmers_Number == f.No && (x.Updated == false || x.Updated == null));
                foreach (var item in cl.ToList())
                {
                    item.Updated = true;
                }


                db.SaveChanges();
            }
        }
    }


}
