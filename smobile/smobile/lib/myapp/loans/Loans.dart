// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:smobile/myapp/Utilities.dart';

@JsonSerializable()
class loans {
  String? Key;
  String? Loan_No;
  DateTime? Application_Date;
  String? Loan_Product_Type;
  String? Client_Code;
  String? Client_Name;
  double? Balance;
  bool? Appraised;
  double? Outstanding_Balance;
  double? Oustanding_Interest;
  DateTime? Last_notification;
  DateTime? Last_Penalty_Date;
  double? Requested_Amount;
  double? Approved_Amount;
  double? Daily_interest;
  DateTime? Loan_Disbursement_Date;
  DateTime? Date_disbursed;
  double? Penalty_Due;
  bool? Penalty_charge;
  double? Outstanding_Penalty;
  double? Interest;
  String? Branch_Code;
  String? Loan_Product_Type_Name;
  int? Installments;
  double? Loan_Principle_Repayment;
  double? Loan_Interest_Repayment;
  double? Interest_Rate;

  DateTime? Last_Repayment_Date;

  DateTime? get _Last_Repayment_Date => Last_Repayment_Date;

  set _Last_Repayment_Date(DateTime? _Last_Repayment_Date) {
    Last_Repayment_Date = _Last_Repayment_Date;
  }

  loans({
    this.Key,
    this.Loan_No,
    this.Application_Date,
    this.Loan_Product_Type,
    this.Client_Code,
    this.Client_Name,
    this.Balance,
    this.Appraised,
    this.Outstanding_Balance,
    this.Oustanding_Interest,
    this.Last_notification,
    this.Last_Penalty_Date,
    this.Requested_Amount,
    this.Approved_Amount,
    this.Daily_interest,
    this.Loan_Disbursement_Date,
    this.Date_disbursed,
    this.Penalty_Due,
    this.Penalty_charge,
    this.Outstanding_Penalty,
    this.Interest,
    this.Branch_Code,
    this.Loan_Product_Type_Name,
    this.Installments,
    this.Loan_Principle_Repayment,
    this.Loan_Interest_Repayment,
    this.Interest_Rate,
    this.Last_Repayment_Date,
  });
  //Loan_Status Loan_Status;

  Map<String, dynamic> toMap() {
    return {
      'Key': Key,
      'Loan_No': Loan_No,
      'Application_Date': Application_Date?.toIso8601String(),
      'Loan_Product_Type': Loan_Product_Type,
      'Client_Code': Client_Code,
      'Client_Name': Client_Name,
      'Balance': Balance,
      'Appraised': Appraised,
      'Outstanding_Balance': Outstanding_Balance,
      'Oustanding_Interest': Oustanding_Interest,
      'Last_notification': Last_notification?.toIso8601String(),
      'Last_Penalty_Date': Last_Penalty_Date?.toIso8601String(),
      'Requested_Amount': Requested_Amount,
      'Approved_Amount': Approved_Amount,
      'Daily_interest': Daily_interest,
      'Loan_Disbursement_Date': Loan_Disbursement_Date?.toIso8601String(),
      'Date_disbursed': Date_disbursed?.toIso8601String(),
      'Penalty_Due': Penalty_Due,
      'Penalty_charge': Penalty_charge,
      'Outstanding_Penalty': Outstanding_Penalty,
      'Interest': Interest,
      'Branch_Code': Branch_Code,
      'Loan_Product_Type_Name': Loan_Product_Type_Name,
      'Installments': Installments,
      'Loan_Principle_Repayment': Loan_Principle_Repayment,
      'Loan_Interest_Repayment': Loan_Interest_Repayment,
      'Interest_Rate': Interest_Rate,
      'Last_Repayment_Date': Last_Repayment_Date?.toIso8601String(),
    };
  }

  factory loans.fromMap(Map<String, dynamic> map) {
    return loans(
      Key: map['Key'] != null ? map['Key'] : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] : null,
      Application_Date: map['Application_Date'] != null
          ? DateTime.tryParse(map['Application_Date'])
          : null,
      Loan_Product_Type:
          map['Loan_Product_Type'] != null ? map['Loan_Product_Type'] : null,
      Client_Code: map['Client_Code'] != null ? map['Client_Code'] : null,
      Client_Name: map['Client_Name'] != null ? map['Client_Name'] : null,
      Balance: map['Balance'] != null ? map['Balance'] : null,
      Appraised: map['Appraised'] != null ? map['Appraised'] : null,
      Outstanding_Balance: map['Outstanding_Balance'] != null
          ? map['Outstanding_Balance']
          : null,
      Oustanding_Interest: map['Oustanding_Interest'] != null
          ? map['Oustanding_Interest']
          : null,
      Last_notification: map['Last_notification'] != null
          ? DateTime.tryParse(map['Last_notification'])
          : null,
      Last_Penalty_Date: map['Last_Penalty_Date'] != null
          ? DateTime.tryParse(map['Last_Penalty_Date'])
          : null,
      Requested_Amount:
          map['Requested_Amount'] != null ? map['Requested_Amount'] : null,
      Approved_Amount:
          map['Approved_Amount'] != null ? map['Approved_Amount'] : null,
      Daily_interest:
          map['Daily_interest'] != null ? map['Daily_interest'] : null,
      Loan_Disbursement_Date: map['Loan_Disbursement_Date'] != null
          ? DateTime.tryParse(map['Loan_Disbursement_Date'])
          : null,
      Date_disbursed: map['Date_disbursed'] != null
          ? DateTime.tryParse(map['Date_disbursed'])
          : null,
      Penalty_Due: map['Penalty_Due'] != null ? map['Penalty_Due'] : null,
      Penalty_charge:
          map['Penalty_charge'] != null ? map['Penalty_charge'] : null,
      Outstanding_Penalty: map['Outstanding_Penalty'] != null
          ? map['Outstanding_Penalty']
          : null,
      Interest: map['Interest'] != null ? map['Interest'] : null,
      Branch_Code: map['Branch_Code'] != null ? map['Branch_Code'] : null,
      Loan_Product_Type_Name: map['Loan_Product_Type_Name'] != null
          ? map['Loan_Product_Type_Name']
          : null,
      Installments: map['Installments'] != null ? map['Installments'] : null,
      Loan_Principle_Repayment: map['Loan_Principle_Repayment'] != null
          ? map['Loan_Principle_Repayment']
          : null,
      Loan_Interest_Repayment: map['Loan_Interest_Repayment'] != null
          ? map['Loan_Interest_Repayment']
          : null,
      Interest_Rate: map['Interest_Rate'] != null ? map['Interest_Rate'] : null,
      Last_Repayment_Date: map['Last_Repayment_Date'] != null
          ? DateTime.tryParse(map['Last_Repayment_Date'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory loans.fromJson(String source) => loans.fromMap(json.decode(source));
}

enum Loan_Status {
  /// <remarks/>
  @JsonValue("Application")
  Application,

  /// <remarks/>
  @JsonValue("Appraisal")
  Appraisal,

  /// <remarks/>
  @JsonValue("Rejected")
  Rejected,

  /// <remarks/>
  @JsonValue("Approved")
  Approved,
  /// <remarks/>
  @JsonValue("Issued")
  Issued,
}

class loanwidget extends StatefulWidget {
  final List<loans> loan;

  const loanwidget({Key? key, required this.loan}) : super(key: key);
  @override
  _loansstate createState() => _loansstate();
}

class _loansstate extends State<loanwidget> {
  List<loans>? loan;

  @override
  void initState() {
    super.initState();
    loan = widget.loan;
  }

  buildItem(BuildContext context, int index) {
    DateTime dr =loan![index].Application_Date!.add(Duration(days: loan![index].Installments! * 30));
    print(json.encode(loan));

    return Padding(
        padding: EdgeInsets.all(10.0),

        child: Container(
          margin: const EdgeInsets.only(bottom: 3.0,top:1.0),
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width /20 ,


          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        loan![index].Loan_Product_Type!,
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: 'cursive'
                        ),
                      ),
                    ),
                    //SizedBox(),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                       loan![index].Loan_Product_Type_Name ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: 'cursive'
                        ),
                        //height: MediaQuery.of(context).size.height / 11,
                        //width: MediaQuery.of(context).size.width / 6,
                      ),
                    ),
                    Container(
                      //alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Text(
                            '${utilities.loandateformatter.format(loan![index].Application_Date!)} ... ${utilities.loandateformatter.format(loan![index].Application_Date!.add(Duration(days: loan![index].Installments! * 30)))}',
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                              // fontStyle: FontStyle.italic,
                              // fontFamily: 'cursive'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///middle
              Container(
                width: (MediaQuery.of(context).size.width * 0.2),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${utilities.formatno.format(loan![index].Installments!)} Months',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: 'cursive'
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '@ ${utilities.formatno.format(loan![index].Interest_Rate ?? 0)}',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: 'cursive'
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///right
              Container(
                width: (MediaQuery.of(context).size.width * 0.3) - 30,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${utilities.formatcurrency.format(loan![index].Outstanding_Balance!)}',
                        style: TextStyle(
                          color:dr.isBefore(DateTime.now())? Colors.red :Colors.green,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: 'cursive'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
    height: MediaQuery.of(context).size.height /3,
    child:  TransparentCard(

        child: CupertinoScrollbar(

        child: ListView.builder(
          itemCount: loan!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return buildItem(context, index);
          },
        ),
    ),
      ),);
  }
}
