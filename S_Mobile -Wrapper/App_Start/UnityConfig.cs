namespace S_Mobile
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            //var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();
            //container.RegisterType<MobileEntities>(new HierarchicalLifetimeManager());
            //container.RegisterType<IRepository, Localdb>(new HierarchicalLifetimeManager());

            //GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}