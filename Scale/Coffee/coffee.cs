using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;

namespace Coffee
{
    public class navi
    {
        private bool saveonchange = true;
        public BindingSource bs { get; set; }
        public AutoweighEntities db { get; set; }
        public string editaddform { get; set; }
        public string datatype { get; set; }
        public object Selecteditem { get; set; }
        public DevExpress.XtraGrid.GridControl grid { get; set; }
    }
    public class coffee
    {
        public static void DecimalToCurrencyString(object sender, ConvertEventArgs cevent)
        {
            // The method converts only to string type. Test this using the DesiredType.
            if (cevent.DesiredType != typeof(string)) return;
            if (cevent.Value !=null)
            // Use the ToString method to format the value as currency ("c").
            cevent.Value = ((double)cevent.Value).ToString("n2");
        }

        public static void CurrencyStringToDecimal(object sender, ConvertEventArgs cevent)
        {
            // The method converts back to decimal type only. 
            if (cevent.DesiredType != typeof(decimal)) return;

            // Converts the string back to decimal using the static Parse method.
            cevent.Value = Decimal.Parse(cevent.Value.ToString(),
            NumberStyles.Currency, null);
        }

        public static AutoweighEntities db;
        public static Setting setup;
        public static User user = null;
        public static string Factory_Name;
        public static List<Store> store;
        public static List<Stores_header> store_header;
        public static List<Stock> stocks;
        public static Item[] inventory;
        public static Statusbar status;
        public static Farmer[] farmers;
        public static Daily_Collections_Detail[] collection;
        public coffee(string logpath)
        {
            Logging.Logging.logpath = logpath;
            Logging.Logging.LogEntryOnFile("Application Started");
        }
        public static AutoweighEntities loaddb()
        {
            if (db != null)
                return db;
            else
                return new AutoweighEntities(ConnectionString());
        }
        public coffee()
        {
            try
            {
                db = new AutoweighEntities(ConnectionString());
                setup = db.Settings.FirstOrDefault();
                loadlists();
            }
            catch(Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
        }
        public static void loadlists() { 
         Task task = Task.Factory.StartNew(() =>
             {
                 try
                 {
                     using (var db = new AutoweighEntities(ConnectionString()))
                     {
                         setup = db.Settings.FirstOrDefault();
                         store = db.Stores.ToList();
                         stocks = db.Stocks.ToList();
                         inventory = db.Items.ToArray();
                         store_header = db.Stores_headers.ToList();
                         farmers = db.Farmers.ToArray();
                         collection = db.Daily_Collections_Details.ToArray();
                     }
                 }
                 catch (Exception ex)
                 {
                     Logging.Logging.ReportError(ex);

                 }
             });
        
        }
        public enum Coffee_Type
        {

            CherryGrade1 =0,
            CherryGrade2 =1,
            Mbuni = 2,
        }
       public static string UppercaseFirst(string s)
        {
            // Check for empty string.
            if (string.IsNullOrEmpty(s))
            {
                return string.Empty;
            }
            // Return char and concat substring.
            return char.ToUpper(s[0]) + s.Substring(1);
        }
        public static Results Reversestore(string entry)
        {
            Results r = new Results();
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                var sh = db.Stores_headers.Where(o => o.Entry == entry).FirstOrDefault();
                if (sh == null)
                {
                    r.Code = -1;
                    r.Desc = "Record not found";
                    return r;
                }
                else
                {
                    if (sh.Reversed == false || sh.Reversed ==null)
                    {                        sh.Reversed = true;

                        Stores_header shh = new Stores_header();
                        shh.Reversed = true;
                        shh.Entry = sh.Entry + "R";
                        shh.Sent = false;
                        shh.Date = sh.Date;
                        shh.Client = sh.Client;
                        shh.Balance = sh.Balance * -1;
                        shh.Total = sh.Total * -1;
                        shh.Posted = sh.Posted;
                        shh.Limit = sh.Limit * -1;
                        shh.Collector = sh.Collector;
                        shh.Collector_No = sh.Collector_No;
                        shh.Collector_is_Member = sh.Collector_is_Member;
                        shh.Factory = sh.Factory;
                        shh.Factory_Name = sh.Factory_Name;
                        shh.Served_By = sh.Served_By;
                        shh.Comments = sh.Comments;
                        shh.Paymode = sh.Paymode;
                        shh.Mpesa_No = sh.Mpesa_No;
                        shh.Mpesa_Code = sh.Mpesa_Code;
                        shh.Mpesa_Name = sh.Mpesa_Name;
                        shh.Limit = sh.Limit;
                        shh.Crop_Year = sh.Crop_Year;
                        shh.Amount_Paid = sh.Amount_Paid * -1;
                        shh.Credit_Amount = sh.Credit_Amount * -1;
                        
                        db.Stores_headers.Add(shh);
                        db.SaveChanges();
                    }
                                 
                }

                    var rr = db.Stores.Where(o => o.Entry == entry && o.Status == "Reversed");
                if (rr.Count() > 0)
                {
                    r.Code = -1;
                    r.Desc = "Store Already Reversed";
                }
                else
                {
                     rr = db.Stores.Where(o => o.Entry == entry);
                     foreach (Store item in rr)
                     {
                     item.Status = "Reversed";
                     }
                     db.SaveChanges();
                    foreach (Store item in rr)
                    {                        
                        Store s = item;
                        s.Entry = s.Entry + "R";
                        s.Amount = s.Amount * -1;
                        s.Quantity = s.Quantity * -1;
                        s.Line_total = s.Line_total * -1;
                        s.Sent = false;
                        s.Status = "Reversed";
                        db.Stores.Add(s);
                    }
                    db.SaveChanges();
                    r.Code = 0;
                    r.Desc = "Store Reversed Successfuly";

                }
            }
            return r;
        }
        public static Results login(User User)
        {
            Results r = new Results();
            using (var db = new AutoweighEntities(coffee.ConnectionString()))
            {
                var user = db.Users.FirstOrDefault(o => o.Name == User.Name && o.Password == User.Password);
                if (user != null)
                {
                    coffee.user = user;

                    r.Code = 0;

                }
                else
                {
                    r.Code = -1;
                    r.Desc = "Invalid Username or password";
                }
            }
            return r;
        }
        
        public static string ConnectionString()
        {
            // Specify the provider name, server and database.
            string providerName = "System.Data.SqlClient";
            //string serverName = "Server\\sql2008";
            //string databaseName = client.Db;
            // Initialize the connection string builder for the
            // underlying provider.
            SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
            // Set the properties for the data source.
            sqlBuilder.DataSource = string.Concat(settings.s.Serverip, @"\", settings.s.Instance);
            sqlBuilder.InitialCatalog = settings.s.database;
            sqlBuilder.IntegratedSecurity = settings.s.IntegratedSecurity;
            sqlBuilder.MultipleActiveResultSets = true;

            if (client.IntegratedSecurity == false)
            {
                sqlBuilder.UserID = settings.s.Username;
                sqlBuilder.Password = settings.s.pass;
            }

            // Build the SqlConnection connection string.
            string providerString = sqlBuilder.ToString();
            // Initialize the EntityConnectionStringBuilder.
            EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
            //Set the provider name.
            entityBuilder.Provider = providerName;

            // Set the provider-specific connection string.
            entityBuilder.ProviderConnectionString = providerString;
            // Set the Metadata location.
            entityBuilder.Metadata = "res://*/";
            return entityBuilder.ToString();

        }
    }
    public enum coffeetype
    {
        CHERRY = 0,
        MBUNI = 1,
    }
    public static class client
    {
        public static string Db;
        public static string Server;
        public static string instance;
        public static string user;
        public static string password;
        public static bool IntegratedSecurity;
        public static bool connectedtomain = false;

    }
    #region Extensions
    

    #endregion
    public class Serial
    {
        public static SerialPort mySerialPort = new SerialPort();
        public static SerialPort serial()
        {
            try
            {
                var settings = new AutoweighEntities(coffee.ConnectionString()).Settings.FirstOrDefault();
                mySerialPort.PortName = settings.Com_Port;
                mySerialPort.BaudRate = (int)settings.BaudRate;// 9600;
                mySerialPort.Parity = Parity.None;
                mySerialPort.StopBits = StopBits.One;
                mySerialPort.DataBits = 8;
                mySerialPort.Handshake = Handshake.None;
                mySerialPort.RtsEnable = true;
                mySerialPort.DtrEnable = true;
                mySerialPort.Open();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                throw;
            }
            return mySerialPort;
        }
    }
    public class Results
    {
        public int Code;
        public string Desc;
    }
    public class filters
    {
        public string field;
        public string filter;
    }

    public class settings
    {

        public string Serverip = string.Empty;
        public string domain = string.Empty;
        public string Instance = string.Empty;
        public static settings s;
        public int Port = 0;
        public string database = string.Empty;
        public bool IntegratedSecurity = true;
        public string Username = string.Empty;
        public string pass = string.Empty;
        public string Companyname = string.Empty;
        public int PostIntervalinsec = 2;
        public int Reconnectintervalinsec = 10;
        public string logpath = string.Empty;
       
        public settings loadsettings(string file)
        {     settings ss = new settings();
            try
            {
           
                XmlSerializer xs = new XmlSerializer(typeof(settings));
                using (var sr = new StreamReader(file))
                {
                    ss = (settings)xs.Deserialize(sr);
                    s = ss;
                    Logging.Logging.logpath = ss.logpath;
                }
            }
            catch (Exception ex) {
                Logging.Logging.logpath = @"C:\Logs\";
                Logging.Logging.ReportError(ex);
                throw; }


            return s;
        }
    }
    public class AutoCompleteTextBox : TextBox
    {
        private ListBox _listBox;
        private bool _isAdded;
        private String[] _values;
        private String _formerValue = String.Empty;

        public AutoCompleteTextBox()
        {
            InitializeComponent();
            ResetListBox();
        }

        private void InitializeComponent()
        {
            _listBox = new ListBox();
            this.KeyDown += this_KeyDown;
            this.KeyUp += this_KeyUp;
        }

        private void ShowListBox()
        {
            if (!_isAdded)
            {
                Parent.Controls.Add(_listBox);
                _listBox.Left = Left;
                _listBox.Top = Top + Height;
                _isAdded = true;
            }
            _listBox.Visible = true;
            _listBox.BringToFront();
        }

        private void ResetListBox()
        {
            _listBox.Visible = false;
        }

        private void this_KeyUp(object sender, KeyEventArgs e)
        {
            UpdateListBox();
        }

        private void this_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.Enter:
                case Keys.Tab:
                    {
                        if (_listBox.Visible)
                        {
                            Text = _listBox.SelectedItem.ToString();
                            ResetListBox();
                            _formerValue = Text;
                            this.Select(this.Text.Length, 0);
                            e.Handled = true;
                        }
                        break;
                    }
                case Keys.Down:
                    {
                        if ((_listBox.Visible) && (_listBox.SelectedIndex < _listBox.Items.Count - 1))
                            _listBox.SelectedIndex++;
                        e.Handled = true;
                        break;
                    }
                case Keys.Up:
                    {
                        if ((_listBox.Visible) && (_listBox.SelectedIndex > 0))
                            _listBox.SelectedIndex--;
                        e.Handled = true;
                        break;
                    }


            }
        }

        protected override bool IsInputKey(Keys keyData)
        {
            switch (keyData)
            {
                case Keys.Tab:
                    if (_listBox.Visible)
                        return true;
                    else
                        return false;
                default:
                    return base.IsInputKey(keyData);
            }
        }

        private void UpdateListBox()
        {
            if (Text == _formerValue)
                return;

            _formerValue = this.Text;
            string word = this.Text;

            if (_values != null && word.Length > 0)
            {
                string[] matches = Array.FindAll(_values,
                                                 x => (x.ToLower().Contains(word.ToLower())));
                if (matches.Length > 0)
                {
                    ShowListBox();
                    _listBox.BeginUpdate();
                    _listBox.Items.Clear();
                    Array.ForEach(matches, x => _listBox.Items.Add(x));
                    _listBox.SelectedIndex = 0;
                    _listBox.Height = 0;
                    _listBox.Width = 0;
                    Focus();
                    using (Graphics graphics = _listBox.CreateGraphics())
                    {
                        for (int i = 0; i < _listBox.Items.Count; i++)
                        {
                            if (i < 20)
                                _listBox.Height += _listBox.GetItemHeight(i);
                            // it item width is larger than the current one
                            // set it to the new max item width
                            // GetItemRectangle does not work for me
                            // we add a little extra space by using '_'
                            int itemWidth = (int)graphics.MeasureString(((string)_listBox.Items[i]) + "_", _listBox.Font).Width;
                            _listBox.Width = (_listBox.Width < itemWidth) ? itemWidth : this.Width; ;
                        }
                    }
                    _listBox.EndUpdate();
                }
                else
                {
                    ResetListBox();
                }
            }
            else
            {
                ResetListBox();
            }
        }

        public String[] Values
        {
            get
            {
                return _values;
            }
            set
            {
                _values = value;
            }
        }

        public List<String> SelectedValues
        {
            get
            {
                String[] result = Text.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                return new List<String>(result);
            }
        }

    }

}

