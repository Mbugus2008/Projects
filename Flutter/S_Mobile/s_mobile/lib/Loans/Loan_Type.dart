// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../common/Apis.dart';
import '../common/Results.dart';

@JsonSerializable()
class Loan_Type implements Tomaps {
  String? Key;
  String? Code;
  String? Description;
  String? Product_Description;
  double? Eligible_Amount;
  double? Min_Loan_Amount;
  double? Max_Loan_Amount;
  bool? Available_on_Mobile;
  bool? Auto_appraise;
  bool? Appraise_Dividend;
  bool? Appraise_Guarantors;
  bool? Appraise_Deposits;
  bool? Appraise_Salary;
  bool? Allow_Topup;
  int? Ordinary_Share_Multiplier;
  int? Shares_Multiplier;
  int? Repayment_Frequency;
  int? Ordinary_Default_Install;
  int? Preferential_Default_Install;
  String? Penalty_Charged_Account;
  double? Amount;
  double? Outstanding_Amount;
  bool? Eligible;
  String? Comments;

  Loan_Type({
    this.Key,
    this.Code,
    this.Description,
    this.Product_Description,
    this.Eligible_Amount,
    this.Min_Loan_Amount,
    this.Max_Loan_Amount,
    this.Available_on_Mobile,
    this.Auto_appraise,
    this.Appraise_Dividend,
    this.Appraise_Guarantors,
    this.Appraise_Deposits,
    this.Appraise_Salary,
    this.Allow_Topup,
    this.Ordinary_Share_Multiplier,
    this.Shares_Multiplier,
    this.Repayment_Frequency,
    this.Ordinary_Default_Install,
    this.Preferential_Default_Install,
    this.Penalty_Charged_Account,
    this.Amount,
    this.Outstanding_Amount,
    this.Eligible,
    this.Comments,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Code': Code,
      'Description': Description,
      'Product_Description': Product_Description,
      'Eligible_Amount': Eligible_Amount,
      'Min_Loan_Amount': Min_Loan_Amount,
      'Max_Loan_Amount': Max_Loan_Amount,
      'Available_on_Mobile': Available_on_Mobile,
      'Auto_appraise': Auto_appraise,
      'Appraise_Dividend': Appraise_Dividend,
      'Appraise_Guarantors': Appraise_Guarantors,
      'Appraise_Deposits': Appraise_Deposits,
      'Appraise_Salary': Appraise_Salary,
      'Allow_Topup': Allow_Topup,
      'Ordinary_Share_Multiplier': Ordinary_Share_Multiplier,
      'Shares_Multiplier': Shares_Multiplier,
      'Repayment_Frequency': Repayment_Frequency,
      'Ordinary_Default_Install': Ordinary_Default_Install,
      'Preferential_Default_Install': Preferential_Default_Install,
      'Penalty_Charged_Account': Penalty_Charged_Account,
      'Amount': Amount,
      'Outstanding_Amount': Outstanding_Amount,
      'Eligible': Eligible,
      'Comments': Comments,
    };
  }

  factory Loan_Type.fromMap(Map<String, dynamic> map) {
    return Loan_Type(
      Key: map['Key'] as String?,
      Code: map['Code'] as String?,
      Description: map['Description'] as String?,
      Product_Description:
          (map['Product_Description'] ?? map['Description']) as String?,
      Eligible_Amount: (map['Eligible_Amount'] ?? map['Amount']) as double?,
      Min_Loan_Amount: map['Min_Loan_Amount'] as double?,
      Max_Loan_Amount: map['Max_Loan_Amount'] as double?,
      Available_on_Mobile: map['Available_on_Mobile'] as bool?,
      Auto_appraise: map['Auto_appraise'] as bool?,
      Appraise_Dividend: map['Appraise_Dividend'] as bool?,
      Appraise_Guarantors: map['Appraise_Guarantors'] as bool?,
      Appraise_Deposits: map['Appraise_Deposits'] as bool?,
      Appraise_Salary: map['Appraise_Salary'] as bool?,
      Allow_Topup: map['Allow_Topup'] as bool?,
      Ordinary_Share_Multiplier: map['Ordinary_Share_Multiplier'] as int?,
      Shares_Multiplier: map['Shares_Multiplier'] as int?,
      Repayment_Frequency: map['Repayment_Frequency'] as int?,
      Ordinary_Default_Install: map['Ordinary_Default_Install'] as int?,
      Preferential_Default_Install: map['Preferential_Default_Install'] as int?,
      Penalty_Charged_Account: map['Penalty_Charged_Account'] as String?,
      Amount: map['Amount'] as double?,
      Outstanding_Amount: map['Outstanding_Amount'] as double?,
      Eligible: map['Eligible'] as bool?,
      Comments: map['Comments'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan_Type.fromJson(String source) =>
      Loan_Type.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Fetch all loan products available on mobile.
  static Future<List<Loan_Type>?> fetchLoanProducts() async {
    final r = await ApiClient().postdata('Loan_products', '{}');
    if (r.statusCode == 200) {
      final results = Results3<Loan_Type>.fromJson(r.body, Loan_Type.fromMap);
      if (results.Code == 0) {
        return results.Contents;
      }
    }
    return null;
  }
}
