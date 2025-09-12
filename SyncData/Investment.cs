using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Permissions;
using System.Text;
using System.Web.UI.WebControls;

namespace SyncData
{
    class Investment
    {
        private static System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        MemberCredits.MemberCredits_Service MemberCredits_Service = new MemberCredits.MemberCredits_Service();
        Intrasoft.ProfitsExtGateway intrasoft;
        Inv.NAV nav = new Inv.NAV(new Uri("http://5.189.167.52:1177/Investment/OData/Company('KPS-TEST')"));
        Imprest_Profits.Imprest_Profits_Service Imprest_Profits_Service = new Imprest_Profits.Imprest_Profits_Service();
        Channels.Channels channels ;
        public Investment()
        {
            ServicePointManager.ServerCertificateValidationCallback +=
     (sender, cert, chain, sslPolicyErrors) => true;
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\Settings.config";
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.investsettings.Username, s.investsettings.pass, s.investsettings.domain);
            nav = new Inv.NAV(new Uri(String.Format("http://{0}:{1}/{2}/OData/Company('{3}')", s.investsettings.Server, s.investsettings.Port, s.investsettings.Instance, s.investsettings.Companyname)));
                nav.Credentials = cd;

            MemberCredits_Service = new  MemberCredits.MemberCredits_Service { Url = geturl(s, MemberCredits_Service.Url), Credentials = cd, PreAuthenticate = true };
            Imprest_Profits_Service = new Imprest_Profits.Imprest_Profits_Service { Url = geturl(s, Imprest_Profits_Service.Url), Credentials = cd, PreAuthenticate = true };
           
            
          // intrasoft = new Intrasoft.ProfitsExtGateway();
          
        }
        public void start()
        {
            intrasoft = new Intrasoft.ProfitsExtGateway();
            channels = new Channels.Channels();
 channels = new Channels.Channels { Url = geturl(s, channels.Url), Credentials = cd, PreAuthenticate = true };
            if (s.investsettings.active)
            {
                intrasoft.Url = s.profits.url;
                while (Program.stop == false)
                {
                    try
                    {
                        Refunds();
                        Reversal();
                        post();
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                    System.Threading.Thread.Sleep(s.othersettings.PostIntervalinsec * 1000);
                }
            }
        }
        public void post()
        {

            try
            {
                channels.Post();
            
            }
            catch (Exception ex) {

                Logging.Logging.ReportError(ex);
            }
        }


        public void Refunds()
        {
            try
            {
                Logging.Logging.LogEntryOnFile(intrasoft.Url);
                var mcredits = MemberCredits_Service.ReadMultiple(new MemberCredits.MemberCredits_Filter[] { new MemberCredits.MemberCredits_Filter { Criteria = "OutGoing", Field = MemberCredits.MemberCredits_Fields.Int_Direction }, new MemberCredits.MemberCredits_Filter { Criteria = "Yes", Field = MemberCredits.MemberCredits_Fields.Posted }, new MemberCredits.MemberCredits_Filter { Criteria = "Pending", Field = MemberCredits.MemberCredits_Fields.Sent } }, null, 0);
                
                foreach (var i in mcredits.ToList())
                {
                    try
                    {
                       
                        if (string.IsNullOrEmpty(i.Profits_Member_No))
                        {
                            i.Sent = MemberCredits.Sent.Failed;
                            i.SentSpecified = true;
                            i.Comments = "Profits Member No is Blank";
                            var iii = i;
                            MemberCredits_Service.Update(ref iii);
                            continue;
                        }

                        Intrasoft.ExtExecParameters head = header();
                        head.ReferenceKey = DateTime.Now.Ticks.ToString();

                        Intrasoft.Prt099VCustomerAccountsListImport ci = new Intrasoft.Prt099VCustomerAccountsListImport();
                        ci.InCustomerCustomerCustId = Convert.ToInt32(i.Profits_Member_No);//110157
                        ci.InCriteriaCustomerTypeCustomerSearch = "1";
                        ci.InSelectedProductProductIdProduct = 0;
                        ci.InSelectedSystemProfitsAccountPrftSystem = 3;
                        Logging.Logging.LogEntryOnFile(String.Format("----\nGet Fosa account > {0} -- {1}\n", i.Entry_No, DateTime.Now));
                        Logging.Logging.CreateXML(head);
                        Logging.Logging.CreateXML(ci);
                        Logging.Logging.LogEntryOnFile(String.Format("\n"));
                        var c = intrasoft.Prt099V_CustomerAccountsList(ci, head);
                        Logging.Logging.LogEntryOnFile(String.Format("Get Fosa account Response> {0} -- {1}\n", i.Entry_No, DateTime.Now));
                        Logging.Logging.CreateXML(c);
                        Logging.Logging.LogEntryOnFile(String.Format("\n\n"));


                        head = header();
                        head.ReferenceKey = DateTime.Now.Ticks.ToString();

                        if (c.Result.Type == Intrasoft.EvaluationType.Success)
                        {
                            var fosa = c.OutSelectedGrp.FirstOrDefault(o => o.OutSelectedGrpOutGrmProfitsAccountProductId == 32401);
                            if (fosa != null)
                            {
                                var bp = Bankparameters();
                                Intrasoft.FEXS01_FundsTransferWithExchangeImport r = new Intrasoft.FEXS01_FundsTransferWithExchangeImport();
                                r.Command = "INSERT";//Command=
                                r.InAuthorIefSuppliedFlag = "1";//InAuthorIefSuppliedFlag=
                                r.InBlackListIefSuppliedExchangePurchaseDocNo = "";//InBlackListIefSuppliedExchangePurchaseDocNo=
                                r.InBoughtAmountIefSuppliedCheckDigit = 0;//InBoughtAmountIefSuppliedCheckDigit=
                                r.InBoughtAmountIefSuppliedPayableAmount = Math.Abs(Math.Round(i.Amount, 2));// 110157;//InBoughtAmountIefSuppliedPayableAmount=
                                r.InSoldProfitsAccountNumber = fosa.OutSelectedGrpOutGrmProfitsAccountAccountNumber.Trim(); // "3200000050";//InBoughtProfitsAccountNumber= //InSoldProfitsAccountNumber=
                                r.InBoughtProfitsAccountNumber = i.Profits_Debit_Account;// "50201675400";//debits account
                                r.InBoughtProfitsAccountCd = 0;//InBoughtProfitsAccountCd=
                                r.InBoughtProfitsAccountPrftSystem = 3;//InBoughtProfitsAccountPrftSystem=
                                r.InBoughtDepositAccountDesignation = "";//InBoughtDepositAccountDesignation=
                                r.InBoughtDepositAccountEntryStatus = "";//InBoughtDepositAccountEntryStatus=
                                r.InBoughtIbanWorkSetChar37 = "";//InBoughtIbanWorkSetChar37=
                                r.InBoughtJustificIdJustific = 34001;//InBoughtJustificIdJustific=
                                r.InBoughtPrftTransactionIdTransact = 3191;//InBoughtPrftTransactionIdTransact=
                                r.InBoughtRepCustomerCDigit = 0;//InBoughtRepCustomerCDigit=
                                r.InBoughtRepCustomerCustId = 0;//InBoughtRepCustomerCustId=
                                r.InBoughtValueDaysIefSuppliedValueDays = 0;//InBoughtValueDaysIefSuppliedValueDays=
                                r.InBoughtValueWorkDatesProductionDate = bp.OutBankParametersCurrTrxDate;//InBoughtValueWorkDatesProductionDate=
                                r.InChargesAccountIefSuppliedFlag = "1";//InChargesAccountIefSuppliedFlag=
                                r.InChargesDiscountIefSuppliedGenPercentage = 0;//InChargesDiscountIefSuppliedGenPercentage=
                                r.InChequeBookItemIssueDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;//.Now;//InChequeBookItemIssueDate=
                                r.InChequeBookItemItemSerialNumber = 0;//InChequeBookItemItemSerialNumber=
                                r.InCommentsGenericDetailDescription = "";//InCommentsGenericDetailDescription=
                                r.InCommentsGenericDetailSerialNum = 0;//InCommentsGenericDetailSerialNum=
                                r.InCommissionsDiscountIefSuppliedGenPercentage = 0;//InCommissionsDiscountIefSuppliedGenPercentage=
                                r.InCreditDepTrxRecordingIComments = (i.Posting_Description.Length > 40 ? i.Posting_Description.Substring(0, 39) : i.Posting_Description);// "Refunds";//InCreditDepTrxRecordingIComments=
                                //r.InExportPostingInGrpFxFtRecordingComments = i.Posting_Description;
                                r.InCustAdditionalCustomerTelephone1 = "";//InCustAdditionalCustomerTelephone1=
                                r.InCustAddressAddress1 = "";//InCustAddressAddress1=
                                r.InCustAddressAddress2 = "";//InCustAddressAddress2=
                                r.InCustAddressCity = "";//InCustAddressCity=
                                r.InCustAddressZipCode = "";//InCustAddressZipCode=
                                r.InCustCountryGenericDetailDescription = "";//InCustCountryGenericDetailDescription=
                                r.InCustCountryGenericDetailSerialNum = 0;//InCustCountryGenericDetailSerialNum=
                                r.InCustListSetDescription = "";//InCustListSetDescription=
                                r.InCustNationalityGenericDetailDescription = "";//InCustNationalityGenericDetailDescription=
                                r.InCustNationalityGenericDetailParameterType = "";//InCustNationalityGenericDetailParameterType=
                                r.InCustNationalityGenericDetailSerialNum = 0;//InCustNationalityGenericDetailSerialNum=
                                r.InCustOtherAfmAfmNo = "";//InCustOtherAfmAfmNo=
                                r.InCustomerCDigit = 0;//InCustomerCDigit=
                                r.InCustomerCustId = 110157;//InCustomerCustId=
                                r.InDealerPenaltyUsrCode = "";//InDealerPenaltyUsrCode=
                                r.InDealerSpecialRateDealerRefNo = "";//InDealerSpecialRateDealerRefNo=
                                r.InDealerUsrCode = "";//InDealerUsrCode=
                                r.InDebitDepTrxRecordingIComments = (i.Posting_Description.Length > 40 ? i.Posting_Description.Substring(0, 39) : i.Posting_Description); ;// "";//InDebitDepTrxRecordingIComments=
                                r.InDepositCDigitIefSuppliedCheckDigit = 0;//InDepositCDigitIefSuppliedCheckDigit=
                                r.InFwdSwapContractsContractDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;//InFwdSwapContractsContractDate=
                                r.InFwdSwapContractsCurrencyRate = 0;//InFwdSwapContractsCurrencyRate=
                                r.InFwdSwapContractsDealerRefNo = "";//InFwdSwapContractsDealerRefNo=
                                r.InFwdSwapContractsEntryComments = "";//InFwdSwapContractsEntryComments=
                                r.InFwdSwapContractsEntryStatus = "";//InFwdSwapContractsEntryStatus=
                                r.InFwdSwapContractsExecDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;//InFwdSwapContractsExecDate=
                                r.InFwdSwapContractsMaturityDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;//InFwdSwapContractsMaturityDate=
                                r.InFwdSwapContractsNotificationDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;//InFwdSwapContractsNotificationDate=
                                r.InFwdSwapContractsOrgSourceAmount = 0;//InFwdSwapContractsOrgSourceAmount=
                                r.InFwdSwapContractsOrgTargetAmount = 0;//InFwdSwapContractsOrgTargetAmount=
                                r.InFwdSwapContractsReferenceNo = 0;//InFwdSwapContractsReferenceNo=
                                r.InFwdSwapContractsSourceUtilBal = 0;//InFwdSwapContractsSourceUtilBal=
                                r.InFwdSwapContractsStartDate = new DateTime(0001, 01, 01, 00, 00, 00);//DateTime.Now;//InFwdSwapContractsStartDate=
                                r.InFwdSwapContractsTargetUtilBal = 0;//InFwdSwapContractsTargetUtilBal=
                                r.InFwdSwapContractsWayOfUtilization = "";//InFwdSwapContractsWayOfUtilization=
                                r.InGenericIdIefSuppliedIdentificationType = "";//InGenericIdIefSuppliedIdentificationType=
                                r.InGenericIdIefSuppliedIdentityPassportNo = "";//InGenericIdIefSuppliedIdentityPassportNo=
                                r.InGenericIdIefSuppliedIssueAuthority = "";//InGenericIdIefSuppliedIssueAuthority=
                                r.InGrpParametersInGrmBankParametersMaxAmntRateTbl = 0;//InGrpParametersInGrmBankParametersMaxAmntRateTbl=
                                r.InGrpParametersInGrmGenericDetailSerialNum = 0;//InGrpParametersInGrmGenericDetailSerialNum=
                                r.InGrpParametersInGrmTerminalTerminalNumber = "172.21.46.243";//InGrpParametersInGrmTerminalTerminalNumber=
                                r.InGrpParametersInGrmTrxCountTrxCounter = 0;//InGrpParametersInGrmTrxCountTrxCounter=
                                r.InGrpParametersInGrmWorkDaysWorkDatesProductionDate = bp.OutBankParametersCurrTrxDate;//InGrpParametersInGrmWorkDaysWorkDatesProductionDate=
                                r.InIdentCountryGenericDetailDescription = "";//InIdentCountryGenericDetailDescription=
                                r.InIdentCountryGenericDetailSerialNum = 0;//InIdentCountryGenericDetailSerialNum=
                                r.InJustificIdJustific = 9108;//InJustificIdJustific=
                                r.InOtherIdIdNo = "";//InOtherIdIdNo=
                                r.InPenaltyDealerSpecialRateDealerRefNo = "";//InPenaltyDealerSpecialRateDealerRefNo=
                                r.InPostIefSuppliedFlag = "Y";//InPostIefSuppliedFlag=
                                r.InPrftTransactionIdTransact = 11041;//InPrftTransactionIdTransact=
                                r.InProductIdProduct = 9102;//InProductIdProduct=
                                r.InResidentIefSuppliedFlag = "";//InResidentIefSuppliedFlag=
                                r.InSoldAmountIefSuppliedPayableAmount = 0;//InSoldAmountIefSuppliedPayableAmount=
                                r.InSoldAvailabilityDaysIefSuppliedValueDays = 0;//InSoldAvailabilityDaysIefSuppliedValueDays=
                                r.InSoldAvailabilityWorkDatesProductionDate = bp.OutBankParametersCurrTrxDate;//InSoldAvailabilityWorkDatesProductionDate=

                                r.InSoldProfitsAccountCd = 0;//InSoldProfitsAccountCd=
                                r.InSoldProfitsAccountPrftSystem = 3;//InSoldProfitsAccountPrftSystem=
                                r.InSoldDepositAccountDesignation = "";//InSoldDepositAccountDesignation=
                                r.InSoldDepositAccountEntryStatus = "";//InSoldDepositAccountEntryStatus=
                                r.InSoldIbanWorkSetChar37 = "";//InSoldIbanWorkSetChar37=
                                r.InSoldJustificIdJustific = 33100;//InSoldJustificIdJustific=
                                r.InSoldPrftTransactionIdTransact = 3181;//InSoldPrftTransactionIdTransact=
                                r.InSoldRepCustomerCDigit = 0;//InSoldRepCustomerCDigit=
                                r.InSoldRepCustomerCustId = 0;//InSoldRepCustomerCustId=
                                r.InSoldValueDaysIefSuppliedValueDays = 0;//InSoldValueDaysIefSuppliedValueDays=
                                r.InSoldValueWorkDatesProductionDate = bp.OutBankParametersCurrTrxDate;//InSoldValueWorkDatesProductionDate=
                                r.InSpecialRateTableIefSuppliedFlag = "";//InSpecialRateTableIefSuppliedFlag=
                                r.InTrxFxFtRecordingSourceTrnType = "";//InTrxFxFtRecordingSourceTrnType=
                                r.InTrxFxFtRecordingTargetTrnType = "";//InTrxFxFtRecordingTargetTrnType=
                                r.InUseWayIefSuppliedFlag = "";//InUseWayIefSuppliedFlag=

                                Logging.Logging.LogEntryOnFile(string.Format("Refunds Request - {0}", i.Document_No));
                                Logging.Logging.CreateXML(head);
                                Logging.Logging.CreateXML(r);
                                var d = intrasoft.FEXS01_FundsTransferWithExchange(r, head);
                                Logging.Logging.LogEntryOnFile(string.Format("Response - {0}", i.Document_No));
                                Logging.Logging.CreateXML(d);

                                switch (d.Result.Type)
                                {
                                    case Intrasoft.EvaluationType.Success:
                                        i.Sent = MemberCredits.Sent.Sent;
                                        i.SentSpecified = true;
                                        i.Comments = "";
                                        i.TrxDate = d.OutSuccessfulTransactionWorkTrxDate;
                                        i.TrxDateSpecified = true;
                                        i.TrxSn = d.OutSuccessfulTransactionWorkTrxUsrSn;
                                        i.TrxSnSpecified = true;
                                        i.TrxUsr = d.OutSuccessfulTransactionWorkTrxUser;
                                        i.TrxUnit = d.OutSuccessfulTransactionWorkTrxUnit;
                                        i.TrxUnitSpecified = true;
                                        break;
                                    case Intrasoft.EvaluationType.Unknown:
                                        Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Document_No, d.Result.Message));
                                        i.Comments = d.Result.Message;
                                        break;
                                    default:
                                        Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Document_No, d.Result.Message));
                                        i.Sent = MemberCredits.Sent.Failed;
                                        i.SentSpecified = true;
                                        i.Comments = d.Result.Message;
                                        break;
                                }

                            }

                            else
                            {
                                i.Sent = MemberCredits.Sent.Failed;
                                i.SentSpecified = true;
                                i.Comments = "Fosa Account Not Found";

                            }
                        }
                        else
                        {
                            i.Sent = MemberCredits.Sent.Failed;
                            i.SentSpecified = true;
                            i.Comments = c.Result.Message;

                        }

                        var ii = i;
                        MemberCredits_Service.Update(ref ii);
                      
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }
            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
         
        }
        public void Reversal()
        {
            try
            {
                // Logging.Logging.LogEntryOnFile(intrasoft.Url);
                //intrasoft.Url = s.profits.url;

                var mcredits = MemberCredits_Service.ReadMultiple(new MemberCredits.MemberCredits_Filter[] { new MemberCredits.MemberCredits_Filter { Criteria = "OutGoing", Field = MemberCredits.MemberCredits_Fields.Int_Direction }, new MemberCredits.MemberCredits_Filter { Criteria = "Yes", Field = MemberCredits.MemberCredits_Fields.Posted }, new MemberCredits.MemberCredits_Filter { Criteria = "Yes", Field = MemberCredits.MemberCredits_Fields.Reversal }, new MemberCredits.MemberCredits_Filter { Criteria = "Pending", Field = MemberCredits.MemberCredits_Fields.Reversed } }, null, 0);


                foreach (var i in mcredits.ToList())
                {
                    try
                    {
                        if (string.IsNullOrEmpty(i.TrxDate.ToString()) || string.IsNullOrEmpty(i.TrxUsr))
                        {
                            i.Sent = MemberCredits.Sent.Failed;
                            i.SentSpecified = true;
                            i.Comments = "Missing Reversal data";
                            var iii = i;
                            MemberCredits_Service.Update(ref iii);
                            continue;
                        }

                        Intrasoft.ExtExecParameters head = header();
                        head.ReferenceKey = DateTime.Now.Ticks.ToString();


                        Intrasoft.FEXS23_OutgoingOrderIssuanceCancellationImport rev = new Intrasoft.FEXS23_OutgoingOrderIssuanceCancellationImport();
                        rev.Command = "INSERT";
                                             
                        rev.InAuthorIefSuppliedFlag = "1";
                        rev.InFxFtRecordingComments = "Reversal";
                        rev.InFxFtRecordingTrxDate = i.TrxDate ;
                        rev.InFxFtRecordingTrxSn = i.TrxSn;
                        rev.InFxFtRecordingTrxUnit = i.TrxUnit;
                        rev.InFxFtRecordingTrxUsr = i.TrxUsr;
                       
                        rev.InPrftTransactionIdTransact = 3311;
                        rev.InParametersInBankParametersRateUsage = "1";
                        rev.InParametersInGenericDetailSerialNum = 0;
                        rev.InParametersInTerminalTerminalNumber = "10.240.228.52";
                        rev.InPrftTransactionIdTransact = 11161;
                        rev.InSecPrftTransactionIdTransact = 11161;

                        Logging.Logging.CreateXML(head);
                        Logging.Logging.CreateXML(rev);
                        Logging.Logging.LogEntryOnFile(String.Format("\n"));
                        var r = intrasoft.FEXS23_OutgoingOrderIssuanceCancellation(rev, head);
                        Logging.Logging.LogEntryOnFile(String.Format("\nReversal Response> {0} -- {1}\n", i.Entry_No, DateTime.Now));
                        Logging.Logging.CreateXML(r);
                        Logging.Logging.LogEntryOnFile(String.Format("\n\n"));


                        switch (r.Result.Type)
                        {
                            case Intrasoft.EvaluationType.Success:
                                i.Reversed = MemberCredits.Reversed.Sent;
                                i.ReversedSpecified = true;
                                i.Comments = "";

                                break;
                            case Intrasoft.EvaluationType.Unknown:
                                Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Document_No, r.Result.Message));

                                i.Comments = r.Result.Message;
                                break;
                            default:
                                Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Document_No, r.Result.Message));
                                i.Reversed = MemberCredits.Reversed.Failed;
                                i.ReversedSpecified = true;
                                i.Comments = r.Result.Message;
                                break;
                        }



                        var ii = i;
                        MemberCredits_Service.Update(ref ii);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }
            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging. settings s, string page)
        {
            var ss = s.investsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }

        private Intrasoft.ExtExecParameters header() {
            Intrasoft.ExtExecParameters head = new Intrasoft.ExtExecParameters();
            head.ChannelId = 9912;
            head.Password = "!*#IANSOFT*#!";
            head.UniqueId = "";
            head.CultureName = "en";
            head.ForcastFlag = false;
            head.ReferenceKey = "";
            head.SotfOtp = "";
            head.BranchCode = "";
            head.ExtUniqueUserId = "IANSOFT";
            //head.ExtUniqueUserId =  Logging.Randomize.RandomString(5);//"IANSOFT";
            head.ExtDeviceAuthCode = "";


            Intrasoft.GetAuthorizedImport authorizedImport = new Intrasoft.GetAuthorizedImport();
            var res = intrasoft.CI3499V_GetAuthorized(authorizedImport, head);
            if (res.Result.Type == Intrasoft.EvaluationType.Success)
                head.UniqueId = res.UniqueId;
            return head;
        }
private Intrasoft.L0701VGetBankParametersExport Bankparameters() {
            Intrasoft.L0701VGetBankParametersImport head = new Intrasoft.L0701VGetBankParametersImport();
            head.InCommandIefSuppliedCommand = "RETRIEVE";// 9912;
            head.InTrxTrxRecoveryGrpSubscript = 0;
            head.InTrxTrxRecoveryPrftSystem = 0;
            head.InTrxTrxRecoveryTrxUsrSn = 0;
            head.InTrxTrxRecoveryTunInternalSn = 0;
            var h = header();
            h.ReferenceKey = DateTime.Now.Ticks.ToString();
            var res = intrasoft.L0701V_GetBankParameters(head, h);
           
            return res;
        }

    }

}
