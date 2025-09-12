using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Globalization;
using System.Configuration;
using System.Text;

namespace WeighCon
{
    public class ErrorHandler
    {
        //public static void LogErrorToDb(Exception ex, string ErrorMethod,string AgentCode)
        //{
        //    try
        //    {
        //        using (AGENCY_BANKINGEntities22 ABE = new AGENCY_BANKINGEntities22())
        //        {
        //            ErrorLog errorLog = new ErrorLog();
        //            errorLog.Description = GetExceptionMessage(ex);
        //            errorLog.Log_Date = DateTime.Now;
        //            errorLog.Log_Time = DateTime.Now;
        //            errorLog.User_ID = AgentCode;
        //            errorLog.Source = ErrorMethod;
        //            ABE.ErrorLogs.Add(errorLog);
        //            ABE.SaveChanges();
        //        }
        //    }
        //    catch (Exception EX)
        //    {}           
        //}
        public static string GetExceptionMessage(Exception ex)
        {
            if (ex.InnerException != null)
            {
                WriteLog("Error", ex.Message.ToString() + " : : " + ex.InnerException.Message.ToString() + " : : " + ex.StackTrace.ToString());
                return ex.InnerException.Message;
            }
            else
            {
                WriteLog("Error", ex.Message.ToString() + " : : " + ex.StackTrace.ToString());
                return ex.Message;
            }
        }
        public static void WriteLog(string ErrType,string Message)
        {
            string Path = ConfigurationManager.AppSettings["Log_Path"];
            try
            {
                string loc = Path + "/" + DateTime.Today.ToString("dd-MM-yy");
                if (!Directory.Exists(loc))
                    Directory.CreateDirectory(loc);
                string path = loc + "/" + ErrType + ".txt";
                if (!File.Exists(path))
                    File.Create(path).Dispose();
                if (File.Exists(path))
                {
                    //using (var w = File.Open(path, FileMode.Open, FileAccess.Write, FileShare.ReadWrite))
                    //{
                    //    Byte[] info = new UTF8Encoding(true).GetBytes(DateTime.Now.ToString(CultureInfo.InvariantCulture) + " : " + Message);
                    //    // Add some information to the file.  
                    //    w.Write(info, 0, info.Length);
                    //}

                    using (StreamWriter w = File.AppendText(path))
                    {
                        w.Write("\r\nLog Entry :");
                        w.Write("{0}", DateTime.Now.ToString(CultureInfo.InvariantCulture));
                        w.WriteLine("-:-" + Message);
                        w.Flush();
                        w.Close();
                    }
                }
            }
            catch (Exception ex) { WriteLog("Exception", ex.ToString()); }
    }
    }
}  
    