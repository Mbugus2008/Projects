using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WeighCon
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            using (Mutex mutex = new Mutex(false, "054ccd2c-a396-4a6f-9b8e-6467bfdea5b0"))
            {
                if (!mutex.WaitOne(0, false))
                {
                    MessageBox.Show("PrintPro already running", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                Application.Run(new frmMain("STEPHEN WAMBUGU"));
            }

        }
    }
}
