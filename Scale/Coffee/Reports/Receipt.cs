using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace Coffee.Reports
{
    public partial class Receipt : DevExpress.XtraReports.UI.XtraReport
    {
        Daily_Collections_Detail c = null;
        public Receipt(Daily_Collections_Detail cc)
        {
            InitializeComponent();
            c = cc;
        }
        private void Receipt_DataSourceDemanded(object sender, EventArgs e)
        {
            lfactory.Text = "Factory: " + coffee.UppercaseFirst(coffee.setup.Factory.ToLower());
            if (coffee.setup != null)
                if (!String.IsNullOrEmpty(coffee.setup.Factory_Name))
                    lfactory.Text = "Factory: " + coffee.UppercaseFirst(coffee.setup.Factory_Name.ToLower());

            lsociety.Text =coffee.Factory_Name;
            bindingSource1.DataSource = c;
            xrLabel13.Text = coffee.setup.Motto;
            lblemail.Text = coffee.setup.Address;
            lphone.Text ="TELEPHONE: " + coffee.setup.Phone_No_;

        }
    }
}
