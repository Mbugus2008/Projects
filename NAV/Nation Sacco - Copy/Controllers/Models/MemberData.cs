using Beno;
using Member;
using MemberApplication;

namespace Nation_Sacco.Controllers.Models
{
    public class MemberData : error
    {
        public string first_name { get; set; }
        public string middle_name { get; set; }
        public string other_names { get; set; }
        public string? current_address { get; set; }
        public string permanent_address { get; set; }
        public string phone { get; set; }
        public string transactional_mobile_no { get; set; }
        public string employer_code { get; set; }
        public DateTime? date_of_birth { get; set; }
        public string email { get; set; }
        public string? citizenship { get; set; }
        public string payroll_staff_no { get; set; }
        public string? primary_identification_type { get; set; }
        public string? secondary_identification_type { get; set; }
        public string? religion { get; set; }
        public string primary_identification { get; set; }
        public string? secondary_identification { get; set; }
        public string? marital_status { get; set; }
        public string gender { get; set; }
        public string terms_of_employment { get; set; }
        public string post_code { get; set; }
        public string city { get; set; }
        public string county { get; set; }
        public string bank_code { get; set; }
        public string bank_branch_code { get; set; }
        public string bank_account_no { get; set; }
        public string kra_pin { get; set; }
        public string loyalty_measure_recruited_by { get; set; }
        public string loyalty_measure_id_number { get; set; }
        public string loyalty_measure_relationship { get; set; }
        public bool is_self_employed { get; set; }
        public bool special_employment { get; set; }
        public string salutation { get; set; }
        public string? special_employment_details { get; set; }
        public string? account_profile { get; set; }
        public string? member_class { get; set; }
        public bool? is_from_another_sacco { get; set; }
        public string? country_of_operation { get; set; }
        public string? work_station { get; set; }
        public string? employment_designation { get; set; }
        public string? delegate_branch { get; set; }
        public string? fosa_branch { get; set; }
        public string? date_of_contribution_commencement { get; set; }
        public double? contribution_amount { get; set; }
        public string? tsc_or_pf_number { get; set; }
        public bool? should_issue_atm_card { get; set; }
        public bool? should_register_mobile_banking { get; set; }
        public string? status_change_callback_url { get; set; }
        public string? picture { get; set; }
        public string? signature { get; set; }

        public List<NokBeneficiaryNomineeInfo>? nok_beneficiary_nominee_info { get; set; }

        public List<Goals>? goals { get; set; }  
        public List<Benovolentss>? benovolents { get; set; } 
    }

  public  class Goals {
    public string? customer_goal { get; set; }
    
    }
    public class Benovolentss
    {


        public string? account_no { get; set; }
        public string? full_name { get; set; }
        public string? staff_no { get; set; }
        public string? member_no { get; set; }
        public System.DateTime? date_of_birth { get; set; }
        public string? address { get; set; }
        public string? telephone { get; set; }
        public string? fax { get; set; }
        public string? email { get; set; }
        public string? id_no { get; set; }
        public decimal? percentallocation { get; set; }
        public Category? category { get; set; }
        public string? residence { get; set; }
        public Beno.Source? source { get; set; }
        public Beno.Status? status { get; set; }
        public bool? paid { get; set; }


    }
}
namespace MemberApplication {
public partial class Member_Application
    {
public MemberApplication.Gender getgender(string g)
        {
            switch (g)
            {
                case "Male": return MemberApplication.Gender.Male;
                case "Female": return MemberApplication.Gender.Female;
                case "Others": return MemberApplication.Gender.Others;
                default: throw new("Invalid Gender");
            }
        }
        public Marital_Status getmarital(string g)
        {
            switch (g)
            {//None,Single,Married,Divorced,Widower,Widow,Others
                case "None": return Marital_Status._blank_;
                case "Single": return Marital_Status.Single;
                case "Married": return Marital_Status.Married;
                case "Divorced": return Marital_Status.Divorced;
                case "Others": return Marital_Status.Others;
                case "Widower": return Marital_Status.Widower;
                case "Widow": return Marital_Status.Widow;
                default: throw new("Invalid Marital Status");
            }
        }   
            public  Terms_of_Employment getemploymenttype(string g)
        {
            switch (g)
            {//None,Permanent & Pensionable,Temporary,Contract,Others
                case "None": return Terms_of_Employment._blank_;
                case "Permanent & Pensionable": return Terms_of_Employment.Permanent__x0026__Pensionable;
                case "Temporary": return Terms_of_Employment.Temporary;
                case "Contract": return Terms_of_Employment.Contract;
                case "Others": return Terms_of_Employment.Others;
              
                default: throw new("Invalid Terms of Employment");
            }
        }


    }
}


namespace Nkinapp
{
    public partial class NofKinApp
    {
        
    }
}