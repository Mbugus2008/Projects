using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Weigh
{
    public partial class Filter : UserControl
    {
        public BindingSource data;
        public List<filters> filter = null;
        public int filtercount =1;


        public Filter()
        {
            InitializeComponent();
            filter = new List<filters>();
        }

        private void button3_Click(object sender, EventArgs e)
        {
           
          
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
 Filters f = new Filters();
          flowLayoutPanel1.Controls.Add(f);
        }
    }
    public class filters
    {
        public string column = string.Empty;
        public string value = string.Empty;


    }
}
