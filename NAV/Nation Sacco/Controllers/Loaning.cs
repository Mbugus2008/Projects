using LoanProduct;
using MemberLoans;
using Nation_Sacco.Controllers.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.IO.MemoryMappedFiles;
using System.ServiceModel;
using Results = Nation_Sacco.Controllers.Models.Results;
using Sectors;
using SubSector_I;
using Microsoft.AspNetCore.Http.HttpResults;
using static System.Net.Mime.MediaTypeNames;
using static System.Runtime.InteropServices.JavaScript.JSType;
using Guarantors;
using System.Net;
using Microsoft.AspNetCore.Authorization;
using System.Text.Json;

namespace Nation_Sacco.Controllers
{

    [Authorize]
    public partial class NationSaccoController : ControllerBase
    {
        Guarantors.Loan_Guarators_PortClient guarantors ;
                
        [HttpPost("Guarantor_info")]
        public IActionResult Guarantor_info(request req)
        {
            List<guarantorDetails> guarantorDetails = new();
            GuarantorDetails guarantor = new GuarantorDetails();
            Results response = new Results();
            try
            {               

                var mm = members.ReadMultiple(new Member.Members_Filter[] { new  Member.Members_Filter { Criteria = req.member_number, Field = Member.Members_Fields.No } }, null, 
                    50).FirstOrDefault();

                if (mm == null) throw new Exception("Member not found");

                guarantor.RemainingGuarantorshipAbility = polaris.CheckGuarantor(mm.No);

                var mmm = guarantors.ReadMultiple(new Guarantors.Loan_Guarators_Filter[] { new Guarantors.Loan_Guarators_Filter { Criteria = mm.No, Field = Guarantors.Loan_Guarators_Fields.Security_No },new Guarantors.Loan_Guarators_Filter { Criteria = ">0", Field = Guarantors.Loan_Guarators_Fields.Loan_Balance } }, null, 50);
                if (mmm.Any())
                {
                    foreach (var g in mmm)
                    {
                        guarantorDetails.Add(new Controllers.Models.guarantorDetails
                        {
                            AmountGuaranteed = (double)g.Amount_Guaranteed,
                            AmountCommited = (double)g.Amount_Committed,
                            LoanNo = g.Loan_No,
                            LoanBalance = (double)g.Loan_Balance,
                            LoanProductCode = g.Loan_Type,
                            LoanProductName = g.Loan_Type,
                            MemberGuaranteed = g.Client_Name,
                            MemberNo = g.Security_Control_No

                        });
                    }
                    guarantor.Guaranteed = guarantorDetails;
                  
                }
            
                response.data = guarantor;

            }
            catch (Exception ex)
            {
                response.result_code = 400;
                response.result_message = ex.Message;
                response.data = new error { error_message = ex.Message };
            }


            return Ok(response);
        }
        [HttpPost("Member_Group")]
        public IActionResult Member_Group(request req)
        {
            groups memberData = new groups();

            Results response = new Results();
            try
            {
                var mmm = members.ReadMultiple(new Member.Members_Filter[] { new Member.Members_Filter { Criteria = req.member_number, Field = Member.Members_Fields.No } }, null, 0).FirstOrDefault();
                if (mmm == null) throw new Exception("Member not found");
                if ( string.IsNullOrEmpty(mmm.Group_Account_Number))
                    throw new Exception("Member is not part of any group");
                var mm = members.ReadMultiple(new Member.Members_Filter[] { new Member.Members_Filter { Criteria = mmm.Group_Account_Number, Field = Member.Members_Fields.No } }, null, 0).FirstOrDefault();

                if (mm != null)
                {
                    Group group = new Group { Code = mm.No, Name = mm.Name };

                    var gm = members.ReadMultiple(new Member.Members_Filter[] { new Member.Members_Filter { Criteria = mm.No, Field = Member.Members_Fields.Group_Account_Number } }, null, 0);
                    foreach (var item in gm)
                    {
                        group.Members.Add(new Group_Member()
                        {
                            Member_Full_Name = item.Name,
                            Member_Number = item.No,
                            Id_Number = item.ID_No,

                        });
                    }
                    memberData.Group = new List<Group> { group };

                    response.data = memberData;
                }
                else
                {
                    response.result_code = 400;
                    response.result_message = "Member with number {0}- NOT found!";
                    response.data = new error { error_message = string.Format("Member with number {0}- NOT found!", req.member_number) };
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);
                response.result_code = 400;
                response.result_message = ex.Message;
                response.data = new error { error_message = string.Format(ex.Message, req.member_number) };

            }
            return Ok(response);
        }
        [HttpPost("Group_Details")]
        public IActionResult Group_Details(request req)
        {
            groups memberData = new groups();

            Results response = new Results();

            var mm = members.ReadMultiple(new Member.Members_Filter[] { new Member.Members_Filter { Criteria = req.member_number, Field = Member.Members_Fields.No } }, null, 0).FirstOrDefault();

            if (mm != null)
            {
                Group group = new Group { Code = mm.No, Name = mm.Name };

                var gm = members.ReadMultiple(new Member.Members_Filter[] { new Member.Members_Filter { Criteria = mm.No, Field = Member.Members_Fields.Group_Account_Number } }, null, 0);
                foreach (var item in gm)
                {
                    group.Members.Add(new Group_Member()
                    {
                        Member_Full_Name = item.Name,
                        Member_Number = item.No,
                        Id_Number = item.ID_No,

                    });
                }
                memberData.Group = new List<Group> { group };

                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "Member with number {0}- NOT found!";
                response.data = new error { error_message = string.Format("Member with number {0}- NOT found!", req.member_number) };
            }
            return Ok(response);
        }
        [HttpPost("Customer_Collaterals")]
        public Results Customer_Collaterals(request req)
        {
           List< Colateral> memberData = new ();
            Results response = new Results();
            Collateral.Collaterals_PortClient collaterals = nm.InitializeClient<Collateral.Collaterals>();
            guarantors = nm.InitializeClient<Guarantors.Loan_Guarators>();

            var mmm = collaterals.ReadMultiple(new Collateral.Collaterals_Filter[] { new Collateral.Collaterals_Filter { Criteria = req.member_number, Field =  Collateral.Collaterals_Fields.Account_No } }, null, 0);
            if (mmm.Any())
            {
                foreach (var mm in mmm)
                {


                    var cl =  new Colateral
                    {
                        No = mm.No,
                        Nature = mm.Collateral_Type.ToString(),
                        Specific_Nature = mm.Collateral_Type.ToString(),
                        Value = mm.Collateral_Limit,

                    };
                    cl.Usage = new List<Usage>();
                    var gr = guarantors.ReadMultiple(new Guarantors.Loan_Guarators_Filter[] { 
                        new Guarantors.Loan_Guarators_Filter { Criteria = mm.Account_No, Field =  Guarantors.Loan_Guarators_Fields.Security_Control_No },
                        new Loan_Guarators_Filter{ Criteria = mm.No,Field = Loan_Guarators_Fields.Security_No },
                        

                        new Loan_Guarators_Filter{ Field = Loan_Guarators_Fields.Type , Criteria = Guarantors.Type.Collateral.ToString() }
                }, null, 0);                    foreach (var item in gr.Where(o => o.Loan_Balance > 0))
                    {
                        var l = loans.Read(item.Loan_No);
                     
                        cl.Usage.Add(new Usage() { Loan_Account_Number = item.Loan_No, Used_Value = (item.Amount_Guaranteed/l.Approved_Amount) * l.Outstanding_Balance});
                    }
                    cl.Used_Value= cl.Usage.Sum(x => x.Used_Value);
                    cl.Unused_Value = cl.Value - cl.Used_Value;
                    memberData.Add(cl);
                }
                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "No collatels found!";
                response.data = new error { error_message = string.Format("No collatels found!", req.member_number) };
            }
            return response;
        }
        [HttpPost("Loan_Schedule")]
        public IActionResult Loan_Schedule(request req)
        {
            List<LoanSchedule> memberData = new List<LoanSchedule>();
            Results response = new Results();
            Loanrepschedule.LoanSchedule_PortClient loanSchedule = nm.InitializeClient<Loanrepschedule.LoanSchedule>();

            var mm = loanSchedule.ReadMultiple(new Loanrepschedule.LoanSchedule_Filter[] { new  Loanrepschedule.LoanSchedule_Filter { Criteria = req.loan_number, Field =  Loanrepschedule.LoanSchedule_Fields.Loan_No } }, null, 0);
            if (mm != null)
            {
                foreach (var item in mm)
                {
                    memberData.Add(new LoanSchedule
                    {
                        Month = item.Expected_Date.ToString(),
                        Amount = item.Monthly_Repayment,
                        Principal = item.Principle_Repayment,
                        Interest = item.Interest_Repayment,
                    });
                }

                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "Member with number {0}- NOT found!";
                response.data = new error { error_message = string.Format("Member with number {0}- NOT found!", req.member_number) };
            }
            return Ok(response);
        }
        [HttpPost("Application_Status_callBack")]
        public Results Application_Status_callBack(request req)
        {
            Loan memberData = new Loan();
            Results response = new Results();
            var mm = loans.ReadMultiple(new Loans_Filter[] { new Loans_Filter { Criteria = req.loan_number, Field = Loans_Fields.Loan_No } }, null, 0).FirstOrDefault();
            if (mm != null)
            {
                memberData = new Loan
                {
                    account_number = mm.Loan_No,
                    product_code = mm.Loan_Product_Type,
                    unpaid_amount = mm.Outstanding_Balance + mm.Oustanding_Interest,
                    product_name = mm.Product_Description,
                    status = mm.Loan_Status.ToString(),
                    requested_amount = mm.Approved_Amount,
                    duration_in_months = mm.Installments,
                    installment_amount = mm.Loan_Repayment,
                    last_installment_paid_at = mm.Last_Pay_Date,
                    loan_performance = mm.Loans_Category_SASRA.ToString(),
                    disbursed_at = mm.Loan_Disbursement_Date,
                };

                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "Member with number {0}- NOT found!";
                response.data = new error { error_message = string.Format("Member with number {0}- NOT found!", req.member_number) };
            }
            return response;
        }

        [HttpPost("Loan_Purpose")]
        public Results<List<Models.Purposes>> Loan_Purpose()
        {
            List<Models.Purposes> memberData = new();
            Results<List<Models.Purposes>> response = new Results<List<Models.Purposes>>();
            
            try
            {
throw new Exception("No List found");
 var m = loanPurpose.ReadMultiple(new  LnPurpose.LoanPurpose_Filter[] { }, null, 0);
            if (m.Any())
            {
                foreach (var mm in m)
                {

                    memberData.Add(new Models.Purposes
                    {
                        code = mm.Code,
                        description = mm.Description,

                    });
                }


                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "Nothing found!";
                //response.data = new error { error_message = "No Products found" };
            }
            }
            catch (Exception ex)
            {
response.result_code = 400;
                response.result_message = "Nothing found!";
                
            }
           
            return response;
        }
        [HttpPost("Loan_data")]
        public IActionResult Loan_data(LoanApplication loan)
        {
            List<Models.Purposes> memberData = new();
   MemberLoans.Loans lns = new MemberLoans.Loans();
            Results<Application> response = new();
            try
            {
                Loans_PortClient loans = nm.InitializeClient<MemberLoans.Loans>();
                var ln = loans.ReadMultiple(new Loans_Filter[] {
            new Loans_Filter{ Criteria =  loan.MemberNumber, Field = Loans_Fields.Client_Code },
            new Loans_Filter{ Criteria = $"{MemberLoans.Loan_Status.Application.ToString()}|{MemberLoans.Loan_Status.Appraisal}|{MemberLoans.Loan_Status.Appraisal}", Field = Loans_Fields.Loan_Status },
            }, null, 0).FirstOrDefault();

                // if (ln != null) throw new Exception("Member has an Existing Application");
                //{"Source":0,"MemberNumber":"02490","Loan_Number":null,"LoanProductType":"MILIKI","LoanRequestedAmount":20000,"LoanDuration":6,"LoanPurpose":"","SasraMainSector":"","SasraSubSector1":"","SasraSubSector2":"","Guarantors":[{"member_number":"26738268","amount":5000},{"member_number":"35439734","amount":5000}],"Collaterals":[],"LoansToBeCleared":[],"StatusChangeCallbackUrl":"http://172.16.200.137:8080/api/credit/callback/"}

                _logger.LogInformation(JsonSerializer.Serialize(loan));


                lns.Source = (MemberLoans.Source)loan.Source;
                lns.SourceSpecified = true;

                lns.Client_Code = loan.MemberNumber;
                lns.Application_Date = DateTime.Now;
                lns.Application_DateSpecified = true;
                lns.Approved_Amount = (decimal)loan.LoanRequestedAmount;
                lns.Recommended_Amount = (decimal)loan.LoanRequestedAmount;
                lns.Requested_Amount = (decimal)loan.LoanRequestedAmount;
                lns.Requested_AmountSpecified = true;
                lns.Recommended_AmountSpecified = true;
                lns.Approved_AmountSpecified = true;
                lns.Loan_Product_Type = loan.LoanProductType;
                lns.Loan_Purpose = loan.LoanPurpose;
                lns.Installments = loan.LoanDuration;
                lns.InstallmentsSpecified = true;
                lns.Sasra_Main = loan.SasraMainSector;
                lns.Sasra_Sub_Sector_I = loan.SasraSubSector1;
                lns.Sasra_Sub_Sector_II = loan.SasraSubSector2;
                if (lns.Loan_Product_Type == "M-LOAN")
                {
                    lns.Loan_Status = MemberLoans.Loan_Status.Appraisal;
                    lns.Loan_StatusSpecified = true;
                    lns.Call_Back_updated = true;
                    lns.Call_Back_updatedSpecified = true;
                }
                loans.Create(ref lns);

                Callback.CallBackUrls cb = new Callback.CallBackUrls();
                cb.Code = lns.Loan_No;
                cb.Url = loan.StatusChangeCallbackUrl;
                cb.Source = Callback.Source.Loan;
                cb.SourceSpecified = true;
                CallBackUrls.Create(ref cb);

                foreach (var g in loan.Guarantors)
                {

                    Guarantors.Loan_Guarators lg = new Loan_Guarators()
                    {
                        Loan_No = lns.Loan_No,
                        Type = Guarantors.Type.Guarantor,
                        TypeSpecified = true,
                        Amount_Guaranteed = (decimal)g.amount,
                        Amount_GuaranteedSpecified = true,
                        Security_No = g.member_number

                    };
                    var gr = guarantors.ReadMultiple(new Loan_Guarators_Filter[] {
                        new Loan_Guarators_Filter {Criteria = g.member_number ,Field = Loan_Guarators_Fields.Security_No },
                        new Loan_Guarators_Filter{ Criteria =lns.Loan_No, Field = Loan_Guarators_Fields.Loan_No }
                    }, null, 0).FirstOrDefault();
                    if (gr == null)
                        guarantors.Create(ref lg);
                    else
                    {
                        lg.Key = gr.Key;
                        guarantors.Update(ref lg);
                    }
                }

                foreach (var item in loan.LoansToBeCleared)
                {
                    var ltp = Loans_Topup.Read(lns.Loan_No, lns.Client_Code, item);
                    if (ltp == null)
                    {
                        var lt = new LoanTopup.Loans_Topup();
                        lt.Loan_No = lns.Loan_No;
                        lt.Loan_Top_Up = item;
                        lt.Client_Code = lns.Client_Code;
                        Loans_Topup.Create(ref lt);
                    }
                }

                foreach (var item in loan.Collaterals)
                {
                    var coll = collaterals.Read(item);

                    if (coll == null) throw new Exception("Collatel Not found");
                    if (coll.Status != Collateral.Status.Approved) throw new Exception("Collatel is not approved for use");
                    if (coll.Discharged == true) throw new Exception("Collatel must not be discharged");
                    if (coll.Validated == false) throw new Exception("Collatel must be validated for use");
                    Guarantors.Loan_Guarators lg = new Loan_Guarators()
                    {
                        Loan_No = lns.Loan_No,
                        Type = Guarantors.Type.Collateral,
                        TypeSpecified = true,
                        Security_No = item,
                        Security_Type = (Guarantors.Security_Type)coll.Collateral_Type,
                        Security_TypeSpecified = true

                    };
                    var gr = guarantors.ReadMultiple(new Loan_Guarators_Filter[] {
                        new Loan_Guarators_Filter {Criteria = item ,Field = Loan_Guarators_Fields.Security_No },
                        new Loan_Guarators_Filter{ Criteria =lns.Loan_No, Field = Loan_Guarators_Fields.Loan_No }
                    }, null, 0).FirstOrDefault();
                    if (gr == null)
                        guarantors.Create(ref lg);
                    else
                    {
                        lg.Key = gr.Key;
                        guarantors.Update(ref lg);
                    }
                }


               

                response.data = new Application()
                {
                    ApplicationStatus = $"Loan application with application number {lns.Loan_No} has been created successfully.",
                    CrmNo = lns.Loan_No,
                };

            }

            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);
                lns.Loan_Status = Loan_Status.Rejected;
                lns.Loan_StatusSpecified = true;
                lns.Remarks = ex.Message;
                if (lns.Key != null)
                loans.Update(ref lns);
                return Ok(new Results<error> { result_code = 400, result_message = ex.Message, data = new error { error_message = ex.Message } });
            }
            return Ok(response);
        }
        [HttpPost("Loan_data_update")]
        public IActionResult Loan_data_Update(LoanApplication loan)
        {
            List<Models.Purposes> memberData = new();

            Results<Application> response = new();
            try
            {
                if (string.IsNullOrEmpty(loan.Loan_Number)) throw new Exception("Loan No is required");//Transaction type required
                Loans_PortClient loans = nm.InitializeClient<MemberLoans.Loans>();
                var ln = loans.ReadMultiple(new Loans_Filter[] {
            new Loans_Filter{ Criteria =  loan.Loan_Number, Field = Loans_Fields.Loan_No },
            new Loans_Filter{ Criteria = $"{MemberLoans.Loan_Status.Application.ToString()}", Field = Loans_Fields.Loan_Status },
            }, null, 0).FirstOrDefault();

                if (ln == null) throw new Exception("Loan application not found");
                ln.Requested_Amount = (decimal)loan.LoanRequestedAmount;
                ln.Requested_AmountSpecified = true;
                ln.Approved_Amount = (decimal)loan.LoanRequestedAmount;
                ln.Approved_AmountSpecified = true;
                ln.Installments = loan.LoanDuration;
                ln.Remarks = "";
                ln.Loan_Status = MemberLoans.Loan_Status.Application;
                ln.Loan_StatusSpecified = true;
                loans.Update(ref ln);
                foreach (var g in loan.Guarantors)
                {

                    Guarantors.Loan_Guarators lg = new Loan_Guarators()
                    {
                        Loan_No = ln.Loan_No,
                        Type = Guarantors.Type.Guarantor,
                        TypeSpecified = true,
                        Amount_Guaranteed = (decimal)g.amount,
                        Amount_GuaranteedSpecified = true,
                        Security_No = g.member_number

                    };
                    var gr = guarantors.ReadMultiple(new Loan_Guarators_Filter[] {
                        new Loan_Guarators_Filter {Criteria = g.member_number ,Field = Loan_Guarators_Fields.Security_No },
                        new Loan_Guarators_Filter{ Criteria =ln.Loan_No, Field = Loan_Guarators_Fields.Loan_No }
                    }, null, 0).FirstOrDefault();
                    if (gr == null)
                        guarantors.Create(ref lg);
                    else
                    {
                        lg.Key = gr.Key;
                        guarantors.Update(ref lg);
                    }
                }
                foreach (var item in loan.Collaterals)
                {

                  var coll =   collaterals.Read(item);

                    if (coll == null) throw new Exception("Collatel Not found");
                    if (coll.Status != Collateral.Status.Approved) throw new Exception("Collatel is not approved for use");
                    if (coll.Discharged == true) throw new Exception("Collatel must not be discharged");
                    if (coll.Validated == false) throw new Exception("Collatel must be validated for use");
                    Guarantors.Loan_Guarators lg = new Loan_Guarators()
                    {
                        Loan_No = ln.Loan_No,
                        Type = Guarantors.Type.Collateral,
                        TypeSpecified = true,
                        Security_Type =(Guarantors.Security_Type) coll.Collateral_Type,
                        Security_TypeSpecified = true,
                        Security_No = item

                    };
                    var gr = guarantors.ReadMultiple(new Loan_Guarators_Filter[] {
                        new Loan_Guarators_Filter {Criteria = item ,Field = Loan_Guarators_Fields.Security_No },
                        new Loan_Guarators_Filter{ Criteria =ln.Loan_No, Field = Loan_Guarators_Fields.Loan_No }
                    }, null, 0).FirstOrDefault();
                    if (gr == null)
                        guarantors.Create(ref lg);
                    else
                    {
                        lg.Key = gr.Key;
                        guarantors.Update(ref lg);
                    }
                }
                response.data = new Application()
                {
                    ApplicationStatus = $"Loan application with application number {ln.Loan_No} has been Updated.",
                    CrmNo = ln.Loan_No,
                };
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);

                return Ok(new Results<error> { result_code = 400, result_message = ex.Message, data = new error { error_message = ex.Message } });
            }
            return Ok(response);
        }
        [HttpPost("Loan_Sectors")]
        public Results<List<Models.Sector>> Loan_Sectors()
        {
            List<Models.Sector> memberData = new();
            Results<List<Models.Sector>> response = new Results<List<Models.Sector>>();
            Sectors.EconomicSectors_PortClient sc = nm.InitializeClient<Sectors.EconomicSectors>();
            SubSector_I.EconomicSubSectors_PortClient ss1 = nm.InitializeClient<SubSector_I.EconomicSubSectors>();
            SubSector_II.EconomicSpecificSectors_PortClient ss2 = nm.InitializeClient<SubSector_II.EconomicSpecificSectors>();
            

            var s = sc.ReadMultiple(new EconomicSectors_Filter [] { }, null, 0);
            var s1 = ss1.ReadMultiple(new  EconomicSubSectors_Filter [] { }, null, 0);
            var s2 = ss2.ReadMultiple(new  SubSector_II.EconomicSpecificSectors_Filter [] { }, null, 0);

            foreach (var item in s)
            {
                List<Models.Sector> sector2 = new();
                var sector1 = s1.Where(o => o.Sector_Code == item.Sector_Code).ToList();

                foreach (var item2 in sector1)
                {
                    Models.Sector sec2 = new Models.Sector()
                    {
                        sector_code = item2.Sub_Sector_Code,
                        parent_sector = item.Sector_Code,
                        sector_description = item2.Sub_Sector_Name,
                        sector_level = 1
                    };
                    sec2.sub_sectors = new();
                    var sector3 = s2.Where(o => o.Sub_Sector_Code == item2.Sub_Sector_Code).ToList();

                    foreach (var item3 in sector3)
                    {
                        Models.Sector sec3 = new Models.Sector()
                        {
                            sector_code = item3.Sub_Subsector_Code,
                            parent_sector = item3.Sub_Sector_Code,
                            sector_description = item3.Sub_Subsector_Description,
                            sector_level = 2
                        };
                        sec2.sub_sectors.Add(sec3);
                    }


                    sector2.Add(sec2);

                }
                ;

                memberData.Add(new Models.Sector
                {
                    sector_code = item.Sector_Code,
                    sector_description = item.Sector_Name,
                    sub_sectors = sector2


                });
            }
            response.data = memberData;
            return response;
        }
        [Authorize]
        [HttpPost("Loan_Products")]
        public Results<List<Models.LoanProduct>> Loan_Products()
        {
            List<Models.LoanProduct> memberData = new();
            Results<List<Models.LoanProduct>> response = new Results<List<Models.LoanProduct>>();
            try
            {

          
            var m = products.ReadMultiple(new LoanProducts_Filter[] { }, null, 0);
            if (m.Any())
            {
                foreach (var mm in m)
                {

                    memberData.Add(new Models.LoanProduct
                    {
                        Product_Id = mm.Code,
                        Source = "",// mm.Source.ToString(),
                        Loan_Name = mm.Product_Description,
                        Min_Guarantors = 0,//mm.,
                        Max_Guarantors = 0,//mm.Max_No_Of_Guarantors,
                        Min_Loan_Amount = mm.Min_Loan_Amount,
                        Max_Loan_Amount = mm.Max_Loan_Amount,
                        Interest_rate = mm.Interest_rate,
                        Status = mm.Blocked == true ? "InActive" : "Active",
                        Interest_Calculation_Method = mm.Repayment_Method.ToString(),
                        Min_Duration = 0,
                        Max_Duration = mm.No_of_Installment,

                        Deposit_Multiplier = (int)mm.Shares_Multiplier,


                    });
                }


                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "No Products found!";
                    //response.data = new error { error_message = "No Products found" };
                }
            }
            catch (Exception ex)
            {

                response.result_code = 400;
                response.result_message = ex.Message;
            }
            return response;
        } 
        [Authorize]
        [HttpPost("Mobile_Limit")]
        public IActionResult EloanLimit(request req)
        {
            Results<Mobileloanlimits.MobileLimits> response = new ();
            try
            {
                if (req.installments == null || req.installments < 1) throw new Exception("Installments should have a value greater than 0");
                if (string.IsNullOrEmpty(req.account_number)) throw new Exception("Account Number should have a value");
               // if (string.IsNullOrEmpty(req.Loan_type)) throw new Exception("Loan_Type should have a value");

                Mobileloanlimits.MobileLimits ml = new Mobileloanlimits.MobileLimits();
                ml.Account_No = req.account_number;
                ml.Installments = req.installments.Value;
                ml.InstallmentsSpecified    = true;
                ml.Loan_Type = req.Loan_type;
                MobileLimits.Create(ref ml);
                response.data = ml;
                if (!string.IsNullOrEmpty( ml.Error))
                {
                    response.result_code = 400;
                    response.result_message = ml.Error;
                }
         
                return Ok(response);
            }
            catch (Exception e)
            {
                response.result_code = 400;
                response.result_message = e.Message;
            }
            return Ok(response);
        }
    }
    public class Usage
    {
        public string Loan_Account_Number { get; set; }
        public decimal Used_Value { get; set; }
    }

    public class Colateral
    {
        public string No { get; set; }
        public string Nature { get; set; }
        public string Specific_Nature { get; set; }
        public decimal Value { get; set; }
        public decimal Used_Value { get; set; }
        public decimal Unused_Value { get; set; }
        public List<Usage> Usage { get; set; }
    }
    public class Group_Member
    {
        public string Member_Number { get; set; }
        public string Id_Number { get; set; }
        public string Member_Full_Name { get; set; }
        public string Position { get; set; }
    }
    public class Group
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public List<Group_Member> Members { get; set; }
    }
    public class groups
    {
        public List<Group> Group { get; set; }
    }
}

namespace Mobileloanlimits {
    partial class MobileLimits
    {
      
    }

}



