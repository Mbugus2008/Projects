import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:smobile/myapp/Deposit_Accounts.dart' as deposits;
import 'package:smobile/myapp/loans/Loans.dart' as loans;

import '../Utilities.dart';
import '../Utilities.dart';

@JsonSerializable()
class Member {
  String Key;
  String No;
  String? Old_Group_Account_Number;
  String? Name;
  String? Global_Dimension_2_Code;
  String? ID_No;
  String? Payroll_Staff_No;
  String? FOSA_Account;
  String? Section;
  DateTime? Registration_Date;
  String? Region;
  String? Group_Name;
  double? Net_Change;
  double? Eloan_Limit;
  String? MPESA_Mobile_No;
  double? Toto_savings;
  double? Current_Shares;
  double? Chrismas_Contribution;
  double? Plaza_Savings;
  double? Total_Outstanding_loan_Balance;
  double? Shares_Capital;
  double? Mobile_Money;
  bool? Sending_Mpesa;
  String? Comment1;
  String? Phone_No;
  List<deposits.depositaccounts>? DepositAccount;
  List<loans.loans>? Loans;

  Member(
    this.Key,
    this.No,
    this.Old_Group_Account_Number,
    this.Name,
    this.Global_Dimension_2_Code,
    this.ID_No,
    this.Payroll_Staff_No,
    this.FOSA_Account,
    this.Section,
    this.Registration_Date,
    this.Region,
    this.Group_Name,
    this.Net_Change,
    this.Eloan_Limit,
    this.MPESA_Mobile_No,
    this.Toto_savings,
    this.Current_Shares,
    this.Chrismas_Contribution,
    this.Plaza_Savings,
    this.Total_Outstanding_loan_Balance,
    this.Shares_Capital,
    this.Mobile_Money,
    this.Sending_Mpesa,
    this.Comment1,
    this.Phone_No,
    this.DepositAccount,
    this.Loans,
  );

  Map<String, dynamic> toMap() {
    return {
      'Key': Key,
      'No': No,
      'Old_Group_Account_Number': Old_Group_Account_Number,
      'Name': Name,
      'Global_Dimension_2_Code': Global_Dimension_2_Code,
      'ID_No': ID_No,
      'Payroll_Staff_No': Payroll_Staff_No,
      'FOSA_Account': FOSA_Account,
      'Section': Section,
      'Registration_Date': Registration_Date?.millisecondsSinceEpoch,
      'Region': Region,
      'Group_Name': Group_Name,
      'Net_Change': Net_Change,
      'Eloan_Limit': Eloan_Limit,
      'MPESA_Mobile_No': MPESA_Mobile_No,
      'Toto_savings': Toto_savings,
      'Current_Shares': Current_Shares,
      'Chrismas_Contribution': Chrismas_Contribution,
      'Plaza_Savings': Plaza_Savings,
      'Total_Outstanding_loan_Balance': Total_Outstanding_loan_Balance,
      'Shares_Capital': Shares_Capital,
      'Mobile_Money': Mobile_Money,
      'Sending_Mpesa': Sending_Mpesa,
      'Comment1': Comment1,
      'Phone_No': Phone_No,
      'DepositAccount': DepositAccount?.map((x) => x.toMap()).toList(),
      'Loans': Loans?.map((x) => x.toMap()).toList(),
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      map['Key'],
      map['No'],
      map['Old_Group_Account_Number'] != null
          ? map['Old_Group_Account_Number']
          : null,
      map['Name'] != null ? map['Name'] : null,
      map['Global_Dimension_2_Code'] != null
          ? map['Global_Dimension_2_Code']
          : null,
      map['ID_No'] != null ? map['ID_No'] : null,
      map['Payroll_Staff_No'] != null ? map['Payroll_Staff_No'] : null,
      map['FOSA_Account'] != null ? map['FOSA_Account'] : null,
      map['Section'] != null ? map['Section'] : null,
      map['Registration_Date'] != null
          ? DateTime.tryParse(map['Registration_Date'])
          : null,
      map['Region'] != null ? map['Region'] : null,
      map['Group_Name'] != null ? map['Group_Name'] : null,
      map['Net_Change'] != null ? map['Net_Change'] : null,
      map['Eloan_Limit'] != null ? map['Eloan_Limit'] : null,
      map['MPESA_Mobile_No'] != null ? map['MPESA_Mobile_No'] : null,
      map['Toto_savings'] != null ? map['Toto_savings'] : null,
      map['Current_Shares'] != null ? map['Current_Shares'] : null,
      map['Chrismas_Contribution'] != null
          ? map['Chrismas_Contribution']
          : null,
      map['Plaza_Savings'] != null ? map['Plaza_Savings'] : null,
      map['Total_Outstanding_loan_Balance'] != null
          ? map['Total_Outstanding_loan_Balance']
          : null,
      map['Shares_Capital'] != null ? map['Shares_Capital'] : null,
      map['Mobile_Money'] != null ? map['Mobile_Money'] : null,
      map['Sending_Mpesa'] != null ? map['Sending_Mpesa'] : null,
      map['Comment1'] != null ? map['Comment1'] : null,
      map['Phone_No'] != null ? map['Phone_No'] : null,
      map['DepositAccount'] != null
          ? List<deposits.depositaccounts>.from(map['DepositAccount']
              ?.map((x) => deposits.depositaccounts.fromMap(x)))
          : null,
      map['Loans'] != null
          ? List<loans.loans>.from(
              map['Loans']?.map((x) => loans.loans.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) => Member.fromMap(json.decode(source));
}

// class balances {
//   String? Name;
//   double? balance;
//   balances(this.Name, this.balance);
//
//   static List<balances> getbalances(Member member) {
//     List<balances> balance = <balances>[];
//     balance.add(balances("Deposits", member.Current_Shares));
//     balance.add(balances("Toto", member.Toto_savings));
//     balance.add(balances("Xmas", member.Chrismas_Contribution));
//     balance.add(balances("Plaza", member.Plaza_Savings));
//     return balance;
//   }
// }



class _accountstate extends State<Accounts> {
  List<deposits.depositaccounts>? balance;
  //var eurosInUSFormat = NumberFormat.currency(locale: "en_KE", symbol: "KES ");

  @override
  void initState() {
    super.initState();
    balance = widget.member.DepositAccount!
        .where((e) => e.Type == deposits.status.savings)
        .toList();
    print(balance);
  }

  buildItem(BuildContext context, int index) {
    return TransparentCard(

        child: Container(
          height: MediaQuery.of(context).size.height,

          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top:20),
                child: Text(
                  '${utilities. formatcurrency.format(balance![index].Balance)}',
                  // '${balance![index].balance!.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: 'cursive'
                  ),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom:5),
                width: 50,
                child: Text(
               balance?[index]?.Name ?? "" ,
                  style: TextStyle(
                    color: Colors.blue,
                    // fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: 'cursive'
                  ),
                  //height: MediaQuery.of(context).size.height / 11,
                  //width: MediaQuery.of(context).size.width / 6,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {

    print(balance);
    return  Container(
        height: MediaQuery.of(context).size.height /10,
        child: CupertinoScrollbar(
          child:ListView.builder(
            itemCount: balance!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildItem(context, index);
            },
          )));
  }
}
