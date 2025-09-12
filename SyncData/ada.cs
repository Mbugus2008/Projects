using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using Newtonsoft;
using Newtonsoft.Json.Linq;
using Logging;
using SyncData.crm_Contacts;
using System.ComponentModel.Design.Serialization;

namespace SyncData
{
    class ada
    {
        private System.Net.NetworkCredential cd, investcd;
        public Logging.settings s = new Logging.settings();
        NAV.NAV nav = new NAV.NAV(new Uri("http://10.1.4.16:7048/DynamicsNAV110/OData/Company('KPS%20UAT%20II')"));
        Inv.NAV invest = new Inv.NAV(new Uri("http://5.189.167.52:1177/Investment/OData/Company('KPS-TEST')"));

        VendorDocuments.Vendor_Attachments_Service Vendor_Attachments = new VendorDocuments.Vendor_Attachments_Service();
        Employee_Attachments.Employee_Attachements_Service Employee_Attachments = new Employee_Attachments.Employee_Attachements_Service();
        Links.Links_Service Links_Service = new Links.Links_Service();
        ErpVendor.Vendors_Service VendorCard_Service = new ErpVendor.Vendors_Service();
        Members.Member_Channels_Service membersservice = new Members.Member_Channels_Service();

        crm_Contacts.Contact_Service Contact_Service = new crm_Contacts.Contact_Service();
        Project_Proposals.Project_Proposals_Service Project_Proposals_Service = new Project_Proposals.Project_Proposals_Service();
        crm_PropertySales.PropertySales_Service PropertySales_Service = new crm_PropertySales.PropertySales_Service();
        Projects.Projects_Service project = new Projects.Projects_Service();
        Loans.Loans_Service Loans_Service = new Loans.Loans_Service();
        Financial_Investments_Channel.Financial_Investments_Channel_Service Financial_Investments_Channel_Service = new Financial_Investments_Channel.Financial_Investments_Channel_Service();
        Withdrawals.Withdrawals_Service Withdrawals_Service = new Withdrawals.Withdrawals_Service();
        Member_withdrawal.Member_withdrawal_Service member_Withdrawal_Service = new Member_withdrawal.Member_withdrawal_Service();
        public ada()
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\Settings.config";
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.erpsettings.Username, s.erpsettings.pass, s.erpsettings.domain);
            nav = new NAV.NAV(new Uri(String.Format("http://{0}:{1}/{2}/OData/Company('{3}')", s.erpsettings.Server, s.erpsettings.Port, s.erpsettings.Instance, s.erpsettings.Companyname)));
            nav.Credentials = cd;

            investcd = new System.Net.NetworkCredential(s.investsettings.Username, s.investsettings.pass, s.investsettings.domain);
            invest = new Inv.NAV(new Uri(String.Format("http://{0}:{1}/{2}/OData/Company('{3}')", s.investsettings.Server, s.investsettings.Port, s.investsettings.Instance, s.investsettings.Companyname)));
            invest.Credentials = investcd;

            Vendor_Attachments = new VendorDocuments.Vendor_Attachments_Service { Url = geturl(s, Vendor_Attachments.Url), Credentials = cd, PreAuthenticate = true };

            Employee_Attachments = new Employee_Attachments.Employee_Attachements_Service { Url = geturl(s, Employee_Attachments.Url), Credentials = cd, PreAuthenticate = true };

            Links_Service = new Links.Links_Service { Url = geturlInvestment(s, Links_Service.Url), Credentials = cd, PreAuthenticate = true };

            VendorCard_Service = new ErpVendor.Vendors_Service { Url = geturl(s, VendorCard_Service.Url), Credentials = cd, PreAuthenticate = true };

            membersservice = new Members.Member_Channels_Service { Url = geturlInvestment(s, membersservice.Url), Credentials = cd, PreAuthenticate = true };
            Contact_Service  = new crm_Contacts.Contact_Service { Url = geturlInvestment(s, Contact_Service.Url), Credentials = cd, PreAuthenticate = true };
            Project_Proposals_Service  = new Project_Proposals.Project_Proposals_Service { Url = geturlInvestment(s, Project_Proposals_Service.Url), Credentials = cd, PreAuthenticate = true };

            PropertySales_Service  = new crm_PropertySales.PropertySales_Service { Url = geturlInvestment(s, PropertySales_Service.Url), Credentials = cd, PreAuthenticate = true };

            project  = new Projects.Projects_Service { Url = geturlInvestment(s, project.Url), Credentials = cd, PreAuthenticate = true };

            Loans_Service  = new Loans.Loans_Service { Url = geturlInvestment(s, Loans_Service.Url), Credentials = cd, PreAuthenticate = true };
            Financial_Investments_Channel_Service = new Financial_Investments_Channel.Financial_Investments_Channel_Service { Url = geturlInvestment(s, Financial_Investments_Channel_Service.Url), Credentials = cd, PreAuthenticate = true };
            Withdrawals_Service = new  Withdrawals.Withdrawals_Service { Url = geturlInvestment(s, Withdrawals_Service.Url), Credentials = cd, PreAuthenticate = true };

           member_Withdrawal_Service  = new Member_withdrawal.Member_withdrawal_Service { Url = geturlInvestment(s, member_Withdrawal_Service.Url), Credentials = cd, PreAuthenticate = true };
            

        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(settings s, string page)
        {
            var ss = s.erpsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }
        private string geturlInvestment(settings s, string page)
        {
            var ss = s.investsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }
        public void start()
        {
            if (s.adasettings.active)
            {
                while (Program.stop == false)
                {
                    try
                    {
                   //     vendordocuments();
                        vendordocs();
                        Employeedocuments();
                        investmentdocuments();
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                    System.Threading.Thread.Sleep(s.othersettings.PostIntervalinsec * 1000);
                }
            }
            else
                Logging.Logging.LogEntryOnFile("Dms service dissabled");
        }
        public void vendordocuments()
        {
            try
            {
                var t = Token().token;
                var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
                var v = Vendor_Attachments.ReadMultiple(new VendorDocuments.Vendor_Attachments_Filter[] { new VendorDocuments.Vendor_Attachments_Filter { Criteria = "No", Field = VendorDocuments.Vendor_Attachments_Fields.Sent } }, null, 0);
                foreach (var att in v.ToList())
                {
                    addvendor(att.Vendor_No);
                    try
                    {
                        if (File.Exists(att.File_path))
                        {
                            Byte[] bytes = File.ReadAllBytes(att.File_path);
                            String file = Convert.ToBase64String(bytes);
                            var request = new RestRequest("ada/v_1/files/save-vendor-file", Method.POST);
                            request.RequestFormat = DataFormat.Json;
                            request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                            request.AddJsonBody(
                                 new
                                 {
                                     F_SUPP_ID = att.Vendor_No,
                                     F_DOC_TYPE = att.Name,
                                     FILE_DATA = file
                                 });
                            Logging.Logging.LogEntryOnFile(request.Resource);
                            var b = request.Parameters.FirstOrDefault(p => p.Type == ParameterType.RequestBody).Value.ToString();
                            IRestResponse response = client.Execute(request);
                            if (response.StatusCode == HttpStatusCode.OK)
                            {
                                var d = SimpleJson.DeserializeObject<filesave>(response.Content);
                                att.Sent = true;
                                att.File_path = d.url;
                                att.Date_Sent = DateTime.Now.Date;
                                att.Comment = "";
                            }
                            else
                            {
                                Logging.Logging.LogEntryOnFile(response.Content);
                                att.Comment = response.Content;
                            }
                        }
                        else
                        {
                            Logging.Logging.LogEntryOnFile("File does not exist");
                            att.Comment = "File does not exist";
                        }
                    }
                    catch (Exception ex)
                    {

                        Logging.Logging.ReportError(ex);
                        att.Comment = ex.Message;

                    }
                    var a = att;
                    Vendor_Attachments.Update(ref a);
                }

            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        public void Employeedocuments()
        {
            try
            {
                Logging.Logging.LogEntryOnFile("Employee documents");
                var t = Token().token;
                var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
                var v = Employee_Attachments.ReadMultiple(new Employee_Attachments.Employee_Attachements_Filter[] { new Employee_Attachments.Employee_Attachements_Filter { Criteria = "No", Field = SyncData.Employee_Attachments.Employee_Attachements_Fields.Sent } }, null, 0);
                foreach (var att in v.ToList())
                {
                    try
                    {

                        if (File.Exists(att.File_path))
                        {
                            addemployee(att);
                            Byte[] bytes = File.ReadAllBytes(att.File_path);
                            String file = Convert.ToBase64String(bytes);
                            var request = new RestRequest("ada/v_1/files/save-employee-file", Method.POST);
                            request.RequestFormat = DataFormat.Json;
                            request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                            request.AddJsonBody(
                                 new
                                 {
                                     F_EMP_NO = att.Employee_No,
                                     F_DOC_TYPE = att.Name,
                                     FILE_DATA = file

                                 });
                            IRestResponse response = client.Execute(request);
                            Logging.Logging.LogEntryOnFile(string.Format("Employee document..{0}", response.Content));
                            if (response.StatusCode == HttpStatusCode.OK)
                            {
                                var d = SimpleJson.DeserializeObject<filesave>(response.Content);
                                att.Sent = true;
                                att.File_path = d.url;
                                att.Date_Sent = DateTime.Now.Date;
                                att.Comment = "";
                            }
                            else
                            {
                                Logging.Logging.LogEntryOnFile(response.Content);
                                att.Comment = response.StatusDescription;

                            }
                        }
                        else
                        {
                            Logging.Logging.LogEntryOnFile("File does not exist");
                            att.Comment = "File does not exist";

                        }

                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                        att.Comment = ex.Message;

                    }
                    var a = att;
                    Employee_Attachments.Update(ref a);
                }

            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        //public void Paymentdocuments()
        //{
        //    try
        //    {
        //        var t = Token().token;
        //        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
        //        var v = nav.Payment_Attachments.Where(o => o.Sent == false);
        //        foreach (var att in v.ToList())
        //        {
        //            try
        //            {
        //                if (File.Exists(att.File_path))
        //                {
        //                    Byte[] bytes = File.ReadAllBytes(att.File_path);
        //                    String file = Convert.ToBase64String(bytes);
        //                    var request = new RestRequest("ada/v_1/files/save-investment-file", Method.POST);
        //                    request.RequestFormat = DataFormat.Json;
        //                    request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);


        //                    request.AddJsonBody(
        //                         new
        //                         { F_SUPP_ID = att.Document_No, F_DOC_TYPE = att.Name,
        //                             FILE_DATA = file
        //                         });
        //                    IRestResponse response = client.Execute(request);
        //                    if (response.StatusCode == HttpStatusCode.OK)
        //                    {
        //                        var d = SimpleJson.DeserializeObject<filesave>(response.Content);
        //                        att.Sent = true;
        //                        att.File_path = d.url;
        //                        att.Date_Sent = DateTime.Now.Date;
        //                        nav.UpdateObject(att);
        //                    }
        //                    else
        //                    {
        //                        Logging.Logging.LogEntryOnFile(response.Content);

        //                        nav.UpdateObject(att);
        //                    }
        //                }
        //                else
        //                {
        //                    Logging.Logging.LogEntryOnFile("File does not exist");
        //                    nav.UpdateObject(att);
        //                }

        //            }
        //            catch (Exception ex)
        //            {
        //                Logging.Logging.ReportError(ex);

        //                nav.UpdateObject(att);
        //            }
        //        }
        //        nav.SaveChanges();
        //    }
        //    catch (Exception ex)
        //    {

        //        Logging.Logging.ReportError(ex);
        //    }
        //}
        public void investmentdocuments()
        {

            try
            {
                Logging.Logging.LogEntryOnFile("Investment Documents");
                var members = membersservice.ReadMultiple(new Members.Member_Channels_Filter[] { new Members.Member_Channels_Filter { Criteria = "", Field = Members.Member_Channels_Fields.DMS_URL } }, null, 0);

                foreach (var member in members.Where(o=> o.DMS_URL == null || o.DMS_URL == "" ))
                {
                    IRestResponse response = null;
                    try
                    {
                        var t = Token().token;
                        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                        var request = new RestRequest("ada/v_1/investments/" + member.No, Method.GET);
                        request = new RestRequest("ada/v_1/investments", Method.POST);
                        request.RequestFormat = DataFormat.Json;
                        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                        request.AddJsonBody(
                             new
                             {
                                 F_ID_NUMBER = member.National_ID_No,
                                 F_NEW_NO = member.National_ID_No,
                                 F_NAME = member.Name,
                                 F_PF_NO = member.National_ID_No//,
                                                                // id = member.National_ID_No

                             });

                        response = client.Execute(request);
                        if (response.StatusCode == HttpStatusCode.OK)
                        {
                            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=68&QYNUM=1&QUERYPARAMS=F_FILENO={0}&LANG=ENGLISH", member.National_ID_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                        }
                        else
                        {
                            if (response.Content.Contains("Member already exists!"))
                                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=68&QYNUM=1&QUERYPARAMS=F_FILENO={0}&LANG=ENGLISH", member.National_ID_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                            else
                                member.DMS_URL = response.Content;
                            //Logging.Logging.LogEntryOnFile(response.Content);
                        }
                          
                            var m = member;
                        membersservice.Update(ref m);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }
                //Member applications

                var memberapp = Contact_Service.ReadMultiple(new crm_Contacts.Contact_Filter[] { new crm_Contacts.Contact_Filter { Criteria = "", Field = crm_Contacts.Contact_Fields.DMS_URL } }, null, 0);

                foreach (var member in memberapp.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                {
                    
                    IRestResponse response = null;
                    try
                    {
                        if (!string.IsNullOrEmpty(member.National_ID_No))
                        {
                            var t = Token().token;
                            var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                            var request = new RestRequest("ada/v_1/investments/" + member.Appliccation_No, Method.GET);
                            request = new RestRequest("ada/v_1/investments", Method.POST);
                            request.RequestFormat = DataFormat.Json;
                            request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                            request.AddJsonBody(
                                 new
                                 {
                                     F_ID_NUMBER = member.National_ID_No,
                                     F_NEW_NO = member.National_ID_No,
                                     F_NAME = member.First_Name,
                                     F_PF_NO = member.National_ID_No//,
                                                                    //id = member.National_ID_No

                             });

                            response = client.Execute(request);
                            if (response.StatusCode == HttpStatusCode.OK)
                            {
                                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=68&QYNUM=1&QUERYPARAMS=F_FILENO={0}&LANG=ENGLISH", member.National_ID_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                            }
                            else
                            {
                                if (response.Content.Contains("Member already exists!"))

                                    member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=68&QYNUM=1&QUERYPARAMS=F_FILENO={0}&LANG=ENGLISH", member.Appliccation_No, s.adasettings.Server_Ip, s.adasettings.Server_id);

                                else
                                    member.DMS_URL =response.Content;

                            }

                            var m = member;
                            Contact_Service.Update(ref m);
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }

  //Proposals

                var Proposals = Project_Proposals_Service.ReadMultiple(new Project_Proposals.Project_Proposals_Filter[] { new Project_Proposals.Project_Proposals_Filter { Criteria = "", Field = Project_Proposals.Project_Proposals_Fields.DMS_URL } }, null, 0);

                foreach (var member in Proposals.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                {
                    IRestResponse response = null;
                    try
                    {
                        var t = Token().token;
                        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
                         var  request = new RestRequest("ada/v_1/investments-projects", Method.POST);
                        request.RequestFormat = DataFormat.Json;
                        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                        request.AddJsonBody(
                             new
                             {
                                 F_PROJECT_ID = member.Document_No,
                              
                                 F_PROJECT_NAME = member.Project_Name 
                              
                                // id = member.Entry

                             }) ;

                        response = client.Execute(request);
                        if (response.StatusCode == HttpStatusCode.OK)
                        {
                            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Document_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                        }
                        else
                        {
                            if (response.Content.Contains("Member already exists!"))

                                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Document_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                            else
                                member.DMS_URL = response.Content;

                        }
                        var m = member;
                        Project_Proposals_Service.Update(ref m);

                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }

                //Projects Sales

                //var Projects = PropertySales_Service.ReadMultiple(new crm_PropertySales.PropertySales_Filter[] { new crm_PropertySales.PropertySales_Filter { Criteria = "", Field = crm_PropertySales.PropertySales_Fields.DMS_URL } }, null, 0);

                //foreach (var member in Projects.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                //{
                //    IRestResponse response = null;
                //    try
                //    {
                //        var t = Token().token;
                //        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                //        var request = new RestRequest("ada/v_1/investments-projects/" + member.Transaction_No, Method.GET);
                //        request = new RestRequest("ada/v_1/investments-projects", Method.POST);
                //        request.RequestFormat = DataFormat.Json;
                //        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                //        request.AddJsonBody(
                //             new
                //             {
                //                 F_PROJECT_ID = member.Project_Code,

                //                 F_PROJECT_NAME = member.Project_Name

                //             });

                //        response = client.Execute(request);
                //        if (response.StatusCode == HttpStatusCode.OK)
                //        {
                //            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Project_Code, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //        }
                //        else
                //        {
                //            if (response.Content.Contains("Member already exists!"))

                //                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Project_Code, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //            else
                //                member.DMS_URL = response.Content;

                //        }
                //        var m = member;
                //        PropertySales_Service.Update(ref m);
                //    }
                //    catch (Exception ex)
                //    {
                //        Logging.Logging.ReportError(ex);
                //    }

                //} 
                //Projects
                
                var Pj = project.ReadMultiple(new Projects.Projects_Filter [] { new  Projects.Projects_Filter { Criteria = "", Field = SyncData.Projects.Projects_Fields.DMS_URL } }, null, 0);

                foreach (var member in Pj.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                {
                    IRestResponse response = null;
                    try
                    {
                        var t = Token().token;
                        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                        var request = new RestRequest("ada/v_1/investments-projects/" + member.Project_No, Method.GET);
                        request = new RestRequest("ada/v_1/investments-projects", Method.POST);
                        request.RequestFormat = DataFormat.Json;
                        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                        request.AddJsonBody(
                             new
                             {
                                 F_PROJECT_ID = member.Project_No,
                                 F_PROJECT_NAME = member.Project_Name
                            });

                        response = client.Execute(request);
                        if (response.StatusCode == HttpStatusCode.OK)
                        {
                            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Project_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                        }
                        else
                        {
                            if (response.Content.Contains("already exists!"))

                                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Project_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                            else
                                member.DMS_URL = response.Content;

                        }
                        var m = member;
                        project.Update(ref m);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }
                //Projects

                //var Loan = Loans_Service.ReadMultiple(new  Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = "", Field = Loans.Loans_Fields.DMS_URL } }, null, 0);

                //foreach (var member in Loan.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                //{
                //    IRestResponse response = null;
                //    try
                //    {
                //        var t = Token().token;
                //        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                //        var request = new RestRequest("ada/v_1/investments-projects/" + member.Application_No, Method.GET);
                //        request = new RestRequest("ada/v_1/investments-projects", Method.POST);
                //        request.RequestFormat = DataFormat.Json;
                //        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                //        request.AddJsonBody(
                //             new
                //             {
                //                 F_PROJECT_ID = member.Application_No,
                //                 F_PROJECT_NAME = member.Member_Name
                //             });

                //        response = client.Execute(request);
                //        if (response.StatusCode == HttpStatusCode.OK)
                //        {
                //            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Application_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //        }
                //        else
                //        {
                //            if (response.Content.Contains("already exists!"))

                //                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Application_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //            else
                //                member.DMS_URL = response.Content;

                //        }
                //        var m = member;
                //        Loans_Service.Update(ref m);
                //    }
                //    catch (Exception ex)
                //    {
                //        Logging.Logging.ReportError(ex);
                //    }

                //}
                //Projects

                var fininv = Financial_Investments_Channel_Service.ReadMultiple(new Financial_Investments_Channel.Financial_Investments_Channel_Filter[] { new Financial_Investments_Channel.Financial_Investments_Channel_Filter { Criteria = "", Field = Financial_Investments_Channel.Financial_Investments_Channel_Fields.DMS_URL } }, null, 0);

                foreach (var member in fininv.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                {
                    IRestResponse response = null;
                    try
                    {
                        var t = Token().token;
                        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                        var request = new RestRequest("ada/v_1/investments-projects/" + member.Document_No, Method.GET);
                        request = new RestRequest("ada/v_1/investments-projects", Method.POST);
                        request.RequestFormat = DataFormat.Json;
                        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                        request.AddJsonBody(
                             new
                             {
                                 F_PROJECT_ID = member.Document_No,
                                 F_PROJECT_NAME = member.Description
                             });

                        response = client.Execute(request);
                        if (response.StatusCode == HttpStatusCode.OK)
                        {
                            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Document_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                        }
                        else
                        {
                            if (response.Content.Contains("already exists!"))

                                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Document_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                            else
                                member.DMS_URL = response.Content;

                        }
                        var m = member;
                        Financial_Investments_Channel_Service.Update(ref m);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }

                //Withdrawals

                //var withdrawal = Withdrawals_Service.ReadMultiple(new Withdrawals.Withdrawals_Filter   [] { new  Withdrawals.Withdrawals_Filter { Criteria = "", Field =  Withdrawals.Withdrawals_Fields.DMS_URL } }, null, 0);

                //foreach (var member in withdrawal.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                //{
                //    IRestResponse response = null;
                //    try
                //    {
                //        var t = Token().token;
                //        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                //        var request = new RestRequest("ada/v_1/investments-projects/" + member.Transaction_No, Method.GET);
                //        request = new RestRequest("ada/v_1/investments-projects", Method.POST);
                //        request.RequestFormat = DataFormat.Json;
                //        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                //        request.AddJsonBody(
                //             new
                //             {
                //                 F_PROJECT_ID = member.Transaction_No,
                //                 F_PROJECT_NAME = member.Member_Name
                //             });

                //        response = client.Execute(request);
                //        if (response.StatusCode == HttpStatusCode.OK)
                //        {
                //            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Transaction_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //        }
                //        else
                //        {
                //            if (response.Content.Contains("already exists!"))

                //                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Transaction_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //            else
                //                member.DMS_URL = response.Content;

                //        }
                //        var m = member;
                //        Withdrawals_Service.Update(ref m);
                //    }
                //    catch (Exception ex)
                //    {
                //        Logging.Logging.ReportError(ex);
                //    }

                //}


                ////Member Withdrawals

                //var member_withdrawal = member_Withdrawal_Service.ReadMultiple(new  Member_withdrawal.Member_withdrawal_Filter[] { new Member_withdrawal.Member_withdrawal_Filter { Criteria = "", Field =  Member_withdrawal.Member_withdrawal_Fields.DMS_URL } }, null, 0);

                //foreach (var member in member_withdrawal.Where(o => o.DMS_URL == null || o.DMS_URL == ""))
                //{
                //    IRestResponse response = null;
                //    try
                //    {
                //        var t = Token().token;
                //        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                //        var request = new RestRequest("ada/v_1/investments-projects/" + member.Document_No, Method.GET);
                //        request = new RestRequest("ada/v_1/investments-projects", Method.POST);
                //        request.RequestFormat = DataFormat.Json;
                //        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                //        request.AddJsonBody(
                //             new
                //             {
                //                 F_PROJECT_ID = member.Document_No,
                //                 F_PROJECT_NAME = member.Member_Name
                //             });

                //        response = client.Execute(request);
                //        if (response.StatusCode == HttpStatusCode.OK)
                //        {
                //            member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Document_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //        }
                //        else
                //        {
                //            if (response.Content.Contains("already exists!"))

                //                member.DMS_URL = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=71&QYNUM=4&QUERYPARAMS=F_PROJECT_ID={0}&LANG=ENGLISH", member.Document_No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                //            else
                //                member.DMS_URL = response.Content;
                //        }
                //        var m = member;
                //        member_Withdrawal_Service.Update(ref m);
                //    }
                //    catch (Exception ex)
                //    {
                //        Logging.Logging.ReportError(ex);
                //    }

                //}

                //  Byte[] bytes = File.ReadAllBytes(string.Format("INVESTMENT_FORM.pdf"));
                //String file = Convert.ToBase64String(bytes);
                //request = new RestRequest("ada/v_1/files/save-investment-file", Method.POST);
                //request.RequestFormat = DataFormat.Json;
                //request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                //request.AddJsonBody(
                //     new
                //     {
                //         F_SUPP_ID = member.No,
                //         F_DOC_TYPE = "TXT",
                //         F_FILENO = member.No,
                //         FILE_DATA = file
                //     });
                //Logging.Logging.LogEntryOnFile(file);
                //string jb = request.Parameters[1].Value.ToString();
                //response = client.Execute(request);
                //if (response.StatusCode == HttpStatusCode.OK)
                //{
                //    var d = SimpleJson.DeserializeObject<filesave>(response.Content);

                //    member.DMS_URL = d.url;
                //    Logging.Logging.LogEntryOnFile(String.Format("Doc for {0} Successfully stored", member.No));


                //}
                //else
                //{
                //    Logging.Logging.LogEntryOnFile(response.Content);

                //}
                //}
                //else
                //{
                //    Logging.Logging.LogEntryOnFile(response.Content);
                //}







                //var t = Token().token;
                //var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
                //var v = Links_Service.ReadMultiple(new Links.Links_Filter[] { new Links.Links_Filter { Criteria = "No", Field = Links.Links_Fields.Sent }, new Links.Links_Filter { Criteria = "Link", Field = Links.Links_Fields.Type } }, null, 100);
                //foreach (var att in v)
                //{
                //    if (!String.IsNullOrEmpty(att.Member_No))
                //    {
                //        try
                //        {
                //            Logging.Logging.LogEntryOnFile(string.Format("Document for {0}", att.Link_ID));
                //            addinvestment(att);
                //            if (File.Exists(att.URL1))
                //            {
                //                Byte[] bytes = File.ReadAllBytes(att.URL1);
                //                String file = Convert.ToBase64String(bytes);
                //                var request = new RestRequest("ada/v_1/files/save-investment-file", Method.POST);
                //                request.RequestFormat = DataFormat.Json;
                //                request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                //                request.AddJsonBody(
                //                     new
                //                     {
                //                         F_SUPP_ID = att.Member_No,
                //                         F_DOC_TYPE = att.Type,
                //                         F_FILENO = att.Member_No,
                //                         FILE_DATA = file
                //                     });
                //                Logging.Logging.LogEntryOnFile(file);
                //                string jb = request.Parameters[1].Value.ToString();
                //                IRestResponse response = client.Execute(request);
                //                if (response.StatusCode == HttpStatusCode.OK)
                //                {
                //                    var d = SimpleJson.DeserializeObject<filesave>(response.Content);
                //                    att.Sent = true;
                //                    att.URL2 = d.url;
                //                    Logging.Logging.LogEntryOnFile(String.Format("Doc for {0} Successfully stored", att.Member_No));
                //                    att.Comments = "";
                //                }
                //                else
                //                {
                //                    Logging.Logging.LogEntryOnFile(response.Content);
                //                    att.Comments = response.Content.Substring(0,249);
                //                }
                //            }
                //            else
                //            {
                //                Logging.Logging.LogEntryOnFile(string.Format("Document {0} not found", att.Link_ID));
                //                att.Comments = string.Format("Document {0} not found", att.Link_ID);
                //            }
                //        }

                //        catch (Exception ex)
                //        {
                //            Logging.Logging.ReportError(ex);
                //            att.Comments = ex.Message;
                //        }
                //    }
                //    var a = att;
                //    Links_Service.Update(ref a);
                //}

            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }

        public void vendordocs()
        {

            try
            {
                Logging.Logging.LogEntryOnFile("Vendor Documents");
                var members = VendorCard_Service.ReadMultiple(new ErpVendor.Vendors_Filter[] { new ErpVendor.Vendors_Filter { Criteria = "", Field = ErpVendor.Vendors_Fields.DMS_Url }  }, null, 0);

                foreach (var member in members.Where(o => o.DMS_Url == null || o.DMS_Url == ""))
                {
                    IRestResponse response = null;
                    try
                    {
                        var t = Token().token;
                        var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                       
                     var    request = new RestRequest("ada/v_1/vendors", Method.POST);
                        request.RequestFormat = DataFormat.Json;
                        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                        request.AddJsonBody(
                             new
                             {
                                 F_NAME = member.Name,
                                 F_SUPP_ID = member.No

                             });

                        response = client.Execute(request);
                        if (response.StatusCode == HttpStatusCode.OK)
                        {
                            member.DMS_Url = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=68&QYNUM=1&QUERYPARAMS=F_SUPP_ID={0}&LANG=ENGLISH", member.No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                        
                        }
                        else
                        {
                            if (response.Content.Contains("Vendor already exist!"))
                                member.DMS_Url = string.Format("http://{1}/ada.web/openQuery.aspx?SERVER_ID={2}&APP=1&LIB=68&QYNUM=1&QUERYPARAMS=F_SUPP_ID={0}&LANG=ENGLISH", member.No, s.adasettings.Server_Ip, s.adasettings.Server_id);
                            else
                                member.DMS_Url = response.Content;
                            Logging.Logging.LogEntryOnFile(response.Content);
                        }

                        var m = member;
                        VendorCard_Service.Update(ref m);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }
               
                            
            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        public Token Token()
        {
            var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
            var request = new RestRequest("authenticate", Method.POST);
            request.RequestFormat = DataFormat.Json;
            request.AddJsonBody(
                 new
                 {
                     username = s.adasettings.Username,
                     password = s.adasettings.pass
                 });

            IRestResponse response = client.Execute(request);
            return SimpleJson.DeserializeObject<Token>(response.Content.ToString());
        }

        public vendor addvendor(string vendor)
        {
            IRestResponse response = null;
            try
            {
                var v = VendorCard_Service.Read(vendor);
                if (v != null)
                {
                    var t = Token().token;
                    var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
                    var request = new RestRequest("ada/v_1/vendors/" + v.No, Method.GET);
                    request.RequestFormat = DataFormat.Json;
                    request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                    response = client.Execute(request);
                    var objects = JObject.Parse(response.Content);

                    if (objects["F_NEW_NO"] == null)
                    {
                        request = new RestRequest("ada/v_1/vendors", Method.POST);
                        request.RequestFormat = DataFormat.Json;
                        request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                        request.AddJsonBody(
                             new
                             {
                                 F_NAME = v.Name,
                                 F_SUPP_ID = v.No
                             }); ;

                        response = client.Execute(request);
                    }
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            if (response != null)
                return SimpleJson.DeserializeObject<vendor>(response.Content.ToString());
            else return null;
        }
        public vendor addemployee(Employee_Attachments.Employee_Attachements e)
        {
            IRestResponse response = null;
            try
            {
                var t = Token().token;
                var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                var request = new RestRequest("ada/v_1/employees/" + e.Employee_No, Method.GET);
                request.RequestFormat = DataFormat.Json;
                request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                response = client.Execute(request);

                var objects = JObject.Parse(response.Content);
                if (objects["F_NEW_NO"] == null)
                {

                    request = new RestRequest("ada/v_1/employees", Method.POST);
                    request.RequestFormat = DataFormat.Json;
                    request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                    request.AddJsonBody(
                         new
                         {
                             F_ID_NUMBER = e.Employee_No,
                             F_EMP_NO = e.Employee_No,
                             F_NAME = e.Employee_Name
                         }); ;

                    response = client.Execute(request);
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            if (response != null)
                return SimpleJson.DeserializeObject<vendor>(response.Content.ToString());
            else return null;
        }
        public void addmember()
        {
            var t = Token().token;
            var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));
            var member = invest.Member.ToList();
            foreach (var m in member)
            {
                try
                {


                    var request = new RestRequest("ada/v_1/investments/" + m.No, Method.GET);
                    //request.RequestFormat = DataFormat.Json;
                    //request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                    //IRestResponse response = client.Execute(request);

                    //var objects = JObject.Parse(response.Content);
                    //if (objects["F_NEW_NO"] == null)
                    //{
                    request = new RestRequest("ada/v_1/investments", Method.POST);
                    request.RequestFormat = DataFormat.Json;
                    request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);
                    var mm = m.Name.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

                    request.AddJsonBody(
                         new
                         {

                             F_DEPT = m.Member_Category,
                             F_FILENO = m.No,
                             F_NEW_NO = m.No,
                             F_PF_NO = m.National_ID_No,
                             F_NAME = m.Name,
                             id = m.National_ID_No

                         });

                    IRestResponse response = client.Execute(request);
                    //}
                }
                catch (Exception ex) { Logging.Logging.ReportError(ex); }
            }
        }

        public vendor addinvestment(Links.Links e)
        {
            IRestResponse response = null;
            try
            {
                var t = Token().token;
                var client = new RestClient(string.Format("{0}", s.adasettings.baseurl));

                var request = new RestRequest("ada/v_1/investments/" + e.Member_No, Method.GET);
                request.RequestFormat = DataFormat.Json;
                request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                response = client.Execute(request);

                var objects = JObject.Parse(response.Content);
                if (objects["F_NEW_NO"] == null)
                {

                    request = new RestRequest("ada/v_1/investments", Method.POST);
                    request.RequestFormat = DataFormat.Json;
                    request.AddParameter("Authorization", "Bearer " + t, ParameterType.HttpHeader);

                    request.AddJsonBody(
                         new
                         {
                             F_ID_NUMBER = e.Member_No,
                             F_NEW_NO = e.Member_No,
                             F_NAME = e.Member_Name,
                             F_PF_NO = e.Member_No,
                             id = e.Member_No

                         }); ;

                    response = client.Execute(request);
                }

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            if (response != null)
                return SimpleJson.DeserializeObject<vendor>(response.Content.ToString());
            else return null;
        }

    }
    class Token
    {
        public string token;

    }
    class vendor
    {
        public string F_NAME { get; set; }
        public string F_SUPP_ID { get; set; }
        public class Vendorfile
        {
            public string FILE_DATA { get; set; }
            public string F_DOC_BOX_NO { get; set; }
            public string F_DOC_DATE { get; set; }
            public string F_DOC_REF { get; set; }
            public string F_DOC_REPOSITORY { get; set; }
            public string F_DOC_TYPE { get; set; }
            public string F_FOLIO { get; set; }
            public string F_SUPP_ID { get; set; }
        }

    }
    public class filesave
    {
        public string msg { get; set; }
        public bool success { get; set; }
        public string url { get; set; }
    }
}