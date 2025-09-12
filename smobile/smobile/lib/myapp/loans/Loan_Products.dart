// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Loan_Products {
  String? Key;
  String? Code;
  String? Product_Description;
  bool? Appraise_Dividend;
  String? Penalty_Charged_Account;
  int? Ordinary_Share_Multiplier;
  bool? Appraise_Guarantors;
  String? Product_Currency_Code;
  String? Min_Re_application_Period;
  int? Recovery_Priority;
  int? Min_No_Of_Guarantors;
  bool? Max_Branch_Approval;
  int? Shares_Multiplier;
  bool? Appraise_Deposits;
  bool? Appraise_Salary;
  int? Preferential_Share_Multiplier;
  bool? Appraise_Business;
  int? Ordinary_Default_Install;
  int? Preferential_Default_Install;
  bool? Collateral_Appraisal;
  int? Max_No_Of_Guarantors;
  bool? interest_Upfront;
  bool? Available_on_Mobile;
  bool? Auto_appraise;
  int? No_of_Installment;
  double? Max_Loan_Amount;
  double? Min_Loan_Amount;


  bool? isSelected = false;
   double? Amount ;
 bool? Eligible;
 String? Comments ;

  Loan_Products(this.Key,
    this.Code,
    this.Product_Description,
    this.Appraise_Dividend,
    this.Penalty_Charged_Account,
    this.Ordinary_Share_Multiplier,
    this.Appraise_Guarantors,
    this.Product_Currency_Code,
    this.Min_Re_application_Period,
    this.Recovery_Priority,
    this.Min_No_Of_Guarantors,
    this.Max_Branch_Approval,
    this.Shares_Multiplier,
    this.Appraise_Deposits,
    this.Appraise_Salary,
    this.Preferential_Share_Multiplier,
    this.Appraise_Business,
    this.Ordinary_Default_Install,
    this.Preferential_Default_Install,
    this.Collateral_Appraisal,
    this.Max_No_Of_Guarantors,
    this.interest_Upfront,
    this.Available_on_Mobile,
    this.Auto_appraise,
    this.No_of_Installment,
    this.Max_Loan_Amount,
    this.Min_Loan_Amount,


    this.isSelected,
      this.Amount,this.Comments,this.Eligible
  );

  Map<dynamic, dynamic> toMap() {
    return {
      'Key': Key,
      'Code': Code,
      'Product_Description': Product_Description,
      'Appraise_Dividend': Appraise_Dividend,
      'Penalty_Charged_Account': Penalty_Charged_Account,
      'Ordinary_Share_Multiplier': Ordinary_Share_Multiplier,
      'Appraise_Guarantors': Appraise_Guarantors,
      'Product_Currency_Code': Product_Currency_Code,
      'Min_Re_application_Period': Min_Re_application_Period,
      'Recovery_Priority': Recovery_Priority,
      'Min_No_Of_Guarantors': Min_No_Of_Guarantors,
      'Max_Branch_Approval': Max_Branch_Approval,
      'Shares_Multiplier': Shares_Multiplier,
      'Appraise_Deposits': Appraise_Deposits,
      'Appraise_Salary': Appraise_Salary,
      'Preferential_Share_Multiplier': Preferential_Share_Multiplier,
      'Appraise_Business': Appraise_Business,
      'Ordinary_Default_Install': Ordinary_Default_Install,
      'Preferential_Default_Install': Preferential_Default_Install,
      'Collateral_Appraisal': Collateral_Appraisal,
      'Max_No_Of_Guarantors': Max_No_Of_Guarantors,
      'interest_Upfront': interest_Upfront,
      'Available_on_Mobile': Available_on_Mobile,
      'Auto_appraise': Auto_appraise,
      'No_of_Installment': No_of_Installment,
      'Max_Loan_Amount': Max_Loan_Amount,
      'Min_Loan_Amount': Min_Loan_Amount,

      'isSelected': isSelected,
      'Eligible': Eligible,
      'Amount': Amount,
      'Comments': Comments,

    };
  }

  factory Loan_Products.fromMap(Map<dynamic, dynamic> map) {
    return Loan_Products(
      map['Key'],
      map['Code'],
      map['Product_Description'] != null ? map['Product_Description'] : null,
      map['Appraise_Dividend'] != null ? map['Appraise_Dividend'] : null,
      map['Penalty_Charged_Account'] != null
          ? map['Penalty_Charged_Account']
          : null,
      map['Ordinary_Share_Multiplier'] != null
          ? map['Ordinary_Share_Multiplier']
          : null,
      map['Appraise_Guarantors'] != null ? map['Appraise_Guarantors'] : null,
      map['Product_Currency_Code'] != null
          ? map['Product_Currency_Code']
          : null,
      map['Min_Re_application_Period'] != null
          ? map['Min_Re_application_Period']
          : null,
      map['Recovery_Priority'] != null ? map['Recovery_Priority'] : null,
      map['Min_No_Of_Guarantors'] != null ? map['Min_No_Of_Guarantors'] : null,
      map['Max_Branch_Approval'] != null ? map['Max_Branch_Approval'] : null,
      map['Shares_Multiplier'] != null ? map['Shares_Multiplier'] : null,
      map['Appraise_Deposits'] != null ? map['Appraise_Deposits'] : null,
      map['Appraise_Salary'] != null ? map['Appraise_Salary'] : null,
      map['Preferential_Share_Multiplier'] != null
          ? map['Preferential_Share_Multiplier']
          : null,
      map['Appraise_Business'] != null ? map['Appraise_Business'] : null,
      map['Ordinary_Default_Install'] != null
          ? map['Ordinary_Default_Install']
          : null,
      map['Preferential_Default_Install'] != null
          ? map['Preferential_Default_Install']
          : null,
      map['Collateral_Appraisal'] != null ? map['Collateral_Appraisal'] : null,
      map['Max_No_Of_Guarantors'] != null ? map['Max_No_Of_Guarantors'] : null,
      map['interest_Upfront'] != null ? map['interest_Upfront'] : null,
      map['Available_on_Mobile'] != null ? map['Available_on_Mobile'] : null,
      map['Auto_appraise'] != null ? map['Auto_appraise'] : null,
      map['No_of_Installment'] != null ? map['No_of_Installment'] : null,
      map['Max_Loan_Amount'] != null ? map['Max_Loan_Amount'] : null,
      map['Min_Loan_Amount'] != null ? map['Min_Loan_Amount'] : null,

      map['isSelected'] != null ? map['isSelected'] : null,
      map['Comments'] != null ? map['Comments'] : null,
      map['Amount'] != null ? map['Amount'] : null,
      map['Eligible'] != null ? map['Eligible'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan_Products.fromJson(dynamic source) =>
      Loan_Products.fromMap(json.decode(source));

}
