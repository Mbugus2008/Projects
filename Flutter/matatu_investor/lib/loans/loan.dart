import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Loan {
  String? Key;
  String? Credit_Number;
  String? Credit_Type;
  String? Product_Name;
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
  //enum
  Loanstatus? Loan_Status;
  double? Amount_Paid_Today;
  DateTime? Date_Filter_today;

  double? get loan_balance => Credit_Balance! + Interest_Balance!;

  Loan({
    this.Key,
    this.Credit_Number,
    this.Credit_Type,
    this.Product_Name,
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
    this.Amount_Paid_Today,
    this.Date_Filter_today,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Credit_Number': Credit_Number,
      'Credit_Type': Credit_Type,
      'Product_Name': Product_Name,
      'Client_Code': Client_Code,
      'Client_Name': Client_Name,
      'Credit_Application_Date':
          Credit_Application_Date?.millisecondsSinceEpoch,
      'Credit_Disbursement_Date':
          Credit_Disbursement_Date?.millisecondsSinceEpoch,
      'Posted': Posted,
      'Monthly_Repayment': Monthly_Repayment,
      'Monthly_Principal_Repayment': Monthly_Principal_Repayment,
      'Monthly_Interest_Repayment': Monthly_Interest_Repayment,
      'Amount_In_Arreares': Amount_In_Arreares,
      'Credit_Balance': Credit_Balance,
      'Interest_Balance': Interest_Balance,
      'Amount_Paid_Today': Amount_Paid_Today,
      'Date_Filter_today': Date_Filter_today?.millisecondsSinceEpoch,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Credit_Number:
          map['Credit_Number'] != null ? map['Credit_Number'] as String : null,
      Credit_Type:
          map['Credit_Type'] != null ? map['Credit_Type'] as String : null,
      Product_Name:
          map['Product_Name'] != null ? map['Product_Name'] as String : null,
      Client_Code:
          map['Client_Code'] != null ? map['Client_Code'] as String : null,
      Client_Name:
          map['Client_Name'] != null ? map['Client_Name'] as String : null,
      Credit_Application_Date: map['Credit_Application_Date'] != null
          ? DateTime.tryParse((map['Credit_Application_Date'] ?? 0))
          : null,
      Credit_Disbursement_Date: map['Credit_Disbursement_Date'] != null
          ? DateTime.tryParse((map['Credit_Disbursement_Date'] ?? 0))
          : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Monthly_Repayment: map['Monthly_Repayment'] != null
          ? map['Monthly_Repayment'] as double
          : null,
      Monthly_Principal_Repayment: map['Monthly_Principal_Repayment'] != null
          ? map['Monthly_Principal_Repayment'] as double
          : null,
      Monthly_Interest_Repayment: map['Monthly_Interest_Repayment'] != null
          ? map['Monthly_Interest_Repayment'] as double
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

      default:
        return "";
    }
  }
}
