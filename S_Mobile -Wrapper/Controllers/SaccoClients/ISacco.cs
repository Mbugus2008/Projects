using Logging;
using S_Mobile.Models;
using System.Collections.Generic;

namespace S_Mobile.Controllers.SaccoClients
{
    public interface ISacco
    {
        Client clnt { get; set; }

        Results<Members.mobile_Member> member(string acc);

        Results<List<Accounts_Service.Accounts>> Accounts(string Phone);

        Results<List<Account_Entries.Account_Entries>> Statement(string acc);

        Results<List<Account_Entries.Account_Entries>> Schedule(string LoanNo);

        Results<List<LoanProducts.LoanProducts>> loan_products();

        Results<Member_mobile_info.Member_mobile_info> CreateAccount(Member_mobile_info.Member_mobile_info request);

        Results<Member_Application.Member_Application> Customer_Registration(Member_Application.Member_Application application);
    }
}

namespace S_Mobile.Account_Entries
{
    public partial class Account_Entries
    {
        public TrimData.LedgerEntries.Transaction_Type Transaction_Type { get; set; }
        public decimal Credit { get; set; }
        public decimal Debit { get; set; }
        public string Loan_No { get; set; }
    }
}