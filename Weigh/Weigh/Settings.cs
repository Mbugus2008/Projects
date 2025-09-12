using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Weigh
{
    public partial class Settings : Form
    {
        public Settings()
        {
            InitializeComponent();
            try
            {
                s = AutoweighEntities.Db.Settings.FirstOrDefault();
                if (s != null)
                    txtfactory.Text = s.Branch;
                cmbcoffetype.SelectedIndex = (int)s.Coffe_type;
                baudRateSpinEdit.Text = s.BaudRate.ToString();
                txtserver.Text = s.Server_url;
                string[] ports = SerialPort.GetPortNames();
                int i = 0;
                foreach (string port in ports)
                {
                    com_PortTextEdit.Items.Add(port);
                   if (s.Com_Port==port)
                        com_PortTextEdit.SelectedIndex = i;
                    i++;
                }
 
                i = 0;
                var d = ports.ToList().IndexOf(s.Com_Port);
                com_PortTextEdit.SelectedIndex = ports.ToList().IndexOf( s.Com_Port);
                var printers = System.Drawing.Printing.PrinterSettings.InstalledPrinters;
                foreach (string printer in printers)
                {
                    cmbprinter.Items.Add(printer);
  if (s.Printer==printer)
                        cmbprinter.SelectedIndex = i;
                    i++;
                }
               // cmbprinter.SelectedIndex = printers.FindIndex(o => o == s.);

                if (AutoweighEntities.user.Type != "Admin")
                {
                    groupBox1.Enabled = false;
                    groupBox2.Enabled = false;
                }
         }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
        }

        private void Settings_Load(object sender, EventArgs e)
        {
            var d = AutoweighEntities.Db.Settings;
            if (d.Count() > 0)
                bindingNavigatorAddNewItem.Visible = false;
        }

        private void settingBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            s.Com_Port = com_PortTextEdit.Text;
            s.BaudRate =Convert.ToInt32( baudRateSpinEdit.Text);
            s.Branch = txtfactory.Text;
            s.Coffe_type = cmbcoffetype.SelectedIndex;
            s.Printer = cmbprinter.Text;
            s.Server_url = txtserver.Text;
            AutoweighEntities.Db.SaveChanges(true);
        }
        Setting s;
        private void bindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            s = new Setting();
            AutoweighEntities.Db.Settings.Add(s);
            bindingNavigatorAddNewItem.Visible = false;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void Settings_FormClosing(object sender, FormClosingEventArgs e)
        {

            //settingBindingNavigatorSaveItem_Click(sender, e);
            }
        }
    }