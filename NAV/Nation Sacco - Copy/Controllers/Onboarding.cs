using Ledgers;
using LnPurpose;
using LoanProduct;
using Member;
using MemberLoans;
using MemberTrans;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Nation_Sacco.Controllers.Models;
using NextofKin;
using Nkinapp;
using StandingOrders;
using System.ServiceModel;
using Results = Nation_Sacco.Controllers.Models.Results;

namespace Nation_Sacco.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public partial class NationSaccoController : ControllerBase
    {
        private Get_Namespace nm;
        private IConfiguration _configuration;
        Branch.Branches_PortClient branches;
        Member.Members_PortClient members;
        NextofKin.NofKin_PortClient nextofKin;
        MemberAccounts.Accounts_PortClient memberAccounts;
        MemberLoans.Loans_PortClient loans;
        AccountTransactions_PortClient AccountTrans;
        Polaris.PolarisIntegration_PortClient polaris;
        LoanProducts_PortClient products;
        LnPurpose.LoanPurpose_PortClient loanPurpose;
        MemberApplication.Member_Application_PortClient memberApplication;
        Nkinapp.NofKinApp_PortClient NofKinApp;
        Employers.CustomerList_PortClient employers;
        Countries.Country_PortClient countries;
        Relationships.RelationTypes_PortClient relationships;
        PostalCodes.PostCodes_PortClient postalCodes; 
        Callback.CallBackUrls_PortClient CallBackUrls;
        MemberTrans.MemberTransactions_PortClient memberTrans;
        Mobileloanlimits.MobileLimits_PortClient MobileLimits;
        StandingOrders.Standing_Orders_PortClient  standingOrders;
        LoanTopup.Loans_Topup_PortClient Loans_Topup;
        MemberGoals.Goals_PortClient MGoals;
        Beno.Benovolent_PortClient benovolent;
        Collateral.Collaterals_PortClient collaterals;
        Mobilecharge.MobileCharges_PortClient MobileCharges;

        private readonly ILogger<NationSaccoController>? _logger;
        public NationSaccoController(ILogger<NationSaccoController>? logger)
        {
            _logger = logger;

            _configuration = new ConfigurationBuilder()
          .SetBasePath(Directory.GetCurrentDirectory())
          .AddJsonFile("appsettings.json")
          .Build();
           nm  = new Get_Namespace(_configuration);
           branches = nm.InitializeClient<Branch.Branches>();
            guarantors = nm.InitializeClient<Guarantors.Loan_Guarators>();
            members = nm.InitializeClient < Member.Members>();
            nextofKin = nm.InitializeClient<NextofKin.NofKin>();
            memberAccounts = nm.InitializeClient<MemberAccounts.Accounts>();
            loanPurpose = nm.InitializeClient<LnPurpose.LoanPurpose>();
            loans = nm.InitializeClient<MemberLoans.Loans>();
            AccountTrans = nm.InitializeClient<Ledgers.AccountTransactions>();
            loanPurpose = nm.InitializeClient<LnPurpose.LoanPurpose>();
            products = nm.InitializeClient<LoanProduct.LoanProducts>();
            mobileTransaction = nm.InitializeClient<MobileTransaction.Transactions>();
            memberApplication = nm.InitializeClient<MemberApplication.Member_Application>();
            NofKinApp = nm.InitializeClient<Nkinapp.NofKinApp>();
            employers = nm.InitializeClient<Employers.CustomerList>();
            countries = nm.InitializeClient<Countries.Country>();
            relationships = nm.InitializeClient<Relationships.RelationTypes>();
            postalCodes = nm.InitializeClient<PostalCodes.PostCodes>();
            CallBackUrls = nm.InitializeClient<Callback.CallBackUrls>();
            memberTrans = nm.InitializeClient<MemberTrans.MemberTransactions>();
            MobileLimits = nm.InitializeClient<Mobileloanlimits.MobileLimits>();
            standingOrders = nm.InitializeClient<StandingOrders.Standing_Orders>();
            Loans_Topup = nm.InitializeClient<LoanTopup.Loans_Topup>();
            benovolent = nm.InitializeClient<Beno.Benovolent>();
            MGoals = nm.InitializeClient<MemberGoals.Goals>();
            collaterals = nm.InitializeClient<Collateral.Collaterals > ();
            MobileCharges= nm.InitializeClient<Mobilecharge.MobileCharges>();
            polaris = new Polaris.PolarisIntegration_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl_codeunit(_configuration) + "PolarisIntegration"));
            polaris.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            polaris.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(_configuration).navsettings.Username;
            polaris.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(_configuration).navsettings.pass;

        
        }

        [HttpPost("search")]
        public Results<MembersData> SearchMember(IdentifierRequest request)
        {
            MembersData memberData = new MembersData();
            Results<MembersData> response = new Results<MembersData>();

            if (request == null || string.IsNullOrEmpty(request.Identifier))
            {
                memberData.error_message = "Invalid request data.";
                response.data = memberData;
                return response;
            }

            // Sample response to return
            var mfilter = new Member.Members_Filter[] { };
            switch (request.Identifier_Type)
            {
                case "member_number":
                    mfilter = new Member.Members_Filter[] {
                new Member.Members_Filter
                {
                    Criteria = request.Identifier,
                    Field = Member.Members_Fields.No
                }
            };
                    break;
                case "id_number":
                case "passport_number":
                    mfilter = new Member.Members_Filter[] {
                new Member.Members_Filter
                {
                    Criteria = request.Identifier,
                    Field = Member.Members_Fields.ID_No
                }
            };
                    break;

                case "phone_number":
                    mfilter = new Member.Members_Filter[] {
                new Member.Members_Filter
                {
                    Criteria =$"*{request.Identifier.Substring(request.Identifier.Length-9)}*",
                    Field = Member.Members_Fields.Mobile_Phone_No
                }
            };
                    break;
                case "Kra_pin":
                    mfilter = new Member.Members_Filter[] {
                new Member.Members_Filter
                {
                    Criteria =request.Identifier,
                    Field = Member.Members_Fields.Pin
                }
            };
                    break;
                default:

                    break;
            }


            Member.Members? member = null;
            if (mfilter.Any())
            {
                member = members.ReadMultiple(mfilter, null, 0).FirstOrDefault();
                if (member != null)
                {

                    var nok = nextofKin.ReadMultiple(new NextofKin.NofKin_Filter[] { new NextofKin.NofKin_Filter { Criteria = member.No, Field = NextofKin.NofKin_Fields.Account_No } }, null, 0);
                    List<NokBeneficiaryNomineeInfo> nokInfoList = nok.Select(kin => new NokBeneficiaryNomineeInfo
                    {
                        //identification_type = "id_number", // Set according to your business logic
                        //identification_value = kin.Id_Value, // Map appropriately from `kin`
                        full_names = kin.Name, // Example, use correct property from `kin`
                        relationship = kin.Relationship,
                        date_of_birth = kin.Date_of_Birth,
                        address = kin.Address,
                        mobile_no = kin.Telephone,
                        email_address = kin.Email,
                        is_next_of_kin = kin.Type == NextofKin.Type.Next_of_Kin,
                        is_beneficiary = kin.Beneficiary,
                        //is_contact_person = kin.IsContactPerson.ToString().ToLower(),
                        //is_nominee = kin.IsNominee.ToString().ToLower(),
                        allocation = (int)kin.PercentAllocation  // Assuming Allocation is nullable
                    }).ToList();
                    memberData = new MembersData
                    {
                        MloanStatus = member.M_Loans_Status,
                        selfguaranteed = member.Self_Gauanteed,
                        selfguaranteedAmount = (double)member.Self_Guarantee_Amount,
                        member_number = member.No,
                        email = member.E_Mail,
                        full_name = member.Name,
                        id_number = member.ID_No,
                        phone = member.Phone_No,
                        status = member.Status.ToString(),
                        kra_pin = member.Pin,
                        onboarded_at = member.Registration_Date,
                        date_of_birth = member.Birth_Date,
                        staff_number = member.Payroll_Staff_No,
                        nok_beneficiary_nominee_info = nokInfoList,
                        member_type = member.Member_Type.ToString(),

                    };
                }
            }
            else
            {
                response.result_code = 400;
                response.result_message = "Member with number {0}- NOT found!";
                memberData.error_message = "Member not found.";
            }
            response.data = memberData;
            return response;
        }
        [HttpPost("institutions")]
        public Results<List<EmployerInstitution>> GetEmployerInstitutions()
        {
            Results<List<EmployerInstitution>> response = new Results<List<EmployerInstitution>>();
            var data = new List<EmployerInstitution>
                        (

                        );
            var emp = employers.ReadMultiple(new Employers.CustomerList_Filter[] { }, null, 0).ToList();
            foreach (Employers.CustomerList e in emp)
            {
                data.Add(new EmployerInstitution { Code = e.No, Name = e.Name });
            }
            response.data = data; 
            return response;
        }
        [HttpPost("delegate")]
        public Results<List<DelegateBranch>> GetDelegateBranches()
        {
            var branches = new List<DelegateBranch>
            {
                new DelegateBranch { Code = "01", Name = "BARINGO/KOIBATEK/MARAKWET BRANCH" },
                new DelegateBranch { Code = "02", Name = "BUNGOMA/MT.ELGON" },
                new DelegateBranch { Code = "03", Name = "BUSIA/TESO BRANCH" },
                // Add more branches as needed...
            };

            var response = new Results<List<DelegateBranch>>
            {
                data = branches
            };

            return response;
        }
        [HttpPost("fosa")] // Endpoint: POST /api/nationsacco/fosa
        public Results<List<FosaBranch>> GetFosaBranches()
        {
            var branches = new List<FosaBranch>
            {
                new FosaBranch { Code = "143", Name = "BOSA HQ" },
                new FosaBranch { Code = "300", Name = "FOSA HQ" },
                new FosaBranch { Code = "301", Name = "NAIROBI" },
                new FosaBranch { Code = "302", Name = "KISUMU" },
                new FosaBranch { Code = "303", Name = "NYERI" },
                new FosaBranch { Code = "304", Name = "WEBUYE" },
                new FosaBranch { Code = "305", Name = "MOMBASA" },
                new FosaBranch { Code = "306", Name = "KISII" },
                new FosaBranch { Code = "307", Name = "TSC" },
                new FosaBranch { Code = "308", Name = "MERU" },
                new FosaBranch { Code = "309", Name = "KITUI" },
                new FosaBranch { Code = "310", Name = "NAKURU" },
                new FosaBranch { Code = "311", Name = "ELDORET" },
                new FosaBranch { Code = "312", Name = "MACHAKOS" },
                new FosaBranch { Code = "313", Name = "KAKAMEGA" },
                new FosaBranch { Code = "314", Name = "EMBU" },
                new FosaBranch { Code = "315", Name = "UPPERHILL" },
                new FosaBranch { Code = "316", Name = "HOMABAY" },
                new FosaBranch { Code = "317", Name = "THIKA" },
                new FosaBranch { Code = "318", Name = "KAPENGURIA" },
                new FosaBranch { Code = "319", Name = "NAROK SATELLITE" },
                new FosaBranch { Code = "320", Name = "SIAYA SATELLITE" },
                new FosaBranch { Code = "321", Name = "VOI SATELLITE" },
                new FosaBranch { Code = "322", Name = "NYAHURURU SATELLITE" },
                new FosaBranch { Code = "323", Name = "LODWAR SATELLITE" },
                new FosaBranch { Code = "340", Name = "Mwingi" },
                new FosaBranch { Code = "600", Name = "New Test" }
            };

            var response = new Results<List<FosaBranch>>
            {
                data = branches
            };

            return response;
        }
        [HttpPost("countries")] // Endpoint: POST /api/nationsacco/countries
        public Results<List<Country>> GetCountries()
        {
            var response = new Results<List<Country>>
            (
                
            );
            var co = countries.ReadMultiple(new Countries.Country_Filter[] { }, null, 0);
            var data = new List<Country>();
            foreach (var country in co)
             { data.Add(new Country { Code = country.Code, Name = country.Name }); }
           response.data = data;

            return response;
        }
        [HttpPost("postcodes")] // Endpoint: POST /api/nationsacco/postcodes
        public Results<List<PostCode>> GetPostCodes()
        {
            var pc = postalCodes.ReadMultiple(new PostalCodes.PostCodes_Filter[] { },null,0).ToList();
            
            var data = new List<PostCode>();
            foreach (var code in pc)
            {
                data.Add(new PostCode { Code = code.Code, City = code.City, Country_Region_Code = code.Country_Region_Code, County = code.County });
            }
            var response = new Results<List<PostCode>>
            {
                data = data
            };

            return response;
        }
        [HttpPost("relationships")] // Endpoint: POST /api/nationsacco/relationships
        public Results<List<Relationship>> GetNokBenNomRelationships()
        {

            var rl = relationships.ReadMultiple(new Relationships.RelationTypes_Filter[] { }, null, 0).ToList();
            var response = new Results<List<Relationship>>
           ();
            List<Relationship> rls = new List<Relationship>();
            foreach (var r in rl)

            {
               rls.Add(new Relationship { Code = r.Description,Relation = r.Description });

            }
            response.data = rls;
            return response;
        }
        [HttpPost("nationalities")] // Endpoint: POST /api/nationsacco/nationalities
        public Results<List<Nationality>> GetMemberNationalities()
        {
            var nationalities = new List<Nationality>
            {
                new Nationality { Code = "AUSTRALIA", Name = "" },
                new Nationality { Code = "CAN", Name = "CANADA" },
                new Nationality { Code = "FR", Name = "FRANCE" },
                new Nationality { Code = "GER", Name = "GERMANY" },
                new Nationality { Code = "IT", Name = "" },
                new Nationality { Code = "KE", Name = "Kenya" },
                new Nationality { Code = "SA", Name = "SOUTH AFRICA" },
                new Nationality { Code = "TZ", Name = "TANZANIA" },
                new Nationality { Code = "UG", Name = "UGANDA" },
                new Nationality { Code = "UK", Name = "united kingdom" },
                new Nationality { Code = "UKRAINE", Name = "" },
                new Nationality { Code = "USA", Name = "USA" }
            };

            var response = new Results<List<Nationality>>
            {
                data = nationalities
            };

            return response;
        }
        [HttpPost("religions")] // Endpoint: POST /api/nationsacco/religions
        public Results<List<Religion>> GetMemberReligions()
        {
            var religions = new List<Religion>
            {
                new Religion { Code = "ATHEIST", Name = "Atheist" },
                new Religion { Code = "BUDDHISM", Name = "Buddhism" },
                new Religion { Code = "CHRISTIAN", Name = "christian" },
                new Religion { Code = "HINDUISM", Name = "Hinduism" },
                new Religion { Code = "MUSLIM", Name = "MUSLIM" }
            };

            var response = new Results<List<Religion>>
            {
                data = religions
            };

            return response;
        }
        [HttpPost("send_member_data")] // Endpoint: POST /api/nationsacco/send_member_data
        public IActionResult? SendMemberData(MemberData memberData)
        {
            Results<Application>? response = new Results<Application>();
            try
            {
                var ma = memberApplication.ReadMultiple(new MemberApplication.Member_Application_Filter[] { new MemberApplication.Member_Application_Filter { Criteria = memberData.primary_identification, Field = MemberApplication.Member_Application_Fields.ID_No_Group_Registration_No } }, null, 1).FirstOrDefault();

                if (ma != null)  throw new Exception($"Application Duplicate Id No: {memberData.primary_identification} "); 
               
                         ma = memberApplication.ReadMultiple(new MemberApplication.Member_Application_Filter[] { new MemberApplication.Member_Application_Filter { Criteria = memberData.kra_pin, Field = MemberApplication.Member_Application_Fields.Pin } }, null, 1).FirstOrDefault();

                if (ma != null)  throw new Exception($"Application Duplicate pin: {memberData.kra_pin} "); 

                    

               

                    var data = new MemberApplication.Member_Application
                    {
                        Mobile_Phone_No = memberData.transactional_mobile_no,
                        Name = $"{memberData.first_name} {memberData.middle_name} {memberData.other_names}",
                        Address = memberData.current_address,
                        Gender = new MemberApplication.Member_Application().getgender(memberData.gender),
                        GenderSpecified = true,
                        Marital_Status = new MemberApplication.Member_Application().getmarital(memberData.marital_status),
                        Employer_Code = memberData.employer_code,
                        Marital_StatusSpecified = true,
                 
                        Permanent_Address = memberData.permanent_address,
                        Phone_No = memberData.transactional_mobile_no,
                        Date_of_Birth = (DateTime)memberData.date_of_birth,
                        Date_of_BirthSpecified = true,
                        E_Mail_Personal = memberData.email,
                        Account_Category = MemberApplication.Account_Category.Single,
                        Account_CategorySpecified = true,

                        Payroll_Staff_No = memberData.payroll_staff_no,
                        ID_No_Group_Registration_No = memberData.primary_identification,
                        Pin = memberData.kra_pin,
                        //Special_Employment=  memberData.special_employment,
                        //Special_EmploymentSpecified = true,
                        
                        Special_Employment_Details = memberData.special_employment_details,
                        Country_Region_Code = memberData.county,
                        Terms_of_Employment = new MemberApplication.Member_Application().getemploymenttype(memberData.terms_of_employment),
                        Post_Code = memberData.post_code,
                        Bank_Code = memberData.bank_code,
                        Bank_Account_No = memberData.bank_account_no,
                        MPESA_Mobile_No = memberData.transactional_mobile_no,
                        Current_Address = memberData.loyalty_measure_recruited_by,
                        Address_2 = memberData.loyalty_measure_id_number,
                        Road_Street_No = memberData.loyalty_measure_relationship,
                        
                        Source = MemberApplication.Source.Mobile,
                        SourceSpecified = true,
                        Monthly_Contribution = (decimal)memberData.contribution_amount,
                        Monthly_ContributionSpecified = true,

                    };
              
                  
                    memberApplication.Create(ref data);
                    Callback.CallBackUrls cb = new Callback.CallBackUrls();
                    cb.Code = data.No;
                    cb.Url  = memberData.status_change_callback_url;
                    cb.Source = Callback.Source.Application;
                    cb.SourceSpecified = true;
                    CallBackUrls.Create(ref cb);

                    if (memberData.goals != null)
                        foreach (var g in memberData.goals)
                    {
                            if (!string.IsNullOrEmpty(g.customer_goal))
                            {
                                var mg = MGoals.ReadMultiple(new MemberGoals.Goals_Filter[] { new MemberGoals.Goals_Filter { Criteria = data.No, Field = MemberGoals.Goals_Fields.Member_No } }, null, 0).FirstOrDefault();
                                if (mg == null)
                                {
                                    var gl = new MemberGoals.Goals() { Member_No = data.No, Customer_Goals = g.customer_goal };
                                    MGoals.Create(ref gl);
                                }
                                else {
                                    mg.Customer_Goals = g.customer_goal;
                                    MGoals.Update(ref mg);
                                }
                            
                            }
                        
                    }
                    if (memberData.benovolents !=null)
                    foreach (var g in memberData.benovolents)
                    {
                        var bn = new Beno.Benovolent()
                        {
                            
                            Account_No = data.No,
                            Address = g.address,
                            PercentAllocation =(decimal)  g.percentallocation,
                            PercentAllocationSpecified = true,
                            Date_of_Birth   =(DateTime)   g.date_of_birth,
                            Date_of_BirthSpecified = true,
                            ID_No = data.ID_No_Group_Registration_No,
                            Category =(Beno.Category) g.category,
                            Source = (Beno.Source)g.source,
                            SourceSpecified = true,
                            Staff_No = g.staff_no,
                            //Status =(Beno.Status) g.status,
                            //StatusSpecified = true,
                            CategorySpecified = true,
                            //PaidSpecified = true, Paid =(bool) g.paid,
                            Email = g.email,    
                            Fax = g.fax,
                            Full_Name = g.full_name,
                            Residence = g.residence,
                            Telephone = g.telephone,
                            Member_No = g.member_no,
                           
                            
                            
                           
                        };
                        benovolent.Create(ref bn);


                    }
                    List<NofKinApp> nofKins = new List<NofKinApp>();
                    foreach (var nok in memberData.nok_beneficiary_nominee_info)
                    {
                        var nk = new NofKinApp()
                        {
                            Account_No = data.No,
                            ID_No = data.ID_No_Group_Registration_No,
                            Date_of_Birth = nok.date_of_birth,
                            Date_of_BirthSpecified = true,
                            PercentAllocation = nok.allocation,
                            PercentAllocationSpecified = true,
                            Name = nok.full_names,
                            Address = nok.address,
                            Beneficiary = nok.is_beneficiary,
                            BeneficiarySpecified = true,
                            Relationship = nok.relationship,
                            Residence = nok.residence,
                            Email = nok.email_address,
                            Telephone = nok.mobile_no,
                            Type = (Nkinapp.Type)nok.identification_type,
                           
                        };
                        nofKins.Add(nk);
                        NofKinApp.Create(ref nk);
                    }
                    if (!String.IsNullOrEmpty( memberData.picture))
                    polaris.SetImage(data.No, memberData.picture,0);
                    if (!String.IsNullOrEmpty(memberData.signature))
                        polaris.SetImage(data.No, memberData.signature,1);
                    response = new Results<Application>
                    {
                        data = new Application() { ApplicationStatus = "Open", CrmNo = data.No },
                        result_message = $"Membership application with application number {data.No} has been created successfully."
                    };
                
                              
                }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex );

                return Ok(new Results<error>() { result_code = 400,result_message =ex.Message,data = new error() { error_message =ex.Message } });
            }
            return Ok(response);
        }
        [HttpPost("RetrieveMemberAccounts")]
        public Results RetrieveMemberAccounts(request? req)
        {
            List<MemberAccount> memberData = new List<MemberAccount>();
            Results response = new Results();
            try
            {
                var mmm = memberAccounts.ReadMultiple(new MemberAccounts.Accounts_Filter[] { new MemberAccounts.Accounts_Filter { Criteria = req.member_number, Field = MemberAccounts.Accounts_Fields.BOSA_Account_No } }, null, 0);
                if (mmm.Any())
                {
                    foreach (MemberAccounts.Accounts mm in mmm)
                    {
                        //double netsal =(double) polaris.GetNeSalary(mm.No);
                        memberData.Add(new MemberAccount
                        {
                            account_number = mm.No,
                            product_name = mm.Account_Type,
                            status = mm.Status.ToString(),
                            branch = mm.Global_Dimension_2_Code,
                            balance = (double)polaris.GetAccountBal(mm.No),
                            opened_at = mm.Registration_Date,
                            has_sacco_link = String.IsNullOrEmpty(mm.ATM_No) ? false : true,
                            Net_Salary = (double)mm.GetNetSalary,//netsal,
                            atm_Enabled = !mm.Disable_ATM_Card,
                            Net_Salaryx4ave = (double) mm.GetNetSalary

                        });
                    }
                    var member = members.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = req.member_number, Field = Members_Fields.No } }, null, 0).FirstOrDefault();
                    if (member != null)
                    {
                        memberData.Add(new MemberAccount
                        {
                            account_number = "Shares",
                            product_name = "Current Shares",
                            status = "Active",
                            balance = (double)member.Current_Shares,
                            opened_at = member.Registration_Date


                        });
                        memberData.Add(new MemberAccount
                        {
                            account_number = "Shares_Capital",
                            product_name = "Share Capital",
                            status = "Active",
                            balance = (double)member.Shares_Retained,
                            opened_at = member.Registration_Date


                        });
                        memberData.Add(new MemberAccount
                        {
                            account_number = "Benevolent_Fund",
                            product_name = "Benevolent Fund",
                            status = "Active",
                            balance = (double)member.Benevolent_Fund,
                            opened_at = member.Registration_Date


                        });
                        memberData.Add(new MemberAccount
                        {
                            account_number = "School_Fees",
                            product_name = "School Fees",
                            status = "Active",
                            balance = (double)member.School_Fees_Contributions,
                            opened_at = member.Registration_Date


                        });
                    }
                    response.data = memberData;
                }
                else
                {
                    response.result_code = 400;
                    response.result_message = $"Member with number {req.account_number}- NOT found!";
                    response.data = new error { error_message = string.Format("Member with number {0}- NOT found!", req.member_number) };
                }
            }
            catch (Exception ex) {
                _logger.LogError(ex.Message);

            
            }
            return response;
        }
        [HttpPost("MemberLoans")]
        public Results MembersLoans(request req)
        {
            List<Loan> memberData = new List<Loan>();
            Results response = new Results();
            var mmm = loans.ReadMultiple(new Loans_Filter[] { new Loans_Filter { Criteria = req.member_number, Field = Loans_Fields.Client_Code } }, null, 30);

            if (mmm.Any())
            {
                foreach (MemberLoans.Loans mm in mmm)
                {
                    memberData.Add(new Loan
                    {
                        account_number = mm.Loan_No,
                        product_code = mm.Loan_Product_Type,
                        product_name = mm.Product_Description,
                        status = mm.Loan_Status.ToString(),
                        requested_amount = mm.Requested_Amount,
                        unpaid_amount = mm.Outstanding_Balance + mm.Oustanding_Interest,
                        duration_in_months = mm.Installments,
                        loan_performance = mm.Loans_Category_SASRA.ToString(),
                        disbursed_at = mm.Issued_Date,
                        Remarks = mm.Remarks,
                        repayment = mm.Repayment,
                        Recovery_Mode =  mm.Recovery_Mode.ToString(),
                    });
                }
                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "No Transactions found!";
                response.data = new error { error_message = string.Format("No Transactions found!", req.member_number) };
            }
            return response;
        }
        [HttpPost("Standingorders")]
        public IActionResult MembersStandingorders(request req)
        {
            List<StandingOrders.Standing_Orders> memberData = new List<StandingOrders.Standing_Orders>();
            List<STO> sto = new List<STO>();
            Results<List<STO>> response = new Results<List<STO>>();
            var mmm = standingOrders.ReadMultiple(new StandingOrders.Standing_Orders_Filter[] { new StandingOrders.Standing_Orders_Filter { Criteria = req.account_number, Field = StandingOrders.Standing_Orders_Fields.Source_Account_No }, new StandingOrders.Standing_Orders_Filter { Criteria = "Yes", Field = StandingOrders.Standing_Orders_Fields.Effected }, new StandingOrders.Standing_Orders_Filter { Criteria = StandingOrders.Status.Approved.ToString(), Field = StandingOrders.Standing_Orders_Fields.Status } }, null, 0);

            if (mmm.Any())
            {
                foreach (var item in mmm)
                {
                    sto.Add(new STO()
                    {
                        Destination_Account_Name = item.Destination_Account_Name,
                        Source_Account_No = item.Source_Account_No,
                        Destination_Account_No = item.Destination_Account_No,
                        Amount = item.Amount,
                        Destination_Account_Type = item.Destination_Account_Type,
                        Effective_Start_Date = item.Effective_Start_Date,
                        Effected = item.Effected,
                        Status = item.Status,
                        Account_Name = item.Account_Name,
                        STO_Type = item.STO_Type,
                    });
                }
                response.data = sto.ToList();
            }
            else
            {

                response.result_code = 400;
                response.result_message = "No Transactions found!";

            }
            return Ok(response);
        }
        [HttpPost("Accounttrans")]
        public Results Accounttrans(request req)
        { Results response = new Results();
            try {
            List<ledgerentries> memberData = new List<ledgerentries>();
           
            var date = string.Format("{0}..{1}",((DateTime) req.from).ToString("MM/dd/yyyy"), ((DateTime)req.to).ToString("MM/dd/yyyy"));
            var mmm = AccountTrans.ReadMultiple(new AccountTransactions_Filter[] { new AccountTransactions_Filter { Criteria = req.account_number, Field = AccountTransactions_Fields.Vendor_No }, new AccountTransactions_Filter { Criteria = date, Field = AccountTransactions_Fields.Posting_Date } }, null, 0);

            if (mmm.Any())

            {
                foreach (AccountTransactions mm in mmm)
                {
                    memberData.Add(new ledgerentries
                    {
                        TransactionCode = mm.Document_No,
                        Operation = mm.Credit_Amount != 0 ? "Credit" : "Debit",
                        Amount =  mm.Amount,
                        Description = mm.Description,
                        RunningBalance = 0,
                        Timestamp = mm.Posting_Date,
                    });

                }
                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "No Transactions found!";
                response.data = new error { error_message = string.Format("No Transactions found!", req.member_number) };
            } 
            } catch (Exception ex) { _logger.LogError(ex.Message);

                response.result_code = 400;
                response.result_message = ex.Message;
                response.data = new error { error_message = string.Format(ex.Message, req.member_number) };
            }
            return response;
        }

        [HttpPost("Bosatrans")]
        public Results Bosaaccounttrans(request req)
        {
            Results response = new Results();
            try
            {
                List<ledgerentries> memberData = new List<ledgerentries>();
                                var date = string.Format("{0}..{1}", ((DateTime)req.from).ToString("MM/dd/yyyy"), ((DateTime)req.to).ToString("MM/dd/yyyy"));

                var tfilter = new MemberTransactions_Filter();
               
                   tfilter.Field = MemberTransactions_Fields.Transaction_Type;
              switch (req.transaction_Type)
                {
                    case Ttype.Shares_Capital:
                          tfilter.Criteria = MemberTrans.Transaction_Type.Shares_Capital.ToString(); break;
                    case Ttype.Deposit_Contribution:
                        tfilter.Criteria = MemberTrans.Transaction_Type.Deposit_Contribution.ToString(); break;
                    case Ttype.Benevolent_Fund:
                        tfilter.Criteria = MemberTrans.Transaction_Type.Benevolent_Fund.ToString(); break;
                    case Ttype.School_Fee:
                        tfilter.Criteria = MemberTrans.Transaction_Type.School_Fee.ToString();
                        break;
                    default:
                        break;
                }
               


                var mmm = memberTrans.ReadMultiple(new  MemberTransactions_Filter[] { 
                    new  MemberTransactions_Filter { Criteria = req.member_number, Field =  MemberTransactions_Fields.Customer_No }, 
                    new  MemberTransactions_Filter  { Criteria = date, Field =  MemberTransactions_Fields.Posting_Date } ,
                    tfilter 
                
                }, null, 0);

                if (mmm.Any())

                {
                    foreach (MemberTransactions mm in mmm)
                    {
                        memberData.Add(new ledgerentries
                        {
                            TransactionCode = mm.Document_No,
                            Operation = mm.Credit_Amount != 0 ? "Credit" : "Debit",
                            Amount = mm.Amount,
                            Description = mm.Description,
                            RunningBalance = 0,
                            Timestamp = mm.Posting_Date,
                        });

                    }
                    response.data = memberData;
                }
                else
                {
                    response.result_code = 400;
                    response.result_message = "No Transactions found!";
                    response.data = new error { error_message = string.Format("No Transactions found!", req.member_number) };
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);

                response.result_code = 400;
                response.result_message = ex.Message;
                response.data = new error { error_message = string.Format(ex.Message, req.member_number) };
            }
            return response;
        }
//[HttpPost("Capitaltrans")]
        //public Results Capitaltrans(request req)
        //{
        //    Results response = new Results();
        //    try
        //    {
        //        List<ledgerentries> memberData = new List<ledgerentries>();

        //        var date = string.Format("{0}..{1}", ((DateTime)req.from).ToString("MM/dd/yyyy"), ((DateTime)req.to).ToString("MM/dd/yyyy"));
        //        var mmm = memberTrans.ReadMultiple(new  MemberTransactions_Filter[] { 
        //            new  MemberTransactions_Filter { Criteria = req.member_number, Field =  MemberTransactions_Fields.Customer_No }, 
        //            new  MemberTransactions_Filter  { Criteria = date, Field =  MemberTransactions_Fields.Posting_Date } ,
        //            new  MemberTransactions_Filter  { Criteria = MemberTrans.Transaction_Type.Shares_Capital.ToString(), Field =  MemberTransactions_Fields.Transaction_Type } 
                
        //        }, null, 0);

        //        if (mmm.Any())

        //        {
        //            foreach (MemberTransactions mm in mmm)
        //            {
        //                memberData.Add(new ledgerentries
        //                {
        //                    TransactionCode = mm.Document_No,
        //                    Operation = mm.Credit_Amount != 0 ? "Credit" : "Debit",
        //                    Amount = mm.Amount,
        //                    Description = mm.Description,
        //                    RunningBalance = 0,
        //                    Timestamp = mm.Posting_Date,
        //                });

        //            }
        //            response.data = memberData;
        //        }
        //        else
        //        {
        //            response.result_code = 400;
        //            response.result_message = "No Transactions found!";
        //            response.data = new error { error_message = string.Format("No Transactions found!", req.member_number) };
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        _logger.LogError(ex.Message);

        //        response.result_code = 400;
        //        response.result_message = ex.Message;
        //        response.data = new error { error_message = string.Format(ex.Message, req.member_number) };
        //    }
        //    return response;
        //}
        [HttpPost("Loantrans")]
        public Results Loantrans(request req)
        { List<ledgerentries> memberData = new List<ledgerentries>();
            Results response = new Results();
            try {

                var date = string.Format("{0}..{1}", ((DateTime)req.from).ToString("MM/dd/yyyy"), ((DateTime)req.to).ToString("MM/dd/yyyy"));

                var mmm = memberTrans.ReadMultiple( new  MemberTrans.MemberTransactions_Filter  [] { new  MemberTrans.MemberTransactions_Filter { Criteria = req.loan_number, Field =  MemberTrans.MemberTransactions_Fields.Loan_No }, new  MemberTrans.MemberTransactions_Filter { Criteria = date, Field =   MemberTrans.MemberTransactions_Fields.Posting_Date } }, null, 50);

            if (mmm.Any())

            {
                foreach (MemberTransactions mm in mmm)
                {
                    memberData.Add(new ledgerentries
                    {
                        TransactionCode = mm.Document_No,
                        Operation = mm.Credit_Amount != 0 ? "Credit" : "Debit",
                        Amount =  mm.Amount,
                        Description = mm.Description,
                        RunningBalance = 0,
                        Timestamp = mm.Posting_Date,
                    });

                }
                response.data = memberData;
            }
            else
            {
                response.result_code = 400;
                response.result_message = "No Transactions found!";
                response.data = new error { error_message = string.Format("No Transactions found!", req.member_number) };
            }} catch(Exception ex) {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);
                response.result_code = 400;
                response.result_message = ex.Message;
                response.data = new error { error_message = string.Format(ex.Message, req.member_number) };
            }
            return response;
        }[HttpPost("AccountDetails")]//
        public IActionResult AccountDetails(request req)
        {
            MemberAccount memberData = new MemberAccount();
            Results<MemberAccount> response = new Results<MemberAccount>();
            var mm = memberAccounts.ReadMultiple(new MemberAccounts.Accounts_Filter[] { new MemberAccounts.Accounts_Filter { Criteria = req.account_number, Field = MemberAccounts.Accounts_Fields.No } }, null, 0).FirstOrDefault();
            if (mm != null)
            {
                
                memberData = new MemberAccount
                {
                    account_number = mm.No,
                    product_name = mm.Account_Type,
                    status = mm.Status.ToString(),
                    branch = mm.Global_Dimension_2_Code,
                    balance = (double)polaris.GetAccountBal(mm.No),
                    opened_at = mm.Registration_Date,
                    account_name = mm.Name,
                    member_no = mm.BOSA_Account_No,
                };

                response.data = memberData;
                return Ok( response);
            }
            else
            {
                response.result_code = 400;
                response.result_message = $"Member with number {req.account_number}- NOT found!";
                return Ok(new Results<error>() { result_code = 400, result_message = $"Member with number {req.account_number}- NOT found!", data = new error { error_message = $"Member with number {req.account_number}- NOT found!" } });
            }
           // return response;
        }
        [HttpPost("Account")]//
        public IActionResult Accountdet(request req)
        {

            MemberAccount memberData = new MemberAccount();
            Results<MemberAccount> response = new Results<MemberAccount>();
            var mm = memberAccounts.ReadMultiple(new MemberAccounts.Accounts_Filter[] { new MemberAccounts.Accounts_Filter { Criteria = req.account_number, Field = MemberAccounts.Accounts_Fields.No } }, null, 0).FirstOrDefault();
            if (mm != null)
            {

                memberData = new MemberAccount
                {
                    account_number = mm.No,
                    product_name = mm.Name,
                    status = mm.Status.ToString(),
                    branch = mm.Global_Dimension_2_Code,
                    
                    opened_at = mm.Registration_Date
                };

                response.data = memberData;
                return Ok( response);
            }
            else
            {
                response.result_code = 400;
                response.result_message = $"Member with acc number {req.account_number}- NOT found!";
                return Ok(new Results<error>() { result_code = 400, result_message = $"Member with acc number {req.account_number}- NOT found!", data = new error { error_message = $"Member with acc number {req.account_number}- NOT found!" } });
            }
           // return response;
        } 
        [HttpPost("block_atm")]//
        public IActionResult blockatm(request req)
        {
            Results response = new Results();
            try {
                if (req.account_number == "") { throw (new Exception("Account no Must have a value")); }
                if (req.Comments == "") { throw (new Exception("Comments Must have a value")); }
            
           var mm = memberAccounts.ReadMultiple(new MemberAccounts.Accounts_Filter[] { new MemberAccounts.Accounts_Filter { Criteria = req.account_number, Field = MemberAccounts.Accounts_Fields.No } }, null, 0).FirstOrDefault();
            if (mm != null)
            { mm.Reason_For_Disabling_ATM_Card = req.Comments;
                    mm.Disable_ATM_Card = true;
                    mm.Disable_ATM_CardSpecified = true;
                   
                    memberAccounts.Update(ref mm);
               return Ok( response);
            }
            else
            {
                    throw new Exception($"acc number {req.account_number}- NOT found!");
              
            }
            }
            catch (Exception ex) { 
           
                return Ok(new Results<error>() { result_code = 400, result_message = ex.Message, data = new error { error_message = ex.Message } });
            }

           // return response;
        }
        [HttpPost("LoanDetails")]
        public Results LoanDetails(request req)
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
                response.result_message = $"Loan with number {req.loan_number  }- NOT found!";
                response.data = new error { error_message = string.Format("Loan with number {0}- NOT found!", req.loan_number) };
            }
            return response;
        }
      
    }
    public class Application
    {
        public string ApplicationStatus { get; set; }
        public string CrmNo { get; set; }
    }

    public class STO {

     
        public string Source_Account_No
        {
            get
           ;
            set
           ;
        }


        public string Account_Name
        {
            get
           ;
            set
           ;
        }

        public STO_Type STO_Type
        {
            get
           ;
            set
          ;
        }

        public decimal Amount
        {
            get
           ;
            set
            ;
        }

      

    
        public Destination_Account_Type Destination_Account_Type
        {
            get
            ;
            set
            ;
        }

       
        public string Destination_Account_No
        {
            get
            ;
            set
            ;
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Order = 10)]
        public string Destination_Account_Name
        {
            get
            ;
            set
            ;
        }

       
        public StandingOrders.Status Status
        {
            get
            ;
            set
            ;
        }

        public System.DateTime Effective_Start_Date
        {
            get
          ;
            set
           ;
        }

        /// <remarks/>
       
        public bool Effected
        {
            get
           ;
            set
            ;
        }


    }
}