using RestSharpWebApi.DetailedCustomerLedgerEntries;
using RestSharpWebApi.LoanListMobile;
using RestSharpWebApi.LoanProductTypesList;
using RestSharpWebApi.Loanschedule;
using RestSharpWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Http;

using System.Web.Services.Description;
using System.Xml;
using Serilog;
using Microsoft.Graph.Models.Security;
using Microsoft.Graph.IdentityGovernance.TermsOfUse;

namespace RestSharpWebApi.Controllers
{
    public class LoansController : ApiController
    {
        Setting s = new Setting();
        // GET: Loans
     
        [HttpPost]
        [Route("LoanList")]
        public Results<List<LoanListMobile.LoanListMobile>> GetLoanList(Loanfilter loanfilter)
        {
            Results<List<LoanListMobile.LoanListMobile>> result = new Results<List<LoanListMobile.LoanListMobile>>();
            LoanListMobile_Service otemplate = new LoanListMobile_Service(s);

            List<LoanListMobile_Filter> _Filters = new List<LoanListMobile_Filter>();
            LoanListMobile_Filter _Filter = new LoanListMobile_Filter();

            _Filter.Criteria = loanfilter.customer_no; _Filter.Field = LoanListMobile_Fields.Member_No; _Filters.Add(_Filter);
            if ((loanfilter.datefrom.Year != 1) || (loanfilter.dateto.Year != 1))
            {

                _Filter = new LoanListMobile_Filter(); _Filter.Criteria = string.Format("{0}..{1}", loanfilter.datefrom, loanfilter.dateto); _Filter.Field = LoanListMobile_Fields.Application_Date; _Filters.Add(_Filter);
            }
            if (loanfilter.StatusSpecified == true)
            {
                _Filter = new LoanListMobile_Filter(); _Filter.Criteria = loanfilter.Status.ToString(); _Filter.Field = LoanListMobile_Fields.LStatus; _Filters.Add(_Filter);
            }
            List<LoanListMobile.LoanListMobile> ln  = otemplate.ReadMultiple(_Filters.ToArray(), null, 0).ToList();
            
            result.Contents = ln;

            //Fetch loan product types
             LoanProductTypesList.LoanProductTypesList_Service productTemplate = new LoanProductTypesList.LoanProductTypesList_Service(s);
            List<LoanProductTypesList.LoanProductTypesList> productTypes = GetLoanProducts().Contents;
          /*  foreach (var o in result.Contents)
            {
                var productType = productTypes.Find(pt => pt.Product_ID == o.Loan_Product_Type);
                if (productType != null)
                {
                    // Include product type information in loan
                    o.Loan_Product_Type=productType.to;

                }
            } */ 
            return result;
        }
        [HttpGet]
        [Route("pendingloans")]
        public Results<List<LoanListMobile.LoanListMobile>> GetpendingLoanList(String customerno)
        {
            Results<List<LoanListMobile.LoanListMobile>> service = new Results<List<LoanListMobile.LoanListMobile>>();

            LoanListMobile_Service _service = new LoanListMobile_Service(s);

            service.Contents = _service.ReadMultiple(new LoanListMobile_Filter[] { new LoanListMobile_Filter { Criteria = "No", Field = LoanListMobile_Fields.Posted }, new LoanListMobile_Filter { Criteria = customerno, Field = LoanListMobile_Fields.Member_No } }, null, 0).ToList();

            return service;
        }
        [HttpPost]
        [Route("clearloans")]
        public Results<CustomerRequest.CustomerRequest> clearloans(string customerno,String loanno)
        {
            Results<CustomerRequest.CustomerRequest> service = new Results<CustomerRequest.CustomerRequest>();
            CustomerRequest.CustomerRequest cr = new CustomerRequest.CustomerRequest();   
           try { 
           //TODO add the request to customer requests.
           cr.Customer_No = customerno;
            cr.Loan_No = loanno;
            cr.Request_Type = CustomerRequest.Request_Type.Clear_Loan;//change to Clear loan
            cr.Request_TypeSpecified = true;
            cr.Request_Date = DateTime.Now;
            cr.Request_DateSpecified = true;
new CustomerRequest.CustomerRequest_Service(s).Create(ref cr);
            service.Contents = cr;
            }
            catch(Exception ex)
            {

                Log.Error(ex, "Clear loan");
            }

            return service;
        }
        [HttpGet]
        [Route("Loanproducts")]
        public Results<List<LoanProductTypesList.LoanProductTypesList>> GetLoanProducts()
        {
            Results<List<LoanProductTypesList.LoanProductTypesList>> results = new Results<List<LoanProductTypesList.LoanProductTypesList>>();

            LoanProductTypesList.LoanProductTypesList_Service otemplate = new LoanProductTypesList.LoanProductTypesList_Service(s);

            results.Contents = otemplate.ReadMultiple(new LoanProductTypesList_Filter[] {new LoanProductTypesList_Filter { Criteria = "Yes",Field = LoanProductTypesList_Fields.Display_On_Portal} }, null, 0).ToList();

            return results;
        }

        [HttpPost]
        [Route("Createloan")]
        public Results<LoanListMobile.LoanListMobile> CreateLoans(LoanListMobile.LoanListMobile loan)
        {
            Results<LoanListMobile.LoanListMobile> results = new Results<LoanListMobile.LoanListMobile>();
            LoanListMobile.LoanListMobile_Service service = new LoanListMobile_Service(s);
            try
            {

                LoanProductTypesList.LoanProductTypesList oprod = new LoanProductTypesList_Service(s)
                    .ReadMultiple(
                        new LoanProductTypesList_Filter[]
                        {
                            new LoanProductTypesList_Filter
                                { Criteria = loan.Loan_Product_Type, Field = LoanProductTypesList_Fields.Product_ID }
                        }, null, 0).FirstOrDefault();


                if (oprod == null)

                    return new Results<LoanListMobile.LoanListMobile>() { Code = -1, Desc = "Invalid Product id " };


                loan.Application_Date = DateTime.Today;
                loan.Application_DateSpecified = true;
                loan.Approved_AmountSpecified = true;
                loan.Approved_Amount = loan.Requested_Amount;
                loan.Requested_AmountSpecified = true;

               

                if (oprod.Mobile_Loan)
                {
                    //send to the mobile request loan
                    MobileLoanRequests.MobileLoanRequests_Service mservice = new MobileLoanRequests.MobileLoanRequests_Service(s);
                 
                    // Check if the customer has an existing loan request in pending status
                    bool hasPendingLoan = mservice.ReadMultiple(new MobileLoanRequests.MobileLoanRequests_Filter[] { new MobileLoanRequests.MobileLoanRequests_Filter { Field = MobileLoanRequests.MobileLoanRequests_Fields.Customer_No, Criteria = loan.Member_No }, new MobileLoanRequests.MobileLoanRequests_Filter { Field = MobileLoanRequests.MobileLoanRequests_Fields.Status_Selection, Criteria = "Pending" } }, null, 0).Any();
                    bool hasBusyLoan = mservice.ReadMultiple(new MobileLoanRequests.MobileLoanRequests_Filter[] { new MobileLoanRequests.MobileLoanRequests_Filter { Field = MobileLoanRequests.MobileLoanRequests_Fields.Customer_No, Criteria = loan.Member_No }, new MobileLoanRequests.MobileLoanRequests_Filter { Field = MobileLoanRequests.MobileLoanRequests_Fields.Status_Selection, Criteria = "Busy" } }, null, 0).Any();
                    if ((!hasPendingLoan) && (!hasBusyLoan))
                    {
                       /* var existingloan = service.ReadMultiple(new LoanListMobile.LoanListMobile_Filter[] {
                            new LoanListMobile.LoanListMobile_Filter{ Field=LoanListMobile.LoanListMobile_Fields.Member_No,Criteria=loan.Member_No},
                            new LoanListMobile.LoanListMobile_Filter { Field=LoanListMobile.LoanListMobile_Fields.Loan_Product_Type,Criteria=loan.Loan_Product_Type},
                            new LoanListMobile.LoanListMobile_Filter {Field=LoanListMobile.LoanListMobile_Fields.Outstanding_Balance,Criteria=">0"},
                            new LoanListMobile.LoanListMobile_Filter { Field=LoanListMobile.LoanListMobile_Fields.Outstanding_Interest,Criteria=">0"} },null,0).FirstOrDefault();

                        if (existingloan != null)
                        {
                            results.Desc = "You have an active "+oprod.Product_Name+". Please clear and try again";
                            results.Code = -1;
                            return results;
                        }*/
                        try
                        {

                            loan.LStatus = LStatus.Approved;
                            loan.LStatusSpecified = true;

                            service.Create(ref loan);
                            MobileLoanRequests.MobileLoanRequests mobloan =
                                new MobileLoanRequests.MobileLoanRequests();
                            mobloan.Customer_No = loan.Member_No;
                            mobloan.Status_Selection = 0;
                            mobloan.Installments = loan.Installments;
                            mobloan.InstallmentsSpecified = true;
                            mobloan.Loan_Amount = loan.Requested_Amount;
                            mobloan.Loan_AmountSpecified = true;
                            mobloan.Loan_Product_Type = loan.Loan_Product_Type;
                            mobloan.Loan_No = loan.Loan_No;
                            mobloan.Product_Name = loan.Loan_Product_Type_Name;
                            mobloan.Remarks = "";
                            mobloan.Created_On = DateTime.Now;
                            mobloan.Created_OnSpecified = true;
                            mservice.Create(ref mobloan);
                            //Send SMS

                        }
                        catch (Exception ex)
                        {
                            results.Desc = ex.Message.ToString();
                            results.Code = -1;
                        }
                        
                    }
                    else
                    {
                        results.Desc = "You have an ongoing loan request. You will be notified on SMS.";
                        results.Code = -1;
                    }
                }
                else
                {
                    service.Create(ref loan);

                }


            }


            catch (Exception ex)
            {
                results.Desc = ex.Message.ToString();
                results.Code = -1;
            }

            results.Contents = loan;

            return results;
        }

        /* [HttpPost]
         [Route("Createloan")]
         public Results<LoanListMobile.LoanListMobile> CreateLoans(LoanListMobile.LoanListMobile loan)
         {
             Results<LoanListMobile.LoanListMobile> results = new Results<LoanListMobile.LoanListMobile>();
             LoanListMobile.LoanListMobile_Service service = new LoanListMobile_Service(s);
             try
             {
                 loan.Application_Date = DateTime.Today;
                 loan.Application_DateSpecified = true;
                 loan.Approved_AmountSpecified = true;
                 loan.Approved_Amount = loan.Requested_Amount;
                 loan.Requested_AmountSpecified = true;
                 service.Create(ref loan);
             }
             catch (Exception ex)
             {
                 results.Desc = ex.Message.ToString();
                 results.Code = -1;
             }
             results.Contents = loan;

             return results;
         }*/
        [HttpPost]
        [Route("loansecurity")]
        public Results<LoanGuarantors.LoanGuarantors> CreateLoansecurity(LoanGuarantors.LoanGuarantors loan)
        {
            Results<LoanGuarantors.LoanGuarantors> results = new Results<LoanGuarantors.LoanGuarantors>();

            LoanGuarantors.LoanGuarantors_Service service = new LoanGuarantors.LoanGuarantors_Service(s);
            try
            {

                loan.Guarantor_TypeSpecified = true;

                service.Create(ref loan);
            }
            catch (Exception ex)
            {
                results.Desc = ex.Message.ToString();
                results.Code = -1;
            }
            results.Contents = loan;

            return results;
        }
        [HttpPost]
        [Route("loantopup")]
        public Results<Loantopup.Loantopup> CreateLoantopup(Loantopup.Loantopup loan)
        {
            Results<Loantopup.Loantopup> results = new Results<Loantopup.Loantopup>();

            Loantopup.Loantopup_Service service = new Loantopup.Loantopup_Service(s);

            try
            {

                service.Create(ref loan);
            }
            catch (Exception ex)
            {
                results.Desc = ex.Message.ToString();
                results.Code = -1;
            }
            results.Contents = loan;

            return results;
        }
        [HttpPost]
        [Route("loancalculator")]
        public Results<loancalculator> Loancalculator(string product, int installments, double amount)
        {
            Results<loancalculator> results = new Results<loancalculator>();
            loancalculator lc = new loancalculator();
            double monthlyPayment = 0;
            try
            {

                var lp = new LoanProductTypesList_Service(s).Read(product);

                if (lp == null)
                {
                    return new Results<loancalculator>() { Code = -1, Desc = "Product does not exist" };
                }
                double monthlyInterestRate = 0;
                int numberOfPayments = 0; 
                double factor = 0;
                switch (lp.Interest_Calculation_Method)
                {
                    case Interest_Calculation_Method.Reducing_Balance:
                        monthlyInterestRate = (double)lp.Interest_Rate / 12 / 100;
                        numberOfPayments = installments;
                        factor = Math.Pow(1 + monthlyInterestRate, numberOfPayments);
                        monthlyPayment = (amount * monthlyInterestRate * factor) / (factor - 1);
                        break;
                    case Interest_Calculation_Method.Straight_Line:
                        monthlyInterestRate = (double)lp.Interest_Rate /12  / 100 ;
                        numberOfPayments = installments;
                        monthlyPayment = (amount + ((monthlyInterestRate * amount)* numberOfPayments)) / numberOfPayments;
                        break;
                    case Interest_Calculation_Method.Amortised:
                        monthlyInterestRate = (double)lp.Interest_Rate / 12 / 100;
                        numberOfPayments = installments;
                        factor = Math.Pow(1 + monthlyInterestRate, numberOfPayments);
                        monthlyPayment = (amount * monthlyInterestRate * factor) / (factor - 1);
                        break; 
                   
                }


                lc.Installment = monthlyPayment;
                lc.TotalPayment = monthlyPayment * installments;
                results.Contents = lc;
            }
            catch (Exception ex)
            {
                results.Desc = ex.Message.ToString();
                results.Code = -1;
            }


            return results;
        }
        [HttpGet]
        [Route("loanledgerentries")]
        public Results<List<DetailedCustomerLedgerEntries.DetailedCustomerLedgerEntries>> Loanledgerentries(string loanno)
        {
            return new Results<List<DetailedCustomerLedgerEntries.DetailedCustomerLedgerEntries>>() { Contents = s.withrunningbal(new DetailedCustomerLedgerEntries_Service(s).ReadMultiple(new DetailedCustomerLedgerEntries_Filter[] { new DetailedCustomerLedgerEntries_Filter { Criteria = loanno, Field = DetailedCustomerLedgerEntries_Fields.Loan_No } }, null, 0).ToList()) };
        }
        [HttpPost]
        [Route("loanschedulelist")]
        public Results<List<loan_Schedule>> Loanschedule(LoanListMobile.LoanListMobile loan)
        {
            if (loan == null) return new Results<List<loan_Schedule>>() { Code = -1, Desc = "Invalid loan data" };
            var lp = new LoanProductTypesList_Service(s).Read(loan.Loan_Product_Type);

           if (lp == null) return new Results<List<loan_Schedule>>() { Code = -1, Desc = "Loan product not found" };
           

            decimal monthlyPayment = loan.Requested_Amount * (((lp.Interest_Rate / 12)/100) * (decimal)Math.Pow(1 + (double)((lp.Interest_Rate / 12)/100), loan.Installments))
                               / ((decimal)Math.Pow(1 + (double)((lp.Interest_Rate / 12)/100), loan.Installments) - 1);


            List<loan_Schedule> schedules = new List<loan_Schedule>();


            decimal remainingBalance = loan.Requested_Amount;
            DateTime duedate = DateTime.Now.AddMonths(1);
            for (int month = 1; month <= loan.Installments; month++)
            {
                if (month > 1)
                {
                    duedate = duedate.AddMonths(1);
                }
                // Calculate monthly interest
                decimal interestPayment = remainingBalance * ((lp.Interest_Rate / 12)/100);

                // Calculate principal payment
                decimal principalPayment = monthlyPayment - interestPayment;

                // Calculate remaining balance
                remainingBalance -= principalPayment;

                // Print the payment details for each month


                schedules.Add(new loan_Schedule() { Interest = (double)interestPayment, Prinicipal = (double)principalPayment, Month = month, Balance = (double)remainingBalance, DueDate = duedate });
            }

            return new Results<List<loan_Schedule>>() { Contents = schedules };// new Results<List<Loanschedule.Loanschedule>>() { Contents = new Loanschedule_Service(s).ReadMultiple(new Loanschedule_Filter[] { new Loanschedule_Filter { Criteria = loanno, Field = Loanschedule_Fields.Loan_No } }, null, 0).ToList() };
        }
        [HttpGet]
        [Route("eligibility")]
        public Results<Eligibility> eligibility(String customerno, string Loantype)
        {
            Results<Eligibility> service = new Results<Eligibility>();
            try
            {
                SBCSERVICE.SBCSERVICE _service = new SBCSERVICE.SBCSERVICE(s);
                var elig = _service.eligibility(customerno, Loantype);
                Eligibility el = new Eligibility();
                el.Customer = customerno;
                el.Loan_Id = Loantype;
                el.Gross = (double)elig;
                el.Net = (double)elig;
                service.Contents = el;
            }
            catch (Exception ex)
            {
                Log.Error("Eligibility",ex);
                service.Code = -1;
                service.Desc = ex.Message;
            }
            return service;
        }
        [HttpGet]
        [Route("helaeligibility")]
        public Results<Eligibility> helaeligibility(String customerno, string Loantype)
        {
            Results<Eligibility> service = new Results<Eligibility>();
            try
            {
                Hela.Hela _service = new Hela.Hela(s);
                var elig = _service.eligibility(customerno, Loantype);
                var catlimit = _service.categoryLimit(customerno);
                //     Hela.Hela hela = new Hela.Hela();
                Eligibility el = new Eligibility();
                el.Customer = customerno;
                el.Loan_Id = Loantype;
                el.Gross = (double)elig;
                el.Net = (double)elig;
                el.CategoryLimit = (double)catlimit;
                service.Contents = el;
            }
            catch (Exception ex)
            {
                Log.Error("Eligibility", ex);
                service.Code = -1;
                service.Desc = ex.Message;
            }
            return service;
        }

    }

    public class Loanfilter
    {
        public string customer_no { get; set; }
        public DateTime datefrom { get; set; }
        public DateTime dateto { get; set; }
        public LoanListMobile.LStatus Status { get; set; }
        public bool StatusSpecified { get; set; }
    }
    public class loancalculator
    {
        public double Installment { get; set; }
        public double TotalPayment { get; set; }
    }
    public class loan_Schedule
    {
        public int Month { get; set; }
        public DateTime DueDate { get; set; }
        public double Prinicipal { get; set; }
        public double Interest { get; set; }
        public double Balance { get; set; }
    }

    public class Eligibility
    {
        public string Loan_Id { get; set; }
        public double Gross { get; set; }
        public double Topup { get; set; }
        public double Charges { get; set; }
        public double Net { get; set; }
        public string Customer { get; set; }
       public double CategoryLimit { get; set; }
    }
}