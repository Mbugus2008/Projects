using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace S_Mobile_Data
{
    public partial class MobileEntities : DbContext
    {
        public MobileEntities(string Connectionstring)
            : base(Connectionstring)
        {
        }
    }
        public interface IRepository<T>
    {
        T GetById(int id);
        IEnumerable<T> GetAll();
        void Add(T entity);
        void Savechanges();
        void Delete(T entity);
        IEnumerable<T> FilterBy(Expression<Func<T, bool>> predicate);
    }
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly DbContext _dbContext;

        public Repository(DbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public T GetById(int id)
        {
            return _dbContext.Set<T>().Find(id);
        }

        public IEnumerable<T> GetAll()
        {
            return _dbContext.Set<T>().ToList();
        }

        public void Add(T entity)
        {
            _dbContext.Set<T>().Add(entity);
           // _dbContext.SaveChanges();
        }

        public void Savechanges()
        {
            //_dbContext.Entry(entity).State = EntityState.Modified;
            _dbContext.SaveChanges();
        }

        public void Delete(T entity)
        {
            _dbContext.Set<T>().Remove(entity);
            _dbContext.SaveChanges();
        }
        public IEnumerable<T> FilterBy(Expression<Func<T, bool>> predicate)
        {
            return _dbContext.Set<T>().Where(predicate).ToList();
        }
    }

    public partial class Client
    {
   
        public int balance(DbContext dbContext1)
        {
           
                if (dbContext1 != null) {
                    return dbContext1.Set<BulkSm>().Where(o => o.Client == Client_Code).Sum(o => o.Value) ?? 0;
                }
                else
                {
                    return 0;
                }
            
        }
        public NotificationMode notification_mode

        {

            get { return (NotificationMode)Notification_Mode; }

            set { Notification_Mode = (int)value; }

        }

        public enum NotificationMode
        {
            Sms = 0,
            Email = 1,
            Both = 2
        }

    }
}
