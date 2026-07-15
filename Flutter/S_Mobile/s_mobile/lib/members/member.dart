// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, constant_identifier_names
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:s_mobile/Loans/Loan.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member_info.dart';
import 'package:s_mobile/members/targetAccount.dart';

import '../Loans/Loan_Type.dart';
import '../common/Results.dart';

@JsonSerializable()
class Member implements Tomaps {
  String? Key;
  String? No;
  String? Name;
  String? E_Mail;
  String? Mobile_Phone_No;
  String? Phone_No;
  String? MPESA_Mobile_No;
  gender? Gender;
  String? ID_No;
  DateTime? Date_of_Birth;
  blocked? Blocked;
  status? Status;
  bool? Group_Account;
  member_info? Member_info;
  List<Loan>? Loans;
  List<Account>? Accounts;
  List<Account>? Source_accounts;
  List<Account>? Dest_accounts;
  List<Loan_Type>? LoanTypes;
  List<targetAccount>? TargetAccount;
  List<entries>? Entries;
  Member({
    this.Key,
    this.No,
    this.Name,
    this.E_Mail,
    this.Mobile_Phone_No,
    this.Phone_No,
    this.MPESA_Mobile_No,
    this.Gender,
    this.ID_No,
    this.Date_of_Birth,
    this.Blocked,
    this.Status,
    this.Group_Account,
    this.Member_info,
    this.Loans,
    this.Accounts,
    this.Source_accounts,
    this.Dest_accounts,
    this.LoanTypes,
    this.TargetAccount,
    this.Entries,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'No': No,
      'Name': Name,
      'E_Mail': E_Mail,
      'Mobile_Phone_No': Mobile_Phone_No,
      'Phone_No': Phone_No,
      'MPESA_Mobile_No': MPESA_Mobile_No,
      'Gender': Gender?.index,
      'ID_No': ID_No,
      'Date_of_Birth': Date_of_Birth?.toIso8601String(),
      'Blocked': Blocked?.index,
      'Status': Status?.index,
      'Group_Account': Group_Account,
      'Member_info': Member_info?.toMap(),
      'Loans': Loans?.map((x) => x.toMap()).toList(),
      'Accounts': Accounts?.map((x) => x.toMap()).toList(),
      'Source_accounts': Source_accounts?.map((x) => x.toMap()).toList(),
      'Dest_accounts': Dest_accounts?.map((e) => e.toMap()).toList(),
      'LoanTypes': LoanTypes?.map((e) => e.toMap()).toList(),
      'TargetAccount': TargetAccount?.map((e) => e.toMap()).toList()
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    // var accountsFromJson = map['Accounts'] as List;
    // List<Account> accountList =
    //     accountsFromJson.map((i) => Account.fromJson(i)).toList();

    return Member(
      Key: map['Key'] != null ? map['Key'] as String : null,
      No: map['No'] != null ? map['No'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      E_Mail: map['E_Mail'] != null ? map['E_Mail'] as String : null,
      Mobile_Phone_No: map['Mobile_Phone_No'] != null
          ? map['Mobile_Phone_No'] as String
          : null,
      Phone_No: map['Phone_No'] != null
          ? map['Phone_No'] as String
          : null,
      MPESA_Mobile_No: map['MPESA_Mobile_No'] != null
          ? map['MPESA_Mobile_No'] as String
          : null,
      Gender: map['Gender'] != null
          ? gender.values[(map['Gender'] ?? 0) as int]
          : null,
      ID_No: map['ID_No'] != null ? map['ID_No'] as String : null,
      Date_of_Birth: map['Date_of_Birth'] != null
          ? DateTime.tryParse((map['Date_of_Birth'] ?? 0))
          : null,
      Blocked: map['Blocked'] != null
          ? blocked.values[(map['Blocked'] ?? 0) as int]
          : null,
      Status: map['Status'] != null
          ? status.values[(map['Status'] ?? 0) as int]
          : null,
      Group_Account:
          map['Group_Account'] != null ? map['Group_Account'] as bool : null,
      Member_info: map['Member_info'] != null
          ? member_info.fromMap(map['Member_info'] as Map<String, dynamic>)
          : null,
      Loans: _tryParseList<Loan>(map['Loans'], Loan.fromMap),
      Accounts: _tryParseList<Account>(
              map['Accounts'] ?? map['DepositAccount'], Account.fromMap) ??
          (map['DepositAccount'] != null
              ? _tryParseList<Account>(
                  map['DepositAccount'], Account.fromDepositMap)
              : null),
      Source_accounts:
          _tryParseList<Account>(map['Source_accounts'], Account.fromMap),
      Dest_accounts:
          _tryParseList<Account>(map['Dest_accounts'], Account.fromMap),
      LoanTypes: _tryParseList<Loan_Type>(map['LoanTypes'], Loan_Type.fromMap),
      TargetAccount: _tryParseList<targetAccount>(
          map['TargetAccount'], targetAccount.fromMap),
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) =>
      Member.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<T>? _tryParseList<T>(
    dynamic json, T Function(Map<String, dynamic>) fromMap) {
  if (json == null) return null;
  if (json is! List) return null;
  return json.whereType<Map<String, dynamic>>().map((e) => fromMap(e)).toList();
}

enum gender {
  /// <remarks/>
  Male,

  /// <remarks/>
  Female,
}

/// <remarks/>
enum blocked {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Credit,

  /// <remarks/>
  Debit,

  /// <remarks/>
  All,
}

/// <remarks/>
enum status {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  New,

  /// <remarks/>
  Active,

  /// <remarks/>
  Dormant,

  /// <remarks/>
  Frozen,

  /// <remarks/>
  Withdrawal_Application,

  /// <remarks/>
  Withdrawn,

  /// <remarks/>
  Deceased,

  /// <remarks/>
  Defaulter,

  /// <remarks/>
  Closed,
}
