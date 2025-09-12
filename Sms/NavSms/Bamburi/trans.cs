using System;
using System.Linq;

namespace RunCodunit
{
    namespace Transactions
    {
        public class trans
        {//{"Document_No":"1700393197694045d14","fleetNO":"M779","Transaction_Date":"21/11/2023","Account_No":"","Description":"Mtwende","Amount":2000.0,"Transaction_Time":"19/11/2023 14:26:37","OTTN":"17003931976940512","Agent_Code":"MTWENDE","Loan_No":"KCA451Y","Type":"MTWENDE"}

            public string Document_No { get; set; }
            public DateTime Transaction_Date { get; set; }

            public string Account_No { get; set; }
            public string Description { get; set; }
            public decimal Amount { get; set; }


            public DateTime Transaction_Time { get; set; }


            public string OTTN { get; set; }

            public string Agent_Code { get; set; }
            public string Loan_No { get; set; }

            public string Type { get; set; }

            public string fleetNO { get; set; }


        }
    }
}
