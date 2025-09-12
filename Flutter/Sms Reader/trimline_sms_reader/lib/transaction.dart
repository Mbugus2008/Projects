// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'dart:convert';

enum TransType { Receipts, Payments }

class transaction {
  int id;
  String? Receipt_No;
  String? Reference;
  DateTime? Completion_Time;
  String? Detaills;
  int? Status;
  double? Withdrawn = 0;
  double? Paid_In = 0;
  double? Charge = 0;
  String? Other_Party_Info;
  String? A_C_No;
  String? Phone;
  String? Name;
  DateTime? Transaction_Date;
  bool? Sent;
  String? Comments;
  String? Purpose;
  String? District;
  TransType? Transtype;

  transaction({
    this.id = 0,
    this.Receipt_No,
    this.Reference,
    this.Completion_Time,
    this.Detaills,
    this.Status,
    this.Withdrawn,
    this.Paid_In,
    this.Charge,
    this.Other_Party_Info,
    this.A_C_No,
    this.Phone,
    this.Name,
    this.Transaction_Date,
    this.Sent,
    this.Comments,
    this.Purpose,
    this.District,
    this.Transtype,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Receipt_No': Receipt_No,
      'Reference': Reference,
      'Completion_Time': Completion_Time?.toString(),
      'Detaills': Detaills,
      'Status': Status,
      'Withdrawn': Withdrawn,
      'Paid_In': Paid_In,
      'Charge': Charge,
      'Other_Party_Info': Other_Party_Info,
      'A_C_No': A_C_No,
      'Phone': Phone,
      'Name': Name,
      'Transaction_Date': Transaction_Date?.toString(),
      'Sent': Sent,
      'Comments': Comments,
      'Purpose': Purpose,
      'District': District,
      'Transtype': Transtype?.index,
    };
  }

  Map<String, dynamic> tabletoMap() {
    return <String, dynamic>{
      'Receipt_No': Receipt_No,
      'Reference': Reference,
      'Completion_Time': Completion_Time?.millisecondsSinceEpoch,
      'Detaills': Detaills,
      'Paid_In': Paid_In,
      'Charge': Charge,
      'Other_Party_Info': Other_Party_Info,
      'A_C_No_': A_C_No,
      'Phone': Phone,
      'Name': Name,
      'Sent': Sent,
      'Comments': Comments,
      'Purpose': Purpose,
      'District': District,
      'Transtype': Transtype?.index,
    };
  }

  factory transaction.fromtableMap(Map<String, dynamic> map) {
    return transaction(
      id: (map['id'] ?? 0) as int,
      Receipt_No:
          map['Receipt_No'] != null ? map['Receipt_No'] as String : null,
      Reference: map['Reference'] != null ? map['Reference'] as String : null,
      Completion_Time: map['Completion_Time'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['Completion_Time'] ?? 0) as int)
          : null,
      Detaills: map['Detaills'] != null ? map['Detaills'] as String : null,
      Status: map['Status'] != null ? map['Status'] as int : null,
      Withdrawn: map['Withdrawn'] != null ? map['Withdrawn'] as double : null,
      Paid_In: map['Paid_In'] != null ? map['Paid_In'] as double : null,
      Charge: map['Charge'] != null ? map['Charge'] as double : null,
      Other_Party_Info: map['Other_Party_Info'] != null
          ? map['Other_Party_Info'] as String
          : null,
      A_C_No: map['A_C_No_'] != null ? map['A_C_No_'] as String : null,
      Phone: map['Phone'] != null ? map['Phone'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      Transaction_Date: map['Transaction_Date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['Transaction_Date'] ?? 0) as int)
          : null,
      Sent: map['Sent'] != null ? (map['Sent'] == 0 ? true : false) : null,
      Comments: map['Comments'] != null ? map['Comments'] as String : null,
      Purpose: map['Purpose'] != null ? map['Purpose'] as String : null,
      District: map['District'] != null ? map['District'] as String : null,
      Transtype: map['Transtype'] != null
          ? TransType.values[(map['Transtype'] as int)]
          : null,
    );
  }
  factory transaction.fromMap(Map<String, dynamic> map) {
    return transaction(
      id: (map['id'] ?? 0) as int,
      Receipt_No:
          map['Receipt_No'] != null ? map['Receipt_No'] as String : null,
      Reference: map['Reference'] != null ? map['Reference'] as String : null,
      Completion_Time: map['Completion_Time'] != null
          ? DateTime.tryParse((map['Completion_Time'] ?? 0))
          : null,
      Detaills: map['Detaills'] != null ? map['Detaills'] as String : null,
      Status: map['Status'] != null ? map['Status'] as int : null,
      Withdrawn: map['Withdrawn'] != null ? map['Withdrawn'] as double : null,
      Paid_In: map['Paid_In'] != null ? map['Paid_In'] as double : null,
      Charge: map['Charge'] != null ? map['Charge'] as double : null,
      Other_Party_Info: map['Other_Party_Info'] != null
          ? map['Other_Party_Info'] as String
          : null,
      A_C_No: map['A_C_No'] != null ? map['A_C_No'] as String : null,
      Phone: map['Phone'] != null ? map['Phone'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      Transaction_Date: map['Transaction_Date'] != null
          ? DateTime.tryParse((map['Transaction_Date'] ?? 0))
          : null,
      Sent: map['Sent'] != null ? map['Sent'] as bool : null,
      Comments: map['Comments'] != null ? map['Comments'] as String : null,
      Purpose: map['Purpose'] != null ? map['Purpose'] as String : null,
      District: map['District'] != null ? map['District'] as String : null,
      Transtype: map['Transtype'] != null
          ? TransType.values[(map['Transtype'] as int)]
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory transaction.fromJson(String source) =>
      transaction.fromMap(json.decode(source) as Map<String, dynamic>);
}
