using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coffee
{
    public partial class AutoweighEntities : DbContext
    {
        public AutoweighEntities(string Connectionstring)
            : base(Connectionstring)
        {
        }
        public int SaveChanges(Boolean showmessage)
        {
            int s = 0;
            try
            {
                s = base.SaveChanges();
                if (s != 0)
                    System.Windows.Forms.MessageBox.Show("Changes saved successfully");
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            return s;
        }
        public enum Savetype
        {
            Farmer
        }
        public int SaveChanges(Savetype savetype)
        {

            int s;
            try
            {
                switch (savetype)
                {
                    case Savetype.Farmer:
                        var entities = ChangeTracker.Entries().Where(x => (x.State == EntityState.Added || x.State == EntityState.Modified));
                        foreach (var entry in entities)
                        {
                            var entity = entry.Entity as Farmer;
                            entity.Updated = true;
                        }
                        break;

                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            s = base.SaveChanges();
            return s;
        }
    }

    
    public partial class Item
    {
        public Item_Variant[] Variants
        {
            get
            {
                return coffee.db.Item_Variants.Where(o => o.No == No).ToArray();
            }
        }
        public double Inventory_Not_Synced
        {
            get
            {
                double v = 0;
                //var store = new AutoweighEntities(coffee.ConnectionString()).Stores.Where(o => o.Item == No && (o.Sent == false ||o.Sent == null )  && o.Factory == coffee.setup.Factory).ToList();
                var store = coffee.db.Stores.Where(o => o.Item == No && (o.Sent == false ||o.Sent == null )  && o.Factory == coffee.setup.Factory).ToList();
                if (store!=null && store.Count()>0)
                 v = (double)store.Where(o => o.Posted == true).Sum(i => i.Quantity);
                return v;
            }
        }
            public double Inventory_Balance
        {
            get
            {
               
                return (double)(Inventory - Inventory_Not_Synced);
            }
        }
        public double Stock
        {
            get { 
                
                return (double) (Inventory ?? 0 - Inventory_Not_Synced); 
            
            
            }
        }
    }
    public partial class Store
    {
        public string Item_name
        {
            get
            {
                string i = "";
                try
                {
                    if (Item != null)
                    {
                        var dd = coffee.inventory.FirstOrDefault(o => o.No == Item);
                        if (dd != null)
                            i = dd.Description;

                    }
                }
                catch (Exception ex) { }

                return i;
            }
        }
        public string Item_description
        {
            get
            {


                return string.Format("{0} {1}", Item_name, Variant);
            }
        }
        public string Payment_mode
        {
            get
            {
                string p = "STORE INVOICE";
                if (Paymode != null)
                {
                    switch ((server.Payment_Mode)Paymode)
                    {
                        case server.Payment_Mode.Credit:
                            p = "STORE INVOICE";
                            break;
                        case server.Payment_Mode.Mpesa:
                            p = "STORE CASH SALE";
                            break;
                    }
                }
                return p;
            }
        }
        public string Client_name
        {
            get
            {
                string c = "";
                try
                {

                    if (Client != null)
                    {
                        var f = coffee.farmers.FirstOrDefault(o => o.No == Client);
                        if (f != null)
                            c = f.Name;


                    }

                    else
                        return "";
                }
                catch (Exception e) { }
                return c;
            }

        }
        public bool Posted
        {
            get
            {
                bool c = false;
                try
                {

                   var f = new AutoweighEntities(coffee.ConnectionString()).Stores_headers.Where(o => o.Entry == Entry ).ToList().FirstOrDefault();
                    if (f != null)
                        c =(bool) f.Posted ;
                }
                catch (Exception e) { }
                return c;
            }

        }  
      
    }
   
    public partial class Item_Variant
    {
        public double quantity_in
        {
            get
            {
                return (double)coffee.stocks.Where(o => o.Item == No && o.Variant == Code).Sum(o => o.Quantity);
            }
        }
        public double quantity_out
        {
            get
            {
                return (double)coffee.store.Where(o => o.Item == No && o.Variant == Code).Sum(o => o.Quantity);
            }
        }
        public double quantity_Bal
        {
            get
            {
                return (double)quantity_in - quantity_out;
            }
        }
        public string Item_name
        {
            get
            {
                return coffee.inventory.FirstOrDefault(o => o.No == No).Description;
            }
        }


    }
    public partial class Stock
    {
        public double quantity_out
        {
            get
            {
                var q = from s in coffee.store join sh in coffee.store_header on s.Entry equals sh.Entry where sh.Posted == true && s.Item == Item && s.Variant == Variant && s.Stock == Document_No select s.Quantity;


                return (double)(q.FirstOrDefault() == null ? 0 : q.FirstOrDefault());
            }
        }
        public double quantity_Bal
        {
            get
            {
                return (double)(Quantity - (double)quantity_out);
            }
        }
    }
    public partial class Daily_Collections_Detail
    {
        public string Name
        {
            get
            {
                return string.Format("{0} {1}", Farmers_Number, Farmers_Name);
            }
        }
        

    }
}
