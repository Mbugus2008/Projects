using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Data.Entity;
using System.Configuration.Install;
using System.Collections;
using System.Data.SqlClient;
namespace Etims
{
    internal static class Program
    {
        
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main(string[] args)
        {
            logs.logpath = Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\logs\\" ;

            try
            {

                if (Environment.UserInteractive)
                {
                    try
                    {
                        logs.LogEntryOnFile("Interactive");
                        string path = Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\Settings.xml";

                        Settings settings = new Settings().load(path);
                        EtimsService etims = new EtimsService(settings.etims);
                     
                        //etims.saveProduct();
                        etims.Sales();
                    }
                    catch (Exception ex) { logs.ReportError(ex); }

                }



                if (args.Length == 0)
                    {
                        ServiceBase[] ServicesToRun;
                        ServicesToRun = new ServiceBase[]
                        {
                            new Etim()
                        };
                        ServiceBase.Run(ServicesToRun);
                    }
                    else if (args.Length == 1)
                    {
                        switch (args[0])
                        {
                            case "-i":
                                InstallService();
                                StartService();
                                break;
                            case "-u":
                                StopService();
                                UninstallService();
                                break;
                            default:
                                throw new NotImplementedException();
                        }
                    }
                
            }
            catch (Exception ex)
            {

                logs.ReportError(ex);
            }
        }
        private static bool IsInstalled()
        {
            using (ServiceController controller =
                new ServiceController("EtimsSc"))
            {
                try
                {
                    ServiceControllerStatus status = controller.Status;
                }
                catch
                {
                    return false;
                }
                return true;
            }
        }

        private static bool IsRunning()
        {
            using (ServiceController controller =
                new ServiceController("EtimsSc"))
            {
                if (!IsInstalled()) return false;
                return (controller.Status == ServiceControllerStatus.Running);
            }
        }

        private static AssemblyInstaller GetInstaller()
        {

            AssemblyInstaller installer = new AssemblyInstaller(
                typeof(Etim).Assembly, null);
            installer.UseNewContext = true;
            return installer;
        }
        private static void InstallService()
        {
            if (IsInstalled())
            {
                logs.LogEntryOnFile("Already Installed");
                Console.WriteLine("Already installed");
                return;
            }

            try

            {
              

                using (AssemblyInstaller installer = GetInstaller())
                {
                    IDictionary state = new Hashtable();
                    try
                    {
                        installer.Install(state);
                        installer.Commit(state);
                    }
                    catch
                    {
                        
                        Console.WriteLine("Unable to install");
                        try
                        {
                            installer.Rollback(state);
                        }
                        catch { }
                        throw;
                    }
                }
            }
            catch(Exception ex) 
            {
                logs.ReportError(ex);
                throw;
            }
        }
     
        private static void UninstallService()
        {
            if (!IsInstalled()) return;
            try
            {
                using (AssemblyInstaller installer = GetInstaller())
                {
                    IDictionary state = new Hashtable();
                    try
                    {
                        logs.LogEntryOnFile("Un-Installing Service");
                        installer.Uninstall(state);
                        installer.Commit(state);
                    }
                    catch
                    {installer.Rollback(state);
                        throw;
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        private static void StartService()
        {
            if (!IsInstalled()) return;
           
            using (ServiceController controller =
                new ServiceController("EtimsSc"))
            {
                try
                {
                    if (controller.Status != ServiceControllerStatus.Running)
                    {
                        controller.Start();
                        controller.WaitForStatus(ServiceControllerStatus.Running,
                            TimeSpan.FromSeconds(10));
                    }
                }
                catch
                {
                    throw;
                }
            }
        }

        private static void StopService()
        {
            if (!IsInstalled()) return;
            using (ServiceController controller =
                new ServiceController("EtimsSc"))
            {
                try
                {
                    if (controller.Status != ServiceControllerStatus.Stopped)
                    {
                        controller.Stop();
                        controller.WaitForStatus(ServiceControllerStatus.Stopped,
                             TimeSpan.FromSeconds(10));
                    }
                }
                catch
                {
                    throw;
                }
            }
        }
  
    }
    
}
