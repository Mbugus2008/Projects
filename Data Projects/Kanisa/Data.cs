using Kanisa.Event;
using Kanisa.Members;
using Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Kanisa
{
    public class Data
    {
        private nav configuration;
        public Members.Customers_Service member_service;
        public AllEvents.Events_PortClient event_service;
        public Sermon.Sermons_PortClient sermon_service;
        public MemberGroups.Member_Groups_Service member_group_service;
        public VoteHeads.Vote_Heads_Service vote_head_service;
        public Payments.Payments_Service payment_service;
        public PaymentDetails.Payment_Details_Service payment_details_service;

        public Data(nav _configuration)
        {
            configuration = _configuration;
            configuration.cd = new System.Net.NetworkCredential(configuration.Username, configuration.pass, configuration.domain);
            member_service = new Members.Customers_Service { Url = configuration.baseurl() + typeof(Members.Customers).Name, Credentials = configuration.cd, PreAuthenticate = true };
            member_group_service = new MemberGroups.Member_Groups_Service { Url = configuration.baseurl() + typeof(MemberGroups.Member_Groups).Name, Credentials = configuration.cd, PreAuthenticate = true };
            vote_head_service = new  VoteHeads.Vote_Heads_Service{ Url = configuration.baseurl() + typeof(VoteHeads.Vote_Heads).Name, Credentials = configuration.cd, PreAuthenticate = true };
            payment_details_service = new PaymentDetails.Payment_Details_Service { Url = configuration.baseurl() + typeof(PaymentDetails.Payment_Details).Name, Credentials = configuration.cd, PreAuthenticate = true };
            payment_service = new Payments.Payments_Service { Url = configuration.baseurl() + typeof(Payments.Payments).Name, Credentials = configuration.cd, PreAuthenticate = true };



            event_service = InitializeClient<AllEvents.Events>();
            sermon_service = InitializeClient<Sermon.Sermons>();
         

        }
        public dynamic InitializeClient<T>()
        {
            string Namespace = typeof(T).Namespace;
            string Class_Name = typeof(T).Name;

            var clientType = Type.GetType($"{Namespace}.{Class_Name}_PortClient");
            var binding = configuration.binding();
            var address = new EndpointAddress(configuration.baseurl() + Class_Name);

            dynamic client = Activator.CreateInstance(clientType, binding, address);
            try
            {

                client.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
                client.ClientCredentials.Windows.ClientCredential.UserName = configuration.Username;
                client.ClientCredentials.Windows.ClientCredential.Password = configuration.pass;

            }
            catch (Exception ex)
            {

            }
            return client;
        }
    }
    namespace Payments
    {
        public partial class Payments
        {
            [System.Xml.Serialization.XmlIgnore]
            public PaymentDetails.Payment_Details[] Payment_Details_List { get; set; }

        }
    }
    namespace Members
    {

        partial class Customers
        {
            [System.Xml.Serialization.XmlIgnore]
            public MemberGroups.Member_Groups[] MembersGroups { get; set; }
            
            
        
            public Kanisa.MemberGroups.Member_Groups[] Get_Groups(Data data)
            {               
                    if (data != null)
                        return data.member_group_service.ReadMultiple(new MemberGroups.Member_Groups_Filter[] { new MemberGroups.Member_Groups_Filter { Criteria = No, Field = MemberGroups.Member_Groups_Fields.Customer } }, null, 0);
                    return null;
               
            }

        }
    }
}
