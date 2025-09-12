using Coffee_MVP.Model.Repository;
using Coffee_MVP.Presenters;
using Coffee_MVP.Repository;
using Coffee_MVP.Views;

namespace Coffee_MVP
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            IUserview userview = new Views.User ();
            IUserrepository<User>    userrepository = new Repository<User>();
            new UserPresenter(userview, userrepository);
            Application.Run((Form)userview);
        }
    }
}