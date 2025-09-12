using Logging;
using S_Mobile.Controllers.Clients;
using System;
using System.Threading.Tasks;

namespace S_Mobile.Models.Paybill
{
    public interface Ipaybill

    {
        Task<Results<MPESA_Transaction>> ConfirmC2BPayment(MPESA_Transaction r);

        Client clnt { get; set; }
    }

    public class paybill
    {
        public Ipaybill GetClientInstance(Client_Paybill clientRecord)
        {
            switch (clientRecord.Client)
            {
                case "CITYHOPPER":
                    return new Cityhoppa(clientRecord.Client);
                case "TrimLine":
                    return new Trimline(clientRecord.Client);
                case "EMBASSAVA":
                    return new Embassava(clientRecord.Client);
                default:
                    return null;

            }
        }

    }
}
