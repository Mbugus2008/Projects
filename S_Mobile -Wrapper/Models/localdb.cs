using System;

namespace S_Mobile.Models
{
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;

    public class Localdb : IRepository, IDisposable
    {
        private MobileEntities _context;

        public Localdb(MobileEntities context)
        {
            _context = context;
        }

        public void Update(object entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
            _context.SaveChanges();
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public void Add(object entity)
        {
            _context.Set(entity.GetType()).Add(entity);
        }

        public void Remove(object entity)
        {
            _context.Set(entity.GetType()).Remove(entity);
        }

        public IEnumerable<T> GetAll<T>() where T : class
        {
            return _context.Set<T>().ToList();
        }

        public IEnumerable<T> where<T>(Func<T, bool> filter = null) where T : class
        {
            return _context.Set<T>().Where(filter).ToList();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public int Getsmsbalance(string client)
        {
            return (_context.BulkSms.Where(o => o.Client == client).Sum(o => o.Value)) ?? 0;
        }

        public BulkSm smsexist(BulkSm sms)
        {
            return _context.BulkSms.FirstOrDefault(o => o.Source_Id == sms.Source_Id && o.Client == sms.Client);
        }

        public Client getclient(string client)
        {
            return _context.Clients.FirstOrDefault(o => o.Client_Code == client);
        }
    }

    public partial class Client
    {
        public Sms_client Sms_clientvalue
        { get { return (Sms_client)Enum.Parse(typeof(Sms_client), (Sms_Client ?? 0).ToString()); } }
    }

    public enum Sms_client
    {
        Africastalking = 0,
        zettatel = 1,
        Blanks = 3
    }
}