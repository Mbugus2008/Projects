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
    public partial class Filters : UserControl
    {
        public string name;
    

        public string value;
        public Filters()
        {
            InitializeComponent();

        }
        public Filters(BindingSource b)
        {
            InitializeComponent();

            cbocolumn.DataSource = b;
            
        }
        private void Filters_Load(object sender, EventArgs e)
        {

        }
    }
}
