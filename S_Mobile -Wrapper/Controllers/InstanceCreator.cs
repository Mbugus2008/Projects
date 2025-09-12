using System;

namespace S_Mobile.Controllers
{
    public class InstanceCreator<T>
    {
        public T CreateInstance(string className)
        {
            // Get the type of the class
            Type type = Type.GetType(className);
            if (type == null)
            {
                throw new ArgumentException($"Type '{className}' not found");
            }

            // Ensure the type implements IClient
            if (!typeof(T).IsAssignableFrom(type))
            {
                throw new InvalidOperationException($"Type '{className}' does not implement Interface");
            }

            // Create an instance of the type
            return (T)Activator.CreateInstance(type);
        }
    }
}