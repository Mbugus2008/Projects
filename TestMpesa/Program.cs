using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestMpesa
{
    class Program
    {

        static void testemail() {

            NavEmail.Hosts h = new NavEmail.Hosts();
            h.host = "smtp.office365.com";
            h.Port = 587;
            h.secure = true;
            h.username = "metrosacco@outlook.com";
            h.password = "Metro@12345";
            h.logpath = @"D:\logs\";
            var d = h.datetotext(DateTime.Now);
            NavEmail.Email email = new NavEmail.Email(h);
            email.Body = "testing11";
            email.From = "metrosacco@outlook.com";
            email.Subject = "Paul Njoroge";
            email.To_Address = "mbugus2008@gmail.com";
            email.attachmentPath = @"D:\Copy of DEC 2022 DEDUCTION1.xlsx";
            var e = email.send(email);

        }
        static void Main(string[] args)
        {
            //testemail();
            //sms_Inforbip.sms s = new sms_Inforbip.sms();
            //sms_Inforbip.sms.m mm = new sms_Inforbip.sms.m();
            //s.apikey = "7bc91240600e8c6574dae6f75e84e25d-17cd33df-b26b-4402-9cb2-aaa1d59c8356";
            //List<sms_Inforbip.sms.Message> ms = new List<sms_Inforbip.sms.Message>();
            //sms_Inforbip.sms.Message m = new sms_Inforbip.sms.Message();
            //m.from = "KimisituINF";
            //m.text = "Testing888";
            //List<sms_Inforbip.sms.Destination> destinations = new List<sms_Inforbip.sms.Destination>();
            //sms_Inforbip.sms.Destination destination = new sms_Inforbip.sms.Destination();
            //destination.to = "254710563359";
            //destinations.Add(destination);
            //m.destinations = destinations;
            //ms.Add(m);
            //mm.messages = ms;
            //s.messages = mm;
            //var r = s.sendsms(s);



            //    NavEmail.Hosts h = new NavEmail.Hosts();
            //    h.host = "smtp.office365.com";
            //    h.Port = 587;
            //    h.username = "metrosacco@outlook.com";
            //    h.password = "Mbanking12345*";
            //    h.logpath = @"D:\logs\";

            //    var d = h.datetotext(DateTime.Now);

            //    NavEmail.Email email = new NavEmail.Email(h);
            //    email.Body = "testing11";
            //    email.From = "metrosacco@outlook.com";
            //    email.Subject = "Paul Njoroge";
            //    email.To_Address = "mbugus2008@gmail.com";
            //    email.attachmentPath = @"D:\logs\2021120.txt";
            //var e =    email.send(email);


            // var t =     matchnames("OUMA ALVISTOR DIANA", "ALVISTOR OUMA DIANA");
            MpesaApi.Cust c = new MpesaApi.Cust();
            c.customer_key = "ANIDUOF2QtUkQZc3PSQKXPj47X0lXDzAujSLISdkn41yHbW6";
            c.customer_secret = "adQKotoAyEyV2b0AqfeerjuqG9pbtL541pSPpqmA0UJHp31qAVfsLHVfncAuWCIg";
            c.ShortCode = "5428730";
            MpesaApi.MpesaApi m = new MpesaApi.MpesaApi(c);
            string ok = "";
            //MpesaApi.stkpush r = new MpesaApi.stkpush();
            //r.passkey = "8d777e028006665355e1ee4d11a1a0e656ad53c2085f7bd63c5b0d8417e06ab9";
            //r.BusinessShortCode = "371888";
            //r.TransactionType = "CustomerPayBillOnline";
            //r.Amount = 10;
            //            r.PartyA = "254710563359";
            //r.PartyB = r.BusinessShortCode;
            //r.PhoneNumber = r.PartyA;// "254710563359";
            //r.CallBackURL = "https://197.155.74.209:806/Deposit.svc/stkpush";
            //r.AccountReference = "Test";
            //r.TransactionDesc = "Test";
            //var sp = m.Stkpush(r);

            //    var shortcodes = new List<(string shortcode, string customerKey, string customerSecret)>
            //{
            //    ("5428732", "Ywm2SlsNJTAsoFG2WoSgkcYG8APVywjP9cKQAigyWpT87aBb", "1SAndcIjBfCHN9mZ7CtuFBIwAGV6GDDoCDGJZxdoLVOrzkeGz7eUe8Nw908VbbA4"),
            //    ("5428734", "OCKk5ps6i7XAfjzU3WtUKsmIyApF1MldxUSj7KRQ25NA7kHG", "u0ANzC1n4qmX7aegDgHy5iGIqPUYt5QCvV7HhrSOxQizhrYdGWcasLCaBTaRhUGA"),
            //    ("5428736", "7hE3OAy0b6II1RMSAirX7n563G1cWvjMg78elAnGOxFUyBbk", "uhHb7KA4QtAIaSGjyKsuxAawXXH6sWz4ziHBcTnK4ZY4VmIXI40uyKH0PA9eqMwP"),
            //    ("5428738", "8Ct44S5QxdWfTVhB9PsBFgoATAIyppM22K25vHLWepyMoNGk", "FATxrz0ajYQaRozhcGS9IsK8kBOHthT6OFGJRbWrHXKzQnOnfyG2KMjiWUywlp4F"),
            //    ("5428740", "Niruk36ISCC26CgNOWANYD0nLggVgMDQHAy6EDs5GAIkYP8n", "sF5Ddhq2YqiRX9eYmHGfjGxHWVs78qdVGB0NyfFCq9lxgDpwyVv2igOjNaQl9mdt"),
            //    ("5428742", "DwNLRAFy6S1IAPZ6vXTanTMCcRu5EfeN2uGo0EhOPG4shes6", "Ci98Svz50ApppG5OsxxCFO1v2Sw7itmOSxiHaiAOymipDhmAGWaceg02rauUN2pU"),
            //    ("5428744", "ADRjhNvuC6hNBdyrGCtKjgrbkWvJAuSGDFPAcPK8wU58Z7EI", "GtAm2iwfwF8SmdDXfnFdhn7VsAX3Y3A9onEqTdzZA6eL5kKh3sfYFsVSIB0Xn1Sc"),
            //    ("5428746", "7XBL9mf2AAHUEIitAB0go7xwVBYbX1nbpBQ8XpPkj5Wfs2ks", "S9ky1npgBn82zOKQKIR55hQtserDHmeRPEIx1LqPxqffpcSGlEkFyQu1MksKon5A"),
            //    ("5428748", "y8nbYYbI7LyoAjIJSGjijkiCqjiWLeJW0yGbpKoIFhxFi1KV", "hHmCxi7rpgcRsl7uiipRiNQr8y7GSoYpj1pTGCkg6GxDDG8f2vzvcvm7GGyo4l5y"),
            //    ("5428750", "jwxX5L6bJrh3JcPGDpIyaIXsg3SkCqkh2AUpYAw9G6xHQpJe", "eogcy3T1PhITJ7lf56gAyw7cGJchcGEuy3DHSR5eca9aT9qoLce9S7uknwlxuGf7"),
            //    ("5428752", "YeYcprLrTJRO7vkA5sntGopaC7V7JAS58BalWG11aUrHoDv0", "85kfUtuGAhP7jyjwAAfaBjBGNDBS7LmFe5OGoFwe8TEsIKZ4MPvZrtL1VXOeLzY2"),
            //    ("5428754", "afnJJzi2aZquC1GCUBzppMQB9wwARfhzl7NfnT3ZuGqfhKEx", "667TZS5YGY57E93xUMZWywaAlAA6pzTtWlOTNTAr9LD1DlGtENvqXVZu1wSXFNmB"),
            //    ("5428756", "6C5fzqGtVPAaasbmluc8smmumnLf7AWQzi5RBLQ3LbRpQ9pk", "GvIocXUcsowhtMb9rnyGhAUv8VUUE6CTFsECGPrG3Jw0ofNbDSk69muqcco4Zvv6"),
            //    ("5428758", "CY0NNZofRsreoJgoCk9lWp6JANccNEUhlFi9GwE2n97hbT9f", "nLjoG40VAVFyTWiGudECpGldsITQcHPSvUeaLK6fGIDMnz70UHpm6sVGKaxAymII"),
            //    ("5428760", "2ccCpy7llPkpuzBo50tnxLcxBNPItYrA6rYldkzvbjG4jxhK", "Rwgnq2myA25uM4JM30tZ2GkIIvK7XCQmcJUhGKAtZo8lIpFsTN0GWcTjAhQcDnfW"),
            //    ("5428762", "0bQMeBmZeGTcyBegOnnE18qym3NUUSqAh8COljAuddUGxk2j", "pz5nfHg4Zzb56a2P1VSc17FRejIItEyDNy8o7fNWdvTVAOEIYenEQd1bvNpatSuF"),
            //    ("5428764", "kcOPzI78gdLOAEAwMohhRQny21lw94nH72NAWtRshpKPesi0", "a8WAuQPXTPorZrzY3vTAQMT9MhA2smgCAl6F2MK6tTClsGuzBNc16ffzbQvN2N21"),
            //    ("5428766", "SSrKyaoHb2vnOvRBy7GZwGaAmLWVtzzuF7CeCIQjFrCQ8QYI", "3lUY0i4HaGgHm9FfX2ZzuGPEOK8bcUA267bjNMwDEFQnsL5GpoC8JowbStxRJlqo"),
            //    ("5428770", "bAWCz7xGFdqct45f1cBLC3HQG5lEyAbnZgVxB01egsDjAnSu", "qPOjkNkHl7G2GYJe87CeYcIMkASSGAiP08fDldajagTiFDH7nn7riLhIGDrLZiTw"),
            //    ("5428772", "rwHtGoUAwrE6EakuRhJsGR5hwXXx4kxXJyOoXrS8fJggWYVn", "SIiq8BGN22AxsgOc4IOIYQGAyARntCMduQ8GUi4hjTTkMcntYJnoXUO8jh5EAizq"),
            //    ("5428774", "SGb7Cpi06PTXGQfHGoEXCWjpv97Xcsiu3YZCxdkilItOVJew", "e07iu4ajvanmX3YQ8q50uhNfMV5wKe5YN9TjkJD6CKwq6wywvoAmfNdQrqB963T9"),
            //    ("5428776", "Pmf4LatvCFPVIS7lmNG6ZcQV0FYuPAD2DOlIqQxnpCq3oVLv", "wwlCO53BAhy3I90SECQ5uwXf4HLClvxNbZeiw40Dtcf9R5gggbmV2cwAn2Gvosjk"),
            //    ("5428778", "h1FlHMRxoMpNmaSAOK2HxAlYG0dduLie5OrUz1Cz7Pt64ADh", "jNiAjGGubZdIiKIN3YOL5sYAbwbKBjYDgNcV9cWJVAxj5kGbAGu1UwFBZNzePAKe"),
            //    ("5428780", "c0h5CLhWg2qjA9xwNH85Qf5lfY4oJl6c11T2EaiCqvMD6HAi", "dNsuYQkhDImEIaHYWS1L3FfmX5WosjsS8oyyGablQFMytyG5pQoEJV1ZnQYLlwgY"),
            //    ("5428782", "n5tWJWdyzAG4kA1yzKh5z8lr8A12aEJK2Bm3cOjusrD4krHl", "WPuVFc4cTAIVHb5ODASlAOMhtb9zIs863GpyjPyOyWixCNYqzgpoDJQwLYPf06qh"),
            //    ("5428784", "8pWHY4C9IJHkg0UfZjNwBeTX9Vm56rPjcKHxDZdQBoUg8rSM", "lCfwmhobAX5vBDUkAIq6h5go0AjyXsv180aA0etCgdm7Z7N1FerojBEf0Rr67bpQ"),
            //    ("5428786", "kJAV4xkvUMjt4JJq5AOxVBAotG9odRVcOMzY26rD0hsZ7eHm", "sMtLup4Cs0pmbLmSPbNA3uzqSCKWRGA2fYTg49zGtAzZtAcWgAoalj2vPmwZOhwj"),
            //    ("5428788", "s0Rhd5PDlBHXEMhUGk0ImgTSfVaWuAXtBhq4J4km2LECa8ls", "oSOcUQcpzIzBIPsSB8ypYy3BP3GlEHeLAUADLxq2UmhYzl7ifXpXmrOxvouAzaxI"),
            //    ("5428790", "iCGUNohHyPV5j0joW1hAKfwFyZA7otAnaQ8PcNMWuEzfUpxu", "f3wd1bcLZTdsOMSllcfdVrGT6tadHpagyXAOYGEH1irdpKok0nQWDsDVnAM8na1N"),
            //    ("5428792", "O7XcDNOimgeEGCHNGJQOJIMMJN9C2prs7LF75NTpPCkl8jkb", "omswVd3YylvvugA99GjbEhuArTGeONTrfEbZb2bEWnEVHveF69dsQ7s8DTIjnIln"),
            //    ("5428794", "7RRXufH9cW9uqO1ogmek9uMBjj3wWzCXzkvaVPoNQPOU7xjP", "gBcGnKXEMczBX6fPNVgScMfJAjSTKQcNhc6oG5IShhMJE3OsqI5uEZVD7szGNlPr"),
            //    ("5428796", "3mbqeflH20SXUYdvXtkyxTviELemMJ0mFLxFlC1HSgOOQrng", "9WviIj5KlKqyu9hYBNUvzMALAhtdUe02YGIfFB5UGMdBAqIsIGnZc6MNHl5I8Sme"),
            //    ("5428798", "rh8AvmzsgD4xFDmsbPlM7GKHVWASkqXqwKPqA2ROPo1hxLUY", "XgGTB5osmqF9X02VqdKaYnNvGdImwaoJqZQvGJezcLZ1wZ1RstXnDzTL7O0zFFuV")
            //};
            //    foreach (var (shortcode, customerKey, customerSecret) in shortcodes)
            //    {
            //        var cust = new MpesaApi.Cust
            //        {
            //            customer_key = customerKey,
            //            customer_secret = customerSecret
            //        };
            //          var mpesa = new MpesaApi.MpesaApi(cust);
            //        var res =  mpesa.Registers(shortcode);
            //        Console.WriteLine($"Shortcode: {shortcode}, Result: {res.Result.Content}");
            //    }
            // MpesaApi.Cust c = new MpesaApi.Cust();

            //   c.customer_key = "SgVXB4NveYzn1t3UaTAfTYwaJTNPhZTSjAVKnGRrWMHYu6y2";
            //   c.customer_secret = "FpouwVP6SVYKG6xoQA6aL9lNELfRBdXzpe6T2mUj1kS8fGmzZ3md21Chg1Ygkp9T";
            //   MpesaApi.MpesaApi mpesa = new MpesaApi.MpesaApi(c);
            //var res =   mpesa.Registers("5428768");




            //MpesaApi.Cust c = new MpesaApi.Cust();
            //c.initiator = "Openvalley";
            //c.customer_key = "jQbmjijzhrBq499Ug8GzpCQjnwKVsvBMQ6iat1z4DAli9vR4";
            //c.customer_secret = "VEiS3clIrPJUPCYIPhkO8a8pBwRLs1TGs1kyBxMX8mW5KLKvWRnnB8LL6vPBKWfA";

            //MpesaApi.MpesaApi mpesa = new MpesaApi.MpesaApi(c);
              //var d = m.author.access_token;
            //var mm=  m.auth(c);
            //Console.WriteLine(d);
            //string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
            //string passkey = "b5ffc1d4e3af18db10b213219b71c528b244eeb4fe9c91db4b93bc9cc7606a68";


            //string p = string.Format("4018311{0}{1}", passkey, timestamp);
            //var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(p);
            //String pass= System.Convert.ToBase64String(plainTextBytes);


        }
        private static int matchnames(string name1, string iprs)
        {
            var n1 = name1.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            var n2 = iprs.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            List<string> result = n2.Where(item =>
    n1.Any(category => category.Equals(item))).ToList();
            return result.Count();
        }
    }
}
