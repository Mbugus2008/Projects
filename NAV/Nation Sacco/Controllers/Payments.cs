
using LoanProduct;
using MemberLoans;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MobileTransaction;
using Nation_Sacco.Controllers.Models;

using System.ServiceModel;
using System.Transactions;
using Results = Nation_Sacco.Controllers.Models.Results;

namespace Nation_Sacco.Controllers
{
   //[AllowAnonymous]
    public partial class NationSaccoController : ControllerBase
    {
        MobileTransaction.Transactions_PortClient mobileTransaction;
      
       
        [HttpPost("Transaction")]
        public IActionResult Transaction(Transaction trans)
        {
            Results response = new Results();
            MobileTransaction.Transactions transact = null;
            try
            {
               // throw new Exception("Service Temporarily Unavailable");

                if (trans.transaction_type < 1) throw new Exception("Transaction type required");//Transaction type required
                if (trans.From_Account_Number == "") throw new Exception("From_Account_Number required");//Transaction type required
                if (trans.phone_number == null) throw new Exception("Phone No Required");
                if (trans.Transaction_Reference.Trim() == "") throw new Exception("Transaction Reference is Required");
                if (trans.Transaction_Reference.Length >20) throw new Exception("Transaction Reference is Too big");

                if (trans.Amount < 0) throw new Exception("Amount is Required");

                var t = mobileTransaction.ReadMultiple(new MobileTransaction.Transactions_Filter[] {
                    new MobileTransaction.Transactions_Filter { Field = MobileTransaction.Transactions_Fields.Transaction_Type, Criteria = trans.transaction_type.ToString() },
                    new MobileTransaction.Transactions_Filter { Field = MobileTransaction.Transactions_Fields.Status, Criteria = MobileTransaction.Status.Pending_Posting.ToString() },
                 new MobileTransaction.Transactions_Filter { Field = MobileTransaction.Transactions_Fields.Account_No, Criteria = trans.From_Account_Number }
                }, null, 0).FirstOrDefault();
                
                if (t != null && t.Source == MobileTransaction.Source.Fosa) throw new Exception("We are processing a similar transaction kindly try again later");//Transaction pending
                t = mobileTransaction.ReadMultiple(new MobileTransaction.Transactions_Filter[] { 
                    new MobileTransaction.Transactions_Filter { Field = MobileTransaction.Transactions_Fields.Document_No, Criteria = trans.Transaction_Reference } ,
                new MobileTransaction.Transactions_Filter { Field = MobileTransaction.Transactions_Fields.Transaction_Type, Criteria = trans.transaction_type.ToString() }
                }, null, 0).FirstOrDefault();
                if (trans.request_type == null)
                    trans.request_type = Controllers.Transaction.Request_type.Initial;

                if (t != null && trans.request_type == Controllers.Transaction.Request_type.Initial) throw new Exception("Reference Already Exists");//Transaction already exist

                if (t == null && ((MobileTransaction.Transaction_Type)trans.transaction_type == MobileTransaction.Transaction_Type.Mpesa_Withdrawal || (MobileTransaction.Transaction_Type)trans.transaction_type == MobileTransaction.Transaction_Type.Bank_Transfer|| (MobileTransaction.Transaction_Type)trans.transaction_type == MobileTransaction.Transaction_Type.Till_Payment) && (trans.request_type == Controllers.Transaction.Request_type.confirmation))
                {
                    throw new Exception("We could not find the initial transaction");
                }

                if ((t != null) && (trans.request_type == Controllers.Transaction.Request_type.confirmation))
                {
                    if (String.IsNullOrEmpty( trans.reference )) throw new Exception("Transaction reference expected");
                    transact = t;
                    
                    transact.Document_No = trans.reference;
                    transact.Status = MobileTransaction.Status.Pending_Posting;
                    transact.StatusSpecified = true;
                }
                else
                {
                    transact = new MobileTransaction.Transactions
                    {
                        Transaction_Type = new Transaction().GetTransaction_Type(trans.transaction_type),
                        Transaction_TypeSpecified = true,
                        Document_No = trans.Transaction_Reference,
                        Transaction_Date = DateTime.Now,
                        Transaction_DateSpecified = true,
                        Account_No = trans.From_Account_Number,
                        Account_No_2 = trans.to_account,
                        Call_Back_Url  = trans.call_back_url,
                        Call_Back_updated = true,
                        Call_Back_updatedSpecified = true,
                        Mobile_No = trans.phone_number,
                        Loan_No = trans.Loan_account,
                        Amount = trans.Amount,
                        AmountSpecified = true,
                        Document_No_Initial = trans.Transaction_Reference,
                        Transaction_Time = DateTime.Now,
                        Transaction_TimeSpecified = true,
                        Channel = trans.channel == "App" ? MobileTransaction.Channel.App : MobileTransaction.Channel.Ussd,
                        SourceSpecified = true,
                        Reference = trans.reference,
                        Source = trans.Source.ToLower() == "fosa" ? MobileTransaction.Source.Fosa : MobileTransaction.Source.Mpesa,

                    };
                    transact.Description = transact.Transaction_Type.ToString();
                    if (!string.IsNullOrEmpty(trans.to_mpesa_phone))
                      transact.Description = trans.to_mpesa_phone;
                    if ((transact.Transaction_Type == Transaction_Type.Bank_Transfer) || transact.Transaction_Type == Transaction_Type.Till_Payment)
                        transact.Account_No_2 = transact.Description;

                    if ((transact.Transaction_Type == MobileTransaction.Transaction_Type.Mpesa_Withdrawal || transact.Transaction_Type == MobileTransaction.Transaction_Type.Bank_Transfer || transact.Transaction_Type == MobileTransaction.Transaction_Type.Till_Payment) && trans.request_type == Controllers.Transaction.Request_type.Initial)
                    {
                        transact.Status = MobileTransaction.Status.Sending_Money;
                        transact.StatusSpecified = true;

                    }
                }
                //Get account
                

                MemberAccount acc = null;
                if (transact.Transaction_Type != MobileTransaction.Transaction_Type.Member_Onboarding_with_IPRS_AI)
                {


                    var ad = AccountDetails(new request() { account_number = trans.From_Account_Number });
                    if (ad is OkObjectResult accdet)
                    {
                        var results = accdet.Value;
                        if (results is Results<error> er)
                        {
                            throw new Exception(er.result_message);

                        }
                        if (results is Results<MemberAccount> macc)
                        {

                            acc = macc.data;
                            transact.Member_No = acc.member_no;

                        }

                    }
                }
               

                //Validation
                switch (transact.Transaction_Type)
                {
                    case MobileTransaction.Transaction_Type.Loan_Repayment_MPESA:

                        if (string.IsNullOrEmpty(trans.Loan_account)) throw new Exception("Loan No is Required");
                        if (transact.Source == MobileTransaction.Source.Fosa) throw new Exception("Source parameter should be Mpesa");
                        break;
                    case MobileTransaction.Transaction_Type.Pay_Loan_From_Account:

                        if (string.IsNullOrEmpty(trans.Loan_account)) throw new Exception("Loan No is Required");

                        break;
                    case MobileTransaction.Transaction_Type.Mpesa_Deposit:
                        if (transact.Source == MobileTransaction.Source.Fosa) throw new Exception("Source parameter should be Mpesa");

                        break;   
                    case MobileTransaction.Transaction_Type.Transfer_to_FOSA:
                        if (transact.Account_No == transact.Account_No_2) throw new Exception("You can't transfer to same account");

                        break;
                    case MobileTransaction.Transaction_Type.Reversal:
                        
                        var rev= mobileTransaction.ReadMultiple(new MobileTransaction.Transactions_Filter[] {
                    new MobileTransaction.Transactions_Filter { Field = MobileTransaction.Transactions_Fields.Document_No, Criteria = trans.Transaction_Reference } ,
                new MobileTransaction.Transactions_Filter { Field = MobileTransaction.Transactions_Fields.Transaction_Type, Criteria = $"<>{Transaction_Type.Reversal.ToString()}" }
                }, null, 0).FirstOrDefault();
                        if (rev == null) throw new Exception("We could not find transaction to be reversed");

                        break;
                    default:

                        break;
                }
                 //reversal
                if (transact.Transaction_Type == MobileTransaction.Transaction_Type.Reversal)
                    return Ok(response);
                //Limits
                if (transact.Source == MobileTransaction.Source.Fosa)
                {
                    var charges = MobileCharges.ReadMultiple(new Mobilecharge.MobileCharges_Filter[] {
                    new Mobilecharge.MobileCharges_Filter{ Field = Mobilecharge.MobileCharges_Fields.Transaction_Type, Criteria = transact.Transaction_Type.ToString() }
                    }, null, 0).FirstOrDefault();
                    if (charges != null)
                    {

                        if (charges.Limit_Per_Transaction > 0 && charges.Limit_Per_Transaction < transact.Amount)
                            throw new Exception($"Transaction Amount exceeds Limit of {charges.Limit_Per_Transaction}");
                        var mmmm = mobileTransaction.ReadMultiple( new Transactions_Filter[] {new Transactions_Filter { Field = Transactions_Fields.Account_No ,Criteria = trans.From_Account_Number },
                        new Transactions_Filter{Field = Transactions_Fields.Transaction_Date, Criteria = DateTime.Today.Date.ToString("MM/dd/yyyy") },
new Transactions_Filter{Field = Transactions_Fields.Transaction_Type, Criteria = transact.Transaction_Type.ToString() }
                        },null,0 );
                        var mmm = mmmm.Sum(o => o.Amount);
                        //var mmm = memberAccounts.ReadMultiple(new MemberAccounts.Accounts_Filter[] { 
                        //    new MemberAccounts.Accounts_Filter { Criteria = trans.From_Account_Number, Field = MemberAccounts.Accounts_Fields.No }, 
                        //    new MemberAccounts.Accounts_Filter { Criteria = DateTime.Today.Date.ToString("MM/dd/yyyy"), Field = MemberAccounts.Accounts_Fields.Date_Filter },
                        //    new MemberAccounts.Accounts_Filter { Field = MemberAccounts.Accounts_Fields.Transaction_Type, Criteria = transact.Transaction_Type.ToString() } }, null, 0).FirstOrDefault();
                        
                        if (charges.Daily_Amount_Limits > 0 && charges.Daily_Amount_Limits < mmm)
                            throw new Exception($"Transaction Amount exceeds Daily Limit of {charges.Daily_Amount_Limits}");
                    }
                }
                //check Balance
                if (transact.Source == MobileTransaction.Source.Fosa)
                    switch (transact.Transaction_Type)
                    {
                        case MobileTransaction.Transaction_Type.Mpesa_Deposit:
                        case MobileTransaction.Transaction_Type.Member_Onboarding_with_IPRS_AI:
                            break;
                        case MobileTransaction.Transaction_Type.Transfer_to_FOSA:

                            string accc = "";
                            var mm = memberAccounts.ReadMultiple(new MemberAccounts.Accounts_Filter[] { 
                                new MemberAccounts.Accounts_Filter { Criteria = transact.Member_No, Field = MemberAccounts.Accounts_Fields.Member_No } }, null, 0);
                            if (mm != null)
                            {
                                
                                    switch (transact.Account_No_2)
                                    {
                                        case "SHARES":
                                            accc = mm.FirstOrDefault( o => o.Account_Type == MemberAccounts.Account_Type.Non_Withdrawable_Deposit).No;
                                          
                                            break;
                                        case "SHARES_CAPITAL":
                                            accc = mm.Where(o => o.Account_Type == MemberAccounts.Account_Type.Share_Capital_Account).FirstOrDefault().No;
                                            //checkbosabal(ref transact, member.Shares_Retained);
                                            break;
                                        case "BENEVOLENT_FUND":
                                            accc = mm.Where(o=> o.Account_Type == MemberAccounts.Account_Type.Benevolent_Account).FirstOrDefault().No;
                                            //checkbosabal(ref transact, member.Benevolent_Fund);
                                            break;
                                        case "SCHOOL_FEES":
                                            accc = mm.Where(o=> o.Account_Type == MemberAccounts.Account_Type.School_Fee_Account).FirstOrDefault().No;
                                            //checkbosabal(ref transact, member.School_Fees_Contributions);
                                            break;
                                    }
                                checkbal(ref transact, accc);
                            }
                            break;
                        default:
                            if (trans.request_type == Controllers.Transaction.Request_type.confirmation)
                                break;
                           
                            checkbal(ref transact);

                            break;
                    }
            }
            catch (Exception ex)
            {
                response.result_code = 400;
                response.result_message = ex.Message;
                if (transact != null)
                {
                    transact.Comments = ex.Message;
                    transact.Status = MobileTransaction.Status.Failed;
                    transact.StatusSpecified = true;
                }
            }
            finally
            {
                if (transact != null )
                    if (transact.Key == null)
                    mobileTransaction.Create(ref transact);
                else
                    mobileTransaction.Update(ref transact);
                if (transact != null && !string.IsNullOrEmpty(trans.call_back_url))
                {
                    Callback.CallBackUrls cb = new Callback.CallBackUrls();
                    cb.Code = transact.Document_No;
                    cb.Url = trans.call_back_url;
                    cb.Source = Callback.Source.Mobile_Transactions;
                    cb.SourceSpecified = true;
                    CallBackUrls.Create(ref cb);
                }
            }
            return Ok(response);
        }

        void checkbal(ref MobileTransaction.Transactions t,String account = "")
        {
            var acc = account == "" ? t.Account_No : account;

            var bal = polaris.GetAccountBal(acc);
            string ch = ((int)t.Transaction_Type).ToString();
            var charges = polaris.GetCharges(ch, t.Amount);
            t.Charge = charges;
            t.ChargeSpecified = true;
            _logger.LogInformation($"Charges: {charges}");
            if (bal < t.Amount + charges)
            {

                throw new Exception("Insufficient Funds");
            }

        }
        void checkbosabal(ref MobileTransaction.Transactions t,decimal accountbal)
        {
            var bal = accountbal;
            var charges = polaris.GetCharges(t.Transaction_Type.ToString(), t.Amount);
            _logger.LogInformation($"Charges: {charges}");
            if (bal < t.Amount + charges)
            {

                throw new Exception("Insufficient Funds");
            }

        }
    }
    public static class TransactionTypeHelper
    {
        public static string GetDescription(this MobileTransaction.Transaction_Type transactionType)
        {
            // Convert enum name to a readable format
            string name = transactionType.ToString();

            // Replace underscores and special encoded characters with spaces
            name = name.Replace("_", " ")
                      .Replace("x0026", "&")  // Handle & symbol
                      .Replace("x000A", ""); // Handle newline (if needed)

            // Trim any extra spaces and return
            return string.Join(" ", name.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries));
        }

        // Optional: Preload all descriptions into a dictionary for performance
        public static readonly Dictionary<MobileTransaction.Transaction_Type, string> DescriptionLookup =
            Enum.GetValues(typeof(MobileTransaction.Transaction_Type))
                .Cast<MobileTransaction.Transaction_Type>()
                .ToDictionary(
                    value => value,
                    value => value.GetDescription()
                );
    }
    public class Transaction
    {
        public enum Request_type { Initial,confirmation };
        public int transaction_type { get; set; }
        public string Source { get; set; }
        public string channel { get; set; }
        public string Transaction_Reference { get; set; }
        public string phone_number { get; set; }
        public decimal Amount { get; set; }
        public string? From_Account_Number { get; set; }
        public string? to_mpesa_phone { get; set; }
        public string? to_account { get; set; }
        public string? Loan_account { get; set; }
        public string? reference { get; set; }
        public string? call_back_url { get; set; }
        public Request_type? request_type { get; set; }

        public MobileTransaction.Transaction_Type GetTransaction_Type(int t) {
            return (MobileTransaction.Transaction_Type)t;

          
        
        }
    }
   
}