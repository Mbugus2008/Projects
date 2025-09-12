// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'enums.dart';

class Transaction {
  String? Key;
  String? Account_No;
  String? Account_Name;
  String? Product_Name;
  String? Document_No;
  DateTime? Document_Date;
  DateTime? Transaction_Time;
  double? Account_Balance;
  //enum
  transaction_Type? Transaction_Type;
  String? Telephone_Number;
  bool? Posted;
  DateTime? Date_Posted;
  String? Account_2;
  //enum
  status? Status;
  String? Loan_No;
  String? Comments;
  double? Amount;
  double? Charge;
  double? Amount_LCY;
  String? Description;
  int? Entry;
  String? Client;
  //enum
  source? Source;
  //enum
  destination? Destination;
  //enum
  loan_Type? Loan_Type;
  String? Receipt_No;
  //enum
  channel? Channel;
  bool? Dont_Charge;
  String? Member_No;
  int? Loan_Period;
  double? Rate;
  //enum
  product_Category? Product_Category;
  double? Loan_Balance;
  String? Bank;
  //enum
  transfer_type? Transfer_type;
  //enum
  bank_Transfer_type? Bank_Transfer_type;
  String? Product_Id;
  String? Sector;
  String? Fosa_Account;
  bool? Hold;
  bool? Self_Guarantee;
  double? Boost_Amount;
  int? Code;
  String? Desc;
  String? Agency_Code;
  double? Float_Amount;
  String? Agent_Account;
  String? Account_Type;
  double? Agent_commision;
  double? Sacco_Commission;
  double? Vendor_commission;
  double? Excise_Duty;
  DateTime? Statement_From;
  DateTime? Statement_to;
  String? Email;
  Transaction({
    this.Key,
    this.Account_No,
    this.Account_Name,
    this.Product_Name,
    this.Document_No,
    this.Document_Date,
    this.Transaction_Time,
    this.Account_Balance,
    this.Transaction_Type,
    this.Telephone_Number,
    this.Posted,
    this.Date_Posted,
    this.Account_2,
    this.Status,
    this.Loan_No,
    this.Comments,
    this.Amount,
    this.Charge,
    this.Amount_LCY,
    this.Description,
    this.Entry,
    this.Client,
    this.Source,
    this.Destination,
    this.Loan_Type,
    this.Receipt_No,
    this.Channel,
    this.Dont_Charge,
    this.Member_No,
    this.Loan_Period,
    this.Rate,
    this.Product_Category,
    this.Loan_Balance,
    this.Bank,
    this.Transfer_type,
    this.Bank_Transfer_type,
    this.Product_Id,
    this.Sector,
    this.Fosa_Account,
    this.Hold,
    this.Self_Guarantee,
    this.Boost_Amount,
    this.Code,
    this.Desc,
    this.Agency_Code,
    this.Float_Amount,
    this.Agent_Account,
    this.Account_Type,
    this.Agent_commision,
    this.Sacco_Commission,
    this.Vendor_commission,
    this.Excise_Duty,
    this.Statement_From,
    this.Statement_to,
    this.Email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Account_No': Account_No,
      'Account_Name': Account_Name,
      'Product_Name': Product_Name,
      'Document_No': Document_No,
      'Document_Date': Document_Date?.millisecondsSinceEpoch,
      'Transaction_Time': Transaction_Time?.millisecondsSinceEpoch,
      'Account_Balance': Account_Balance,
      'Transaction_Type': Transaction_Type?.index,
      'Telephone_Number': Telephone_Number,
      'Posted': Posted,
      'Date_Posted': Date_Posted?.millisecondsSinceEpoch,
      'Account_2': Account_2,
      'Status': Status?.index,
      'Loan_No': Loan_No,
      'Comments': Comments,
      'Amount': Amount,
      'Charge': Charge,
      'Amount_LCY': Amount_LCY,
      'Description': Description,
      'Entry': Entry,
      'Client': Client,
      'Source': Source?.index,
      'Destination': Destination?.index,
      'Loan_Type': Loan_Type?.index,
      'Receipt_No': Receipt_No,
      'Channel': Channel?.index,
      'Dont_Charge': Dont_Charge,
      'Member_No': Member_No,
      'Loan_Period': Loan_Period,
      'Rate': Rate,
      'Product_Category': Product_Category?.index,
      'Loan_Balance': Loan_Balance,
      'Bank': Bank,
      'Transfer_type': Transfer_type?.index,
      'Bank_Transfer_type': Bank_Transfer_type?.index,
      'Product_Id': Product_Id,
      'Sector': Sector,
      'Fosa_Account': Fosa_Account,
      'Hold': Hold,
      'Self_Guarantee': Self_Guarantee,
      'Boost_Amount': Boost_Amount,
      'Code': Code,
      'Desc': Desc,
      'Agency_Code': Agency_Code,
      'Float_Amount': Float_Amount,
      'Agent_Account': Agent_Account,
      'Account_Type': Account_Type,
      'Agent_commision': Agent_commision,
      'Sacco_Commission': Sacco_Commission,
      'Vendor_commission': Vendor_commission,
      'Excise_Duty': Excise_Duty,
      'Statement_From': Statement_From?.millisecondsSinceEpoch,
      'Statement_to': Statement_to?.millisecondsSinceEpoch,
      'Email': Email,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Account_No:
          map['Account_No'] != null ? map['Account_No'] as String : null,
      Account_Name:
          map['Account_Name'] != null ? map['Account_Name'] as String : null,
      Product_Name:
          map['Product_Name'] != null ? map['Product_Name'] as String : null,
      Document_No:
          map['Document_No'] != null ? map['Document_No'] as String : null,
      Document_Date: map['Document_Date'] != null
          ? DateTime.tryParse((map['Document_Date'] ?? 0))
          : null,
      Transaction_Time: map['Transaction_Time'] != null
          ? DateTime.tryParse((map['Transaction_Time'] ?? 0))
          : null,
      Account_Balance: map['Account_Balance'] != null
          ? map['Account_Balance'] as double
          : null,
      Transaction_Type: map['Transaction_Type'] != null
          ? transaction_Type?.values[(map['Transaction_Type'] ?? 0) as int]
          : null,
      Telephone_Number: map['Telephone_Number'] != null
          ? map['Telephone_Number'] as String
          : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Date_Posted: map['Date_Posted'] != null
          ? DateTime.tryParse((map['Date_Posted'] ?? 0))
          : null,
      Account_2: map['Account_2'] != null ? map['Account_2'] as String : null,
      Status: map['Status'] != null
          ? status?.values[(map['Status'] ?? 0) as int]
          : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
      Comments: map['Comments'] != null ? map['Comments'] as String : null,
      Amount: map['Amount'] != null ? map['Amount'] as double : null,
      Charge: map['Charge'] != null ? map['Charge'] as double : null,
      Amount_LCY:
          map['Amount_LCY'] != null ? map['Amount_LCY'] as double : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
      Entry: map['Entry'] != null ? map['Entry'] as int : null,
      Client: map['Client'] != null ? map['Client'] as String : null,
      Source: map['Source'] != null
          ? source?.values[(map['Source'] ?? 0) as int]
          : null,
      Destination: map['Destination'] != null
          ? destination?.values[(map['Destination'] ?? 0) as int]
          : null,
      Loan_Type: map['Loan_Type'] != null
          ? loan_Type?.values[(map['Loan_Type'] ?? 0) as int]
          : null,
      Receipt_No:
          map['Receipt_No'] != null ? map['Receipt_No'] as String : null,
      Channel: map['Channel'] != null
          ? channel?.values[(map['Channel'] ?? 0) as int]
          : null,
      Dont_Charge:
          map['Dont_Charge'] != null ? map['Dont_Charge'] as bool : null,
      Member_No: map['Member_No'] != null ? map['Member_No'] as String : null,
      Loan_Period:
          map['Loan_Period'] != null ? map['Loan_Period'] as int : null,
      Rate: map['Rate'] != null ? map['Rate'] as double : null,
      Product_Category: map['Product_Category'] != null
          ? product_Category?.values[(map['Product_Category'] ?? 0) as int]
          : null,
      Loan_Balance:
          map['Loan_Balance'] != null ? map['Loan_Balance'] as double : null,
      Bank: map['Bank'] != null ? map['Bank'] as String : null,
      Transfer_type: map['Transfer_type'] != null
          ? transfer_type?.values[(map['Transfer_type'] ?? 0) as int]
          : null,
      Bank_Transfer_type: map['Bank_Transfer_type'] != null
          ? bank_Transfer_type?.values[(map['Bank_Transfer_type'] ?? 0) as int]
          : null,
      Product_Id:
          map['Product_Id'] != null ? map['Product_Id'] as String : null,
      Sector: map['Sector'] != null ? map['Sector'] as String : null,
      Fosa_Account:
          map['Fosa_Account'] != null ? map['Fosa_Account'] as String : null,
      Hold: map['Hold'] != null ? map['Hold'] as bool : null,
      Self_Guarantee:
          map['Self_Guarantee'] != null ? map['Self_Guarantee'] as bool : null,
      Boost_Amount:
          map['Boost_Amount'] != null ? map['Boost_Amount'] as double : null,
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Agency_Code:
          map['Agency_Code'] != null ? map['Agency_Code'] as String : null,
      Float_Amount:
          map['Float_Amount'] != null ? map['Float_Amount'] as double : null,
      Agent_Account:
          map['Agent_Account'] != null ? map['Agent_Account'] as String : null,
      Account_Type:
          map['Account_Type'] != null ? map['Account_Type'] as String : null,
      Agent_commision: map['Agent_commision'] != null
          ? map['Agent_commision'] as double
          : null,
      Sacco_Commission: map['Sacco_Commission'] != null
          ? map['Sacco_Commission'] as double
          : null,
      Vendor_commission: map['Vendor_commission'] != null
          ? map['Vendor_commission'] as double
          : null,
      Excise_Duty:
          map['Excise_Duty'] != null ? map['Excise_Duty'] as double : null,
      Statement_From: map['Statement_From'] != null
          ? DateTime.tryParse((map['Statement_From'] ?? 0))
          : null,
      Statement_to: map['Statement_to'] != null
          ? DateTime.tryParse((map['Statement_to'] ?? 0))
          : null,
      Email: map['Email'] != null ? map['Email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);
}
