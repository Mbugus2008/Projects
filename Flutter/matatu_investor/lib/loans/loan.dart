import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Loan {
  String? Key;
  String? Loan_No;
  String? Loan_Type;
  String? Product_Name;
  String? Member_No;
  String? Member_Name;
  double? Principle_Amount;
  bool? Principle_AmountSpecified;
  double? Loan_Balance;
  bool? Loan_BalanceSpecified;
  int? Status;
  bool? StatusSpecified;
  DateTime? Repayment_Start_Date;
  bool? Repayment_Start_DateSpecified;
  int? Installments;
  bool? InstallmentsSpecified;
  DateTime? Repayment_End_Date;
  bool? Repayment_End_DateSpecified;
  double? Interest_Rate;
  bool? Interest_RateSpecified;
  double? Monthly_Interest;
  bool? Monthly_InterestSpecified;
  double? Monthly_Installment;
  bool? Monthly_InstallmentSpecified;

  // Legacy fields for backward compatibility
  String? Credit_Number;
  String? Credit_Type;
  String? Client_Code;
  String? Client_Name;
  DateTime? Credit_Application_Date;
  DateTime? Credit_Disbursement_Date;
  bool? Posted;
  double? Monthly_Repayment;
  double? Monthly_Principal_Repayment;
  double? Monthly_Interest_Repayment;
  double? Amount_In_Arreares;
  double? Credit_Balance;
  double? Interest_Balance;
  Loanstatus? Loan_Status;
  double? Amount_Paid_Today;
  DateTime? Date_Filter_today;

  double? get loan_balance =>
      (Loan_Balance ?? Credit_Balance ?? 0) + (Interest_Balance ?? 0);

  Loan({
    this.Key,
    this.Loan_No,
    this.Loan_Type,
    this.Product_Name,
    this.Member_No,
    this.Member_Name,
    this.Principle_Amount,
    this.Principle_AmountSpecified,
    this.Loan_Balance,
    this.Loan_BalanceSpecified,
    this.Status,
    this.StatusSpecified,
    this.Repayment_Start_Date,
    this.Repayment_Start_DateSpecified,
    this.Installments,
    this.InstallmentsSpecified,
    this.Repayment_End_Date,
    this.Repayment_End_DateSpecified,
    this.Interest_Rate,
    this.Interest_RateSpecified,
    this.Monthly_Interest,
    this.Monthly_InterestSpecified,
    this.Monthly_Installment,
    this.Monthly_InstallmentSpecified,
    // Legacy fields
    this.Credit_Number,
    this.Credit_Type,
    this.Client_Code,
    this.Client_Name,
    this.Credit_Application_Date,
    this.Credit_Disbursement_Date,
    this.Posted,
    this.Monthly_Repayment,
    this.Monthly_Principal_Repayment,
    this.Monthly_Interest_Repayment,
    this.Amount_In_Arreares,
    this.Credit_Balance,
    this.Interest_Balance,
    this.Loan_Status,
    this.Amount_Paid_Today,
    this.Date_Filter_today,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Loan_No': Loan_No,
      'Loan_Type': Loan_Type,
      'Product_Name': Product_Name,
      'Member_No': Member_No,
      'Member_Name': Member_Name,
      'Principle_Amount': Principle_Amount,
      'Principle_AmountSpecified': Principle_AmountSpecified,
      'Loan_Balance': Loan_Balance,
      'Loan_BalanceSpecified': Loan_BalanceSpecified,
      'Status': Status,
      'StatusSpecified': StatusSpecified,
      'Repayment_Start_Date': Repayment_Start_Date?.toIso8601String(),
      'Repayment_Start_DateSpecified': Repayment_Start_DateSpecified,
      'Installments': Installments,
      'InstallmentsSpecified': InstallmentsSpecified,
      'Repayment_End_Date': Repayment_End_Date?.toIso8601String(),
      'Repayment_End_DateSpecified': Repayment_End_DateSpecified,
      'Interest_Rate': Interest_Rate,
      'Interest_RateSpecified': Interest_RateSpecified,
      'Monthly_Interest': Monthly_Interest,
      'Monthly_InterestSpecified': Monthly_InterestSpecified,
      'Monthly_Installment': Monthly_Installment,
      'Monthly_InstallmentSpecified': Monthly_InstallmentSpecified,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
      Loan_Type: map['Loan_Type'] != null ? map['Loan_Type'] as String : null,
      Product_Name:
          map['Product_Name'] != null ? map['Product_Name'] as String : null,
      Member_No: map['Member_No'] != null ? map['Member_No'] as String : null,
      Member_Name:
          map['Member_Name'] != null ? map['Member_Name'] as String : null,
      Principle_Amount: map['Principle_Amount'] != null
          ? (map['Principle_Amount'] is int
              ? (map['Principle_Amount'] as int).toDouble()
              : map['Principle_Amount'] as double)
          : null,
      Principle_AmountSpecified: map['Principle_AmountSpecified'] != null
          ? map['Principle_AmountSpecified'] as bool
          : null,
      Loan_Balance: map['Loan_Balance'] != null
          ? (map['Loan_Balance'] is int
              ? (map['Loan_Balance'] as int).toDouble()
              : map['Loan_Balance'] as double)
          : null,
      Loan_BalanceSpecified: map['Loan_BalanceSpecified'] != null
          ? map['Loan_BalanceSpecified'] as bool
          : null,
      Status: map['Status'] != null ? map['Status'] as int : null,
      StatusSpecified: map['StatusSpecified'] != null
          ? map['StatusSpecified'] as bool
          : null,
      Repayment_Start_Date: map['Repayment_Start_Date'] != null
          ? DateTime.tryParse(map['Repayment_Start_Date'].toString())
          : null,
      Repayment_Start_DateSpecified:
          map['Repayment_Start_DateSpecified'] != null
              ? map['Repayment_Start_DateSpecified'] as bool
              : null,
      Installments:
          map['Installments'] != null ? map['Installments'] as int : null,
      InstallmentsSpecified: map['InstallmentsSpecified'] != null
          ? map['InstallmentsSpecified'] as bool
          : null,
      Repayment_End_Date: map['Repayment_End_Date'] != null
          ? DateTime.tryParse(map['Repayment_End_Date'].toString())
          : null,
      Repayment_End_DateSpecified: map['Repayment_End_DateSpecified'] != null
          ? map['Repayment_End_DateSpecified'] as bool
          : null,
      Interest_Rate: map['Interest_Rate'] != null
          ? (map['Interest_Rate'] is int
              ? (map['Interest_Rate'] as int).toDouble()
              : map['Interest_Rate'] as double)
          : null,
      Interest_RateSpecified: map['Interest_RateSpecified'] != null
          ? map['Interest_RateSpecified'] as bool
          : null,
      Monthly_Interest: map['Monthly_Interest'] != null
          ? (map['Monthly_Interest'] is int
              ? (map['Monthly_Interest'] as int).toDouble()
              : map['Monthly_Interest'] as double)
          : null,
      Monthly_InterestSpecified: map['Monthly_InterestSpecified'] != null
          ? map['Monthly_InterestSpecified'] as bool
          : null,
      Monthly_Installment: map['Monthly_Installment'] != null
          ? (map['Monthly_Installment'] is int
              ? (map['Monthly_Installment'] as int).toDouble()
              : map['Monthly_Installment'] as double)
          : null,
      Monthly_InstallmentSpecified: map['Monthly_InstallmentSpecified'] != null
          ? map['Monthly_InstallmentSpecified'] as bool
          : null,
      // Legacy field mappings
      Credit_Number:
          map['Credit_Number'] != null ? map['Credit_Number'] as String : null,
      Credit_Type:
          map['Credit_Type'] != null ? map['Credit_Type'] as String : null,
      Client_Code:
          map['Client_Code'] != null ? map['Client_Code'] as String : null,
      Client_Name:
          map['Client_Name'] != null ? map['Client_Name'] as String : null,
      Credit_Application_Date: map['Credit_Application_Date'] != null
          ? DateTime.tryParse(map['Credit_Application_Date'].toString())
          : null,
      Credit_Disbursement_Date: map['Credit_Disbursement_Date'] != null
          ? DateTime.tryParse(map['Credit_Disbursement_Date'].toString())
          : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Monthly_Repayment: map['Monthly_Repayment'] != null
          ? (map['Monthly_Repayment'] is int
              ? (map['Monthly_Repayment'] as int).toDouble()
              : map['Monthly_Repayment'] as double)
          : null,
      Monthly_Principal_Repayment: map['Monthly_Principal_Repayment'] != null
          ? (map['Monthly_Principal_Repayment'] is int
              ? (map['Monthly_Principal_Repayment'] as int).toDouble()
              : map['Monthly_Principal_Repayment'] as double)
          : null,
      Monthly_Interest_Repayment: map['Monthly_Interest_Repayment'] != null
          ? (map['Monthly_Interest_Repayment'] is int
              ? (map['Monthly_Interest_Repayment'] as int).toDouble()
              : map['Monthly_Interest_Repayment'] as double)
          : null,
      Amount_In_Arreares: map['Amount_In_Arreares'] != null
          ? map['Amount_In_Arreares'] as double
          : null,
      Credit_Balance: map['Credit_Balance'] != null
          ? map['Credit_Balance'] as double
          : null,
      Interest_Balance: map['Interest_Balance'] != null
          ? map['Interest_Balance'] as double
          : null,
      Amount_Paid_Today: map['Amount_Paid_Today'] != null
          ? map['Amount_Paid_Today'] as double
          : null,
      Date_Filter_today: map['Date_Filter_today'] != null
          ? DateTime.tryParse((map['Date_Filter_today'] ?? 0))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan.fromJson(String source) =>
      Loan.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum Loanstatus {
  /// <remarks/>
  Application,

  /// <remarks/>
  Appraisal,

  /// <remarks/>
  Approved,

  /// <remarks/>
  Rejected,
}

extension loan_statuss on Loanstatus {
  String get value {
    switch (this) {
      case Loanstatus.Application:
        return "Application";
      case Loanstatus.Appraisal:
        return "Appraisal";
      case Loanstatus.Approved:
        return "Approved";
      case Loanstatus.Rejected:
        return "Rejected";
    }
  }
}

// Request class for getting member loans
class LoansRequest {
  String? Member;

  LoansRequest({this.Member});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Member': Member,
    };
  }

  factory LoansRequest.fromMap(Map<String, dynamic> map) {
    return LoansRequest(
      Member: map['Member'] != null ? map['Member'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoansRequest.fromJson(String source) =>
      LoansRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
