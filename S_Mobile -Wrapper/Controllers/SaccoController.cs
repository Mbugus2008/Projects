using Logging;
using S_Mobile.Controllers.SaccoClients;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace S_Mobile.Controllers
{
    /// <summary>
    /// Nav Integration API
    /// </summary>
    public class SaccoController : ApiController
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        private Accounts_Service.Accounts_Service accounts = new Accounts_Service.Accounts_Service();
        private Transactions.Transactions_Service transactions = new Transactions.Transactions_Service();
        private Loans.Loans_mobile_Service loans_Mobile = new Loans.Loans_mobile_Service();
        private Smobile.Mobile mobile = new Smobile.Mobile();
        private Agent_App.Agent_App_Service Agent_App_Service = new Agent_App.Agent_App_Service();
        private Account_Entries.Account_Entries_Service Account_Entries_Service = new Account_Entries.Account_Entries_Service();
        private Member_Application.Member_Application_Service Application_Service = new Member_Application.Member_Application_Service();
        private Account_Types.Account_Types_Service Account_Types_Service = new Account_Types.Account_Types_Service();
        private Members.mobile_Member_Service member_Service = new Members.mobile_Member_Service();
        private Nextofkin.Nextofkin_Service Nextofkin_Service = new Nextofkin.Nextofkin_Service();
        private Mobile_Loan_Entries.Mobile_Loan_Entries_Service Loan_Entries_Service = new Mobile_Loan_Entries.Mobile_Loan_Entries_Service();
        private Relationshiptypes.Relationshiptypes_Service Relationshiptypes_Service = new Relationshiptypes.Relationshiptypes_Service();
        private Eligibility.Eligibility_Service _eligibility = new Eligibility.Eligibility_Service();

        private LoanProducts.LoanProducts_Service LoanProducts_Service = new LoanProducts.LoanProducts_Service();
        private Guarantors_Mobile.Guarantors_Mobile_Service Guarantors_Mobile_Service = new Guarantors_Mobile.Guarantors_Mobile_Service();
        private Member_mobile_info.Member_mobile_info_Service member_Mobile_Info = new Member_mobile_info.Member_mobile_info_Service();

        private ISacco sacco;

        /// <summary>
        ///
        /// </summary>
        public SaccoController()
        {
            InstanceCreator<ISacco> creator = new InstanceCreator<ISacco>();
            sacco = creator.CreateInstance(string.Format("S_Mobile.Controllers.SaccoClients.{0}", WebApiApplication.client));

            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);

            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);
            //cd = new System.Net.NetworkCredential(@"PAULO\MBRANCH", "6lT+4pfc3ywVs4R+fngXL39Qm9g3JzR6+d7Ug6Nj2AM=" );

            accounts = new Accounts_Service.Accounts_Service { Url = Logging.misc.geturl(s, accounts.Url), Credentials = cd, PreAuthenticate = true };

            //var c = accounts.Read("");

            transactions = new Transactions.Transactions_Service { Url = Logging.misc.geturl(s, transactions.Url), Credentials = cd, PreAuthenticate = true };
            loans_Mobile = new Loans.Loans_mobile_Service { Url = Logging.misc.geturl(s, loans_Mobile.Url), Credentials = cd, PreAuthenticate = true };
            mobile = new Smobile.Mobile { Url = Logging.misc.geturl(s, mobile.Url), Credentials = cd, PreAuthenticate = true };
            Agent_App_Service = new Agent_App.Agent_App_Service { Url = Logging.misc.geturl(s, Agent_App_Service.Url), Credentials = cd, PreAuthenticate = true };
            Account_Entries_Service = new Account_Entries.Account_Entries_Service { Url = Logging.misc.geturl(s, Account_Entries_Service.Url), Credentials = cd, PreAuthenticate = true };
            Application_Service = new Member_Application.Member_Application_Service { Url = Logging.misc.geturl(s, Application_Service.Url), Credentials = cd, PreAuthenticate = true };
            Account_Types_Service = new Account_Types.Account_Types_Service { Url = Logging.misc.geturl(s, Account_Types_Service.Url), Credentials = cd, PreAuthenticate = true };
            member_Service = new Members.mobile_Member_Service { Url = Logging.misc.geturl(s, member_Service.Url), Credentials = cd, PreAuthenticate = true };
            Nextofkin_Service = new Nextofkin.Nextofkin_Service { Url = Logging.misc.geturl(s, Nextofkin_Service.Url), Credentials = cd, PreAuthenticate = true };
            Relationshiptypes_Service = new Relationshiptypes.Relationshiptypes_Service { Url = Logging.misc.geturl(s, Relationshiptypes_Service.Url), Credentials = cd, PreAuthenticate = true };
            _eligibility = new Eligibility.Eligibility_Service { Url = Logging.misc.geturl(s, _eligibility.Url), Credentials = cd, PreAuthenticate = true };
            LoanProducts_Service = new LoanProducts.LoanProducts_Service { Url = Logging.misc.geturl(s, LoanProducts_Service.Url), Credentials = cd, PreAuthenticate = true };
            Loan_Entries_Service = new Mobile_Loan_Entries.Mobile_Loan_Entries_Service { Url = Logging.misc.geturl(s, Loan_Entries_Service.Url), Credentials = cd, PreAuthenticate = true };
            Guarantors_Mobile_Service = new Guarantors_Mobile.Guarantors_Mobile_Service { Url = Logging.misc.geturl(s, Guarantors_Mobile_Service.Url), Credentials = cd, PreAuthenticate = true };
            member_Mobile_Info = new Member_mobile_info.Member_mobile_info_Service { Url = Logging.misc.geturl(s, member_Mobile_Info.Url), Credentials = cd, PreAuthenticate = true };
        }

        /// <summary>
        /// Get Accounts for the given phone no
        /// </summary>
        /// <param name="Phone">Should start with +254</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        //[HttpPost]
        //[Route("api/accounts")]
        //public Results<List<Accounts_Service.Accounts>> Accounts([FromBody] string Phone)
        //{
        //    Results<List<Accounts_Service.Accounts>> r = new Results<List<Accounts_Service.Accounts>>();
        //    try
        //    {
        //        Phone = string.Format("+254{0}", Phone.Substring(Phone.Length - 9));
        //        r.Contents = accounts.ReadMultiple(new Accounts_Service.Accounts_Filter[] { new Accounts_Service.Accounts_Filter { Criteria = Phone, Field = Accounts_Service.Accounts_Fields.MPESA_Mobile_No } }, null, 0).ToList();
        //    }
        //    catch (Exception ex)
        //    {
        //        Logging.Logging.ReportError(ex);
        //        r.Code = -1;
        //        r.Desc = ex.Message;
        //    }
        //    return r;
        //}
        /// <summary>
        /// Get Accounts for the given phone no
        /// </summary>
        /// <param name="Phone">Should start with +254</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        [HttpPost]
        [Route("api/accounts")]
        public Results<List<Accounts_Service.Accounts>> Accounts([FromBody] Params Phone)
        {
            Results<List<Accounts_Service.Accounts>> r = new Results<List<Accounts_Service.Accounts>>();
            try
            {
                //Phone.Phone = string.Format("+254{0}", Phone.Phone.Substring(Phone.Phone.Length - 9));
                //var acc = accounts.ReadMultiple(new Accounts_Service.Accounts_Filter[] { new Accounts_Service.Accounts_Filter { Criteria = Phone.Phone, Field = Accounts_Service.Accounts_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
                //if  (acc!=null)
                r.Contents = accounts.ReadMultiple(new Accounts_Service.Accounts_Filter[] { new Accounts_Service.Accounts_Filter { Criteria = Phone.Phone, Field = Accounts_Service.Accounts_Fields.Member_No } }, null, 0).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/Otp")]
        public Results<int> Otp(Params request)
        {
            Results<int> r = new Results<int>();
            try
            {
                //  mobile.SendSms("Otp", request.Phone, request.text, "");
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/Createaccount")]
        public Results<Member_mobile_info.Member_mobile_info> CreateAccount(Member_mobile_info.Member_mobile_info request)
        {
            Results<Member_mobile_info.Member_mobile_info> r = new Results<Member_mobile_info.Member_mobile_info>();
            try
            {
                member_Mobile_Info.Create(ref request);
                //  mobile.SendSms("Otp", request.Phone, request.text, "");
                r.Contents = request;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Account details for the given account no
        /// </summary>
        /// <param name="acc">Account no for the customer</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        [HttpPost]
        [Route("api/account")]
        public Results<Accounts_Service.Accounts> Account([FromBody] Params acc)
        {
            Results<Accounts_Service.Accounts> r = new Results<Accounts_Service.Accounts>();
            try
            {
                r.Contents = accounts.Read(acc.Acc);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/account_Phone")]
        public Results<Accounts_Service.Accounts> Account_Phone([FromBody] Params acc)
        {
            Results<Accounts_Service.Accounts> r = new Results<Accounts_Service.Accounts>();
            try
            {
                r.Contents = accounts.ReadMultiple(new Accounts_Service.Accounts_Filter[] { new Accounts_Service.Accounts_Filter { Criteria = acc.Phone, Field = Accounts_Service.Accounts_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/member")]
        public Results<Members.mobile_Member> member([FromBody] Params acc)
        {
            if (sacco != null)
                return sacco.member(acc.Phone);

            Results<Members.mobile_Member> r = new Results<Members.mobile_Member>();
            try
            {
                var accs = Account_Phone(acc);
                if (accs.Code == 0)
                {
                    if (accs.Contents != null)
                        r.Contents = member_Service.Read(accs.Contents.Member_No);
                }
                else
                    throw new Exception(accs.Desc);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Accounts for the given phone no
        /// </summary>
        /// <param name="idno">Customer Id no</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        [HttpPost]
        [Route("api/accounts_byid")]
        public Results<List<Accounts_Service.Accounts>> Accounts_byid([FromBody] string idno)
        {
            Results<List<Accounts_Service.Accounts>> r = new Results<List<Accounts_Service.Accounts>>();
            try
            {
                r.Contents = accounts.ReadMultiple(new Accounts_Service.Accounts_Filter[] { new Accounts_Service.Accounts_Filter { Criteria = idno, Field = Accounts_Service.Accounts_Fields.ID_No } }, null, 0).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/Statement")]
        public Results<List<Account_Entries.Account_Entries>> Accountentries([FromBody] Params Phone)
        {
            if (sacco != null)
                return sacco.Statement(Phone.Acc);

            Results<List<Account_Entries.Account_Entries>> r = new Results<List<Account_Entries.Account_Entries>>();
            try
            {
                //Phone.Phone = string.Format("+254{0}", Phone.Phone.Substring(Phone.Phone.Length - 9));
                //var acc = Accounts(Phone);
                //if (acc != null)
                //    if (acc.Code == 0)
                //    {
                //        if (acc.Contents.Count > 0)
                //        {
                r.Contents = Account_Entries_Service.ReadMultiple(new Account_Entries.Account_Entries_Filter[] { new Account_Entries.Account_Entries_Filter { Criteria = Phone.Acc, Field = Account_Entries.Account_Entries_Fields.Customer_No } }, null, 0).ToList();
                //    }
                //}
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/Schedule")]
        public Results<List<Account_Entries.Account_Entries>> Schedule([FromBody] Params Phone)
        {
            if (sacco != null)
                return sacco.Statement(Phone.Acc);

            Results<List<Account_Entries.Account_Entries>> r = new Results<List<Account_Entries.Account_Entries>>();
            try
            {
                //Phone.Phone = string.Format("+254{0}", Phone.Phone.Substring(Phone.Phone.Length - 9));
                //var acc = Accounts(Phone);
                //if (acc != null)
                //    if (acc.Code == 0)
                //    {
                //        if (acc.Contents.Count > 0)
                //        {
                r.Contents = Account_Entries_Service.ReadMultiple(new Account_Entries.Account_Entries_Filter[] { new Account_Entries.Account_Entries_Filter { Criteria = Phone.Acc, Field = Account_Entries.Account_Entries_Fields.Customer_No } }, null, 0).ToList();
                //    }
                //}
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Customer loans for the given phone no
        /// </summary>
        /// <param name="Phone">Should start with +254</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = List of all Customer loans and balances
        /// </returns>
        [HttpPost]
        [Route("api/loans")]
        public Results<List<Loans.Loans_mobile>> loans([FromBody] Params Phone)
        {
            Results<List<Loans.Loans_mobile>> r = new Results<List<Loans.Loans_mobile>>();
            try
            {
                //Phone.Phone = string.Format("+254{0}", Phone.Phone.Substring(Phone.Phone.Length - 9));
                //var acc = Accounts(Phone);
                //if (acc != null)
                //    if (acc.Code == 0)
                //    {
                //        if (acc.Contents.Count > 0)
                //        {
                r.Contents = loans_Mobile.ReadMultiple(new Loans.Loans_mobile_Filter[] { new Loans.Loans_mobile_Filter { Criteria = Phone.Phone, Field = Loans.Loans_mobile_Fields.Client_Code } }, null, 0).ToList();
                //    }
                //}
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Customer loans for the given phone no
        /// </summary>
        /// <param name="Phone">Should start with +254</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = List of all Customer loans and balances
        /// </returns>
        [HttpPost]
        [Route("api/guarantors")]
        public Results<List<Guarantors_Mobile.Guarantors_Mobile>> Guarantors([FromBody] Params Loan)
        {
            Results<List<Guarantors_Mobile.Guarantors_Mobile>> r = new Results<List<Guarantors_Mobile.Guarantors_Mobile>>();
            try
            {
                r.Contents = Guarantors_Mobile_Service.ReadMultiple(new Guarantors_Mobile.Guarantors_Mobile_Filter[] { new Guarantors_Mobile.Guarantors_Mobile_Filter { Criteria = Loan.Loan_No, Field = Guarantors_Mobile.Guarantors_Mobile_Fields.Loan_No } }, null, 0).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Customer loans for the given phone no
        /// </summary>
        /// <param name="Phone">Should start with +254</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = List of all Customer loans and balances
        /// </returns>
        ///
        [HttpPost]
        [Route("api/eligibility")]
        public Results<Eligibility.Eligibility> eligibility([FromBody] Params Phone)
        {
            Results<Eligibility.Eligibility> r = new Results<Eligibility.Eligibility>();
            try
            {
                Phone.Phone = string.Format("+254{0}", Phone.Phone.Substring(Phone.Phone.Length - 9));
                mobile.AdvanceEligibility(Phone.Phone, Phone.Loan_Type);

                r.Contents = _eligibility.Read(Phone.Phone, Phone.Loan_Type);
                if (r.Contents == null)
                {
                    r.Code = -1;
                    r.Desc = "No record Found";
                    return r;
                }
                if (r.Contents != null)
                    if (r.Contents.Comments != null)
                        if (!r.Contents.Comments.Equals(""))
                        {
                            r.Code = -1;
                            r.Desc = r.Contents.Comments;
                            return r;
                        }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Customer loans for the given phone no
        /// </summary>
        /// <param name="cs">Group certificate no</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = List of all Customer loans and balances
        /// </returns>
        [HttpPost]
        [Route("api/group")]
        public Results<Members.mobile_Member> Group([FromBody] Params cs)
        {
            Results<Members.mobile_Member> r = new Results<Members.mobile_Member>();
            try
            {
                r.Contents = member_Service.ReadMultiple(new Members.mobile_Member_Filter[] { new Members.mobile_Member_Filter { Criteria = cs.CS_Number, Field = Members.mobile_Member_Fields.ID_No }, new Members.mobile_Member_Filter { Criteria = "Yes", Field = Members.mobile_Member_Fields.Group_Account } }, null, 0).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Customer loans for the given phone no
        /// </summary>
        /// <param name="param">Id No for the customer</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = List of all Customer loans and balances
        /// </returns>
        [HttpPost]
        [Route("api/loans_byid")]
        public Results<List<Loans.Loans_mobile>> loans_byid([FromBody] Params param)
        {
            Results<List<Loans.Loans_mobile>> r = new Results<List<Loans.Loans_mobile>>();
            try
            {
                var acc = Accounts_byid(param.Id_No);
                if (acc != null)
                    if (acc.Code == 0)
                    {
                        if (acc.Contents.Count > 0)
                        {
                            r.Contents = loans_Mobile.ReadMultiple(new Loans.Loans_mobile_Filter[] { new Loans.Loans_mobile_Filter { Criteria = acc.Contents[0].Member_No, Field = Loans.Loans_mobile_Fields.Client_Code } }, null, 0).ToList();
                        }
                    }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Accounts for the given phone no
        /// </summary>
        /// <param name="trans">Transaction details</param>
        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        [HttpPost]
        [Route("api/transaction")]
        public Results<Transactions.Transactions> transaction([FromBody] Transactions.Transactions trans)
        {
            Results<Transactions.Transactions> r = new Results<Transactions.Transactions>();
            try
            {
                trans.AmountSpecified = true;
                trans.Amount_LCYSpecified = true;
                trans.ChannelSpecified = true;
                trans.Transaction_TypeSpecified = true;
                trans.Document_DateSpecified = true;
                trans.Transaction_TimeSpecified = true;
                trans.Statement_FromSpecified = true;
                trans.Statement_toSpecified = true;
                trans.Vendor_commissionSpecified = true;
                trans.Agent_commisionSpecified = true;
                trans.Sacco_CommissionSpecified = true;
                trans.Excise_DutySpecified = true;

                var t = transactions.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = trans.Document_No, Field = Transactions.Transactions_Fields.Document_No }, new Transactions.Transactions_Filter { Criteria = trans.Transaction_Type.ToString(), Field = Transactions.Transactions_Fields.Transaction_Type } }, null, 0).FirstOrDefault();
                if (t == null)
                {
                    transactions.Create(ref trans);
                    r.Contents = trans;
                    r.Code = trans.Code;
                    r.Desc = trans.Desc;
                    if (trans.Code == 0 && trans.Transaction_Type == Transactions.Transaction_Type.Ministatement)
                    {
                        List<Transactions.Ministatement> mini = new List<Transactions.Ministatement>();
                        var ent = Account_Entries_Service.ReadMultiple(new Account_Entries.Account_Entries_Filter[] { new Account_Entries.Account_Entries_Filter { Criteria = trans.Account_No, Field = Account_Entries.Account_Entries_Fields.Customer_No } }, null, 5);

                        foreach (Account_Entries.Account_Entries account_Entries in ent)
                        {
                            Transactions.Ministatement m = new Transactions.Ministatement();
                            m.posting_Date = account_Entries.Posting_Date;
                            m.desc = account_Entries.Description;
                            m.amount = Math.Abs((double)account_Entries.Amount);
                            if (account_Entries.Amount > 0)
                                m.dr_cr = "DR";
                            else
                                m.dr_cr = "CR";
                            mini.Add(m);
                        }
                        trans.ministatement = mini.ToArray();
                    }
                    if (trans.Code == 0 && trans.Transaction_Type == Transactions.Transaction_Type.Loan_Ministatement)
                    {
                        List<Transactions.Ministatement> loan_mini = new List<Transactions.Ministatement>();
                        var ent = Loan_Entries_Service.ReadMultiple(new Mobile_Loan_Entries.Mobile_Loan_Entries_Filter[] { new Mobile_Loan_Entries.Mobile_Loan_Entries_Filter { Criteria = trans.Loan_No, Field = Mobile_Loan_Entries.Mobile_Loan_Entries_Fields.Loan_No } }, null, 5);

                        foreach (var account_Entries in ent)
                        {
                            Transactions.Ministatement m = new Transactions.Ministatement();
                            m.posting_Date = account_Entries.Posting_Date;
                            m.desc = account_Entries.Description;
                            m.amount = Math.Abs((double)account_Entries.Amount);
                            m.TransactionType = account_Entries.Transaction_Type.ToString();
                            if (account_Entries.Amount > 0)
                                m.dr_cr = "DR";
                            else
                                m.dr_cr = "CR";
                            loan_mini.Add(m);
                        }
                        trans.Loan_ministatement = loan_mini.ToArray();
                    }
                }
                else
                {
                    r.Contents = t;
                    r.Code = -1;// t.Code;
                    r.Desc = "Transaction already exist";// t.Desc;
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Total charges for a transaction
        /// </summary>
        /// <param name="trans">Complete transaction request</param>
        /// <returns>Return same object but with a charge amount in the charge amount</returns>
        [HttpPost]
        [Route("api/transaction_charge")]
        public Results<Transactions.Transactions> transaction_charge([FromBody] Transactions.Transactions trans)
        {
            Results<Transactions.Transactions> r = new Results<Transactions.Transactions>();
            try
            {
                switch ((Transactions.Transaction_Type)trans.Transaction_Type)
                {
                    case Transactions.Transaction_Type.Withdrawal_Request:
                        trans.Charge = mobile.Charge((int)Transactions.Transaction_Type.Confirm, trans.Amount, trans.Account_No, (trans.Account_2 ?? ""), (int)trans.Source, (int)trans.Bank_Transfer_type, (int)trans.Channel);
                        break;

                    case Transactions.Transaction_Type.Utility_Payment:
                        trans.Charge = mobile.Charge((int)Transactions.Transaction_Type.Bill_Confirmation, trans.Amount, trans.Account_No, (trans.Account_2 ?? ""), (int)trans.Source, (int)trans.Bank_Transfer_type, (int)trans.Channel);
                        break;

                    case Transactions.Transaction_Type.Airtime:
                        trans.Charge = mobile.Charge((int)Transactions.Transaction_Type.Airtime_Confirmation, trans.Amount, trans.Account_No, (trans.Account_2 ?? ""), (int)trans.Source, (int)trans.Bank_Transfer_type, (int)trans.Channel);
                        break;

                    case Transactions.Transaction_Type.Bank_Transfer:
                        trans.Charge = mobile.Charge((int)Transactions.Transaction_Type.Bank_Transfer_Confirmation, trans.Amount, trans.Account_No, (trans.Account_2 ?? ""), (int)trans.Source, (int)trans.Bank_Transfer_type, (int)trans.Channel);
                        break;

                    default:
                        trans.Charge = mobile.Charge((int)trans.Transaction_Type, trans.Amount, trans.Account_No, (trans.Account_2 ?? ""), (int)trans.Source, (int)trans.Bank_Transfer_type, (int)trans.Channel);
                        break;
                }

                r.Contents = trans;
                r.Code = trans.Code;
                r.Desc = trans.Desc;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get agent Account Details
        /// </summary>
        /// <param name="agentCode"></param>
        /// <returns>Returns Agent Account</returns>
        [HttpPost]
        [Route("api/agent")]
        public Results<Agent_App.Agent_App> Agent_applications([FromBody] Params agentCode)
        {
            Results<Agent_App.Agent_App> r = new Results<Agent_App.Agent_App>();
            try
            {
                r.Contents = Agent_App_Service.Read(agentCode.Agent_Code);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get agent Account Details
        /// </summary>
        /// <param name="agentCode"></param>
        /// <returns>Returns Agent Account</returns>
        [HttpPost]
        [Route("api/Apllication_images")]
        public Results<Params> Application_images([FromBody] Params pictures)
        {
            Results<Params> r = new Results<Params>();
            try
            {
                mobile.SetImage(pictures.Application_No, Convert.ToInt32(pictures.Picturetype), pictures.Image);
                r.Contents = pictures;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get agent Account Details
        /// </summary>
        /// <param name="nextofkin"></param>
        /// <returns>Returns Agent Account</returns>
        [HttpPost]
        [Route("api/nextofkin")]
        public Results<List<Nextofkin.Nextofkin>> Next_of_kin([FromBody] List<Nextofkin.Nextofkin> nextofkin)
        {
            List<Nextofkin.Nextofkin> nok = new List<Nextofkin.Nextofkin>();
            Results<List<Nextofkin.Nextofkin>> r = new Results<List<Nextofkin.Nextofkin>>();
            try
            {
                foreach (var item in nextofkin.ToList())
                {
                    Nextofkin.Nextofkin n = item;
                    Logging.Logging.LogEntryOnFile(n.Account_No);
                    Nextofkin_Service.Create(ref n);
                    nok.Add(n);
                }
                r.Contents = nok.ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// New Customer Registration
        /// </summary>
        /// <param name="application"></param>
        /// <returns>Returns Agent Account</returns>
        [HttpPost]
        [Route("api/Registration")]
        public Results<Member_Application.Member_Application> Customer_Registration([FromBody] Member_Application.Member_Application application)
        {
            Results<Member_Application.Member_Application> r = new Results<Member_Application.Member_Application>();
            try
            {
                var reg = Application_Service.ReadMultiple(new Member_Application.Member_Application_Filter[] { new Member_Application.Member_Application_Filter { Criteria = application.ID_No, Field = Member_Application.Member_Application_Fields.ID_No } }, null, 0).FirstOrDefault();

                if (reg == null)
                {
                    application.Date_of_BirthSpecified = true;
                    application.GenderSpecified = true;
                    application.Marital_StatusSpecified = true;

                    Application_Service.Create(ref application);
                    r.Contents = application;
                }
                else
                {
                    r.Contents = reg;
                    r.Code = -1;
                    r.Desc = "Application exists";
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Savings account Types
        /// </summary>

        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        [HttpPost]
        [Route("api/account_types")]
        public Results<List<Account_Types.Account_Types>> Account_Type()
        {
            Results<List<Account_Types.Account_Types>> r = new Results<List<Account_Types.Account_Types>>();
            try
            {
                r.Contents = Account_Types_Service.ReadMultiple(new Account_Types.Account_Types_Filter[] { new Account_Types.Account_Types_Filter { Criteria = "Savings", Field = Account_Types.Account_Types_Fields.Product_Class_Type } }, null, 0).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <summary>
        /// Get Savings account Types
        /// </summary>

        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        [HttpPost]
        [Route("api/Loan_products")]
        public Results<List<LoanProducts.LoanProducts>> loan_products()
        {
            if (sacco != null)
                return sacco.loan_products();

            Results<List<LoanProducts.LoanProducts>> r = new Results<List<LoanProducts.LoanProducts>>();
            try
            {
                r.Contents = LoanProducts_Service.ReadMultiple(new LoanProducts.LoanProducts_Filter[] { }, null, 0).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        /// <returns>
        ///Code 0 = Successful
        ///Code -1 = Unsuccessful
        ///Desc = Error Description if Code is -1
        ///Contents = Response Data if code is 0
        /// </returns>
        [HttpPost]
        [Route("api/Relationtypes")]
        public Results<List<Relationshiptypes.Relationshiptypes>> Relationtypes()
        {
            Results<List<Relationshiptypes.Relationshiptypes>> r = new Results<List<Relationshiptypes.Relationshiptypes>>();
            try
            {
                r.Contents = Relationshiptypes_Service.ReadMultiple(new Relationshiptypes.Relationshiptypes_Filter[] { }, null, 0).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
    }

    public class Params
    {
        /// <summary>
        /// Customers Phone No +254
        /// </summary>
        public string Phone { get; set; }

        public string Acc { get; set; }

        /// <summary>
        /// Customers Phone No +254
        /// </summary>
        public string CS_Number { get; set; }

        /// <summary>
        /// National Id NO
        /// </summary>
        public string Id_No { get; set; }

        public string text { get; set; }

        /// <summary>
        /// Agent Code
        /// </summary>
        public string Agent_Code { get; set; }

        /// <summary>
        /// Application NO
        /// </summary>
        public string Application_No { get; set; }

        /// <summary>
        /// Picture type
        /// </summary>

        public Picture_type Picturetype { get; set; }

        /// <summary>
        /// Image
        /// </summary>
        public string Loan_Type { get; set; }

        public string Image { get; set; }

        public string Loan_No { get; set; }
    }

    public enum Picture_type
    {
        Photo, Signature, Id_Front, Id_Back, Finderprint1, Fingerprint2, Finderprint3, Fingerprint4
    }

    namespace S_Mobile.Accounts_Service
    {
        public partial class Accounts
        {
        }
    }
}

namespace S_Mobile.Transactions
{
    public partial class Transactions
    {
        public Ministatement[] ministatement { get; set; }
        public Ministatement[] Loan_ministatement { get; set; }
    }

    public class Ministatement
    {
        public double amount { get; set; }
        public string desc { get; set; }
        public DateTime posting_Date { get; set; }
        public string dr_cr { get; set; }
        public string TransactionType { get; set; }
    }
}