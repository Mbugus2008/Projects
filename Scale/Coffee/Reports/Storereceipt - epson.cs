using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Linq;

namespace Coffee.Reports
{
    public partial class Storereceipt_epson : DevExpress.XtraReports.UI.XtraReport
    {
        Stores_header sh = null;
        public Storereceipt_epson( Stores_header s)
        {
            InitializeComponent();
            sh = s; 
        }

        private void Storereceipt_DataSourceDemanded(object sender, EventArgs e)
        {
            lsociety.Text = coffee.Factory_Name;
            lfactory.Text = coffee.setup.Factory_Name;
            xrLabel4.Text = coffee.setup.Address;
            xrLabel40.Text = coffee.setup.Phone_No_;
            
            bindingSource2.DataSource = sh;

            if (sh.Total == 0)
                sh.Total = sh.Store_lines.Sum(o => o.Line_total);

            switch ((server.Payment_Mode)sh.Paymode)
            {
                case server.Payment_Mode.Credit:
               
                    xrLabel28.Visible = true;
                    xrLabel29.Visible = true;
                    xrLabel30.Visible = true;
                    xrLabel31.Visible = true;
                    xrLabel32.Visible = true;
                    xrLabel33.Visible = true;
                    xrLabel8.Visible = true;
                    xrLabel21.Visible = true;
                    xrLabel22.Visible = true;
                    xrLabel24.Visible = true;
                    xrLabel25.Text = "STORES CREDIT SALES RECEIPT/INVOICE";
                    xrinvoicename.Text = "INVOICE NO:";

                    xrLabel34.Visible = false;
                    xrLabel35.Visible = false;
                    xrLabel36.Visible = false;
                    xrLabel37.Visible = false;
                    xrLabel38.Visible = false;
                    xrLabel39.Visible = false;

                    xrLabel44.Visible = false;
                    xrLabel45.Visible = false;
                    xrLabel46.Visible = false;
                    xrLabel47.Visible = false;

                    break;
                case server.Payment_Mode.Both:
                    xrLabel28.Visible = true;
                    xrLabel29.Visible = true;
                    xrLabel30.Visible = true;
                    xrLabel31.Visible = true;
                    xrLabel32.Visible = true;
                    xrLabel33.Visible = true;
                    xrLabel8.Visible = true;
                    xrLabel21.Visible = true;
                    xrLabel22.Visible = true;
                    xrLabel24.Visible = true;
                    xrLabel25.Text = "STORES CREDIT SALES RECEIPT/INVOICE";
                    xrinvoicename.Text = "INVOICE NO:";

                    xrLabel34.Visible = false;
                    xrLabel35.Visible = false;
                    xrLabel36.Visible = false;
                    xrLabel37.Visible = false;
                    xrLabel38.Visible = false;
                    xrLabel39.Visible = false;

                    xrLabel44.Visible = true;
                    xrLabel45.Visible = true;
                    xrLabel46.Visible = true;
                    xrLabel47.Visible = true;
                  

                    break;



                    case server.Payment_Mode.Mpesa:
                    xrLabel28.Visible = false;
                    xrLabel29.Visible = false;
                    xrLabel30.Visible = false;
                    xrLabel31.Visible = false;
                    xrLabel32.Visible = false;
                    xrLabel33.Visible = false;
                    xrLabel8.Visible = false;
                    xrLabel21.Visible = false;
                    xrLabel22.Visible = false;
                    xrLabel24.Visible = false;
                    xrinvoicename.Text = "RECEIPT NO:";
                    xrLabel25.Text = "STORES CASH SALES RECEIPT";

                    xrLabel34.Visible = true;
                    xrLabel35.Visible = true;
                    xrLabel36.Visible = true;
                    xrLabel37.Visible = true;
                    xrLabel38.Visible = true;
                    xrLabel39.Visible = true;

                    xrLabel44.Visible = false;
                    xrLabel45.Visible = false;
                    xrLabel46.Visible = false;
                    xrLabel47.Visible = false;
                    break;
                default:
                    xrLabel28.Visible = false;
                    xrLabel29.Visible = false;
                    xrLabel30.Visible = false;
                    xrLabel31.Visible = false;
                    xrLabel32.Visible = false;
                    xrLabel33.Visible = false;
                    xrLabel8.Visible = true;
                    xrLabel21.Visible = true;
                    xrLabel22.Visible = true;
                    xrLabel24.Visible = true;
                    xrinvoicename.Text = "RECEIPT/INVOICE NO:";
                    xrLabel25.Text = "STORES CASH SALES RECEIPT/INVOICE";

                    xrLabel34.Visible = true;
                    xrLabel35.Visible = true;
                    xrLabel36.Visible = true;
                    xrLabel37.Visible = true;
                    xrLabel38.Visible = true;
                    xrLabel39.Visible = true;
                    break;

            }
        }

    }
}
