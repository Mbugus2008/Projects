using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Linq;
namespace Weigh
{
    public partial class Receipt : DevExpress.XtraReports.UI.XtraReport
    {
        printdata cc;
        public Receipt(printdata c)
        {
            InitializeComponent();
            
           cc= c;
        }

        private void Receipt_DataSourceDemanded(object sender, EventArgs e)
        {
            objectDataSource1.DataSource = cc.c;
            xrLabel9.Text = AutoweighEntities.setup.Branch;
            xrLabel14.Text = cc.c.Cumm.ToString();
            viewusername.Text = cc.u.Name;

        }
        public class printdata
        {
            public Daily_Collections_Detail c;
        public User u;
        
        }
    }

}
