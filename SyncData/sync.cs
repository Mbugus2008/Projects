using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;

namespace SyncData
{
    public partial class sync : ServiceBase
    {
        
        public sync()
        {
            InitializeComponent();
        }
        protected override void OnStart(string[] args)
        {
            start();
        }

        protected override void OnStop()
        {
            Program.stop = true;
        }

        public void start() { 

            ada ada = new ada();
             Thread _thread;
            _thread = new Thread(ada.start);
            _thread.IsBackground = false; 
            _thread.Priority = ThreadPriority.Normal;
            _thread.SetApartmentState(ApartmentState.STA);
            _thread.Start();

            Erp erp = new Erp();
            Thread terp;
            terp = new Thread(erp.start);
            terp.IsBackground = false;
            terp.Priority = ThreadPriority.Normal;
            terp.SetApartmentState(ApartmentState.STA);
            terp.Start();

            Investment inv = new Investment();
            Thread tinv;
            tinv = new Thread(inv.start);
            tinv.IsBackground = false;
            tinv.Priority = ThreadPriority.Normal;
            tinv.SetApartmentState(ApartmentState.STA);
            tinv.Start();

            Crm crm = new Crm();
            Thread tcrm;
            tcrm = new Thread(crm.start);
            tcrm.IsBackground = false;
            tcrm.Priority = ThreadPriority.Normal;
            tcrm.SetApartmentState(ApartmentState.STA);
            tcrm.Start();
        }
    }
}
