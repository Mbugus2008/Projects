

namespace Loansdata
{


    public partial class Loans
    {
        public double Loan_Balance => (double)(Outstanding_Balance + Oustanding_Interest);
        public DateTime Completion_Date { get { return Loan_Disbursement_Date.AddMonths(Installments); } }
        public bool In_arrears { get { return (DateTime.Today < Completion_Date); } }




    }

    }