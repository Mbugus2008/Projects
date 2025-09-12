using System;
using System.Collections.Generic;

namespace S_Mobile.Models
{
    public class Nav : IRepository
    {
        public void Add(object entity)
        {
        }

        public IEnumerable<T> GetAll<T>() where T : class
        {
            throw new NotImplementedException();
        }

        public Client getclient(string client)
        {
            throw new NotImplementedException();
        }

        public int Getsmsbalance(string Client)
        {
            throw new NotImplementedException();
        }

        public void Remove(object entity)
        {
            throw new NotImplementedException();
        }

        public void SaveChanges()
        {
            throw new NotImplementedException();
        }

        public BulkSm smsexist(BulkSm sms)
        {
            throw new NotImplementedException();
        }

        public void Update(object entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<T> where<T>(Func<T, bool> filter) where T : class
        {
            throw new NotImplementedException();
        }
    }
}