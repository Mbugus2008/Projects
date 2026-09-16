
using System;
using System.Linq;
using System.Threading;

namespace S_Mobile
{
    class Homabay : init
    {
        const string c = "HBCWSACCO";
      
        public Homabay()
        {
            client = db.Clients.FirstOrDefault(o => o.Client_Code == c);
            Logging.Logging.LogEntryOnFile("url: " + client.Url);
            paybill.Url = client.Url;
            Thread _threadbulk = new Thread(start);
            _threadbulk.IsBackground = false; // true;
            _threadbulk.Priority = ThreadPriority.Normal;
            _threadbulk.SetApartmentState(ApartmentState.STA);
            _threadbulk.Start();
        }
        public void start()
        {
            while (S_Mobile.init.close==false)
            {
                Deposits();
            }
        }
        public void registrations()
        {
            try
            {
                var r = service.Registration();
                Logging.Logging.LogEntryOnFile(string.Format("{0} Registrations {1}", client.Client_Name, r.Count()));
                foreach (ClientService.Applications a in r)
                {
                    var c = db.Customers.FirstOrDefault(o => o.Telephone == a.telephoneField && o.Client == client.Client_Code);
                    if (c == null)
                    {
                        c = new Customer();
                        c.Telephone = a.telephoneField;
                        c.Client = client.Client_Code;
                        db.Customers.Add(c);
                    }
                    c.Name = a.account_NameField;
                    c.Language = "EN";
                    c.PinChanged = false;
                    c.Active = true;
                    var l = db.Logins.FirstOrDefault(o => o.Telephone == a.telephoneField);
                    if (l == null)
                    {
                        l = new Login();
                        l.Telephone = a.telephoneField;
                        db.Logins.Add(l);
                    }
                    l.Start_Pin = GenerateRandomNo().ToString();
                    l.PIN_Encrypted = l.Start_Pin;

                    db.SaveChanges();
                    c.Registration_Sms_sent = sendsms(c.Telephone, string.Format(regmessage, l.Start_Pin));
                    db.SaveChanges();
                }

            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
        }
        public void Deposits()
        {
            using (var db = new MobileEntities())
            {
                var deposits = db.MPESA_Transactions.Where(o => o.Paybil_Number == client.Paybill_No  && o.Sent == false );

                foreach (var d in deposits.ToList())
                {
                    try
                    {
                        Paybill.Mpesa mpesa = new Paybill.Mpesa();
                        mpesa.Receipt_No = d.Receipt_No_;
                        mpesa.Completion_Time = (DateTime)d.Completion_Time;
                        mpesa.Completion_TimeSpecified = true;
                        mpesa.Initiation_Time = (DateTime)d.Initiation_Time;
                        mpesa.Initiation_TimeSpecified = true;
                        mpesa.Paid_In = (decimal)d.Paid_In;
                        mpesa.Paid_InSpecified = true;
                        mpesa.Paybil_Number = d.Paybil_Number;
                        mpesa.Phone = d.Phone;
                        mpesa.Status = (S_Mobile.Paybill.Status)(d.Status??0);
                        mpesa.StatusSpecified = true;
                        mpesa.Balance = (decimal)d.Balance;
                        mpesa.BalanceSpecified = true;
                        mpesa.A_C_No = d.A_C_No_;
                        mpesa.Transaction_Date = (DateTime)d.Transaction_Date;
                        mpesa.Transaction_DateSpecified = true;
                        mpesa.Name = d.Name;
                        mpesa.Other_Party_Info = d.Other_Party_Info;
                        mpesa.Detaills = d.Detaills;
                        var r = paybill.Paybill(mpesa);
                        if (r.code == 0)
                            d.Sent = true;
                        else
                        {
                            d.Sent = false;
                            d.Comments = r.error_Desc;
                        }
                        db.SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                }
            }
            //public void bulksms()
            //{
            //    int bal = Sms.Smsbalance(client.Client_Code);
            //    if (bal > 0)
            //    {
            //        S.SmsCompleted += new ClientService.SmsCompletedEventHandler(smsget);
            //        S.SmsAsync(bal);
            //        Waitforthis();
            //    }
            //}
            //private void Waitforthis()
            //{
            //    System.Threading.Thread.Sleep(60000);
            //}
            //void smsget(object sender, ClientService.SmsCompletedEventArgs e)
            //{
            //    int bal = Sms.Smsbalance(client.Client_Code);
            //    foreach (var item in e.Result)
            //    {
            //        Sms s = new Sms();
            //        var sourceid = db.BulkSms.FirstOrDefault(o=> o.Source_Id==item.Entry.ToString() && o.Client == client.Client_Code);
            //        if (sourceid == null)
            //        {
            //            s.Client = client.Client_Code;
            //            s.Message = item.Message;
            //            s.Source_Id = item.Entry.ToString();
            //            s.Balance = bal;
            //            s.Type = (int)Sms.Smstype.Bulk;
            //            s.Sendsms(s);
            //            item.SMS_Balance = bal;
            //            item.SMS_BalanceSpecified = true;
            //            bal = bal - 1;
            //        }
            //        else
            //        { 
            //            item.SMS_Balance =(int) sourceid.Balance;
            //            item.SMS_BalanceSpecified = true;
            //        }
            //        item.Delivered = true;
            //        item.DeliveredSpecified = true;
            //        item.Date_Delivered = DateTime.Now.Date;
            //        item.Date_DeliveredSpecified = true;
            //        item.Time_Delivered = DateTime.Now;
            //        item.Time_DeliveredSpecified = true;
            //    }

            //    S.Smsupdate(e.Result);
            //}
        }
    }
}
