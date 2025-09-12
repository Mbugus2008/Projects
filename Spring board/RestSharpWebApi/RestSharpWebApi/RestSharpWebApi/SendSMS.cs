using RestSharpWebApi.Controllers;
using RestSharpWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RestSharpWebApi
{
    public class SendSMS
    {
        Setting s = new Setting();
        private void CreateSMS(string telNo, string customerNo, string message)
        {
            
            SMSMessages.SMSMessages_Service _Service = new SMSMessages.SMSMessages_Service(s);
            Results<SMSMessages.SMSMessages> messageresults = new Results<SMSMessages.SMSMessages>();
            SMSMessages.SMSMessages messages = new SMSMessages.SMSMessages();
            int num = 0;
            var record = _Service.ReadMultiple(null, null, 0).LastOrDefault();
            if (record != null)
            {
                num = record.Entry_No;
            }
            num++;
            messages.Entry_No = num;
            messages.Entry_NoSpecified = true;
            messages.Telephone_No = telNo;
            messages.Account_No = customerNo;
            messages.SMS_Message = message;
            messages.Scheduled_Date = DateTime.Today;
            messages.Scheduled_Time = DateTime.Now;
            messages.Source = SMSMessages.Source.Mobile_Banking;
            messages.SourceSpecified = true;
            messages.Scheduled_DateSpecified = true;
            messages.Scheduled_TimeSpecified = true;
            
            try
            {
                _Service.Create(ref messages);
            }
            catch {; }
        }

    }
}