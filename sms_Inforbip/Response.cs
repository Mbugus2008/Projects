using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sms_Inforbip
{
    public class Res
    {
        public List<Message> messages { get; set; }
        public RequestError requestError { get; set; }
    }

    public class Status
    {
        public int groupId { get; set; }
        public string groupName { get; set; }
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
    }

    public class Message
    {
        public string to { get; set; }
        public Status status { get; set; }
        public string messageId { get; set; }
    }
    public class ServiceException
    {
        public string messageId { get; set; }
        public string text { get; set; }
    }

    public class RequestError
    {
        public ServiceException serviceException { get; set; }
    }
}
