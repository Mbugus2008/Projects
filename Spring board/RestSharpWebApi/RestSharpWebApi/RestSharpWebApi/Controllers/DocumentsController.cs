using RestSharpWebApi.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Http;
using Serilog;
using System.Runtime.InteropServices;
using Microsoft.Graph;
using Microsoft.Graph.Models;
using System.Runtime.InteropServices.ComTypes;
using System.Security.AccessControl;

namespace RestSharpWebApi.Controllers
{
    public partial class DocumentsController : ApiController//Login
    {
        Setting s = new Setting();
        [HttpGet]
        [Route("statement")]
        public Results<string> statement(string custno, DateTime from, DateTime to)
        {

            Results<string> result = new Results<string>();
            SBCSERVICE.SBCSERVICE _Service = new SBCSERVICE.SBCSERVICE(s);


            try
            {
                StringBuilder seg = new StringBuilder();
                for (int i = 0; i < Request.RequestUri.Segments.Length - 1; i++)
                {
                    seg.Append(Request.RequestUri.Segments[i]);
                }

                Results<MobilitySetup.MobilitySetup> rs = new CustomerDetailsController().getsetup();
                if (rs.Code == -1) return new Results<string>() { Code = rs.Code, Desc = rs.Desc };
                MobilitySetup.MobilitySetup ms = rs.Contents;
        


                string filename = _Service.GetStatement(custno, from, to);
                string folder = "Statements";
                string path = $"{Request.RequestUri.Authority}{seg}Documents/{folder}";
                string topath = $"{path}/{filename}";

                var source = $"{ms.Statement_Path}\\{filename}";
                string fileto = $"{System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath}Documents\\{folder}\\{filename}";
                File.Copy(source, fileto, true);

                FileSecurity fileSecurity = File.GetAccessControl(fileto);

                // Add an access rule to allow everyone to read and write the file
                fileSecurity.AddAccessRule(new FileSystemAccessRule("Everyone", FileSystemRights.Read | FileSystemRights.Write, AccessControlType.Allow));

                // Apply the modified access control to the file
                File.SetAccessControl(fileto, fileSecurity);



                result.Contents = topath;

            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }

        [HttpGet]
        [Route("offerletter")]
        public Results<string> offerletter(string loanno)
        {

            Results<string> result = new Results<string>();
            SBCSERVICE.SBCSERVICE _Service = new SBCSERVICE.SBCSERVICE(s);
            try
            {
                StringBuilder seg = new StringBuilder();
                for (int i = 0; i < Request.RequestUri.Segments.Length - 1; i++)
                {
                    seg.Append(Request.RequestUri.Segments[i]);
                }

                Results<MobilitySetup.MobilitySetup> rs = new CustomerDetailsController().getsetup();
                if (rs.Code == -1) return new Results<string>() { Code = rs.Code, Desc = rs.Desc };

                MobilitySetup.MobilitySetup ms = rs.Contents;
              
                string filename = _Service.GetOfferletter(loanno);
                string folder = "Offer Letters";
                string path = $"{Request.RequestUri.Authority}{seg}Documents/{folder}";
                string topath = $"{path}/{filename}";

                var source = $"{ms.Offer_Letter_Path}\\{filename}";
                string fileto = $"{System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath}Documents\\{folder}\\{filename}";
                File.Copy(source, fileto, true);
                File.Copy(source, fileto, true);

                FileSecurity fileSecurity = File.GetAccessControl(fileto);

                // Add an access rule to allow everyone to read and write the file
                fileSecurity.AddAccessRule(new FileSystemAccessRule("Everyone", FileSystemRights.Read | FileSystemRights.Write, AccessControlType.Allow));

                // Apply the modified access control to the file
                File.SetAccessControl(fileto, fileSecurity); result.Contents = topath;

            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }
        [HttpGet]
        [Route("demandletter")]
        public Results<string> demandletter(string loanno)
        {

            Results<string> result = new Results<string>();
            SBCSERVICE.SBCSERVICE _Service = new SBCSERVICE.SBCSERVICE(s);

            try
            {
                StringBuilder seg = new StringBuilder();
                for (int i = 0; i < Request.RequestUri.Segments.Length - 1; i++)
                {
                    seg.Append(Request.RequestUri.Segments[i]);

                }
                Results<MobilitySetup.MobilitySetup> rs = new CustomerDetailsController().getsetup();
                if (rs.Code == -1) return new Results<string>() { Code = rs.Code, Desc = rs.Desc };

                MobilitySetup.MobilitySetup ms = rs.Contents;
            
                
                
                string filename = _Service.GetDemandLetter(loanno);
                string folder = "Demand letter";
                string path = $"{Request.RequestUri.Authority}{seg}Documents/{folder}";
                string topath = $"{path}/{filename}";

                var source = $"{ms.Demand_Letter_Path}\\{filename}";
                string fileto = $"{System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath}Documents\\{folder}\\{filename}";
                File.Copy(source, fileto, true);
                File.Copy(source, fileto, true);

                FileSecurity fileSecurity = File.GetAccessControl(fileto);

                // Add an access rule to allow everyone to read and write the file
                fileSecurity.AddAccessRule(new FileSystemAccessRule("Everyone", FileSystemRights.Read | FileSystemRights.Write, AccessControlType.Allow));

                // Apply the modified access control to the file
                File.SetAccessControl(fileto, fileSecurity); result.Contents = topath;

            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }
        [HttpGet]
        [Route("loanschedule")]
        public Results<string> loanschedule(string loanno)
        {

            Results<string> result = new Results<string>();
            SBCSERVICE.SBCSERVICE _Service = new SBCSERVICE.SBCSERVICE(s);


            try
            {
                StringBuilder seg = new StringBuilder();
                for (int i = 0; i < Request.RequestUri.Segments.Length - 1; i++)
                {
                    seg.Append(Request.RequestUri.Segments[i]);
                }

                Results<MobilitySetup.MobilitySetup> rs = new CustomerDetailsController().getsetup();
                if (rs.Code == -1) return new Results<string>() { Code = rs.Code, Desc = rs.Desc };

                MobilitySetup.MobilitySetup ms = rs.Contents;
                string filename = _Service.GetSchedule(loanno);


                string folder = "Loan Schedules";


                string path = $"{Request.RequestUri.Authority}{seg}Documents/{folder}";
                string topath = $"{path}/{filename}";

                var source = $"{ms.Repayment_Schedule_Path}\\{filename}";
                string fileto = $"{System.Web.Hosting.HostingEnvironment.ApplicationPhysicalPath}Documents\\{folder}\\{filename}";
                File.Copy(source,fileto,true );
                result.Contents = topath;
                File.Copy(source, fileto, true);

                FileSecurity fileSecurity = File.GetAccessControl(fileto);

                // Add an access rule to allow everyone to read and write the file
                fileSecurity.AddAccessRule(new FileSystemAccessRule("Everyone", FileSystemRights.Read | FileSystemRights.Write, AccessControlType.Allow));

                // Apply the modified access control to the file
                File.SetAccessControl(fileto, fileSecurity);

                //string path = $"{Request.RequestUri.Authority}{seg}Documents/Loan Schedules";
                // string dc = _Service.GetSchedule(loanno);

                // result.Contents = $"{path}/{dc}";

            }
            catch (Exception ex)
            {
                Log.Error("Schedules",ex);
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }
        [HttpGet]
        [Route("setimage")]
        public Results<CustomerCard.CustomerCard> Uploadcustomerimage(string customerid, string link)
        {
            try
            {
                var cs = new CustomerCard.CustomerCard_Service(s);
                var c = cs.Read(customerid);
                if (c == null)
                    return new Results<CustomerCard.CustomerCard>() { Code = -1, Desc = "Invalid customer id" };
                c.Profile_Picture = link;
                cs.Update(ref c);
                return new Results<CustomerCard.CustomerCard>() { Contents = c };
            }
            catch (Exception e)
            {
                Log.Error(e, "setimage");
                return new Results<CustomerCard.CustomerCard>() { Code = -1, Desc = e.Message };

            }
        }
        //[HttpGet]
        //[Route("getimage")]
        public Results<IHttpActionResult> Downloadcustomerimage(string fileName)
        {
            StringBuilder seg = new StringBuilder();
            for (int i = 0; i < Request.RequestUri.Segments.Length - 1; i++)
            {
                seg.Append(Request.RequestUri.Segments[i]);
            }
            string path = $"{Request.RequestUri.Authority}{seg}Images/";

            var filePath = Path.Combine(path, fileName);

            if (File.Exists(filePath))
            {
                var fileBytes = File.ReadAllBytes(filePath);
                var response = new HttpResponseMessage(HttpStatusCode.OK)
                {
                    Content = new ByteArrayContent(fileBytes)
                };
                response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment")
                {
                    FileName = fileName
                };
                response.Content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");

                return new Results<IHttpActionResult>() { Contents = ResponseMessage(response) };
            }
            else
            {
                return new Results<IHttpActionResult>() { Contents = NotFound(), Code = -1 };
            }
        }
    }

}