using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sacco.Shared
{
    public class StateContainerService
    {
        ///<summary>
        ///The state property with initial value
        ///</summary>
        public string member { get; set; }
        public string company_name { get; set; }
        public string id { get; set; }
        public Memberdata.Members members_det { get; set; }
        ///<summary>
        ///The event will be raised for state changed
        ///</summary>
        public event Action OnStateChange;
        ///<summary>
        ///This method will be accessed by the sender component
        ///to update the state
        ///</summary>
        public void Setmember_det(Memberdata.Members value)
        {
            members_det = value;
            NotifyStateChanged();
        } public void Setmember(string value)
        {
            member = value;
            NotifyStateChanged();
        } 
        public void Setcompany(string value)
        {
            company_name = value;
            NotifyStateChanged();
        } 
        public void setid(string value)
        {
            id = value;
            NotifyStateChanged();
        }
        private void NotifyStateChanged() => OnStateChange?.Invoke();

    }
}
