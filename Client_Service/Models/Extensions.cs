using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Client_Service.Loan_Eligibility

{
    public partial class Loan_Eligibility
    {
        public string Total_charges { get {
                if (use_percentage)
                    return string.Format("{0} %", Charges) ;
                else
                    return string.Format("Kes. {0}", Charges) ;
            } }
    }
}