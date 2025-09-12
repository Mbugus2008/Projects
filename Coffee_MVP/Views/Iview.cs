using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coffee_MVP.Views
{
    public interface IUserview
    {
        event EventHandler AddNewUser;
        event EventHandler EditUser;
        event EventHandler DeleteUser;
        event EventHandler SaveUser;
        event EventHandler CancelUser;

            
          void setUserbindingsource(BindingSource source);
        void Show();
    }
}
