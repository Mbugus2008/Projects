using Coffee_MVP.Model.Repository;
using Coffee_MVP.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coffee_MVP.Presenters
{
    internal class UserPresenter
    {
        private IUserview view;
        private IUserrepository<User>  repository;

        private BindingSource userbindingsource;
        private IEnumerable<User> userslist;

        public UserPresenter(IUserview view, IUserrepository<User> repository)
        {
            this.userbindingsource = new BindingSource();
            this.view = view;
            this.repository = repository;

            this.view.EditUser += edituser;

            this.view.setUserbindingsource(userbindingsource);
            Loadallusers();
            this.view.Show();
        
        }

        private void Loadallusers()
        {
            userslist = repository.GetAll();
            userbindingsource.DataSource = userslist;
        }

        private void edituser(object? sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}
