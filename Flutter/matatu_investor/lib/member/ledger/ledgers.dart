import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:matatu/common/Apis.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ledgers {
  String? Key;
  DateTime? Posting_Date;
  String? Document_No;
  String? Customer_No;
  double? Debit_Amount;
  double? Credit_Amount;
  String? Currency_Code;
  double? Amount;
  double? Amount_LCY;
  String? User_ID;
  String? Source_Code;
  String? Reason_Code;
  Transaction_Types? Transaction_Type;
  String? Vehicle_No;
  bool? Unapplied;
  int? Unapplied_by_Entry_No;
  int? Cust_Ledger_Entry_No;
  int? Entry_No;
  String? Loan_Number;
  String? Month;
  String? Description;
  String? TransactionType;
  ledgers({
    this.Key,
    this.Posting_Date,
    this.Document_No,
    this.Customer_No,
    this.Debit_Amount,
    this.Credit_Amount,
    this.Currency_Code,
    this.Amount,
    this.Amount_LCY,
    this.User_ID,
    this.Source_Code,
    this.Reason_Code,
    this.Transaction_Type,
    this.Vehicle_No,
    this.Unapplied,
    this.Unapplied_by_Entry_No,
    this.Cust_Ledger_Entry_No,
    this.Entry_No,
    this.Loan_Number,
    this.Month,
    this.Description,
    this.TransactionType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Posting_Date': Posting_Date?.millisecondsSinceEpoch,
      'Document_No': Document_No,
      'Customer_No': Customer_No,
      'Debit_Amount': Debit_Amount,
      'Credit_Amount': Credit_Amount,
      'Currency_Code': Currency_Code,
      'Amount': Amount,
      'Amount_LCY': Amount_LCY,
      'User_ID': User_ID,
      'Source_Code': Source_Code,
      'Reason_Code': Reason_Code,
      'Transaction_Type': Transaction_Type?.index,
      'Vehicle_No': Vehicle_No,
      'Unapplied': Unapplied,
      'Unapplied_by_Entry_No': Unapplied_by_Entry_No,
      'Cust_Ledger_Entry_No': Cust_Ledger_Entry_No,
      'Entry_No': Entry_No,
      'Loan_Number': Loan_Number,
      'Month': Month,
      'Description': Description,
      'TransactionType': TransactionType,
    };
  }

  factory ledgers.fromMap(Map<String, dynamic> map) {
    return ledgers(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Posting_Date: map['Posting_Date'] != null
          ? DateTime.tryParse((map['Posting_Date'] ?? 0))
          : null,
      Document_No:
          map['Document_No'] != null ? map['Document_No'] as String : null,
      Customer_No:
          map['Customer_No'] != null ? map['Customer_No'] as String : null,
      Debit_Amount:
          map['Debit_Amount'] != null ? map['Debit_Amount'] as double : null,
      Credit_Amount:
          map['Credit_Amount'] != null ? map['Credit_Amount'] as double : null,
      Currency_Code:
          map['Currency_Code'] != null ? map['Currency_Code'] as String : null,
      Amount: map['Amount'] != null ? map['Amount'] as double : null,
      Amount_LCY:
          map['Amount_LCY'] != null ? map['Amount_LCY'] as double : null,
      User_ID: map['User_ID'] != null ? map['User_ID'] as String : null,
      Source_Code:
          map['Source_Code'] != null ? map['Source_Code'] as String : null,
      Reason_Code:
          map['Reason_Code'] != null ? map['Reason_Code'] as String : null,
      Transaction_Type: map['Transaction_Type'] != null
          ? Transaction_Types.values[(map['Transaction_Type'] ?? 0) as int]
          : null,
      Vehicle_No:
          map['Vehicle_No'] != null ? map['Vehicle_No'] as String : null,
      Unapplied: map['Unapplied'] != null ? map['Unapplied'] as bool : null,
      Unapplied_by_Entry_No: map['Unapplied_by_Entry_No'] != null
          ? map['Unapplied_by_Entry_No'] as int
          : null,
      Cust_Ledger_Entry_No: map['Cust_Ledger_Entry_No'] != null
          ? map['Cust_Ledger_Entry_No'] as int
          : null,
      Entry_No: map['Entry_No'] != null ? map['Entry_No'] as int : null,
      Loan_Number:
          map['Loan_Number'] != null ? map['Loan_Number'] as String : null,
      Month: map['Month'] != null ? map['Month'] as String : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
      TransactionType: map['TransactionType'] != null
          ? map['TransactionType'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ledgers.fromJson(String source) =>
      ledgers.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum Transaction_Types {
  @JsonValue(0)
  _blank_,
  @JsonValue(1)
  Service_Fee_Paid,
  @JsonValue(2)
  Deposit_Payment,
  @JsonValue(3)
  Capital_Payment,
  @JsonValue(4)
  Loan,
  @JsonValue(5)
  Repayment,
  @JsonValue(6)
  Interest_Debit,
  @JsonValue(7)
  Interest_Credit,
  @JsonValue(8)
  Insurance,
  @JsonValue(9)
  Housing,
  @JsonValue(10)
  Xmas,
  @JsonValue(11)
  Welfare,
  @JsonValue(12)
  Super_Save,
  @JsonValue(13)
  Savings,
  @JsonValue(14)
  Penalty_Charged,
  @JsonValue(15)
  Penalty_Paid,
  @JsonValue(16)
  Land,
  @JsonValue(17)
  Investment,
  @JsonValue(18)
  Parking,
  @JsonValue(19)
  Collateral,
  @JsonValue(20)
  Buses,
  @JsonValue(21)
  Registration,
}

class ledger_request extends Request {
  List<Transaction_Types>? TType;

  ledger_request(
      {Header? header,
      String? body,
      String? Otp,
      String? phone,
      String? Otp_message,
      String? bookmark,
      int? size,
      this.TType})
      : super(
            header: header,
            body: body,
            Otp: Otp,
            phone: phone,
            Otp_message: Otp_message,
            bookmark: bookmark,
            size: size);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header?.toMap(),
      'body': body,
      'Otp': Otp,
      'phone': phone,
      'Otp_message': Otp_message,
      'bookmark': bookmark,
      'size': size,
      'TType': TType?.map((x) => x.index).toList(),
    };
  }

  factory ledger_request.fromMap(Map<String, dynamic> map) {
    final List<dynamic> hobbyList = map['TType'];
    final List<Transaction_Types> hobbies = hobbyList
        .cast<Transaction_Types>(); // Convert dynamic list to String list
    return ledger_request(
        header: map['header'] != null
            ? Header.fromMap(map['header'] as Map<String, dynamic>)
            : null,
        body: map['body'] != null ? map['body'] as String : null,
        Otp: map['Otp'] != null ? map['Otp'] as String : null,
        phone: map['phone'] != null ? map['phone'] as String : null,
        Otp_message:
            map['Otp_message'] != null ? map['Otp_message'] as String : null,
        bookmark: map['bookmark'] != null ? map['bookmark'] as String : null,
        size: map['size'] != null ? map['size'] as int : null,
        TType: hobbies);
  }

  String toJson() => json.encode(toMap());

  factory ledger_request.fromJson(String source) =>
      ledger_request.fromMap(json.decode(source) as Map<String, dynamic>);
}
