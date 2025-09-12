
namespace Eproc.Services
{
    public interface Icprofile
    {
        Task<CompProfile.CompanyProfile> getprofile(string email);
        Task<CompProfile.CompanyProfile> save(CompProfile.CompanyProfile profile);
        Task<List<Kcontact.KeyContact>> getcontacts(string taxno);
        Task<List<KPersonnel.KeyPersonnel>> getPersonnel(string taxno);
        Task<List<Pexperience.PastExperience>> getexperience(string taxno);
        Task<List<BDetails.BankDetails>> getbankdetails(string taxno);
        Task<List<Lhistory.LitigationHistory>> getLhistory(string taxno);
        Task<List<PDetails.PartnershipDetails>> getpdetails(string taxno);
        Task<List<Rcompany.RegisteredCompany>> getrcompany(string taxno);
        Task<List<ARevenue.AnnualRevenue>> getarevenue(string taxno); 
        Task<List<EProcAttachment.EProcSubmittedAttachment>> getattachment(string taxno);

Task<List<MgtStructure.EProcSubmittedMgtStructure>> getstructure();
        Task<List<Countries.Country>> getcountries();
        Task<Curency.Currency[]> getcurrencies();

        //Save
    //    Task<Kcontact.KeyContact> savecontact(Kcontact.KeyContact model);
    //Task<BDetails.BankDetails> savebdetails(BDetails.BankDetails model);
    //  Task<KPersonnel.KeyPersonnel> savepersonel(KPersonnel.KeyPersonnel model);

        Task<T> SaveData<T>(T model);
  Task Delete<T>(T model);

    }
    }