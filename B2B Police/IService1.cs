using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace B2B_Police
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
         B2B_Police.B2B.HeaderReply getAccountValidation(B2B_Police.B2B.HeaderRequest HeaderRequest, B2B_Police.B2B.getInputType getAccountValidationInput, out B2B_Police.B2B.getOutputType getAccountValidationOutput)
        ;


    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    


    }
namespace B2B_Police.B2B
{[DataContract]
    public partial class HeaderRequest : object, System.ComponentModel.INotifyPropertyChanged
    { }
    [DataContract]
    public partial class Connection : object, System.ComponentModel.INotifyPropertyChanged
    { }
    [DataContract]
    public partial class sendOutputType : object, System.ComponentModel.INotifyPropertyChanged
    { }
    [DataContract]
    public partial class sendOutputTypeOperationParameters : object, System.ComponentModel.INotifyPropertyChanged
    { }
    [DataContract]
    public partial class getInputTypeOperationParameters : object, System.ComponentModel.INotifyPropertyChanged
    { }
    [DataContract]
    public partial class getInputType : object, System.ComponentModel.INotifyPropertyChanged
    { }
    [DataContract]
    public partial class getOutputTypeOperationParameters : object, System.ComponentModel.INotifyPropertyChanged
    { }
   
    [DataContract]	
public partial class Account : object, System.ComponentModel.INotifyPropertyChanged { }
    [DataContract]
    public partial class Institution : object, System.ComponentModel.INotifyPropertyChanged { }
    [DataContract]
    public partial class Payment : object, System.ComponentModel.INotifyPropertyChanged { }
    [DataContract]
    public partial class sendInputType : object, System.ComponentModel.INotifyPropertyChanged { }
    [DataContract]
    public partial class sendInputTypeOperationParameters : object, System.ComponentModel.INotifyPropertyChanged { }
    [DataContract]
    public partial class HeaderReply : object, System.ComponentModel.INotifyPropertyChanged { }
    [DataContract]
    public partial class getOutputType : object, System.ComponentModel.INotifyPropertyChanged { }
  
}