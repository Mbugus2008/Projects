using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Coffee_MVP.Views
{
    public partial class User : Form,IUserview
    {
        public User()
        {
            InitializeComponent();
        }

        public event EventHandler AddNewUser;
        public event EventHandler EditUser;
        public event EventHandler DeleteUser;
        public event EventHandler SaveUser;
        public event EventHandler CancelUser;

        public void setUserbindingsource(BindingSource source)
        {
            dataGridView1.DataSource = source;
            
        }

       
    }
}
