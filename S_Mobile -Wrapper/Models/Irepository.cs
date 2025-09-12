using System;
using System.Collections.Generic;

namespace S_Mobile.Models
{
    public interface IRepository
    {
        void Update(object entity);

        void SaveChanges();

        void Add(object entity);

        void Remove(object entity);

        IEnumerable<T> GetAll<T>() where T : class;

        IEnumerable<T> where<T>(Func<T, bool> filter = null) where T : class;

        int Getsmsbalance(string Client);

        BulkSm smsexist(BulkSm sms);

        Client getclient(string client);
    }
}