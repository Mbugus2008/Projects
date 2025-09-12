using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using pulseem.Server.Data;
using pulseem.Shared.Models;

namespace pulseem.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientController : ControllerBase
    {
        private readonly ApplicationDBContext _context;
        public ClientController(ApplicationDBContext context)
        {
            this._context = context;
            Console.WriteLine("Initialize");
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            Console.WriteLine("Getting data");
            var devs = await _context.Clients.ToListAsync();
            return Ok(devs);
        }
        [HttpGet("{email}")]
        public async Task<IActionResult> Get(string email)
        {
            var dev = await _context.Clients.FirstOrDefaultAsync(a => a.Email == email);
            return Ok(dev);
        }
        [HttpPost]
        public async Task<IActionResult> Post(Clients client)
        {
            Console.WriteLine("Adding data");
            _context.Add(client);
            await _context.SaveChangesAsync();
            return Ok(client.Email);
        }
        [HttpPut]
        public async Task<IActionResult> Put(Clients client)
        {
            _context.Entry(client).State = EntityState.Modified;
            var all = _context.Clients.Where(o =>  o.CellPhone.EndsWith(client.CellPhone.Substring(client.CellPhone.Length -9)));
           await all.ForEachAsync(a => a.SmsStatus = client.SmsStatus);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        [HttpDelete("{email}")]
        public async Task<IActionResult> Delete(string email)
        {
            var em = new Clients { Email = email };
            _context.Remove(em);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
