using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace Coffee
{
    public partial class Stores_header
    {
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
        public List<Store> Store_lines
        {
            get
            {
                List<Store> s = null;
                if (Entry != null)
                {
                    s = new AutoweighEntities(coffee.ConnectionString()).Stores.Where(o => o.Entry == Entry).ToList();

                }
                return s;
            }
        }
        public double store_items_Qty
        {
            get
            {

                var s = coffee.loaddb().Stores.Where(o => o.Entry == Entry).ToList();

                if (s.Any())
                    return (double)s.Sum(o => o.Quantity);
                else
                    return 0;
            }
        }
        public string Client_name
        {
            get
            {
                string c = "";
                if (Client != null)
                {
                    var f = coffee.farmers.FirstOrDefault(o => o.No == Client);
                    if (f != null)
                        c = f.Name;
                }
                return c;
            }
        }

        public string Paymode_Name
        {
            get
            {


                return (Paymode != null ? ((server.Payment_Mode)Paymode).ToString() : "");

            }
        }
    }

    public interface IStores_headerView
    {
        IList<Stores_header> Stores_headerList { get; set; }

        Stores_header Selected { get; set; }
        CustomerPresenter Presenter { set; }
    }
    public interface IStores_headerRepository
    {
        IEnumerable<Stores_header> GetAllStoresReceipts();

        Stores_header GetStores_header(string Receipt_no);
        void SaveStore_Header( Stores_header customer);
        void DeleteStore_Header(Stores_header stores_Header);
    }
    public class CustomerPresenter
    {
        private readonly IStores_headerView _view;
        private readonly IStores_headerRepository _repository;

        public CustomerPresenter(IStores_headerView view, IStores_headerRepository repository)
        {
            _view = view;
            view.Presenter = this;
            _repository = repository;

            UpdateCustomerListView();
        }

        private void UpdateCustomerListView()
        {
         
            Stores_header selectedCustomer = _view.Selected != null ? _view.Selected : null;
            _view.Stores_headerList = _repository.GetAllStoresReceipts().ToList();
            _view.Selected = selectedCustomer;
        }

        public void UpdateCustomerView(Stores_header p)
        {
         _repository.SaveStore_Header(p);
        }

        public void SaveCustomer(Stores_header stores_Header)
        {
            _repository.SaveStore_Header(stores_Header);
        }
    }


    public class Repository : IStores_headerRepository
    {
    
        private readonly Lazy<List<Stores_header>> _Stores_header;

        public Repository()
        {
           

            _Stores_header = new Lazy<List<Stores_header>>(() =>
            {
               
                    return (List<Stores_header>)coffee.loaddb().Stores_headers.Where(o=> o.Crop_Year == coffee.setup.Current_crop).ToList();
                
            });
        }

        

        
        public IEnumerable<Stores_header> GetAllStoresReceipts()
        {
            return _Stores_header.Value;
        }

        public Stores_header GetStores_header(string Receipt_no)
        {
            return _Stores_header.Value.Where(o=> o.Entry == Receipt_no).FirstOrDefault();
        }

        public void SaveStore_Header(Stores_header customer)
        {
            
        }

        public void DeleteStore_Header(Stores_header stores_Header)
        {
            DeleteStore_Header(stores_Header);
        }
    }
}
