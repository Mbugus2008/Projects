// import 'package:flutter/material.dart';

// import 'package:s_mobile/main.dart';
// import 'package:s_mobile/common/utilities.dart';

// import 'Loan.dart';

// class Loans_summary extends StatelessWidget {
//   const Loans_summary({
//     Key? key,
//     required this.loans,
//   }) : super(key: key);

//   final List<Loan>? loans;
//   final double w = 90;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         totalloans(context),
//         Spacer(),
//         arrears(context),
//         Spacer(),
//         todays(context),
//         Spacer(),
//         balance(context),
//       ],
//     );
//   }

//   Container arrears(BuildContext context) {
//     return Container(
//       width: w,
//       child: Column(
//         children: [
//           Text(
//             "Arrears",
//             style: Theme.of(context).textTheme.vamounts_header,
//           ),
//         ],
//       ),
//     );
//   }

//   Container balance(BuildContext context) {
//     return Container(
//       width: w,
//       child: Column(
//         children: [
//           Text(
//             "Balance",
//             style: Theme.of(context).textTheme.vamounts_header,
//           ),
//         ],
//       ),
//     );
//   }

//   Container todays(BuildContext context) {
//     var le = (loans
//         ?.map((item) => item.Monthly_Repayment)
//         .reduce((value, element) => value! + element!));
//     return Container(
//       width: w,
//       child: Column(
//         children: [
//           Text(
//             "Today",
//             style: Theme.of(context).textTheme.vamounts_header,
//           ),
//           Text(
//             '(${utilities.formatcurrency.format((le ?? 0)! / 30)})',
//             style: Theme.of(context).textTheme.vamounts,
//           ),
//         ],
//       ),
//     );
//   }

//   Container totalloans(BuildContext context) {
//     return Container(
//       width: w,
//       child: Column(
//         children: [
//           Text(
//             "Loan",
//             style: Theme.of(context).textTheme.vamounts_header,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Loans_widgets extends StatelessWidget {
//   const Loans_widgets({Key? key, required this.loans, required this.index})
//       : super(key: key);

//   final List<Loan>? loans;
//   final int index;
//   final double w = 90;
//   Padding loan_details(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Text(
//             '${loans?[index].Credit_Number}',
//             style: Theme.of(context).textTheme.vamounts,
//           ),
//           Text(
//             '${loans?[index].Product_Name}',
//             style: TextStyle(fontSize: 10),
//           ),
//           Text(
//             utilities.formatter
//                 .format(loans?[index].Credit_Application_Date as DateTime),
//             style: TextStyle(fontSize: 10),
//           ),
//         ],
//       ),
//     );
//   }

//   Column balance(BuildContext context) {
//     return Column(
//       children: [
//         Spacer(),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             utilities.formatcurrency.format(loans?[index].loan_balance),
//             style: Theme.of(context).textTheme.vamounts_header,
//           ),
//         ),
//         Spacer(),
//       ],
//     );
//   }

//   Column arrears(BuildContext context) {
//     return Column(
//       children: [
//         Spacer(),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             utilities.formatcurrency.format(loans?[index].Amount_In_Arreares),
//             style: Theme.of(context).textTheme.vamounts,
//           ),
//         ),
//         Spacer(),
//       ],
//     );
//   }

//   Column today(BuildContext context) {
//     double? mp = loans?[index].Monthly_Repayment;
//     return Column(
//       children: [
//         Spacer(),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             utilities.formatcurrency.format(loans?[index].Amount_Paid_Today),
//             style: Theme.of(context).textTheme.vamounts,
//           ),
//         ),
//         Spacer(),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             '/ ${utilities.formatcurrency.format(mp! / 30)}',
//             style: Theme.of(context).textTheme.vamounts,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Card(
//           elevation: 20,
//           child: Container(
//               // color: loans?[index].Amount_In_Arreares as double > 0
//               //   ? Colors.red
//               // : Colors.transparent,
//               width: MediaQuery.of(context).size.width - 20,
//               height: 40,
//               child: Row(
//                 children: [
//                   Container(
//                       width: w, child: FittedBox(child: loan_details(context))),
//                   Spacer(),
//                   Container(width: w, child: arrears(context)),
//                   Spacer(),
//                   Container(
//                       color: Colors.transparent,
//                       width: w,
//                       child: today(context)),
//                   Spacer(),
//                   Container(width: w, child: balance(context)),
//                 ],
//               )),
//         )
//       ],
//     );
//   }
// }

// class Loans_Totals extends StatelessWidget {
//   const Loans_Totals({
//     Key? key,
//     required this.loans,
//   }) : super(key: key);

//   final List<Loan>? loans;
//   final double w = 90;
//   @override
//   Widget build(BuildContext context) {
//     var l = loans
//         ?.map((item) => item.Amount_Paid_Today)
//         .reduce((value, element) => value! + element!);
//     var le = (loans
//         ?.map((item) => item.Monthly_Repayment)
//         .reduce((value, element) => value! + element!));
//     var amountpaid = 0.0;
//     if (l != null) {
//       amountpaid = (l - (le! / 30));
//     }
//     return Container(
//       color: amountpaid < 0 ? Colors.red : Colors.transparent,
//       child: Row(
//         children: [
//           Container(width: w, child: totalloans(context)),

//           Spacer(),
//           Container(width: w, child: arrears(context)),
//           Spacer(),
//           // savings(context),
//           // Spacer(),
//           Container(width: w, child: todays(context)), Spacer(),
//           Container(width: w, child: balance(context)),
//         ],
//       ),
//     );
//   }

//   Column arrears(BuildContext context) {
//     var l = loans
//         ?.map((item) => item.Amount_In_Arreares)
//         .reduce((value, element) => value! + element!);
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(utilities.formatcurrency.format(l ?? 0),
//               style: Theme.of(context).textTheme.bodyLarge),
//         ),
//         Spacer(),
//       ],
//     );
//   }

//   Column balance(BuildContext context) {
//     var l = loans
//         ?.map((item) => item.loan_balance)
//         .reduce((value, element) => value! + element!);
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(utilities.formatcurrency.format(l ?? 0),
//               style: Theme.of(context).textTheme.bodyLarge),
//         ),
//         Spacer(),
//       ],
//     );
//   }

//   Column todays(BuildContext context) {
//     var l = loans
//         ?.map((item) => item.Amount_Paid_Today)
//         .reduce((value, element) => value! + element!);
//     var le = (loans
//         ?.map((item) => item.Monthly_Repayment)
//         .reduce((value, element) => value! + element!));
//     var amount = 0.0;
//     if (l != null) {
//       amount = l - (le! / 30);
//     }
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(utilities.formatcurrency.format(l ?? 0),
//               style: Theme.of(context).textTheme.bodyLarge),
//         ),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Text(utilities.formatcurrency.format(amount),
//               style: TextStyle(fontSize: 10, color: Colors.black)),
//         ),
//       ],
//     );
//   }

//   Column totalloans(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//             '${(loans == null ? 0 : loans?.where((e) => e.Credit_Balance! > 0)?.length)}',
//             style: Theme.of(context).textTheme.bodyText1),
//       ],
//     );
//   }
// }
