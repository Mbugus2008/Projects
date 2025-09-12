using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;

namespace SyncData
{
    class Erp
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();

        Intrasoft.ProfitsExtGateway intrasoft;
        NAV.NAV nav = new NAV.NAV(new Uri("http://5.189.167.52:1278/KpsErp/OData/Company('KPS%20Test')"));

        Erp_Payroll_Profits.Payroll_Profits_Service Payroll_Profits_Service = new Erp_Payroll_Profits.Payroll_Profits_Service();
        GL_Account.GL_Account_Service GL_Account_Service = new GL_Account.GL_Account_Service();
        Imprest_Profits.Imprest_Profits_Service Imprest_Profits_Service = new Imprest_Profits.Imprest_Profits_Service();
        public Erp()
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\Settings.config";
            s = s.loadsettings(path);
            
            cd = new System.Net.NetworkCredential(s.erpsettings.Username, s.erpsettings.pass, s.erpsettings.domain);
            nav = new NAV.NAV(new Uri(String.Format("http://{0}:{1}/{2}/OData/Company('{3}')", s.erpsettings.Server, s.erpsettings.Port, s.erpsettings.Instance, s.erpsettings.Companyname)));
            nav.Credentials = cd;
            Payroll_Profits_Service = new Erp_Payroll_Profits.Payroll_Profits_Service { Url = geturl(s, Payroll_Profits_Service.Url), Credentials = cd, PreAuthenticate = true };
            GL_Account_Service = new GL_Account.GL_Account_Service { Url = geturl(s, GL_Account_Service.Url), Credentials = cd, PreAuthenticate = true };
            Imprest_Profits_Service = new Imprest_Profits.Imprest_Profits_Service { Url = geturl(s, Imprest_Profits_Service.Url), Credentials = cd, PreAuthenticate = true };
        }
        public void test()
        {
            intrasoft = new Intrasoft.ProfitsExtGateway();
            intrasoft.Url = s.profits.url;
            Sendimprest();
            Reversal();
        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging.settings s, string page)
        {
            var ss = s.erpsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }
        public void start()
        {
            try
            {
                Logging.Logging.LogEntryOnFile(string.Format("Starting Erp Service"));
                if (s.erpsettings.active)
                {                     
                  intrasoft = new Intrasoft.ProfitsExtGateway();
                  intrasoft.Url = s.profits.url;
                    while (Program.stop == false)
                    {
                        while (Program.stop == false)
                        {
                            try
                            {
                                if (DateTime.Now.Date < new DateTime(2021, 05, 30))
                                {
                                    Sendaccounts();
                                    Sendimprest();
                                    Sendpayroll();
                                    Reversal();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logging.Logging.ReportError(ex);
                            }
                            System.Threading.Thread.Sleep(s.othersettings.PostIntervalinsec * 1000);
                        }
                    }
                }
                else
                {
                    Logging.Logging.LogEntryOnFile(string.Format("Erp Service not active"));
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
        }
        public void Sendimprest()
        {
            try
            {
                //   Intrasoft.ExtExecParameters heads = header();

                var imprest = Imprest_Profits_Service.ReadMultiple(new Imprest_Profits.Imprest_Profits_Filter[]
                {new Imprest_Profits.Imprest_Profits_Filter{ Criteria = "Pending", Field = Imprest_Profits.Imprest_Profits_Fields.Status } }, null, 0);

                foreach (Imprest_Profits.Imprest_Profits i in imprest.ToList())
                {
                    try
                    {
                        Intrasoft.ExtExecParameters head = header();
                        head.ReferenceKey = String.Format("{0}-{1}", i.Line_No, DateTime.Now.Ticks.ToString());
                        Intrasoft.CDC0112V_DynamicFormQueryImport _DynamicFormQuery = new Intrasoft.CDC0112V_DynamicFormQueryImport();
                        _DynamicFormQuery.Command = "RETRIEVE";//Command=
                        _DynamicFormQuery.InCommandIefSuppliedCommand = "RETRIEVE";//InCommandIefSuppliedCommand=
                        _DynamicFormQuery.InContinueIefSuppliedNum10 = 0;//InContinueIefSuppliedNum10=
                        _DynamicFormQuery.InCustomerCDigit = 0;//InCustomerCDigit=
                        _DynamicFormQuery.InCustomerCustId = i.Member_Id;//InCustomerCustId=
                        _DynamicFormQuery.InDateFromIefSuppliedDate = new DateTime(2020, 01, 01, 13, 00, 00).ToUniversalTime(); //DateTime.Now.AddDays(-3)//InDateFromIefSuppliedDate=
                        _DynamicFormQuery.InDateToIefSuppliedDate = new DateTime(2020, 06, 01, 13, 00, 00).ToUniversalTime();//InDateToIefSuppliedDate=

                        _DynamicFormQuery.InDynamicFormStatusPfgSetupValuesEntryDescr = "";//InDynamicFormStatusPfgSetupValuesEntryDescr=

                        _DynamicFormQuery.InDynamicFormStatusPfgSetupValuesPredefinedValues = "";//InDynamicFormStatusPfgSetupValuesPredefinedValues=

                        _DynamicFormQuery.InGrpParametersInGrmBankemployeeFirstName = "";//InGrpParametersInGrmBankemployeeFirstName=

                        _DynamicFormQuery.InGrpParametersInGrmBankemployeeLastName = "";//InGrpParametersInGrmBankemployeeLastName=
                        _DynamicFormQuery.InGrpParametersInGrmBankParametersBankCode = 0;//InGrpParametersInGrmBankParametersBankCode=

                        _DynamicFormQuery.InGrpParametersInGrmBankParametersBankName = "";//InGrpParametersInGrmBankParametersBankName=

                        _DynamicFormQuery.InGrpParametersInGrmBankParametersTaxRegNo = "";//InGrpParametersInGrmBankParametersTaxRegNo=

                        _DynamicFormQuery.InGrpParametersInGrmTerminalTerminalNumber = "172.21.46.155";//InGrpParametersInGrmTerminalTerminalNumber=
                        _DynamicFormQuery.InGrpParametersInGrmTrxCountTrxCounter = 0;//InGrpParametersInGrmTrxCountTrxCounter=
                        _DynamicFormQuery.InGrpParametersInGrmUnitCategoryGenericDetailSerialNum = 0;//InGrpParametersInGrmUnitCategoryGenericDetailSerialNum=

                        _DynamicFormQuery.InGrpParametersInGrmUnitClearingHouseFlag = "";//InGrpParametersInGrmUnitClearingHouseFlag=

                        _DynamicFormQuery.InGrpParametersInGrmUnitUnitName = "";//InGrpParametersInGrmUnitUnitName=

                        _DynamicFormQuery.InGrpParametersInGrmUsrPassword = "";//InGrpParametersInGrmUsrPassword=
                        _DynamicFormQuery.InGrpParametersInGrmWorkDatesProductionDate = new DateTime(0001, 01, 01, 00, 00, 00);//InGrpParametersInGrmWorkDatesProductionDate=

                        _DynamicFormQuery.InPfgTagSetSetupDescription = "";//InPfgTagSetSetupDescription=

                        _DynamicFormQuery.InPfgTagSetSetupTagSetCode = "IMPREST FORM";//InPfgTagSetSetupTagSetCode=
                        _DynamicFormQuery.InProfitsAccountAccountCd = 0;//InProfitsAccountAccountCd=

                        _DynamicFormQuery.InProfitsAccountAccountNumber = "";//InProfitsAccountAccountNumber=
                        _DynamicFormQuery.InProfitsAccountPrftSystem = 0;//InProfitsAccountPrftSystem=

                        _DynamicFormQuery.InUserDefinedFieldsFieldValue = "";//InUserDefinedFieldsFieldValue=

                        _DynamicFormQuery.InUserDefinedFieldsPfgSetCategory = "";//InUserDefinedFieldsPfgSetCategory=
                        _DynamicFormQuery.InUserDefinedFieldsPfgSetSn = 0;//InUserDefinedFieldsPfgSetSn=

                        _DynamicFormQuery.InUserDefinedFieldsPfgTag = "";//InUserDefinedFieldsPfgTag=

                        _DynamicFormQuery.InUserDefinedFieldsPfgTagSetCode = "";//InUserDefinedFieldsPfgTagSetCode=

                        _DynamicFormQuery.InUserDefTableAccountNumber = "";//InUserDefTableAccountNumber=
                        _DynamicFormQuery.InUserDefTableCustomerCode = 0;//InUserDefTableCustomerCode=
                        _DynamicFormQuery.InUserDefTablePrftSystem = 0;//InUserDefTablePrftSystem=

                        _DynamicFormQuery.InUserDefTableRecordType = "";//InUserDefTableRecordType=
                        _DynamicFormQuery.InUserDefTableSn = 0;//InUserDefTableSn=

                        _DynamicFormQuery.InUserDefTableTagSetCode = "";//InUserDefTableTagSetCode=

                        Logging.Logging.LogEntryOnFile(String.Format("----\nImprest Query> {0} -- {1}\n", i.Line_No, DateTime.Now));
                        Logging.Logging.CreateXML(head);
                        Logging.Logging.CreateXML(_DynamicFormQuery);
                        Logging.Logging.LogEntryOnFile(String.Format("\n"));
                        var dfq = intrasoft.CDC0112V_DynamicFormQuery(_DynamicFormQuery, head);
                        Logging.Logging.LogEntryOnFile(String.Format("Imprest Query Response> {0} -- {1}\n", i.Line_No, DateTime.Now));
                        Logging.Logging.CreateXML(dfq);
                        Logging.Logging.LogEntryOnFile(String.Format("\n\n"));
                        if (dfq.Result.Type == Intrasoft.EvaluationType.Success)
                        {
                            short formno = Convert.ToInt16((dfq.OutGrpList.Count() == 0 ? 1 : dfq.OutGrpList.LastOrDefault().OutGrpOutGrmUserDefTableSn) + 0);
                            Intrasoft.UDF002VDynamicFieldsImport r = new Intrasoft.UDF002VDynamicFieldsImport();
                            head = header();
                            head.ReferenceKey = String.Format("{0}-{1}", i.Line_No, DateTime.Now.Ticks.ToString());
                            r.InAllowMultipleIefSuppliedFlag = "1";//InAllowMultipleIefSuppliedFlag=
                            r.Command = "INSERT";
                            r.InCommandIefSuppliedCommand = "INSERT";//InCommandIefSuppliedCommand=
                            r.InContinueFromUserDefinedFieldsPfgSetSn = 0;//InContinueFromUserDefinedFieldsPfgSetSn=
                            r.InContinueHistUserDefFldHistHistorySn = 0;//InContinueHistUserDefFldHistHistorySn=
                            r.InCustomerCustId = i.Member_Id;//InCustomerCustId=
                            r.InForCreationIefSuppliedTmstamp = DateTime.Now.ToUniversalTime();//InForCreationIefSuppliedTmstamp=
                            r.InForInsertionUserDefTableAccountNumber = i.Member_Id.ToString().PadLeft(14, '0');//InForInsertionUserDefTableAccountNumber=
                            r.InForInsertionUserDefTableCDigit1 = 0;//InForInsertionUserDefTableCDigit1=
                            r.InForInsertionUserDefTableCustId1 = i.Member_Id;//InForInsertionUserDefTableCustId1=
                            r.InForInsertionUserDefTableCustomerCode = i.Member_Id;//InForInsertionUserDefTableCustomerCode=
                            r.InForInsertionUserDefTablePrftSystem = 1;//InForInsertionUserDefTablePrftSystem=
                            r.InForInsertionUserDefTableRecordType = "00";//InForInsertionUserDefTableRecordType=
                            r.InJustificIdJustific = 99011;//InJustificIdJustific=
                            r.InPrftTransactionIdTransact = 1013;//InPrftTransactionIdTransact=
                            r.InProductIdProduct = 99011;//InProductIdProduct=
                            r.InSelectedPfgTagSetSetupTagSetCode = "IMPREST FORM";


                            Intrasoft.UDF002VInGrpFieldsItem item = new Intrasoft.UDF002VInGrpFieldsItem();
                            List<Intrasoft.UDF002VInGrpFieldsItem> inGrpFields = new List<Intrasoft.UDF002VInGrpFieldsItem>();
                            item.InGrpFieldsInGrmInputActionIefSuppliedFlag = "I";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowToUser = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetCategory = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetSn = 1;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagMandatory = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldLabel = "Employee Number:";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldValue = i.Employee_No;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTag = "EMPNO";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldFormat = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldLength = 50;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldType = "4";
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowOrder = 1;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsShowOrder = 1;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsUdSn = formno;
                            inGrpFields.Add(item);

                            item = new Intrasoft.UDF002VInGrpFieldsItem();
                            item.InGrpFieldsInGrmInputActionIefSuppliedFlag = "I";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowToUser = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetCategory = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetSn = 2;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagMandatory = "Y";
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowOrder = 2;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsShowOrder = 2;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTag = "EMPNAME";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldFormat = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldLength = 70;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldType = "4";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldLabel = "Employee Name :";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldValue = i.Employee_Name;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsUdSn = formno;
                            inGrpFields.Add(item);

                            item = new Intrasoft.UDF002VInGrpFieldsItem();
                            item.InGrpFieldsInGrmInputActionIefSuppliedFlag = "I";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowToUser = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetCategory = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetSn = 3;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagMandatory = "Y";
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowOrder = 3;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsShowOrder = 3;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTag = "IMPNO";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldFormat = "XXXXXXXXXXXXXXXXXXXX";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldLength = 20;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldType = "4";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldLabel = "Imprest Number :";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldValue = i.Imprest_No;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsUdSn = formno;
                            inGrpFields.Add(item);

                            item = new Intrasoft.UDF002VInGrpFieldsItem();
                            item.InGrpFieldsInGrmInputActionIefSuppliedFlag = "I";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowToUser = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetCategory = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetSn = 4;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagMandatory = "Y";
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowOrder = 4;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsShowOrder = 4;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTag = "BRNCHCD";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldFormat = "ZZZZ";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldLength = 4;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldType = "2";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldLabel = "Branch Code";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldValue = i.Global_Dimesnion_2_Code.ToString();
                            item.InGrpFieldsInGrmInputUserDefinedFieldsUdSn = formno;
                            inGrpFields.Add(item);

                            item = new Intrasoft.UDF002VInGrpFieldsItem();
                            item.InGrpFieldsInGrmInputActionIefSuppliedFlag = "I";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowToUser = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetCategory = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetSn = 5;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagMandatory = "Y";
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowOrder = 5;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsShowOrder = 5;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTag = "IMPAMNT";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldFormat = "ZZZZZZZZZZZZZZZ.Z9";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldLength = 40;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldType = "2";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldLabel = "Imprest Amount";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldValue = i.Amount.ToString();
                            item.InGrpFieldsInGrmInputUserDefinedFieldsUdSn = formno;
                            inGrpFields.Add(item);

                            item = new Intrasoft.UDF002VInGrpFieldsItem();
                            item.InGrpFieldsInGrmInputActionIefSuppliedFlag = "I";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowToUser = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetCategory = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetSn = 6;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagMandatory = "Y";
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowOrder = 6;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsShowOrder = 6;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTag = "CURRCODE";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldFormat = "ZZZZ";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldLength = 5;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldType = "2";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldLabel = "Currency Code";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldValue = "22";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsUdSn = formno;
                            inGrpFields.Add(item);

                            item = new Intrasoft.UDF002VInGrpFieldsItem();
                            item.InGrpFieldsInGrmInputActionIefSuppliedFlag = "I";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTagSetCode = r.InSelectedPfgTagSetSetupTagSetCode;
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowToUser = "Y";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetCategory = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgSetSn = 7;
                            // item.InGrpFieldsInGrmInputPfgSetupDetailTagMandatory = "Y";
                            item.InGrpFieldsInGrmInputPfgSetupDetailShowOrder = 10;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsShowOrder = 10;
                            item.InGrpFieldsInGrmInputUserDefinedFieldsPfgTag = "IAPPLICSTA";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldFormat = "X";
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldLength = 1;
                            item.InGrpFieldsInGrmInputPfgSetupDetailTagFieldType = "4";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldLabel = "Application Status:";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsFieldValue = "1";
                            item.InGrpFieldsInGrmInputUserDefinedFieldsUdSn = formno;
                            inGrpFields.Add(item);

                            r.InGrpFields = inGrpFields.ToArray();
                            Logging.Logging.LogEntryOnFile(String.Format("Imprest Insert> {0} -- {1}\n", i.Line_No, DateTime.Now));
                            Logging.Logging.CreateXML(head);
                            Logging.Logging.CreateXML(r);
                            Logging.Logging.LogEntryOnFile(String.Format("\n"));
                            var d = intrasoft.UDF002V_DynamicFields(r, head);
                            Logging.Logging.LogEntryOnFile(String.Format("Imprest Insert Response> {0} -- {1}\n", i.Line_No, DateTime.Now));
                            Logging.Logging.CreateXML(d);
                            Logging.Logging.LogEntryOnFile(String.Format("\n\n"));
                            if (d.Result.Type == Intrasoft.EvaluationType.Success)
                            {
                                r.Command = "INSVAL";
                                r.InCommandIefSuppliedCommand = "INSVAL";//InCommandIefSuppliedCommand=
                                head = header();
                                r.InGrpFields = null;
                                head.ReferenceKey = String.Format("{0}-{1}", i.Line_No, DateTime.Now.Ticks.ToString());
                                Logging.Logging.LogEntryOnFile(String.Format("Imprest Validate > {0} -- {1}\n", i.Line_No, DateTime.Now));
                                Logging.Logging.CreateXML(head);
                                Logging.Logging.CreateXML(r);
                                Logging.Logging.LogEntryOnFile(String.Format("\n"));
                                var v = intrasoft.UDF002V_DynamicFields(r, head);
                                Logging.Logging.LogEntryOnFile(String.Format("Imprest Validate Response> {0} -- {1}\n", i.Line_No, DateTime.Now));
                                Logging.Logging.CreateXML(v);
                                Logging.Logging.LogEntryOnFile(String.Format("\n\n"));

                                if (v.Result.Type == Intrasoft.EvaluationType.Success)
                                {
                                    if (v.OutGrpError.Count() == 0)
                                    {
                                        r.Command = "INSUPD";
                                        r.InGrpFields = null;
                                        r.InCommandIefSuppliedCommand = "INSUPD";//InCommandIefSuppliedCommand=
                                        head = header();

                                        head.ReferenceKey = String.Format("{0}-{1}", i.Line_No, DateTime.Now.Ticks.ToString());
                                        Logging.Logging.LogEntryOnFile(String.Format("Imprest Update > {0} -- {1}\n", i.Line_No, DateTime.Now));
                                        Logging.Logging.CreateXML(head);
                                        Logging.Logging.CreateXML(r);
                                        Logging.Logging.LogEntryOnFile(String.Format("\n"));
                                        var u = intrasoft.UDF002V_DynamicFields(r, head);
                                        Logging.Logging.LogEntryOnFile(String.Format("Imprest Update Response> {0} -- {1}\n", i.Line_No, DateTime.Now));
                                        Logging.Logging.CreateXML(u);
                                        Logging.Logging.LogEntryOnFile(String.Format("\n\n"));

                                        if (u.Result.Type == Intrasoft.EvaluationType.Success)
                                        {

                                            Intrasoft.Adds01AdditionalTransactionPostingImport adds01 = new Intrasoft.Adds01AdditionalTransactionPostingImport();
                                            adds01.Command = "INSERT";//Command=
                                            adds01.InAuthorisationGrantedIefSuppliedFlag = "0";
                                            adds01.InBopGenericDetailShortDescription = "";
                                            adds01.InCountryGenericDetailShortDescription = "";
                                            adds01.InFxftProductIdProduct = 12502;
                                            adds01.InFxftServiceIdProduct = 12502;
                                            adds01.InGeneralFxFtRecordingCustIdPasspNum = "BTS Kostas Test 1";
                                            adds01.InGlgAccountAccountId = "";
                                            adds01.InGlgAccountSecLevel = 0;
                                            adds01.InInputCurrencyIdCurrency = 0;
                                            adds01.InInputCurrencyShortDescr = "";
                                            adds01.InMainFxftFxFtRecordingComments = i.Posting_Desricption;
                                            adds01.InMainFxftPrftTransactionIdTransact = 12501;
                                            adds01.InRecordCaseFxFtRecordingIDrCrFlag = 0;
                                            adds01.InRecordCaseFxFtRecordingISegmentType = 0;
                                            adds01.InSectorGenericDetailShortDescription = "";
                                            adds01.InSecurityInBankParametersMaxAmntRateTbl = 0;
                                            adds01.InSecurityInBankParametersMaxAmntSrs = 0;
                                            adds01.InSecurityInTerminalTerminalNumber = "172.21.46.243";
                                            adds01.InToBeConvertedIefSuppliedAmount = 0;


                                            //adds01.InExportPosting

                                            List<Intrasoft.Adds01InExportPostingItem> adds01s = new List<Intrasoft.Adds01InExportPostingItem>();

                                            Intrasoft.Adds01InExportPostingItem adds011 = new Intrasoft.Adds01InExportPostingItem();
                                            //Debit gl
                                            adds011.InExportPostingInGroupJustificIdJustific = 0;
                                            adds011.InExportPostingInGrpChequeBookItemItemSerialNumber = 0;
                                            adds011.InExportPostingInGrpCurrencyIdCurrency = 22;
                                            adds011.InExportPostingInGrpCurrencyShortDescr = "KES";
                                            adds011.InExportPostingInGrpDepUnclearTransAvailabilityDate = new DateTime(0001, 01, 01, 00, 00, 00);
                                            adds011.InExportPostingInGrpDepositAccountCDigit = 0;
                                            adds011.InExportPostingInGrpDpTrxSpecialAgrAvailDateSpread = 0;
                                            adds011.InExportPostingInGrpDpTrxSpecialAgrValueDateSpread = 0;
                                            adds011.InExportPostingInGrpFdValeurBalanceValueDate = new DateTime(0001, 01, 01, 00, 00, 00);
                                            adds011.InExportPostingInGrpFxFtRecordingComments = (i.Posting_Desricption.Length > 40 ? i.Posting_Desricption.Substring(0, 39) : i.Posting_Desricption);
                                            adds011.InExportPostingInGrpFxFtRecordingIDomesticAmount = i.Amount;
                                            adds011.InExportPostingInGrpFxFtRecordingIDrCrFlag = 1;
                                            adds011.InExportPostingInGrpFxFtRecordingIRate = 1;
                                            adds011.InExportPostingInGrpFxFtRecordingISegmentType = 2;
                                            adds011.InExportPostingInGrpFxFtRecordingITrxAmount = i.Amount;
                                            adds011.InExportPostingInGrpFxFtRecordingGlAccount = i.GL_Account;
                                            adds011.InExportPostingInGrpFxftJustificIdJustific = 12501; 
                                            adds011.InExportPostingInGrpPrftTransactionIdTransact = 3191;
                                            if (i.Transaction_Type == Imprest_Profits.Transaction_Type.MC_Creditors)
                                            {
                                                adds011.InExportPostingInGrpFxftJustificIdJustific = 12500;
                                                adds011.InExportPostingInGrpPrftTransactionIdTransact = 3181;
                                                adds011.InExportPostingInGrpFxFtRecordingIDrCrFlag = 2;
                                            }
                                            adds011.InExportPostingInGrpIefSuppliedFlag = "";
                                          
                                            adds011.InExportPostingInGrpProfitsAccountAccountNumber = "";
                                            adds011.InExportPostingInGrpTeamInformationAuthorizationResult = "";
                                            adds011.InExportPostingInGrpTeamInformationSuper1Code = "";
                                            adds011.InExportPostingInGrpTeamInformationSuper2Code = "";
                                            adds011.InExportPostingInGrpThirdpartyPaymentTppField1 = "";
                                            adds011.InExportPostingInGrpThirdpartyPaymentTppField2 = "";
                                            adds011.InExportPostingInGrpThirdpartyPaymentTppField3 = "";
                                            adds011.InExportPostingInGrpThirdpartyPaymentTppField4 = "";
                                            adds011.InExportPostingInGrpUnitCode = i.Global_Dimesnion_2_Code;
                                            adds011.InExportPostingInGrpUnitUnitName = "";
                                            adds01s.Add(adds011);

                                            //credit gl
                                            Intrasoft.Adds01InExportPostingItem adds012 = new Intrasoft.Adds01InExportPostingItem();
                                            adds012.InExportPostingInGroupJustificIdJustific = 33100;
                                            adds012.InExportPostingInGrpChequeBookItemItemSerialNumber = 0;
                                            adds012.InExportPostingInGrpCurrencyIdCurrency = 22;
                                            adds012.InExportPostingInGrpCurrencyShortDescr = "KES";
                                            adds012.InExportPostingInGrpDepUnclearTransAvailabilityDate = new DateTime(0001, 01, 01, 00, 00, 00);
                                            adds012.InExportPostingInGrpDepositAccountCDigit = 0;
                                            adds012.InExportPostingInGrpDpTrxSpecialAgrAvailDateSpread = 0;
                                            adds012.InExportPostingInGrpDpTrxSpecialAgrValueDateSpread = 0;
                                            adds012.InExportPostingInGrpFdValeurBalanceValueDate = new DateTime(0001, 01, 01, 00, 00, 00);
                                            adds012.InExportPostingInGrpFxFtRecordingComments = (i.Posting_Desricption.Length > 40 ? i.Posting_Desricption.Substring(0, 39) : i.Posting_Desricption);
                                            adds012.InExportPostingInGrpFxFtRecordingGlAccount = "";
                                            adds012.InExportPostingInGrpFxFtRecordingIDomesticAmount = i.Amount;
                                            adds012.InExportPostingInGrpFxFtRecordingIDrCrFlag = 1;
                                            adds012.InExportPostingInGrpFxFtRecordingIRate = 1;
                                            adds012.InExportPostingInGrpFxFtRecordingISegmentType = 0;
                                            adds012.InExportPostingInGrpFxFtRecordingITrxAmount = i.Amount;
                                            adds012.InExportPostingInGrpIefSuppliedFlag = "";
                                            adds012.InExportPostingInGrpPrftTransactionIdTransact = 3181;
                                            adds012.InExportPostingInGrpFxftJustificIdJustific = 12502;
                                            adds012.InExportPostingInGrpProfitsAccountAccountNumber = i.Fosa_Account;

                                            if (i.Transaction_Type == Imprest_Profits.Transaction_Type.MC_Creditors)
                                            {
                                                adds012.InExportPostingInGroupJustificIdJustific = 34001;
                                                adds012.InExportPostingInGrpFxftJustificIdJustific = 12503;
                                                adds012.InExportPostingInGrpPrftTransactionIdTransact = 3191;

                                            }
                                            adds012.InExportPostingInGrpTeamInformationAuthorizationResult = "";
                                            adds012.InExportPostingInGrpTeamInformationSuper1Code = "";
                                            adds012.InExportPostingInGrpTeamInformationSuper2Code = "";
                                            adds012.InExportPostingInGrpThirdpartyPaymentTppField1 = "";
                                            adds012.InExportPostingInGrpThirdpartyPaymentTppField2 = "";
                                            adds012.InExportPostingInGrpThirdpartyPaymentTppField3 = "";
                                            adds012.InExportPostingInGrpThirdpartyPaymentTppField4 = "";
                                            adds012.InExportPostingInGrpUnitCode = i.Global_Dimesnion_2_Code;
                                            adds012.InExportPostingInGrpUnitUnitName = "";
                                            adds01s.Add(adds012);

                                            adds01.InExportPosting = adds01s.ToArray();

                                            head = header();
                                            head.ReferenceKey = String.Format("{0}-{1}", i.Line_No, DateTime.Now.Ticks.ToString());
                                            Logging.Logging.LogEntryOnFile(String.Format("Imprest Posting > {0} -- {1}\n", i.Line_No, DateTime.Now));
                                            Logging.Logging.CreateXML(head);
                                            Logging.Logging.CreateXML(adds01);
                                            Logging.Logging.LogEntryOnFile(String.Format("\n"));
                                            var adds = intrasoft.Adds01_AdditionalTransactionPosting(adds01, head);
                                            Logging.Logging.LogEntryOnFile(String.Format("Imprest Posting Response> {0} -- {1}\n", i.Line_No, DateTime.Now));
                                            Logging.Logging.CreateXML(adds);
                                            Logging.Logging.LogEntryOnFile(String.Format("\n\n"));

                                            if (adds.Result.Type == Intrasoft.EvaluationType.Success)
                                            {
                                                i.Status = Imprest_Profits.Status.Completed;
                                                i.StatusSpecified = true;
                                                i.Comments = "";
                                                i.TrxDate = adds.OutDuplicateFxFtRecordingTrxDate;
                                                i.TrxDateSpecified = true;
                                                i.TrxSn = adds.OutDuplicateFxFtRecordingTrxSn;
                                                i.TrxSnSpecified = true;
                                                i.TrxUsr = adds.OutDuplicateFxFtRecordingTrxUsr;
                                                i.TrxUnit = adds.OutDuplicateFxFtRecordingTrxUnit;
                                                i.TrxUnitSpecified = true;
                                            }
                                            else
                                            {
                                                i.Status = Imprest_Profits.Status.Failed;
                                                i.StatusSpecified = true;
                                                Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Imprest_No, adds.Result.Message));
                                                i.Comments = adds.Result.Message;
                                            }


                                        }
                                        else
                                        {
                                            i.Status = Imprest_Profits.Status.Failed;
                                            i.StatusSpecified = true;
                                            Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Imprest_No, u.Result.Message));
                                            i.Comments = u.Result.Message;
                                        }
                                    }
                                    else
                                    {
                                        i.Status = Imprest_Profits.Status.Failed;
                                        i.StatusSpecified = true;
                                        i.Comments = "Validation Errors";
                                    }
                                }
                                else
                                {
                                    i.Status = Imprest_Profits.Status.Failed;
                                    i.StatusSpecified = true;
                                    Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Imprest_No, v.Result.Message));
                                    i.Comments = v.Result.Message;
                                }
                            }
                            else
                            {
                                i.Status = Imprest_Profits.Status.Failed;
                                i.StatusSpecified = true;
                                Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Imprest_No, d.Result.Message));
                                i.Comments = d.Result.Message;
                            }

                        }
                        else
                        {
                            i.Status = Imprest_Profits.Status.Failed;
                            i.StatusSpecified = true;
                            Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Imprest_No, dfq.Result.Message));
                            i.Comments = dfq.Result.Message;
                        }
                    }
                    catch (Exception ex)
                    {
                        i.Status = Imprest_Profits.Status.Failed;
                        i.StatusSpecified = true;
                        i.Comments = ex.Message;

                        Logging.Logging.ReportError(ex);
                    }
                    var dd = i;
                    Imprest_Profits_Service.Update(ref dd);
                }



            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
        }
        public void Sendpayroll()
        {
            try
            {
                var payrol = Payroll_Profits_Service.ReadMultiple(new Erp_Payroll_Profits.Payroll_Profits_Filter[] { new Erp_Payroll_Profits.Payroll_Profits_Filter { Criteria = "Pending", Field = Erp_Payroll_Profits.Payroll_Profits_Fields.Status } }, null, 0).ToList();
                foreach (var i in payrol.ToList())
                {
                    Intrasoft.ExtExecParameters head = header();
                    Intrasoft.Adds01AdditionalTransactionPostingImport r = new Intrasoft.Adds01AdditionalTransactionPostingImport();
                    r.Command = "INSERT";
                    r.InFxftProductIdProduct = 12502;
                    r.InFxftServiceIdProduct = 12502;
                    r.InGeneralFxFtRecordingCustIdPasspNum = i.Employee_No;
                    r.InMainFxftPrftTransactionIdTransact = i.Entry_No;
                    r.InSecurityInTerminalTerminalNumber = "172.21.46.243";
                    r.InAuthorisationGrantedIefSuppliedFlag = "0";
                    r.InGlgAccountSecLevel = 0;
                    r.InSecurityInBankParametersMaxAmntRateTbl = 0;
                    r.InSecurityInBankParametersMaxAmntSrs = 0;
                    r.InToBeConvertedIefSuppliedAmount = 0;
                    r.InMainFxftPrftTransactionIdTransact = 12501;
                    r.InMainFxftFxFtRecordingComments = string.Format("{0}-{1}", i.Transaction_Code, i.Payroll_Period);
                    List<Intrasoft.Adds01InExportPostingItem> adds01InExportPostingItems = new List<Intrasoft.Adds01InExportPostingItem>();

                    Intrasoft.Adds01InExportPostingItem adds01InExportPostingItem = new Intrasoft.Adds01InExportPostingItem();

                    adds01InExportPostingItem.InExportPostingInGroupJustificIdJustific = 0;
                    adds01InExportPostingItem.InExportPostingInGrpCurrencyShortDescr = "KES";
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingGlAccount = i.Gl_Account;// "1.11.1.1.999988";
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingIDomesticAmount = (decimal)i.Amount;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingIDrCrFlag = 1;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingIRate = 1;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingISegmentType = 2;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingITrxAmount = (decimal)i.Amount;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingComments = string.Format("{0}-{1}", i.Transaction_Code, i.Payroll_Period);
                    //adds01InExportPostingItem.InExportPostingInGrpProfitsAccountAccountNumber = i.Fosa_Account;
                    adds01InExportPostingItem.InExportPostingInGrpPrftTransactionIdTransact = 3191;
                    //adds01InExportPostingItem.InExportPostingInGrpUnitCode = 600;
                    adds01InExportPostingItem.InExportPostingInGrpFxftJustificIdJustific = 12501;
                    adds01InExportPostingItem.InExportPostingInGrpFdValeurBalanceValueDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;
                    adds01InExportPostingItem.InExportPostingInGrpDpTrxSpecialAgrAvailDateSpread = 0;
                    adds01InExportPostingItem.InExportPostingInGrpDpTrxSpecialAgrValueDateSpread = 0;
                    adds01InExportPostingItem.InExportPostingInGrpDepositAccountCDigit = 0;
                    adds01InExportPostingItem.InExportPostingInGrpDepUnclearTransAvailabilityDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;
                    adds01InExportPostingItem.InExportPostingInGrpCurrencyIdCurrency = 22;
                    adds01InExportPostingItem.InExportPostingInGrpChequeBookItemItemSerialNumber = 0;
                    adds01InExportPostingItem.InExportPostingInGroupJustificIdJustific = 0;
                    adds01InExportPostingItems.Add(adds01InExportPostingItem);




                    adds01InExportPostingItem = new Intrasoft.Adds01InExportPostingItem();
                    adds01InExportPostingItem.InExportPostingInGroupJustificIdJustific = 33100;
                    adds01InExportPostingItem.InExportPostingInGrpCurrencyShortDescr = "KES";
                    // adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingGlAccount = i.Gl_Account;// "1.11.1.1.999988";
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingIDomesticAmount = (decimal)i.Amount;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingIDrCrFlag = 2;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingIRate = 1;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingISegmentType = 0;
                    adds01InExportPostingItem.InExportPostingInGrpFxFtRecordingITrxAmount = (decimal)i.Amount;
                    adds01InExportPostingItem.InExportPostingInGrpProfitsAccountAccountNumber = i.Fosa_Account;
                    adds01InExportPostingItem.InExportPostingInGrpPrftTransactionIdTransact = 3181;
                    // adds01InExportPostingItem.InExportPostingInGrpUnitCode = 600;
                    adds01InExportPostingItem.InExportPostingInGrpFxftJustificIdJustific = 12502;
                    adds01InExportPostingItem.InExportPostingInGrpFdValeurBalanceValueDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;
                    adds01InExportPostingItem.InExportPostingInGrpDpTrxSpecialAgrAvailDateSpread = 0;
                    adds01InExportPostingItem.InExportPostingInGrpDpTrxSpecialAgrValueDateSpread = 0;
                    adds01InExportPostingItem.InExportPostingInGrpDepositAccountCDigit = 0;
                    adds01InExportPostingItem.InExportPostingInGrpDepUnclearTransAvailabilityDate = new DateTime(0001, 01, 01, 00, 00, 00);// DateTime.Now;
                    adds01InExportPostingItem.InExportPostingInGrpCurrencyIdCurrency = 22;
                    adds01InExportPostingItem.InExportPostingInGrpChequeBookItemItemSerialNumber = 0;
                    // adds01InExportPostingItem.InExportPostingInGroupJustificIdJustific = 0;
                    adds01InExportPostingItems.Add(adds01InExportPostingItem);


                    r.InExportPosting = adds01InExportPostingItems.ToArray();
                    head.ReferenceKey = String.Format("{0}-{1}", i.Entry_No, DateTime.Now.Ticks.ToString());
                    Logging.Logging.LogEntryOnFile(String.Format("Payroll Request> {0} -- {1}\n", i.Entry_No, DateTime.Now));
                    Logging.Logging.CreateXML(head);
                    Logging.Logging.CreateXML(r);
                    Logging.Logging.LogEntryOnFile(String.Format("\n"));
                    var d = intrasoft.Adds01_AdditionalTransactionPosting(r, head);
                    Logging.Logging.LogEntryOnFile(String.Format("Payroll Response> {0} -- {1}\n", i.Entry_No, DateTime.Now));
                    Logging.Logging.CreateXML(d);
                    Logging.Logging.LogEntryOnFile(String.Format("\n\n"));


                    if (d.Result.Type == Intrasoft.EvaluationType.Success)
                    {
                        i.Status = Erp_Payroll_Profits.Status.Completed ;
                        i.StatusSpecified = true;
                        i.Comments = "";
                    }
                    else
                    {
                        i.Status = Erp_Payroll_Profits.Status.Failed;
                        i.StatusSpecified = true;
                        Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Entry_No, d.Result.Message));
                        i.Comments = d.Result.Message;
                    }
                    var pr = i;
                    Payroll_Profits_Service.Update(ref pr);
                }

            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        public void Sendaccounts()
        {
            try
            {
                var gls = GL_Account_Service.ReadMultiple(new GL_Account.GL_Account_Filter[]{ new GL_Account.GL_Account_Filter
                { Criteria = "Pending", Field = GL_Account.GL_Account_Fields.Status }}, null, 0);
                foreach (GL_Account.GL_Account i in gls.ToList())
                {
                    try
                    {
                        Intrasoft.ExtExecParameters head = header();
                        Intrasoft.G0501V_GLAccountValidationImport r = new Intrasoft.G0501V_GLAccountValidationImport();
                        head.ReferenceKey = DateTime.Now.Ticks.ToString();// i.Imprest_No;
                        r.Command = "CREATE";//Command=
                        r.InAssLiabChangeIefSuppliedChar1 = null;
                        r.InAuthorGrantedIefSuppliedFlag = "0";//InAuthorGrantedIefSuppliedFlag=
                        r.InBalTypeGenericDetailDescription = "MIXED";//InBalTypeGenericDetailDescription=
                        r.InBalTypeGenericDetailParameterType = "GLBAL";//InBalTypeGenericDetailParameterType=   
                        r.InBalTypeGenericDetailSerialNum = 4;//InBalTypeGenericDetailSerialNum=
                        r.InBalshTypeGenericDetailSerialNum = 0;//InBalshTypeGenericDetailSerialNum=
                        r.InBistaGenericDetailDescription = null;

                        r.InBistaGenericDetailSerialNum = 0;//InBistaGenericDetailSerialNum=
                        r.InCategUnitGenericDetailDescription = "ALL UNITS";//InCategUnitGenericDetailDescription=
                        r.InGlgAccountDescr = (i.Name.Length > 40 ? i.Name.Substring(0, 40) : i.Name);
                        r.InCategUnitGenericDetailSerialNum = 1;//InCategUnitGenericDetailSerialNum=
                        //string[] gl = i.No.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);
                        //if (gl.Length == 3)
                        //{
                        //    string newgl = string.Format("{0}.{1}.1.1.{2}", gl[0], gl[1], gl[2]);
                        //    i.No = newgl;
                        //}
                        r.InGlgAccountAccountId = i.No;// "1.11.1.1.999788";//InGlgAccountAccountId=
                        r.InGlgAccountBopFlg = "0";//InGlgAccountBopFlg=
                        r.InGlgAccountBopGroupAccount = 0;//InGlgAccountBopGroupAccount=
                        r.InGlgAccountCentralFlag = "2";//InGlgAccountCentralFlag=
                        r.InGlgAccountDbCrBalFlag = "4";//InGlgAccountDbCrBalFlag=
                        r.InGlgAccountDeactivationDate = DateTime.Now;//InGlgAccountDeactivationDate=
                        r.InGlgAccountDescr = (i.Name.Length > 40 ? i.Name.Substring(0, 40) : i.Name);  //"INTEGRATION SAMPLE ACCOUNT";//InGlgAccountDescr=
                        r.InGlgAccountDsubTrnFlag = "1";//InGlgAccountDsubTrnFlag=
                        r.InGlgAccountEvalFlag = "2";//InGlgAccountEvalFlag=
                        r.InGlgAccountFcconvFlag = "0";//InGlgAccountFcconvFlag=
                        r.InGlgAccountLastUpdDate = DateTime.Now;//InGlgAccountLastUpdDate=
                        r.InGlgAccountLevel = null;
                        r.InGlgAccountMandAdditionalInfo = "0";//InGlgAccountMandAdditionalInfo=
                        r.InGlgAccountMandCustInfo = "0";//InGlgAccountMandCustInfo=
                        r.InGlgAccountModifyDate = DateTime.Now;//InGlgAccountModifyDate=
                        r.InGlgAccountOpenDate = DateTime.Now;//InGlgAccountOpenDate=
                        r.InGlgAccountOptionalFlag = "0";//InGlgAccountOptionalFlag=
                        r.InGlgAccountPositionFlag = "0";//InGlgAccountPositionFlag=
                        r.InGlgAccountRealTimeFlag = "0";//InGlgAccountRealTimeFlag=
                        r.InGlgAccountReconFlag = "0";//InGlgAccountReconFlag=
                        r.InGlgAccountReconRunDt = DateTime.Now;//InGlgAccountReconRunDt=
                        r.InGlgAccountReconStartDt = DateTime.Now;//InGlgAccountReconStartDt=
                        r.InGlgAccountSecLevel = 0;//InGlgAccountSecLevel=
                        r.InGlgAccountShortDescr = "INTGR";//InGlgAccountShortDescr=
                        r.InGlgAccountState = "1";//InGlgAccountState=
                        r.InGlgAccountStatus = null;
                        r.InGlgAccountSubsConsFlag = "1";//InGlgAccountSubsConsFlag=
                        r.InGlgAccountSubsidCount = 0;//InGlgAccountSubsidCount=
                        r.InGlgAccountTimestmp = DateTime.Now;//InGlgAccountTimestmp=
                        r.InGlgAccountUnitAppliedFor = (i.Name.Length > 40 ? i.Name.Substring(0, 40) : i.Name);// "INTEGRATION SAMPLE ACCOUNT";//InGlgAccountUnitAppliedFor=
                        r.InGlgAccountUnitRealTime = "0";//InGlgAccountUnitRealTime=
                        r.InGlgAccountUpdateWayInd = "3";//InGlgAccountUpdateWayInd=
                        r.InGlgAccountUpdatedFlag = "0";//InGlgAccountUpdatedFlag=
                        r.InGlgAccountValeurDateFlag = "1";//InGlgAccountValeurDateFlag=
                        r.InGlgAccountValeurFlg = "0";//InGlgAccountValeurFlg=
                        r.InGlgAccountDeleteGlgAccountAccountId = null;
                        r.InGlgAccountDeleteGlgAccountTimestmp = DateTime.Now;//InGlgAccountDeleteGlgAccountTimestmp=
                        r.InGlgAccountPkeyGlgAccountAccountId = null;
                        r.InGlgHCurrGroupCurrGroupId = "KES";//InGlgHCurrGroupCurrGroupId=
                        r.InJustificIdJustific = 99011;//InJustificIdJustific=
                        r.InLogMntRecordingAuthorizer1 = null;
                        r.InLogMntRecordingAuthorizer2 = null;
                        r.InLogMntRecordingReversalFlag = "0";//InLogMntRecordingReversalFlag=
                        r.InLogMntRecordingTerminalNumber = "172.21.42.190";//InLogMntRecordingTerminalNumber=
                        r.InLogMntRecordingTrxCode = 5011;//InLogMntRecordingTrxCode=
                        r.InPermitUnitGenericDetailDescription = null;
                        r.InPermitUnitGenericDetailSerialNum = 0;//InPermitUnitGenericDetailSerialNum=
                        r.InPrctpGenericDetailDescription = null;
                        r.InPrctpGenericDetailSerialNum = 0;//InPrctpGenericDetailSerialNum=
                        r.InPrftTransactionIdTransact = 5011;//InPrftTransactionIdTransact=
                        r.InProductIdProduct = 99011;//InProductIdProduct=
                        r.InSubsGenericDetailDescription = null;
                        r.InSubsGenericDetailSerialNum = 0;//InSubsGenericDetailSerialNum=
                        r.InTeamInformationJustificationDescription = null;
                        r.InTeamInformationJustificationId = 0;//InTeamInformationJustificationId=
                        r.InTeamInformationProductDescription = null;
                        r.InTeamInformationProductId = 0;//InTeamInformationProductId=
                        r.InTeamInformationTeamComments = null;
                        r.InTeamInformationTransactionDescription = null;
                        r.InTeamInformationTransactionId = 0;//InTeamInformationTransactionId=
                        r.InTeamInformationUnitCode = 0;//InTeamInformationUnitCode=
                        r.InTeamInformationUserTerminalId = null;
                        Logging.Logging.CreateXML(r);
                        var d = intrasoft.G0501V_GlAccountValidation(r, head);
                        Logging.Logging.CreateXML(d);
                        if (d.Result.Type == Intrasoft.EvaluationType.Success)
                        {
                            i.Status = GL_Account.Status.Completed;
                            i.StatusSpecified = true;

                        }
                        else
                        {
                            Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.No, d.Result.Message));
                            i.Status = GL_Account.Status.Failed;
                            i.StatusSpecified = true;
                            i.Comments = d.Result.Message;
                            if (d.Result.Message.Equals("ACC_AE"))
                            {
                                i.Status = GL_Account.Status.Completed;
                                i.StatusSpecified = true;
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        i.Status = GL_Account.Status.Failed;
                        i.StatusSpecified = true;
                        i.Comments = ex.Message;
                        Logging.Logging.ReportError(ex);
                    }

                    var ii = i;
                    GL_Account_Service.Update(ref ii);
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

                var mcredits = Imprest_Profits_Service.ReadMultiple(new Imprest_Profits.Imprest_Profits_Filter[] {  new Imprest_Profits.Imprest_Profits_Filter { Criteria = "Yes", Field = Imprest_Profits.Imprest_Profits_Fields.Reversal }, new Imprest_Profits.Imprest_Profits_Filter { Criteria = "Pending", Field = Imprest_Profits.Imprest_Profits_Fields.Reversed } }, null, 0);


                foreach (var i in mcredits.ToList())
                {
                    try
                    {
                        if (string.IsNullOrEmpty(i.TrxDate.ToString()) || string.IsNullOrEmpty(i.TrxUsr))
                        {
                            i.Reversed = Imprest_Profits.Reversed.  Failed;
                            i.ReversedSpecified = true;
                            i.Comments = "Missing Reversal data";
                            var iii = i;
                            Imprest_Profits_Service.Update(ref iii);
                            continue;
                        }

                        Intrasoft.ExtExecParameters head = header();
                        head.ReferenceKey = DateTime.Now.Ticks.ToString();


                        Intrasoft.ADDS03_CancelAdditionalTransactionsImport rev = new Intrasoft.ADDS03_CancelAdditionalTransactionsImport();
                        rev.Command = "INSERT";
             
                        rev.InCommandIefSuppliedCommand = "1";
                        rev.InFxFtRecordingComments = "";
                        rev.InFxFtRecordingTrxDate = i.TrxDate;
                        rev.InFxFtRecordingTrxSn = i.TrxSn;
                        rev.InFxFtRecordingTrxUnit = i.TrxUnit;
                        rev.InFxFtRecordingTrxUsr = i.TrxUsr;
                        rev.InPrftTransactionIdTransact = 12511;
                        rev.InTerminalTerminalNumber = "123.111.11.11";
                    
                        Logging.Logging.LogEntryOnFile(String.Format("----\nImprest Reversal  > {0} -- {1}\n", i.Imprest_No, DateTime.Now));
                        Logging.Logging.CreateXML(head);
                        Logging.Logging.CreateXML(rev);
                        Logging.Logging.LogEntryOnFile(String.Format("\n"));
                        var r = intrasoft.ADDS03_CancelAdditionalTransactions(rev, head);
                        Logging.Logging.LogEntryOnFile(String.Format("\nImprest Reversal Response> {0} -- {1}\n", i.Imprest_No, DateTime.Now));
                        Logging.Logging.CreateXML(r);
                        Logging.Logging.LogEntryOnFile(String.Format("\n\n"));


                        switch (r.Result.Type)
                        {
                            case Intrasoft.EvaluationType.Success:
                                i.Reversed = Imprest_Profits.Reversed.Sent;
                                i.ReversedSpecified = true;
                                i.Comments = "";
                                break;
                            case Intrasoft.EvaluationType.Unknown:
                                Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Imprest_No, r.Result.Message));
                                i.Comments = r.Result.Message;
                                break;
                            default:
                                Logging.Logging.LogEntryOnFile(String.Format("{0}-{1}", i.Imprest_No, r.Result.Message));
                                i.Reversed = Imprest_Profits.Reversed.Failed;
                                i.ReversedSpecified = true;
                                i.Comments = r.Result.Message;
                                break;
                        }
                        var ii = i;
                        Imprest_Profits_Service.Update(ref ii);
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

        private Intrasoft.ExtExecParameters header()
        {
            Intrasoft.ExtExecParameters head = new Intrasoft.ExtExecParameters();
            head.ChannelId = 9912;
            head.Password = "!*#IANSOFT*#!";
            head.UniqueId = "";
            head.CultureName = "en";
            head.ForcastFlag = false;
            head.ReferenceKey = "";
            head.SotfOtp = "";
            head.BranchCode = "";
            head.ExtUniqueUserId = Logging.Randomize.RandomString(5);// "IANSOFT";
            head.ExtDeviceAuthCode = "";


            Intrasoft.GetAuthorizedImport authorizedImport = new Intrasoft.GetAuthorizedImport();
            var res = intrasoft.CI3499V_GetAuthorized(authorizedImport, head);
            if (res.Result.Type == Intrasoft.EvaluationType.Success)
                head.UniqueId = res.UniqueId;
            return head;
        }

        private Intrasoft.L0701VGetBankParametersExport Bankparameters()
        {
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
