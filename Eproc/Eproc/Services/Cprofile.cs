using ARevenue;
using BDetails;
using CompProfile;
using Countries;
using Curency;
using EProcAttachment;
using Kcontact;
using KPersonnel;
using Lhistory;
using MgtStructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using PDetails;
using Pexperience;
using ProcurementPortal;
using Rcompany;
using ReleasedBids;
using System.ServiceModel;
using System.ServiceModel.Description;

namespace Eproc.Services
{
    public class Cprofile : Icprofile
    {
        IConfiguration config { get; set; }
        CompProfile.CompanyProfile_PortClient profile { get; set; }
        Kcontact.KeyContact_PortClient keyContact_Port { get; set; }
        KPersonnel.KeyPersonnel_PortClient keyPersonnel { get; set; }
        Pexperience.PastExperience_PortClient pastexperience { get; set; }

        BDetails.BankDetails_PortClient bank
        {
            get
            {
                return new BankDetails_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "bankdetails"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        } 
 MgtStructure.EProcSubmittedMgtStructure_PortClient Mgtstr
        {
            get
            {
                return new EProcSubmittedMgtStructure_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "EProcSubmittedMgtStructure"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        Countries.Country_PortClient country
        {
            get
            {
                return new Country_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "Country"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }  EProcAttachment.EProcSubmittedAttachment_PortClient Attachment_PortClient
        {
            get
            {
                return new EProcSubmittedAttachment_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "EProcSubmittedAttachment"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        Curency.Currency_PortClient curr
        {
            get
            {
                return new Currency_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "Currency"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        Lhistory.LitigationHistory_PortClient lhistory
        {
            get
            {
                return new LitigationHistory_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "LitigationHistory"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        PDetails.PartnershipDetails_PortClient PartnershipDetails
        {
            get
            {
                return new PartnershipDetails_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "PartnershipDetails"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        Rcompany.RegisteredCompany_PortClient registeredCompany
        {
            get
            {
                return new RegisteredCompany_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "RegisteredCompany"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        ARevenue.AnnualRevenue_PortClient AnnualRevenue
        {
            get
            {
                return new AnnualRevenue_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "AnnualRevenue"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }


        public Cprofile(IConfiguration configuration)
        {
            config = configuration;
       


            profile = new CompProfile.CompanyProfile_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "CompanyProfile"));
            profile.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            profile.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;
            profile.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;


            keyContact_Port = new Kcontact.KeyContact_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "KeyContact"));
            keyContact_Port.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            keyContact_Port.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;
            keyContact_Port.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;

            keyPersonnel = new KPersonnel.KeyPersonnel_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "KeyPersonnel"));
            keyPersonnel.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            keyPersonnel.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;
            keyPersonnel.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;


            pastexperience = new Pexperience.PastExperience_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "PastExperience"));
            pastexperience.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            pastexperience.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;
            pastexperience.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;

        }

        public async Task<List<Kcontact.KeyContact>> getcontacts(string email)
        {
            var conts = await keyContact_Port.ReadMultipleAsync(new Kcontact.KeyContact_Filter[] { new Kcontact.KeyContact_Filter { Criteria = email, Field = Kcontact.KeyContact_Fields.Tax_Registration_No } }, null, 0);

            return conts.ReadMultiple_Result1.ToList();
        }
        [Authorize]
        public async Task<CompProfile.CompanyProfile> getprofile(string email)
        {

            var p = await profile.ReadMultipleAsync(new CompProfile.CompanyProfile_Filter[] { new() { Criteria = email, Field = CompProfile.CompanyProfile_Fields.Tax_Registration_No } }, null, 0);
            return p.ReadMultiple_Result1.FirstOrDefault();
        }

        public async Task<List<KeyPersonnel>> getPersonnel(string taxno)
        {
            var person = await keyPersonnel.ReadMultipleAsync(new KPersonnel.KeyPersonnel_Filter[] { new KPersonnel.KeyPersonnel_Filter { Criteria = taxno, Field = KPersonnel.KeyPersonnel_Fields.Tax_Registration_No } }, null, 0);

            return person.ReadMultiple_Result1.ToList();
        }
        public async Task<List<Pexperience.PastExperience>> getexperience(string taxno)
        {
            var person = await pastexperience.ReadMultipleAsync(new Pexperience.PastExperience_Filter[] { new Pexperience.PastExperience_Filter { Criteria = taxno, Field = Pexperience.PastExperience_Fields.Tax_Registration_No } }, null, 0);

            return person.ReadMultiple_Result1.ToList();
        }
        
        public Task<CompanyProfile> save(CompanyProfile p)
        {
            var pp = profile.ReadByRecId(p.Key);

            if (pp != null) { profile.Update(ref pp); }
            else
            {
                pp = profile.Read(p.Tax_Registration_No);
                if (pp != null)
                {
                    p.Key = pp.Key;
                    profile.Update(ref p);
                }
            }
            return Task.FromResult(p);
        }

        public async Task<List<BDetails.BankDetails>> getbankdetails(string taxno)
        {
            var person = await bank.ReadMultipleAsync(new BDetails.BankDetails_Filter[] { new BDetails.BankDetails_Filter { Criteria = taxno, Field = BDetails.BankDetails_Fields.Tax_Registration_No } }, null, 0);

            return person.ReadMultiple_Result1.ToList();
        }

        public async Task<List<LitigationHistory>> getLhistory(string taxno)
        {
            var c = await lhistory.ReadMultipleAsync(new LitigationHistory_Filter[] { new LitigationHistory_Filter { Criteria = taxno, Field =  LitigationHistory_Fields.Tax_Registration_No } }, null, 0);
            return c.ReadMultiple_Result1.ToList();
        }

        public async Task<List<PartnershipDetails>> getpdetails(string taxno)
        {
            var c = await PartnershipDetails.ReadMultipleAsync(new PartnershipDetails_Filter[] { new PartnershipDetails_Filter { Criteria = taxno, Field = PartnershipDetails_Fields.Tax_Registration_No } }, null, 0);
            return c.ReadMultiple_Result1.ToList();
        }

        public async Task<List<RegisteredCompany>> getrcompany(string taxno)
        {
            var c = await registeredCompany.ReadMultipleAsync(new RegisteredCompany_Filter[] { new RegisteredCompany_Filter { Criteria = taxno, Field = RegisteredCompany_Fields.Tax_Registration_No } }, null, 0);
            return c.ReadMultiple_Result1.ToList();
        }

        public async Task<List<AnnualRevenue>> getarevenue(string taxno)
        {
            var c = await AnnualRevenue.ReadMultipleAsync(new AnnualRevenue_Filter[] { new AnnualRevenue_Filter { Criteria = taxno,Field= AnnualRevenue_Fields.Tax_Registration_No} }, null, 0);
            return c.ReadMultiple_Result1.ToList();

        }

        public async Task<List<Country>> getcountries()
        {
            var c = await country.ReadMultipleAsync(new Country_Filter[] { }, null, 0);
            return c.ReadMultiple_Result1.ToList();
        }
        public async Task<Currency[]> getcurrencies()
        {
            var c = await curr.ReadMultipleAsync(new Currency_Filter[] { }, null, 0);
            return c.ReadMultiple_Result1;
        }
        public async Task<T> SaveData<T>(T model)
        {
            if (model is Kcontact.KeyContact)
            {
                var contact = model as Kcontact.KeyContact;
                var c = keyContact_Port.ReadMultiple(new KeyContact_Filter[] { new KeyContact_Filter { Criteria = contact.Tax_Registration_No, Field = KeyContact_Fields.Tax_Registration_No }, new KeyContact_Filter { Criteria = contact.Entry_No.ToString(), Field = KeyContact_Fields.Entry_No } }, null, 0).FirstOrDefault();
                if (c != null)
                    keyContact_Port.Update(ref contact);
                else
                    keyContact_Port.Create(ref contact);
                (model as KeyContact).Key = contact.Key;

            }
            if (model is KPersonnel.KeyPersonnel)
            {
                var contact = model as KPersonnel.KeyPersonnel;
                var c = keyPersonnel.ReadMultiple(new KPersonnel.KeyPersonnel_Filter[] { new KPersonnel.KeyPersonnel_Filter { Criteria = contact.Tax_Registration_No, Field = KeyPersonnel_Fields.Tax_Registration_No }, new KPersonnel.KeyPersonnel_Filter { Criteria = contact.Entry_No.ToString(), Field = KeyPersonnel_Fields.Entry_No } }, null, 0).FirstOrDefault();
                if (c != null)
                    keyPersonnel.Update(ref contact);
                else
                    keyPersonnel.Create(ref contact);
                (model as KeyPersonnel).Key = contact.Key;

            }
            if (model is Pexperience.PastExperience)
            {
                var contact = model as PastExperience;
                var c = pastexperience.ReadMultiple(new Pexperience.PastExperience_Filter[] { new Pexperience.PastExperience_Filter { Criteria = contact.Tax_Registration_No, Field = PastExperience_Fields.Tax_Registration_No }, new Pexperience.PastExperience_Filter { Criteria = contact.Entry_No.ToString(), Field = PastExperience_Fields.Entry_No } }, null, 0).FirstOrDefault();
                if (c != null)
                    pastexperience.Update(ref contact);
                else
                    pastexperience.Create(ref contact);
                (model as PastExperience).Key = contact.Key;

            }
            if (model is LitigationHistory)
            {
                var contact = model as LitigationHistory;

                var c = lhistory.ReadMultiple(new LitigationHistory_Filter[] { new LitigationHistory_Filter { Criteria = contact.Tax_Registration_No, Field = LitigationHistory_Fields.Tax_Registration_No }, new LitigationHistory_Filter { Criteria = contact.Entry_No.ToString(), Field = LitigationHistory_Fields.Entry_No } }, null, 0).FirstOrDefault();
                if (c != null)
                    lhistory.Update(ref contact);
                else
                    lhistory.Create(ref contact);
                (model as LitigationHistory).Key = contact.Key;

            }
            if (model is AnnualRevenue)
            {
                var contact = model as AnnualRevenue;

                var c = AnnualRevenue.ReadMultiple(new AnnualRevenue_Filter[] { new AnnualRevenue_Filter { Criteria = contact.Tax_Registration_No, Field = AnnualRevenue_Fields.Tax_Registration_No }, new AnnualRevenue_Filter { Criteria = contact.Entry_No.ToString(), Field = AnnualRevenue_Fields.Entry_No } }, null, 0).FirstOrDefault();
                if (c != null)
                    AnnualRevenue.Update(ref contact);
                else
                    AnnualRevenue.Create(ref contact);
                (model as AnnualRevenue).Key = contact.Key;

            }
            if (model is RegisteredCompany)
            {
                var contact = model as RegisteredCompany;

                var c = registeredCompany.ReadMultiple(new RegisteredCompany_Filter[] { new RegisteredCompany_Filter { Criteria = contact.Tax_Registration_No, Field = RegisteredCompany_Fields.Tax_Registration_No }, new RegisteredCompany_Filter { Criteria = contact.Entry_No.ToString(), Field = RegisteredCompany_Fields.Entry_No } }, null, 0).FirstOrDefault();
                if (c != null)
                    registeredCompany.Update(ref contact);
                else
                    registeredCompany.Create(ref contact);
                (model as RegisteredCompany).Key = contact.Key;

            }
            if (model is BankDetails)
            {
                var contact = model as BankDetails;

                var c = bank.ReadMultiple(new BankDetails_Filter[] { new BankDetails_Filter { Criteria = contact.Tax_Registration_No, Field = BankDetails_Fields.Tax_Registration_No }, new BankDetails_Filter { Criteria = contact.Entry_No.ToString(), Field = BankDetails_Fields.Entry_No } }, null, 0).FirstOrDefault();
                if (c != null)
                    bank.Update(ref contact);
                else
                    bank.Create(ref contact);
                (model as BankDetails).Key = contact.Key;

            }
            return await Task.FromResult(model);

        }

        public Task Delete<T>(T model)
        {
            if (model is Kcontact.KeyContact)
            {
                var contact = model as Kcontact.KeyContact;
                keyContact_Port.Delete(contact.Key);

            }
            if (model is KeyPersonnel)
            {
                var contact = model as KeyPersonnel;
                keyPersonnel.Delete(contact.Key);

            }
            if (model is Pexperience.PastExperience)
            {
                var contact = model as PastExperience;
                pastexperience.Delete(contact.Key);

            }
            return Task.CompletedTask;
        }

        public async Task<List<EProcAttachment.EProcSubmittedAttachment>> getattachment(string taxno)
        {
            var c = await Attachment_PortClient.ReadMultipleAsync(new EProcSubmittedAttachment_Filter[] { new EProcSubmittedAttachment_Filter {Criteria = taxno,Field = EProcSubmittedAttachment_Fields.Tax_Registration_No } }, null, 0);
            return c.ReadMultiple_Result1.ToList();
        }

        public async Task<List<EProcSubmittedMgtStructure>> getstructure()
        {
            var c = await Mgtstr.ReadMultipleAsync(new EProcSubmittedMgtStructure_Filter[] { }, null, 0);
            return c.ReadMultiple_Result1.ToList();
        }
    }
    
    public class AttachDocuments
    {
        public EProcAttachment.Attachment_Category Category { get; set; }
        public string AttachmentID { get; set; }
        public string Description { get; set; }
        public int Year { get; set; }
        public List<EProcAttachment.EProcSubmittedAttachment> SubmittedAttachment { get; set; }
         
     

    }
}
