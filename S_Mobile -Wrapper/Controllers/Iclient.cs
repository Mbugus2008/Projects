using Logging;

namespace S_Mobile.Controllers
{
    public interface Iclient
    {
        Results<Mpesa_Transactions.Mpesa_Transactions> Mpesa(Mpesa_Transactions.Mpesa_Transactions mpesa);
    }
}