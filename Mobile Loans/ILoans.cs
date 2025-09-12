using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Mobile_Loans
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    [XmlSerializerFormat]
    public interface ILoans
    {
        [OperationContract]
        [WebGet]
        Members.Members getmember(string phone);
        [OperationContract]
        Members.Members createmember(Members.Members m );
        
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
  
}
namespace Mobile_Loans.Members
{
  public class Results
    {
        public int Code = 0;
        public string Desc = "Successfull";
    }
        [DataContractFormat]
    public partial class Members:Results { }

}