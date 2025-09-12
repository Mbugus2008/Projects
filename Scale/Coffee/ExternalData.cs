using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Threading.Tasks;
using Test;
using Coffee.server;

namespace Coffee
{
    public class ExternalData
    {
        public server.Collect service = new server.Collect();
        public static bool stop = false;
        
        #region Update server
        public void start()
        {
            if (client.connectedtomain)
            {               
                Logging.Logging.LogEntryOnFile("Starting Services");
                Task.Factory.StartNew(() => updatedata(), TaskCreationOptions.LongRunning);
                Task.Factory.StartNew(() => updatecollections(), TaskCreationOptions.LongRunning);
                Task.Factory.StartNew(() => updatesetup(), TaskCreationOptions.LongRunning);
                Task.Factory.StartNew(() => updatestores(), TaskCreationOptions.LongRunning);
            }
        }
        public void updatesetup()
        {
            try
            {
                //while (stop == false)
                //{
                service.Url = coffee.setup.Server_url;

                service.setupCompleted += (s, e) =>
                {
                    if (e.Error != null)
                        Logging.Logging.ReportError(e.Error);
                    else if (e.Cancelled)
                        Logging.Logging.ReportError(e.Error);
                    else
                    {
                        if (e.Result != null)
                        {
                            Setting.insert(e.Result);
                        }
                    };
                };
                service.setupAsync();
                service.LoansCompleted += (s, e) =>
                {
                    if (e.Error != null)
                        Logging.Logging.ReportError(e.Error);
                    else if (e.Cancelled)
                        Logging.Logging.ReportError(e.Error);
                    else
                    {

                        if (e.Result.Code == 0) { Loan.insertloans(e.Result.Contents.ToList());if (e.Result.Contents.Length>0 ) service.LoansAsync(e.Result.Contents.LastOrDefault().Key,(int)coffee.setup.Batch_size); }
                     
                    }
                };
                service.LoansAsync(null,(int)coffee.setup.Batch_size);

                service.MembercollectionsummaryCompleted += (s, e) =>
                {
                    if (e.Error != null)
                        Logging.Logging.ReportError(e.Error);
                    else if (e.Cancelled)
                        Logging.Logging.ReportError(e.Error);
                    else
                    {

                        if (e.Result.Code == 0) { Coffee_summary.insertcoffeesummarys(e.Result.Contents.ToList()); if (e.Result.Contents.Length > 0) service.MembercollectionsummaryAsync(e.Result.Contents.LastOrDefault().Key, (int)coffee.setup.Batch_size); }

                    }
                };
                service.MembercollectionsummaryAsync(null, (int)coffee.setup.Batch_size);
                // }
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
        }


        public void updatedata()
        {
            try
            {
                while (stop == false)
                {
                    
                        List<server.Vendor> ff = null;
                        if (coffee.setup.Load_Members_in_Batches == false)
                        {
                            if (coffee.setup.Pick_factory_farmers == true)
                                 Farmer.insertfarmers(service.Farmersbyfactory(coffee.setup.Factory).ToList());
                            else
                                  Farmer.insertfarmers(service.Farmers(null).ToList());
                      }
                        else
                        {
                            if (coffee.setup.Pick_factory_farmers == true)
                                ff = service.Farmersbyfactorybatch(coffee.setup.Factory, null, (int)coffee.setup.Batch_size).ToList();
                            else
                                ff = service.FarmersBatch(null, (int)coffee.setup.Batch_size).ToList();

                            string lastkey = null;
                            while (ff.Count > 0)
                            {                               
                                    Farmer.insertfarmers(ff);
                                     lastkey = ff.LastOrDefault().Key;

                                    if (coffee.setup.Pick_factory_farmers == true)
                                        ff = service.Farmersbyfactorybatch(coffee.setup.Factory, lastkey, (int)coffee.setup.Batch_size).ToList();
                                    else
                                        ff = service.FarmersBatch(lastkey, (int)coffee.setup.Batch_size).ToList();
                              
                            }
                        }
                        Farmer.insertfarmers(service.Cross_Farmers(null).ToList());
                        Farmer.insertfarmers(service.Group_Farmers(null).ToList());
                 
                    System.Threading.Thread.Sleep((coffee.setup.Sync_data_interval_sec_ ?? 30) * 1000);
                }
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
        }
        public void updatefarmer(String frm)
        {
            try
            {
              service.Url = coffee.setup.Server_url;
                        server.Vendor farmer =  service.Farmer(frm);
                    Farmer.insertfarmer(farmer);
          
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
        }
        public void updatecollections()
        {
            try
            {
                while (stop == false)
                {
                    using (var db = new AutoweighEntities(coffee.ConnectionString()))
                    {
                        try
                        {
                            service.Url = coffee.setup.Server_url;
                            service.Timeout = 600000;

                            List<server.Collection> ncc = new List<server.Collection>();
                            var cc = db.Daily_Collections_Details.Where(o => o.Sent == false).Take(400);
                            foreach (Daily_Collections_Detail c in cc)
                            {
                                server.Collection nc = new server.Collection();
                                nc.Collection_Number = c.Collection_Number;
                                nc.Collections_Date = c.Collections_Date;
                                nc.Collections_DateSpecified = true;
                                nc.Kg_Collected = (decimal)(c.Kg__Collected ?? 0);
                                nc.Kg_CollectedSpecified = true;
                                nc.Farmers_Number = c.Farmers_Number;
                                nc.Farmers_Name = c.Farmers_Name;
                                nc.Factory = c.Factory;
                                nc.Member_Number = c.Delivered_By;
                                nc.Collections_Time = (DateTime)c.Collection_time;
                                nc.Collections_TimeSpecified = true;
                                nc.Coffee_Type =(server.Coffee_Type) Convert.ToInt32( c.Coffee_Type) ;
                                nc.Coffee_TypeSpecified = true;
                                nc.Collected_by = c.User;
                                nc.Collect_type = c.Collect_type;
                                nc.Crop = c.Crop;
                                ncc.Add(nc);
                            }
                            if (ncc.Count > 0)
                            {
                                var col = service.Collections(ncc.ToArray());
                                foreach (var c in col.ToList())
                                {
                                    var ccc = db.Daily_Collections_Details.FirstOrDefault(o => o.Collection_Number == c.Collection_Number);
                                    if (cc != null)
                                        if (c.Code == 0)
                                        {
                                            ccc.Sent = true;
                                            ccc.Comments = "";
                                        }
                                        else
                                        {
                                            ccc.Comments = c.desc;
                                        }
                                    db.SaveChanges();
                                }
                            }
                        }
                        catch (Exception ex)
                        { Logging.Logging.ReportError(ex); }
                    }
                    System.Threading.Thread.Sleep((coffee.setup.Sync_data_interval_sec_ ?? 30)*1000);
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
        }
        public void storeitems (){
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                var items = service.Itemsbylocation (coffee.setup.Factory);

                foreach (var item in items)
                {
                    Logging.Logging.LogEntryOnFile(item.No);
                    Item f = db.Items.FirstOrDefault(o => o.No == item.No);
                    if (f == null)
                    {
                        f = new Item();
                        f.No = item.No;
                        db.Items.Add(f);
                    }
                    f.Description = item.Description;
                    f.Base_Unit_of_Measure = item.Base_Unit_of_Measure;
                    f.Unit_Cost = (double)item.Unit_Cost;
                    f.Unit_Price = (double)item.Unit_Price;
                    f.Inventory = (double)item.Inventory;// + (double)item.Inventory_Not_posted;
                    f.Prevent_Negative_Inventory =(int) item.Prevent_Negative_Inventory;
                    //if (item.Item_Variants != null)
                    //foreach (var variants in item.Item_Variants)
                    //{
                    //    Item_Variant v = db.Item_Variants.FirstOrDefault(o => o.Code == variants.Code && o.No == variants.Item_No);
                    //    if (v == null)
                    //    {
                    //        v = new Item_Variant();
                    //        v.No = variants.Item_No;
                    //        v.Code = variants.Code;
                    //        db.Item_Variants.Add(v);
                    //    }
                    //    v.Description = variants.Description;
                    //    v.Price = (double)variants.Price;
                    //}

                    db.SaveChanges();

                }
            }
        }
        public void updatestores()
        {
            try
            {
                while (stop == false)
                {
                    using (var db = new AutoweighEntities(coffee.ConnectionString()))
                    {

                        try
                        {
                            service.Url = coffee.setup.Server_url;
                            storeitems();
                          List<server.Stores_Header> storesheader = new List<server.Stores_Header>();
                            var unsentstoreheader = db.Stores_headers.Where(o => (o.Sent == false || o.Sent == null ) && (o.Posted == true)).ToList().Take(300);
                            foreach (var store in unsentstoreheader)
                            {
                                server.Stores_Header sheader = new server.Stores_Header();
                                sheader.Client = store.Client;
                                sheader.Collector_No = store.Collector_No;
                                sheader.Collector_Name = store.Collector;
                                sheader.Entry = store.Entry;
                                sheader.Total =(decimal) store.Total.GetValueOrDefault();
                                sheader.TotalSpecified = true;
                                sheader.PayMode = (server.PayMode)store.Paymode;
                                sheader.PayModeSpecified = true;
                                sheader.Amount_Paid = (decimal)store.Amount_Paid.GetValueOrDefault();
                                sheader.Amount_PaidSpecified = true;
                                sheader.Balance = (decimal)store.Balance.GetValueOrDefault();
                                sheader.BalanceSpecified = true;
                                sheader.Limit = (decimal)store.Limit.GetValueOrDefault();
                                sheader.LimitSpecified = true;
                                sheader.Stores = (decimal)store.Stores.GetValueOrDefault();
                                sheader.StoresSpecified = true;
                                sheader.Date =(DateTime) store.Date;
                                sheader.DateSpecified = true;
                                sheader.Limit_Available = (decimal)store.Limit_Available.GetValueOrDefault();
                                sheader.Limit_AvailableSpecified = true;
                                sheader.Mpesa_code = store.Mpesa_Code;
                                sheader.Mpesa_No = store.Mpesa_No;
                                sheader.Crop_Year = store.Crop_Year;
                                sheader.Factory = store.Factory;
                                sheader.Served_By = store.Served_By;
                                sheader.Credit_Amount =(decimal) store.Credit_Amount.GetValueOrDefault();
                                sheader.Item_Count = store.Item_Count.GetValueOrDefault(); sheader.Item_CountSpecified = true;
                                sheader.Credit_AmountSpecified = true;
                                storesheader.Add(sheader);
                            }
                            if (storesheader.Count() > 0)
                            {
                                var sentstoreheader = service.SetStoresheader(storesheader.ToArray());
                                foreach (var item in sentstoreheader)
                                {
                                    var s1 = db.Stores_headers.FirstOrDefault(o => o.Entry == item.Entry);
                                    if (s1 != null)
                                    {
                                        if (item.Code == 0)
                                        {
                                            s1.Sent = true;

                                            s1.Comments = "";
                                        }
                                        else
                                        {
                                            Logging.Logging.LogEntryOnFile(item.desc);
                                            s1.Comments = item.desc;
                                        }
                                    }
                                    db.SaveChanges();

                                }
                            }

                            List<server.Stores> stores = new List<server.Stores>();
                            var unsentstore = db.Stores.Where(o => o.Sent == false).ToList().Take(300);
                            foreach (var store in unsentstore)
                            {
                                if (store.Posted == true)
                                {
                                    server.Stores sstore = new server.Stores();
                                    sstore.Farmer = store.Client;
                                    sstore.Item = store.Item;
                                    sstore.Variant = store.Variant;
                                    sstore.Unit_Cost = (decimal)(store.Amount ?? 0);
                                    sstore.Unit_CostSpecified = true;
                                    sstore.Total_Cost = (decimal)(store.Line_total ?? 0);
                                    sstore.Total_CostSpecified = true;
                                    sstore.Date = (DateTime)store.Date;
                                    sstore.DateSpecified = true;
                                    sstore.Time = (DateTime)(store.Time == null ? (DateTime)store.Date : store.Time);
                                    sstore.TimeSpecified = true;
                                    sstore.Source_no = store.ID;
                                    sstore.Source_noSpecified = true;
                                    sstore.Receipt_No = store.Entry;
                                    sstore.Qty = (decimal)(store.Quantity ?? 0);
                                    sstore.QtySpecified = true;
                                    sstore.User = store.Served_By;
                                    sstore.Factory = store.Factory;
                                    sstore.Crop = store.Crop;
                                    sstore.Payment_Mode = (server.Payment_Mode)(store.Paymode ?? 0);
                                    sstore.Payment_ModeSpecified = true;
                                    stores.Add(sstore);
                                }
                            }
                            if (stores.Count() > 0)
                            {
                                var sentstore = service.SetStores(stores.ToArray());
                                foreach (var item in sentstore)
                                {
                                    var s1 = db.Stores.FirstOrDefault(o => o.ID == item.Source_no);
                                    if (s1 != null)
                                    {
                                        if (item.Code == 0)
                                        {
                                            s1.Sent = true;
                                            s1.Status = "successfull";
                                            s1.Comments = "";
                                            updatefarmer(s1.Client);
                                            db.SaveChanges();
                                        }
                                        else
                                        {
                                            s1.Status = "Failed";
                                            Logging.Logging.LogEntryOnFile(item.desc);
                                            s1.Comments = item.desc;
                                        }
                                    }
                                    db.SaveChanges();

                                }
                            }
                           
                        }

                        catch (Exception ex)
                        {
                            Logging.Logging.ReportError(ex);
                        }

                    }
                    System.Threading.Thread.Sleep((coffee.setup.Sync_data_interval_sec_ ?? 30) * 1000);
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
        }
        #endregion
    }
}