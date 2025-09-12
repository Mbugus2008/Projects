

using pulseem.Shared.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pulseem.Shared
{
    //public class ClientService
    //{
    //    #region Property
    //    private readonly AppDBContext _appDBContext;
    //    #endregion

    //    #region Constructor
    //    public ClientService(AppDBContext appDBContext)
    //    {
    //        _appDBContext = appDBContext;
    //    }
    //    #endregion

    //    #region Get List of Clients
    //    public async Task<List<Clients>> GetAllClientsAsync()
    //    {
    //        return await _appDBContext.Clients.ToListAsync();
    //    }
    //    #endregion

    //    #region Insert Client
    //    public async Task<bool> InsertClientAsync(Clients Client)
    //    {
    //        await _appDBContext.Clients.AddAsync(Client);
    //        await _appDBContext.SaveChangesAsync();
    //        return true;
    //    }
    //    #endregion

    //    #region Get Client by Id
    //    public async Task<Clients> GetClientAsync(String Id)
    //    {
    //        Clients Client = await _appDBContext.Clients.FirstOrDefaultAsync(c => c.Email.Equals(Id));
    //        return Client;
    //    }
    //    #endregion

    //    #region Update Client
    //    public async Task<bool> UpdateClientAsync(Clients Client)
    //    {
    //        _appDBContext.Clients.Update(Client);
    //        await _appDBContext.SaveChangesAsync();
    //        return true;
    //    }
    //    #endregion

    //    #region DeleteClient
    //    public async Task<bool> DeleteClientAsync(Clients Client)
    //    {
    //        _appDBContext.Remove(Client);
    //        await _appDBContext.SaveChangesAsync();
    //        return true;
    //    }
    //    #endregion
    //}
}

