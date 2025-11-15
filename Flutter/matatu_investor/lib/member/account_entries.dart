// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AccountRequest {
  String? Account;

  AccountRequest({this.Account});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Account': Account,
    };
  }

  factory AccountRequest.fromMap(Map<String, dynamic> map) {
    return AccountRequest(
      Account: map['Account'] != null ? map['Account'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountRequest.fromJson(String source) =>
      AccountRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AccountEntry {
  String? Key;
  DateTime? Posting_Date;
  bool? Posting_DateSpecified;
  int? Entry_Type;
  bool? Entry_TypeSpecified;
  int? Document_Type;
  bool? Document_TypeSpecified;
  String? Document_No;
  String? Vendor_No;
  String? Initial_Entry_Global_Dim_1;
  String? Initial_Entry_Global_Dim_2;
  String? Currency_Code;
  double? Amount;
  bool? AmountSpecified;
  double? Amount_LCY;
  bool? Amount_LCYSpecified;
  double? Debit_Amount;
  bool? Debit_AmountSpecified;
  double? Debit_Amount_LCY;
  bool? Debit_Amount_LCYSpecified;
  double? Credit_Amount;
  bool? Credit_AmountSpecified;
  double? Credit_Amount_LCY;
  bool? Credit_Amount_LCYSpecified;
  DateTime? Initial_Entry_Due_Date;
  bool? Initial_Entry_Due_DateSpecified;
  String? User_ID;
  String? Source_Code;
  String? Reason_Code;
  bool? Unapplied;
  bool? UnappliedSpecified;
  int? Unapplied_by_Entry_No;
  bool? Unapplied_by_Entry_NoSpecified;
  int? Vendor_Ledger_Entry_No;
  bool? Vendor_Ledger_Entry_NoSpecified;
  String? Member_No;
  String? Loan_No;
  String? Motorvehicle_Code;
  int? Posting_Type;
  bool? Posting_TypeSpecified;
  int? Transaction_Type;
  bool? Transaction_TypeSpecified;
  int? Entry_No;
  bool? Entry_NoSpecified;
  String? Month;
  bool? Reversed;
  bool? ReversedSpecified;
  String? Description;

  AccountEntry({
    this.Key,
    this.Posting_Date,
    this.Posting_DateSpecified,
    this.Entry_Type,
    this.Entry_TypeSpecified,
    this.Document_Type,
    this.Document_TypeSpecified,
    this.Document_No,
    this.Vendor_No,
    this.Initial_Entry_Global_Dim_1,
    this.Initial_Entry_Global_Dim_2,
    this.Currency_Code,
    this.Amount,
    this.AmountSpecified,
    this.Amount_LCY,
    this.Amount_LCYSpecified,
    this.Debit_Amount,
    this.Debit_AmountSpecified,
    this.Debit_Amount_LCY,
    this.Debit_Amount_LCYSpecified,
    this.Credit_Amount,
    this.Credit_AmountSpecified,
    this.Credit_Amount_LCY,
    this.Credit_Amount_LCYSpecified,
    this.Initial_Entry_Due_Date,
    this.Initial_Entry_Due_DateSpecified,
    this.User_ID,
    this.Source_Code,
    this.Reason_Code,
    this.Unapplied,
    this.UnappliedSpecified,
    this.Unapplied_by_Entry_No,
    this.Unapplied_by_Entry_NoSpecified,
    this.Vendor_Ledger_Entry_No,
    this.Vendor_Ledger_Entry_NoSpecified,
    this.Member_No,
    this.Loan_No,
    this.Motorvehicle_Code,
    this.Posting_Type,
    this.Posting_TypeSpecified,
    this.Transaction_Type,
    this.Transaction_TypeSpecified,
    this.Entry_No,
    this.Entry_NoSpecified,
    this.Month,
    this.Reversed,
    this.ReversedSpecified,
    this.Description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Posting_Date': Posting_Date?.toIso8601String(),
      'Posting_DateSpecified': Posting_DateSpecified,
      'Entry_Type': Entry_Type,
      'Entry_TypeSpecified': Entry_TypeSpecified,
      'Document_Type': Document_Type,
      'Document_TypeSpecified': Document_TypeSpecified,
      'Document_No': Document_No,
      'Vendor_No': Vendor_No,
      'Initial_Entry_Global_Dim_1': Initial_Entry_Global_Dim_1,
      'Initial_Entry_Global_Dim_2': Initial_Entry_Global_Dim_2,
      'Currency_Code': Currency_Code,
      'Amount': Amount,
      'AmountSpecified': AmountSpecified,
      'Amount_LCY': Amount_LCY,
      'Amount_LCYSpecified': Amount_LCYSpecified,
      'Debit_Amount': Debit_Amount,
      'Debit_AmountSpecified': Debit_AmountSpecified,
      'Debit_Amount_LCY': Debit_Amount_LCY,
      'Debit_Amount_LCYSpecified': Debit_Amount_LCYSpecified,
      'Credit_Amount': Credit_Amount,
      'Credit_AmountSpecified': Credit_AmountSpecified,
      'Credit_Amount_LCY': Credit_Amount_LCY,
      'Credit_Amount_LCYSpecified': Credit_Amount_LCYSpecified,
      'Initial_Entry_Due_Date': Initial_Entry_Due_Date?.toIso8601String(),
      'Initial_Entry_Due_DateSpecified': Initial_Entry_Due_DateSpecified,
      'User_ID': User_ID,
      'Source_Code': Source_Code,
      'Reason_Code': Reason_Code,
      'Unapplied': Unapplied,
      'UnappliedSpecified': UnappliedSpecified,
      'Unapplied_by_Entry_No': Unapplied_by_Entry_No,
      'Unapplied_by_Entry_NoSpecified': Unapplied_by_Entry_NoSpecified,
      'Vendor_Ledger_Entry_No': Vendor_Ledger_Entry_No,
      'Vendor_Ledger_Entry_NoSpecified': Vendor_Ledger_Entry_NoSpecified,
      'Member_No': Member_No,
      'Loan_No': Loan_No,
      'Motorvehicle_Code': Motorvehicle_Code,
      'Posting_Type': Posting_Type,
      'Posting_TypeSpecified': Posting_TypeSpecified,
      'Transaction_Type': Transaction_Type,
      'Transaction_TypeSpecified': Transaction_TypeSpecified,
      'Entry_No': Entry_No,
      'Entry_NoSpecified': Entry_NoSpecified,
      'Month': Month,
      'Reversed': Reversed,
      'ReversedSpecified': ReversedSpecified,
      'Description': Description,
    };
  }

  factory AccountEntry.fromMap(Map<String, dynamic> map) {
    DateTime? parseDate(dynamic dateValue) {
      if (dateValue == null) return null;
      try {
        if (dateValue is DateTime) return dateValue;
        if (dateValue is String) return DateTime.parse(dateValue);
        return null;
      } catch (e) {
        return null;
      }
    }

    return AccountEntry(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Posting_Date: parseDate(map['Posting_Date']),
      Posting_DateSpecified: map['Posting_DateSpecified'] != null
          ? map['Posting_DateSpecified'] as bool
          : null,
      Entry_Type: map['Entry_Type'] != null
          ? (map['Entry_Type'] is double
              ? (map['Entry_Type'] as double).toInt()
              : map['Entry_Type'] as int)
          : null,
      Entry_TypeSpecified: map['Entry_TypeSpecified'] != null
          ? map['Entry_TypeSpecified'] as bool
          : null,
      Document_Type: map['Document_Type'] != null
          ? (map['Document_Type'] is double
              ? (map['Document_Type'] as double).toInt()
              : map['Document_Type'] as int)
          : null,
      Document_TypeSpecified: map['Document_TypeSpecified'] != null
          ? map['Document_TypeSpecified'] as bool
          : null,
      Document_No:
          map['Document_No'] != null ? map['Document_No'] as String : null,
      Vendor_No: map['Vendor_No'] != null ? map['Vendor_No'] as String : null,
      Initial_Entry_Global_Dim_1: map['Initial_Entry_Global_Dim_1'] != null
          ? map['Initial_Entry_Global_Dim_1'] as String
          : null,
      Initial_Entry_Global_Dim_2: map['Initial_Entry_Global_Dim_2'] != null
          ? map['Initial_Entry_Global_Dim_2'] as String
          : null,
      Currency_Code:
          map['Currency_Code'] != null ? map['Currency_Code'] as String : null,
      Amount: map['Amount'] != null
          ? (map['Amount'] is int
              ? (map['Amount'] as int).toDouble()
              : map['Amount'] as double)
          : null,
      AmountSpecified: map['AmountSpecified'] != null
          ? map['AmountSpecified'] as bool
          : null,
      Amount_LCY: map['Amount_LCY'] != null
          ? (map['Amount_LCY'] is int
              ? (map['Amount_LCY'] as int).toDouble()
              : map['Amount_LCY'] as double)
          : null,
      Amount_LCYSpecified: map['Amount_LCYSpecified'] != null
          ? map['Amount_LCYSpecified'] as bool
          : null,
      Debit_Amount: map['Debit_Amount'] != null
          ? (map['Debit_Amount'] is int
              ? (map['Debit_Amount'] as int).toDouble()
              : map['Debit_Amount'] as double)
          : null,
      Debit_AmountSpecified: map['Debit_AmountSpecified'] != null
          ? map['Debit_AmountSpecified'] as bool
          : null,
      Debit_Amount_LCY: map['Debit_Amount_LCY'] != null
          ? (map['Debit_Amount_LCY'] is int
              ? (map['Debit_Amount_LCY'] as int).toDouble()
              : map['Debit_Amount_LCY'] as double)
          : null,
      Debit_Amount_LCYSpecified: map['Debit_Amount_LCYSpecified'] != null
          ? map['Debit_Amount_LCYSpecified'] as bool
          : null,
      Credit_Amount: map['Credit_Amount'] != null
          ? (map['Credit_Amount'] is int
              ? (map['Credit_Amount'] as int).toDouble()
              : map['Credit_Amount'] as double)
          : null,
      Credit_AmountSpecified: map['Credit_AmountSpecified'] != null
          ? map['Credit_AmountSpecified'] as bool
          : null,
      Credit_Amount_LCY: map['Credit_Amount_LCY'] != null
          ? (map['Credit_Amount_LCY'] is int
              ? (map['Credit_Amount_LCY'] as int).toDouble()
              : map['Credit_Amount_LCY'] as double)
          : null,
      Credit_Amount_LCYSpecified: map['Credit_Amount_LCYSpecified'] != null
          ? map['Credit_Amount_LCYSpecified'] as bool
          : null,
      Initial_Entry_Due_Date: parseDate(map['Initial_Entry_Due_Date']),
      Initial_Entry_Due_DateSpecified:
          map['Initial_Entry_Due_DateSpecified'] != null
              ? map['Initial_Entry_Due_DateSpecified'] as bool
              : null,
      User_ID: map['User_ID'] != null ? map['User_ID'] as String : null,
      Source_Code:
          map['Source_Code'] != null ? map['Source_Code'] as String : null,
      Reason_Code:
          map['Reason_Code'] != null ? map['Reason_Code'] as String : null,
      Unapplied: map['Unapplied'] != null ? map['Unapplied'] as bool : null,
      UnappliedSpecified: map['UnappliedSpecified'] != null
          ? map['UnappliedSpecified'] as bool
          : null,
      Unapplied_by_Entry_No: map['Unapplied_by_Entry_No'] != null
          ? (map['Unapplied_by_Entry_No'] is double
              ? (map['Unapplied_by_Entry_No'] as double).toInt()
              : map['Unapplied_by_Entry_No'] as int)
          : null,
      Unapplied_by_Entry_NoSpecified:
          map['Unapplied_by_Entry_NoSpecified'] != null
              ? map['Unapplied_by_Entry_NoSpecified'] as bool
              : null,
      Vendor_Ledger_Entry_No: map['Vendor_Ledger_Entry_No'] != null
          ? (map['Vendor_Ledger_Entry_No'] is double
              ? (map['Vendor_Ledger_Entry_No'] as double).toInt()
              : map['Vendor_Ledger_Entry_No'] as int)
          : null,
      Vendor_Ledger_Entry_NoSpecified:
          map['Vendor_Ledger_Entry_NoSpecified'] != null
              ? map['Vendor_Ledger_Entry_NoSpecified'] as bool
              : null,
      Member_No: map['Member_No'] != null ? map['Member_No'] as String : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
      Motorvehicle_Code: map['Motorvehicle_Code'] != null
          ? map['Motorvehicle_Code'] as String
          : null,
      Posting_Type: map['Posting_Type'] != null
          ? (map['Posting_Type'] is double
              ? (map['Posting_Type'] as double).toInt()
              : map['Posting_Type'] as int)
          : null,
      Posting_TypeSpecified: map['Posting_TypeSpecified'] != null
          ? map['Posting_TypeSpecified'] as bool
          : null,
      Transaction_Type: map['Transaction_Type'] != null
          ? (map['Transaction_Type'] is double
              ? (map['Transaction_Type'] as double).toInt()
              : map['Transaction_Type'] as int)
          : null,
      Transaction_TypeSpecified: map['Transaction_TypeSpecified'] != null
          ? map['Transaction_TypeSpecified'] as bool
          : null,
      Entry_No: map['Entry_No'] != null
          ? (map['Entry_No'] is double
              ? (map['Entry_No'] as double).toInt()
              : map['Entry_No'] as int)
          : null,
      Entry_NoSpecified: map['Entry_NoSpecified'] != null
          ? map['Entry_NoSpecified'] as bool
          : null,
      Month: map['Month'] != null ? map['Month'] as String : null,
      Reversed: map['Reversed'] != null ? map['Reversed'] as bool : null,
      ReversedSpecified: map['ReversedSpecified'] != null
          ? map['ReversedSpecified'] as bool
          : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountEntry.fromJson(String source) =>
      AccountEntry.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AccountEntriesResults {
  int? Code;
  String? Desc;
  List<AccountEntry>? Contents;

  AccountEntriesResults({
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.map((x) => x.toMap()).toList(),
    };
  }

  factory AccountEntriesResults.fromMap(Map<String, dynamic> map) {
    return AccountEntriesResults(
      Code: map['Code'] != null
          ? (map['Code'] is double
              ? (map['Code'] as double).toInt()
              : map['Code'] as int)
          : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<AccountEntry>.from(
              (map['Contents'] as List).map<AccountEntry?>(
                (x) => AccountEntry.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountEntriesResults.fromJson(String source) =>
      AccountEntriesResults.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
