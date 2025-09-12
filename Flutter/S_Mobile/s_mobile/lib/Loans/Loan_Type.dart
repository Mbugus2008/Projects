// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Loan_Type {
  String? Code;
  String? Description;
  double? Eligible_Amount;
  Loan_Type({
    this.Code,
    this.Description,
    this.Eligible_Amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Description': Description,
      'Eligible_Amount': Eligible_Amount,
    };
  }

  factory Loan_Type.fromMap(Map<String, dynamic> map) {
    return Loan_Type(
      Code: map['Code'] != null ? map['Code'] as String : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
      Eligible_Amount: map['Eligible_Amount'] != null
          ? map['Eligible_Amount'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan_Type.fromJson(String source) =>
      Loan_Type.fromMap(json.decode(source) as Map<String, dynamic>);
}
