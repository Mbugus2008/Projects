using System;
using System.Linq;

namespace Coffee
{
    public partial class Setting

    {
        public static void insert(server.Setup l)
        {
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                try
                {
                    Setting f = db.Settings.FirstOrDefault();
                    if (f == null)
                    {
                        f = new Setting();
                        db.Settings.Add(f);
                    }
                    f.to(ref f, l);

                    db.SaveChanges();
                }
                catch (Exception ex) { Logging.Logging.ReportError(ex); }
            }
        }

        
        public void to(ref Setting f, server.Setup l)
        {
            f.Current_crop = l.Current_Crop;
            f.Address = l.Address;
            f.Phone_No_ = l.Phone_No;
        }

    }
}
