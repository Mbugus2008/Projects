using System.Net.Http.Json;

namespace Sacco.Client.Services
{
    public interface ILoanService
    {
        Task SaveLoanAsync(Loansdata.Loans loan);
        Task<Loansdata.Loans> GetLoanAsync(string id);
        // Other methods
    }
    public class LoanService : ILoanService
    {
        private readonly HttpClient _http;

        public LoanService(HttpClient http)
        {
            _http = http;
        }

        public Task<Loansdata.Loans> GetLoanAsync(string id)
        {
            throw new NotImplementedException();
        }

        public async Task SaveLoanAsync(Loansdata.Loans loan)
        {
            await _http.PostAsJsonAsync("api/loans", loan);
        }

        // Implement other methods
    }
}
