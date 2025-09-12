using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WeighCon
{
    public partial class frmSettings : Form
    {
        public frmSettings()
        {
            InitializeComponent();
        }

        private void frmSettings_Load(object sender, EventArgs e)
        {
            txtPrintLabelName.Text = ConfigurationManager.AppSettings["labelName"];
            string rdbCheck = ConfigurationManager.AppSettings["printerType"];
            if(rdbCheck== "1")
            { rdb52.Checked = true; }
            else if (rdbCheck == "2")
            { rdb58.Checked = true; }
            else if (rdbCheck == "3")
            { rdbV.Checked = true; }

            txtScannerIP.Text  = ConfigurationManager.AppSettings["sIP"];
            txtScannerPort.Text = ConfigurationManager.AppSettings["sPort"];

            txtScaleIP.Text = ConfigurationManager.AppSettings["wIP"];
            txtScalePort.Text = ConfigurationManager.AppSettings["wPort"];
            txtPrinterIP.Text = ConfigurationManager.AppSettings["pIP"];
            txtPrinterPort.Text = ConfigurationManager.AppSettings["pPort"];
            txtRejectionIP.Text = ConfigurationManager.AppSettings["rIP"];
            txtRejectionPort.Text = ConfigurationManager.AppSettings["rPort"];
            txttimeout.Text = ConfigurationManager.AppSettings["timeOut"];
        }
    }
}
