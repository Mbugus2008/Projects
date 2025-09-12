using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.ServiceProcess;
using System.Text;
using System.Threading;

namespace Etims
{
    public partial class Etim : ServiceBase
    {
        private Thread _thread;
        EtimsService etims;
        public Etim()
        {
            InitializeComponent();
            string path = Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\Settings.xml";
            Settings settings = new Settings().load(path);
            etims = new EtimsService(settings.etims);
        }

        protected override void OnStart(string[] args)
        {
            logs.LogEntryOnFile("Starting Service");
            _thread = new Thread(() => etims.start());
            _thread.IsBackground = false; // true;
            _thread.Priority = ThreadPriority.Normal;
            _thread.SetApartmentState(ApartmentState.STA);
            _thread.Start();
        }

        protected override void OnStop()
        {
            logs.LogEntryOnFile("Stopping Service");
            etims.Stopservice = true;
        }
    }
}
