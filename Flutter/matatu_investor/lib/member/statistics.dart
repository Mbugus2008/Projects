import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Assets/assets.dart';
import '../Assets/utils.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Statistic {
  String? Key;
  String? No;
  double? Capital_Balance;
  double? Operation_Cost;
  double? Deposit_Balance;
  double? Savings;
  double? Xmas;
  double? Welfare;
  double? Operation;
  double? Insurance;
  double? Parking;
  double? Buses;
  int? No_of_Vehicles;
  int? Total_Loans;
  double? Loan_Balances;
  double? Principal;
  double? Interest;
  double? OverDraft_Balances;
  double? Total_loans_Balances;
  double? Initial_Registration;
  double? Registration_paid;
  double? Registraion_Balance;
  double? Penalty_Paid;
  double? Penalty_Due;
  double? Penalty;
  double? Outstanding_Orders_LCY;
  double? Shipped_Not_Invoiced_LCY;
  double? Outstanding_Invoices_LCY;
  double? Outstanding_Serv_Orders_LCY;
  double? Serv_Shipped_Not_Invoiced_LCY;
  double? Outstanding_Serv_Invoices_LCY;
  Statistic({
    this.Key,
    this.No,
    this.Capital_Balance,
    this.Operation_Cost,
    this.Deposit_Balance,
    this.Savings,
    this.Xmas,
    this.Welfare,
    this.Operation,
    this.Insurance,
    this.Parking,
    this.Buses,
    this.No_of_Vehicles,
    this.Total_Loans,
    this.Loan_Balances,
    this.Principal,
    this.Interest,
    this.OverDraft_Balances,
    this.Total_loans_Balances,
    this.Initial_Registration,
    this.Registration_paid,
    this.Registraion_Balance,
    this.Penalty_Paid,
    this.Penalty_Due,
    this.Penalty,
    this.Outstanding_Orders_LCY,
    this.Shipped_Not_Invoiced_LCY,
    this.Outstanding_Invoices_LCY,
    this.Outstanding_Serv_Orders_LCY,
    this.Serv_Shipped_Not_Invoiced_LCY,
    this.Outstanding_Serv_Invoices_LCY,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'No': No,
      'Capital_Balance': Capital_Balance,
      'Operation_Cost': Operation_Cost,
      'Deposit_Balance': Deposit_Balance,
      'Savings': Savings,
      'Xmas': Xmas,
      'Welfare': Welfare,
      'Operation': Operation,
      'Insurance': Insurance,
      'Parking': Parking,
      'Buses': Buses,
      'No_of_Vehicles': No_of_Vehicles,
      'Total_Loans': Total_Loans,
      'Loan_Balances': Loan_Balances,
      'Principal': Principal,
      'Interest': Interest,
      'OverDraft_Balances': OverDraft_Balances,
      'Total_loans_Balances': Total_loans_Balances,
      'Initial_Registration': Initial_Registration,
      'Registration_paid': Registration_paid,
      'Registraion_Balance': Registraion_Balance,
      'Penalty_Paid': Penalty_Paid,
      'Penalty_Due': Penalty_Due,
      'Penalty': Penalty,
      'Outstanding_Orders_LCY': Outstanding_Orders_LCY,
      'Shipped_Not_Invoiced_LCY': Shipped_Not_Invoiced_LCY,
      'Outstanding_Invoices_LCY': Outstanding_Invoices_LCY,
      'Outstanding_Serv_Orders_LCY': Outstanding_Serv_Orders_LCY,
      'Serv_Shipped_Not_Invoiced_LCY': Serv_Shipped_Not_Invoiced_LCY,
      'Outstanding_Serv_Invoices_LCY': Outstanding_Serv_Invoices_LCY,
    };
  }

  factory Statistic.fromMap(Map<String, dynamic> map) {
    return Statistic(
      Key: map['Key'] != null ? map['Key'] as String : null,
      No: map['No'] != null ? map['No'] as String : null,
      Capital_Balance: map['Capital_Balance'] != null
          ? map['Capital_Balance'] as double
          : null,
      Operation_Cost: map['Operation_Cost'] != null
          ? map['Operation_Cost'] as double
          : null,
      Deposit_Balance: map['Deposit_Balance'] != null
          ? map['Deposit_Balance'] as double
          : null,
      Savings: map['Savings'] != null ? map['Savings'] as double : null,
      Xmas: map['Xmas'] != null ? map['Xmas'] as double : null,
      Welfare: map['Welfare'] != null ? map['Welfare'] as double : null,
      Operation: map['Operation'] != null ? map['Operation'] as double : null,
      Insurance: map['Insurance'] != null ? map['Insurance'] as double : null,
      Parking: map['Parking'] != null ? map['Parking'] as double : null,
      Buses: map['Buses'] != null ? map['Buses'] as double : null,
      No_of_Vehicles: map['No_of_Vehicles'] != null
          ? (map['No_of_Vehicles'] is double
              ? (map['No_of_Vehicles'] as double).toInt()
              : map['No_of_Vehicles'] as int)
          : null,
      Total_Loans: map['Total_Loans'] != null
          ? (map['Total_Loans'] is double
              ? (map['Total_Loans'] as double).toInt()
              : map['Total_Loans'] as int)
          : null,
      Loan_Balances:
          map['Loan_Balances'] != null ? map['Loan_Balances'] as double : null,
      Principal: map['Principal'] != null ? map['Principal'] as double : null,
      Interest: map['Interest'] != null ? map['Interest'] as double : null,
      OverDraft_Balances: map['OverDraft_Balances'] != null
          ? map['OverDraft_Balances'] as double
          : null,
      Total_loans_Balances: map['Total_loans_Balances'] != null
          ? map['Total_loans_Balances'] as double
          : null,
      Initial_Registration: map['Initial_Registration'] != null
          ? map['Initial_Registration'] as double
          : null,
      Registration_paid: map['Registration_paid'] != null
          ? map['Registration_paid'] as double
          : null,
      Registraion_Balance: map['Registraion_Balance'] != null
          ? map['Registraion_Balance'] as double
          : null,
      Penalty_Paid:
          map['Penalty_Paid'] != null ? map['Penalty_Paid'] as double : null,
      Penalty_Due:
          map['Penalty_Due'] != null ? map['Penalty_Due'] as double : null,
      Penalty: map['Penalty'] != null ? map['Penalty'] as double : null,
      Outstanding_Orders_LCY: map['Outstanding_Orders_LCY'] != null
          ? map['Outstanding_Orders_LCY'] as double
          : null,
      Shipped_Not_Invoiced_LCY: map['Shipped_Not_Invoiced_LCY'] != null
          ? map['Shipped_Not_Invoiced_LCY'] as double
          : null,
      Outstanding_Invoices_LCY: map['Outstanding_Invoices_LCY'] != null
          ? map['Outstanding_Invoices_LCY'] as double
          : null,
      Outstanding_Serv_Orders_LCY: map['Outstanding_Serv_Orders_LCY'] != null
          ? map['Outstanding_Serv_Orders_LCY'] as double
          : null,
      Serv_Shipped_Not_Invoiced_LCY:
          map['Serv_Shipped_Not_Invoiced_LCY'] != null
              ? map['Serv_Shipped_Not_Invoiced_LCY'] as double
              : null,
      Outstanding_Serv_Invoices_LCY:
          map['Outstanding_Serv_Invoices_LCY'] != null
              ? map['Outstanding_Serv_Invoices_LCY'] as double
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Statistic.fromJson(String source) =>
      Statistic.fromMap(json.decode(source) as Map<String, dynamic>);
}

class statistics_model {
  final String Name;
  final double Balance;
  final DateTime Lastupdate;

  statistics_model(this.Name, this.Balance, this.Lastupdate);
}

class member_statistics extends StatelessWidget {
  const member_statistics({
    Key? key,
    required this.stat,
  }) : super(key: key);

  final statistics_model? stat;
  static const double containerwidth = 65;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(15),
            border: Border.all(color: Colors.white.withAlpha(30)),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Current Balance',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withAlpha(130),
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                formatBalance(stat!.Balance),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                stat!.Name.toString(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  letterSpacing: 3,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dateToExpiry(stat!.Lastupdate),
                      style: TextStyle(
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(mastercardIcon),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return Row(
    //   children: <Widget>[
    //     Deposits(context),
    //     Spacer(),
    //     Shares(context),
    //     Spacer(),
    //     Savings(context),
    //     Spacer(),
    //     xmas(context),
    //     Spacer(),
    //     Welfare(context),
    //   ],
    // );
  }

  // Card xmas(BuildContext context) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     elevation: 20,
  //     child: Container(
  //       width: containerwidth,
  //       child: Column(
  //         children: [
  //           Spacer(),
  //           FittedBox(
  //             child: Text(
  //               utilities.formatcurrency
  //                   .format(mem_Statistic == null ? 0 : mem_Statistic?.Xmas),
  //               style: Theme.of(context).textTheme.caption,
  //             ),
  //           ),
  //           Spacer(),
  //           Text("Xmas", style: Theme.of(context).textTheme.subtitle1),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Card Savings(BuildContext context) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     elevation: 20,
  //     child: SizedBox(
  //       width: containerwidth,
  //       child: Column(
  //         children: [
  //           Spacer(),
  //           FittedBox(
  //             child: Text(
  //               utilities.formatcurrency
  //                   .format(mem_Statistic == null ? 0 : mem_Statistic?.Savings),
  //               style: Theme.of(context).textTheme.caption,
  //             ),
  //           ),
  //           Spacer(),
  //           Text("Savings", style: Theme.of(context).textTheme.subtitle1),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Card Shares(BuildContext context) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     elevation: 20,
  //     child: Container(
  //       width: containerwidth,
  //       child: Column(
  //         children: [
  //           Spacer(),
  //           FittedBox(
  //             child: Text(
  //               utilities.formatcurrency.format(
  //                   mem_Statistic == null ? 0 : mem_Statistic?.Capital_Balance),
  //               style: Theme.of(context).textTheme.caption,
  //             ),
  //           ),
  //           Spacer(),
  //           Text("Share capital", style: Theme.of(context).textTheme.subtitle1),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Card Deposits(BuildContext context) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     elevation: 20,
  //     child: Container(
  //       width: containerwidth + 10,
  //       child: Column(
  //         children: [
  //           Spacer(),
  //           FittedBox(
  //             child: Text(
  //               utilities.formatcurrency.format(
  //                   mem_Statistic == null ? 0 : mem_Statistic?.Deposit_Balance),
  //               style: Theme.of(context).textTheme.caption,
  //             ),
  //           ),
  //           Spacer(),
  //           Text(
  //             "Deposits",
  //             style: Theme.of(context).textTheme.subtitle1,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Card Welfare(BuildContext context) {
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     elevation: 20,
  //     child: Container(
  //       width: containerwidth,
  //       child: Column(
  //         children: [
  //           Spacer(),
  //           FittedBox(
  //             child: Text(
  //               utilities.formatcurrency
  //                   .format(mem_Statistic == null ? 0 : mem_Statistic?.Welfare),
  //               style: Theme.of(context).textTheme.caption,
  //             ),
  //           ),
  //           Spacer(),
  //           Text(
  //             "Welfare",
  //             style: Theme.of(context).textTheme.subtitle1,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
