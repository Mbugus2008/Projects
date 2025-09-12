// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class targetAccount {
  String? AccountNo;
  String? Description;
  String? PrincipleAmount;
  String? AccountPeriod;
  String? TargetAccount;
  String? LockAccount;
  String? ApplicationDate;
  String? Status;
  String? Interest;
  String? Balance;
  targetAccount({
    this.AccountNo,
    this.Description,
    this.PrincipleAmount,
    this.AccountPeriod,
    this.TargetAccount,
    this.LockAccount,
    this.ApplicationDate,
    this.Status,
    this.Interest,
    this.Balance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AccountNo': AccountNo,
      'Description': Description,
      'PrincipleAmount': PrincipleAmount,
      'AccountPeriod': AccountPeriod,
      'TargetAccount': TargetAccount,
      'LockAccount': LockAccount,
      'ApplicationDate': ApplicationDate,
      'Status': Status,
      'Interest': Interest,
      'Balance': Balance,
    };
  }

  factory targetAccount.fromMap(Map<String, dynamic> map) {
    return targetAccount(
      AccountNo: map['AccountNo'] != null ? map['AccountNo'] as String : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
      PrincipleAmount: map['PrincipleAmount'] != null
          ? map['PrincipleAmount'] as String
          : null,
      AccountPeriod:
          map['AccountPeriod'] != null ? map['AccountPeriod'] as String : null,
      TargetAccount:
          map['TargetAccount'] != null ? map['TargetAccount'] as String : null,
      LockAccount:
          map['LockAccount'] != null ? map['LockAccount'] as String : null,
      ApplicationDate: map['ApplicationDate'] != null
          ? map['ApplicationDate'] as String
          : null,
      Status: map['Status'] != null ? map['Status'] as String : null,
      Interest: map['Interest'] != null ? map['Interest'] as String : null,
      Balance: map['Balance'] != null ? map['Balance'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory targetAccount.fromJson(String source) =>
      targetAccount.fromMap(json.decode(source) as Map<String, dynamic>);
}
