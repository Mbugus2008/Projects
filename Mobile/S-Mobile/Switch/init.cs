using S_Mobile_Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Threading.Tasks;


namespace S_Mobile
{
    class init
    {

        DbContext _dbcontext;
        public init(DbContext dbContext)
        {
            _dbcontext = dbContext;
        }
        public static Boolean close = false;
        public void Start()
        {

            Logging.Logging.LogEntryOnFile("Service Started");
            Thread _threadbulk = new Thread(() => process());
            _threadbulk.IsBackground = true;
            _threadbulk.Priority = ThreadPriority.Normal;
            _threadbulk.SetApartmentState(ApartmentState.STA);
            _threadbulk.Start();
            //while (close == false) { }
        }
        public void process()
        {
            while (true)
            {
                Logging.Logging.LogEntryOnFile(DateTime.Now.ToString());

                Sms.Sms ss = new Sms.Sms(_dbcontext);

                ss.sendscheduledsms();
                if ((DateTime.Now > new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 7, 0, 0)) && (DateTime.Now < new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 22, 0, 0)))
                {
                    ss.smsbalancenotify();
                }

                Thread.Sleep(10000);
            }
        }




    }


}
