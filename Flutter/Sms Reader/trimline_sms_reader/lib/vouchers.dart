import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:trimline_sms_reader/t__results.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class Vouchers implements Tomaps {
  String? Key;
  String? Document_No;
  DateTime? Document_Date;
  DateTime? Posting_Date;

  String? Account_No;
  String? Payment_Ref_No;
  double? Payment_Amount;
  double? Amount_Spent;
  String? Posting_Description;

  String? Created_By;
  DateTime? Created_On;
  bool? Posted;
  String? Posted_By;
  DateTime? Posted_On;
  String? Global_Dimension_1_Code;
  String? Global_Dimension_2_Code;
  String? Req_No;
  String? Cheque_No;
  Vouchers({
    this.Key,
    this.Document_No,
    this.Document_Date,
    this.Posting_Date,
    this.Account_No,
    this.Payment_Ref_No,
    this.Payment_Amount,
    this.Amount_Spent,
    this.Posting_Description,
    this.Created_By,
    this.Created_On,
    this.Posted,
    this.Posted_By,
    this.Posted_On,
    this.Global_Dimension_1_Code,
    this.Global_Dimension_2_Code,
    this.Req_No,
    this.Cheque_No,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Document_No': Document_No,
      'Document_Date': Document_Date?.millisecondsSinceEpoch,
      'Posting_Date': Posting_Date?.millisecondsSinceEpoch,
      'Account_No': Account_No,
      'Payment_Ref_No': Payment_Ref_No,
      'Payment_Amount': Payment_Amount,
      'Amount_Spent': Amount_Spent,
      'Posting_Description': Posting_Description,
      'Created_By': Created_By,
      'Created_On': Created_On?.millisecondsSinceEpoch,
      'Posted': Posted,
      'Posted_By': Posted_By,
      'Posted_On': Posted_On?.millisecondsSinceEpoch,
      'Global_Dimension_1_Code': Global_Dimension_1_Code,
      'Global_Dimension_2_Code': Global_Dimension_2_Code,
      'Req_No': Req_No,
      'Cheque_No': Cheque_No,
    };
  }

  factory Vouchers.fromMap(Map<String, dynamic> map) {
    return Vouchers(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Document_No:
          map['Document_No'] != null ? map['Document_No'] as String : null,
      Document_Date: map['Document_Date'] != null
          ? DateFormat("yyyy-MM-dd").parse((map['Document_Date'] ?? 0))
          : null,
      Posting_Date: map['Posting_Date'] != null
          ? DateFormat("yyyy-MM-dd").parse((map['Posting_Date'] ?? 0))
          : null,
      Account_No:
          map['Account_No'] != null ? map['Account_No'] as String : null,
      Payment_Ref_No: map['Payment_Ref_No'] != null
          ? map['Payment_Ref_No'] as String
          : null,
      Payment_Amount: map['Payment_Amount'] != null
          ? map['Payment_Amount'] as double
          : null,
      Amount_Spent:
          map['Amount_Spent'] != null ? map['Amount_Spent'] as double : null,
      Posting_Description: map['Posting_Description'] != null
          ? map['Posting_Description'] as String
          : null,
      Created_By:
          map['Created_By'] != null ? map['Created_By'] as String : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Posted_By: map['Posted_By'] != null ? map['Posted_By'] as String : null,
      Global_Dimension_1_Code: map['Global_Dimension_1_Code'] != null
          ? map['Global_Dimension_1_Code'] as String
          : null,
      Global_Dimension_2_Code: map['Global_Dimension_2_Code'] != null
          ? map['Global_Dimension_2_Code'] as String
          : null,
      Req_No: map['Req_No'] != null ? map['Req_No'] as String : null,
      Cheque_No: map['Cheque_No'] != null ? map['Cheque_No'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vouchers.fromJson(String source) =>
      Vouchers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  fromMap_table(Map<String, dynamic> map) {
    return Vouchers(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Document_No:
          map['Document_No'] != null ? map['Document_No'] as String : null,
      Document_Date: map['Document_Date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['Document_Date'] ?? 0) as int)
          : null,
      Posting_Date: map['Posting_Date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['Posting_Date'] ?? 0) as int)
          : null,
      Account_No:
          map['Account_No'] != null ? map['Account_No'] as String : null,
      Payment_Ref_No: map['Payment_Ref_No'] != null
          ? map['Payment_Ref_No'] as String
          : null,
      Payment_Amount: map['Payment_Amount'] != null
          ? map['Payment_Amount'] as double
          : null,
      Amount_Spent:
          map['Amount_Spent'] != null ? map['Amount_Spent'] as double : null,
      Posting_Description: map['Posting_Description'] != null
          ? map['Posting_Description'] as String
          : null,
      Created_By:
          map['Created_By'] != null ? map['Created_By'] as String : null,
      Created_On: map['Created_On'] != null
          ? DateTime.fromMillisecondsSinceEpoch((map['Created_On'] ?? 0) as int)
          : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Posted_By: map['Posted_By'] != null ? map['Posted_By'] as String : null,
      Posted_On: map['Posted_On'] != null
          ? DateTime.fromMillisecondsSinceEpoch((map['Posted_On'] ?? 0) as int)
          : null,
      Global_Dimension_1_Code: map['Global_Dimension_1_Code'] != null
          ? map['Global_Dimension_1_Code'] as String
          : null,
      Global_Dimension_2_Code: map['Global_Dimension_2_Code'] != null
          ? map['Global_Dimension_2_Code'] as String
          : null,
      Req_No: map['Req_No'] != null ? map['Req_No'] as String : null,
      Cheque_No: map['Cheque_No'] != null ? map['Cheque_No'] as String : null,
    );
  }
}
