// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/member/ledger/ledgers.dart';
import 'package:matatu/member/ledger/page.dart';

class accounts {
  String? No;
  String? name;
  double? balance;
  DateTime? lastdateupdated;
  List<Transaction_Types>? transaction_types;
  accounts({
    this.No,
    this.name,
    this.balance,
    this.lastdateupdated,
    this.transaction_types,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'No': name,
      'name': name,
      'balance': balance,
      'lastdateupdated': lastdateupdated?.millisecondsSinceEpoch,
      'transaction_types': transaction_types?.map((x) => x.index).toList(),
    };
  }

  factory accounts.fromMap(Map<String, dynamic> map) {
    final List<dynamic> hobbyList = map['transaction_types'];
    final List<Transaction_Types> hobbies = hobbyList
        .cast<Transaction_Types>(); // Convert dynamic list to String list
    return accounts(
        No: map['No'] != null ? map['No'] as String : null,
        name: map['name'] != null ? map['name'] as String : null,
        balance: map['balance'] != null ? map['balance'] as double : null,
        lastdateupdated: map['lastdateupdated'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (map['lastdateupdated'] ?? 0) as int)
            : null,
        transaction_types: hobbies);
  }

  String toJson() => json.encode(toMap());

  factory accounts.fromJson(String source) =>
      accounts.fromMap(json.decode(source) as Map<String, dynamic>);
}

class accountsmodel extends StatelessWidget {
  final accounts acc;

  const accountsmodel({
    required this.acc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MemberController controller = Get.find();
    return Card(
        elevation: 4.0,
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                acc.name!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              // SizedBox(height: 2.0),
              GestureDetector(
                onTap: () {
                  // Add your onTap logic here
                  print(acc.toJson());
                  controller.getledgers(acc);
                  Get.to(() => ledgerpage(
                        acc: acc,
                      ));
                  // Get.to(ledgerDataSource(
                  //     Get.find<MemberController>().ledgerentries.value));
                },
                child: Text(
                  NumberFormat("#,##0.00", "en_US").format(acc.balance!),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
              ),

              acc.lastdateupdated != null
                  ? Text(acc.lastdateupdated.toString())
                  : Text("")
            ],
          ),
        ));

    //  Container(
    //   padding: const EdgeInsets.all(24),
    //   decoration: BoxDecoration(
    //     color: Colors.white.withAlpha(15),
    //     border: Border.all(color: Colors.white.withAlpha(30)),
    //     borderRadius: const BorderRadius.all(Radius.circular(16)),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text(
    //         'Current Balance',
    //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    //           color: Colors.white.withAlpha(130),
    //           shadows: [
    //             Shadow(
    //               color: Colors.black.withOpacity(0.25),
    //               offset: const Offset(0, 2),
    //               blurRadius: 5,
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 8),
    //       Text(
    //         formatBalance(acc.balance ?? 0),
    //         style: Theme.of(context).textTheme.headlineLarge?.copyWith(
    //           fontWeight: FontWeight.w700,
    //           shadows: [
    //             Shadow(
    //               color: Colors.black.withOpacity(0.25),
    //               offset: const Offset(0, 2),
    //               blurRadius: 5,
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 16),
    //       Text(
    //         obscureCardNumber(acc.name.toString()),
    //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    //           letterSpacing: 3,
    //           fontWeight: FontWeight.w600,
    //           shadows: [
    //             Shadow(
    //               color: Colors.black.withOpacity(0.25),
    //               offset: const Offset(0, 2),
    //               blurRadius: 5,
    //             ),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 24),
    //       Expanded(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               dateToExpiry(acc.lastdateupdated ?? DateTime.now()),
    //               style: TextStyle(
    //                 letterSpacing: 3,
    //                 shadows: [
    //                   Shadow(
    //                     color: Colors.black.withOpacity(0.25),
    //                     offset: const Offset(0, 2),
    //                     blurRadius: 5,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SvgPicture.asset(mastercardIcon),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
