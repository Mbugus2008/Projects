using Logging;
using RestSharp;
using S_Mobile.Mpesa_Transactions;
using S_Mobile.Sms_and_Email;
using S_Mobile_Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;


namespace S_Mobile.Sms
{
    public class Sms
    {
        IRepository<BulkSm> repo;
        IRepository<Client> clientrepo;
        IRepository<Sms_keyword> keyrepo;
        DbContext _dbcontext;

        public Sms(DbContext dbcontext)
        {
            this._dbcontext = dbcontext;


        }

        public void smsbalancenotify()
        {
            try
            {
                clientrepo = new Repository<Client>(_dbcontext);
                keyrepo = new Repository<Sms_keyword>(_dbcontext);
                var clients = clientrepo.FilterBy(o => o.Notify_low_sms == true);
                foreach (Client client in clients)
                {
                    int bal = client.balance(_dbcontext);

                    if ((bal < client.Sms_reorder_level) &&
                        (client.Last_Notification.GetValueOrDefault().Date != DateTime.Today))
                    {
                        var keywords = keyrepo.FilterBy(o => o.Client == client.Client_Code).FirstOrDefault();
                        StringBuilder body = new StringBuilder();

                        Email email = new Email();
                        email.To_address = client.Email;
                        email.CC = client.email_cc;
                        body.AppendLine(
                            $"Hi {client.Client_Name} This is to inform you that your sms credit level is below thresh hold");
                        body.AppendLine($"Current Balance = {bal}");
                        body.AppendLine($"Threshold = {client.Sms_reorder_level}");

                        if (keywords != null)
                        {
                            body.AppendLine("Payment Details:");
                            body.AppendLine("PayBill: 4113871");
                            body.AppendLine($"Account = {keywords.Code}");
                            body.AppendLine("PayBill Name: TrimLine Systems & Solutions");
                        }

                        email.body = body.ToString();
                        email.subject = "Courtesy Balance Notification";

                        if (client.Notification_Mode == null)
                            client.notification_mode = Client.NotificationMode.Both;
                        switch (client.notification_mode)
                        {
                            case Client.NotificationMode.Sms:
                                if (!string.IsNullOrEmpty(client.Contact))
                                    sendsms(new BulkSm()
                                    {
                                        Client = "TRIMLINE", Message = email.body, Phone = client.Contact,
                                        Source_Id = DateTime.Now.Ticks.ToString()
                                    });
                                break;

                            case Client.NotificationMode.Email:
                                if (!string.IsNullOrEmpty(client.Email))
                                    email.send(email);
                                break;
                            case Client.NotificationMode.Both:
                                if (!string.IsNullOrEmpty(client.Contact))
                                    sendsms(new BulkSm()
                                    {
                                        Client = "TRIMLINE", Message = email.body, Phone = client.Contact,
                                        Source_Id = DateTime.Now.Ticks.ToString()
                                    });
                                if (!string.IsNullOrEmpty(client.Email))
                                    email.send(email);
                                break;
                        }

                        client.Last_Notification = DateTime.Today;
                    }

                    clientrepo.Savechanges();
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }

        }

        public void sendscheduledsms()
        {
            try
            {
                repo = new Repository<BulkSm>(_dbcontext);
                var sms = repo.FilterBy(o => o.Scheduled == true && o.Status == 0 && o.Scheduled_Time < DateTime.Now);
                Logging.Logging.LogEntryOnFile($"Scheduled sms count {sms.Count()}");
                foreach (var sm in sms.ToList())
                {
                    BulkSm s = sm;
                    resendsms(ref s);
                    sm.Status = s.Status;
                    sm.Trace = s.Trace;
                    sm.Comments = s.Comments;
                    repo.Savechanges();
                }

            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);

            }
        }

        public Logging.Results<BulkSm> sendsms(BulkSm s)
        {
            ServicePointManager.ServerCertificateValidationCallback += (sender, cert, chain, errors) => true;
            var client = new RestClient("https://5.189.167.52:4001");
            var request = new RestRequest("/api/sendsms", Method.Post);
            request.AddHeader("Content-Type", "application/json");

            BulkSm bulk = new BulkSm()
            {
                Source_Id = s.Source_Id,
                Phone = s.Phone,
                Message = s.Message.Replace(@"\n", Environment.NewLine),
                Client = s.Client
            };
            request.AddJsonBody(bulk);
            var response = client.Execute<Logging.Results<BulkSm>>(request);
            return response.Data;
        }

        public Logging.Results<BulkSm> resendsms(ref BulkSm s)
        {
            ServicePointManager.ServerCertificateValidationCallback += (sender, cert, chain, errors) => true;
            //var client = new RestClient("http://localhost/S_Mobile");
            var client = new RestClient("https://5.189.167.52:4001");
            var request = new RestRequest("/api/resendsms", Method.Post);
            request.AddHeader("Content-Type", "application/json");
            request.AddJsonBody(s);
            var response = client.Execute<Logging.Results<BulkSm>>(request);
            if (response.Data.Code == 0)
            {
                s = response.Data.Contents;
            }

            return response.Data;
        }

        public void Mpesa()
        {
            //repo = new Repository<>(_dbcontext);


        }


    }
}
