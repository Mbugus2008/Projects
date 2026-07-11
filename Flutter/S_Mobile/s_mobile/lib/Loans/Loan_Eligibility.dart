// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../common/Apis.dart';
import '../common/Results.dart';

@JsonSerializable()
class Loan_Eligibility implements Tomaps {
  String? Key;
  DateTime? Date;
  String? Code;
  String? Member;
  String? Loan_Type;
  double? Loan_Balance;
  double? Eligible_Amount;
  double? Charges;
  double? Amount_Requested;
  String? Phone;
  int? Eligibility_Status;
  String? Comments;
  double? Topup_Paid;
  double? Topup_Installment;
  String? Total_charges;
  bool? use_percentage;

  Loan_Eligibility({
    this.Key,
    this.Date,
    this.Code,
    this.Member,
    this.Loan_Type,
    this.Loan_Balance,
    this.Eligible_Amount,
    this.Charges,
    this.Amount_Requested,
    this.Phone,
    this.Eligibility_Status,
    this.Comments,
    this.Topup_Paid,
    this.Topup_Installment,
    this.Total_charges,
    this.use_percentage,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Date': Date?.toIso8601String(),
      'Code': Code,
      'Member': Member,
      'Loan_Type': Loan_Type,
      'Loan_Balance': Loan_Balance,
      'Eligible_Amount': Eligible_Amount,
      'Charges': Charges,
      'Amount_Requested': Amount_Requested,
      'Phone': Phone,
      'Eligibility_Status': Eligibility_Status,
      'Comments': Comments,
      'Topup_Paid': Topup_Paid,
      'Topup_Installment': Topup_Installment,
      'Total_charges': Total_charges,
      'use_percentage': use_percentage,
    };
  }

  factory Loan_Eligibility.fromMap(Map<String, dynamic> map) {
    return Loan_Eligibility(
      Key: map['Key'] as String?,
      Date: map['Date'] != null
          ? DateTime.tryParse(map['Date'].toString())
          : null,
      Code: map['Code'] as String?,
      Member: map['Member'] as String?,
      Loan_Type: map['Loan_Type'] as String?,
      Loan_Balance: (map['Loan_Balance'] as num?)?.toDouble(),
      Eligible_Amount: (map['Eligible_Amount'] as num?)?.toDouble(),
      Charges: (map['Charges'] as num?)?.toDouble(),
      Amount_Requested: (map['Amount_Requested'] as num?)?.toDouble(),
      Phone: map['Phone'] as String?,
      Eligibility_Status: map['Eligibility_Status'] as int?,
      Comments: map['Comments'] as String?,
      Topup_Paid: (map['Topup_Paid'] as num?)?.toDouble(),
      Topup_Installment: (map['Topup_Installment'] as num?)?.toDouble(),
      Total_charges: map['Total_charges'] as String?,
      use_percentage: map['use_percentage'] as bool?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan_Eligibility.fromJson(String source) =>
      Loan_Eligibility.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Check eligibility for a loan product, including top-up rules.
  /// Returns the eligibility record, or a record with error in [Comments] if declined.
  static Future<Loan_Eligibility?> checkEligibility({
    required String phone,
    required String code,
    String? loanType,
  }) async {
    final body = json.encode({
      'Phone': phone,
      'Code': code,
      'Loan_Type': loanType ?? code,
    });
    final r = await ApiClient().postdata('EligibilityWithTopup', body);
    if (r.statusCode == 200) {
      final bodyMap = json.decode(r.body) as Map<String, dynamic>;
      final codeVal = (bodyMap['Code'] ?? bodyMap['code']) as int? ?? -1;
      final desc = (bodyMap['Desc'] ?? bodyMap['desc']) as String? ?? '';

      if (codeVal == 0) {
        // Success — parse the eligibility object
        final results = Results2<Loan_Eligibility>.fromJson(
            r.body, Loan_Eligibility.fromMap);
        return results.Contents;
      } else if (desc.isNotEmpty) {
        // Decline/error with a message — return a synthetic record so UI can show it
        return Loan_Eligibility(
          Code: code,
          Eligibility_Status: 0, // Not Eligible
          Comments: desc,
        );
      }
    }
    return null;
  }
}
