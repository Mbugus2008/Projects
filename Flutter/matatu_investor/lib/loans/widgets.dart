import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/loans/loan.dart';
import 'package:matatu/main.dart';
import 'package:matatu/utilities.dart';

class Loans_summary extends StatelessWidget {
  Loans_summary({
    Key? key,
  }) : super(key: key);
  final MemberController loans = Get.find();
  final double w = 90;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        totalloans(context),
        Spacer(),
        arrears(context),
        Spacer(),
        todays(context),
        Spacer(),
        balance(context),
      ],
    );
  }

  SizedBox arrears(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            "Arrears",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
        ],
      ),
    );
  }

  SizedBox balance(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            "Balance",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
        ],
      ),
    );
  }

  SizedBox todays(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            "Today",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
          if (loans.loan.isNotEmpty)
            Text(
              '(${utilities.formatcurrency.format(((loans.loan.map((item) => (item.Monthly_Installment ?? item.Monthly_Repayment ?? 0)).reduce((value, element) => value + element)) / 30))})',
              style: Theme.of(context).textTheme.vamounts,
            )
          else
            CircularProgressIndicator(),
        ],
      ),
    );
  }

  SizedBox totalloans(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            "Loan",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
        ],
      ),
    );
  }
}

class Loans_widgets extends StatelessWidget {
  const Loans_widgets({Key? key, required this.loans, required this.index})
      : super(key: key);

  final Loan? loans;
  final int index;
  final double w = 90;
  Padding loan_details(BuildContext context) {
    if (loans != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '${loans?.Loan_No ?? loans?.Credit_Number ?? 'N/A'}',
              style: Theme.of(context).textTheme.vamounts,
            ),
            Text(
              '${loans?.Product_Name ?? 'N/A'}',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              utilities.formatter.format(loans?.Repayment_Start_Date ??
                  loans?.Credit_Application_Date ??
                  DateTime(2019, 1, 1)),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      );
    } else {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator());
    }
  }

  Column balance(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            utilities.formatcurrency.format(loans?.loan_balance),
            style: Theme.of(context).textTheme.vamounts_header,
          ),
        ),
        Spacer(),
      ],
    );
  }

  Column arrears(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            utilities.formatcurrency.format(loans?.Amount_In_Arreares ?? 0),
            style: Theme.of(context).textTheme.vamounts,
          ),
        ),
        Spacer(),
      ],
    );
  }

  Column today(BuildContext context) {
    double mp = loans?.Monthly_Installment ?? loans?.Monthly_Repayment ?? 0;
    return Column(
      children: [
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            utilities.formatcurrency.format(loans?.Amount_Paid_Today ?? 0),
            style: Theme.of(context).textTheme.vamounts,
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '/ ${utilities.formatcurrency.format(mp / 30)}',
            style: Theme.of(context).textTheme.vamounts,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 20,
          child: SizedBox(
              // color: loans?[index].Amount_In_Arreares as double > 0
              //   ? Colors.red
              // : Colors.transparent,
              width: MediaQuery.of(context).size.width - 20,
              height: 40,
              child: Row(
                children: [
                  SizedBox(
                      width: w, child: FittedBox(child: loan_details(context))),
                  Spacer(),
                  SizedBox(width: w, child: arrears(context)),
                  Spacer(),
                  Container(
                      color: Colors.transparent,
                      width: w,
                      child: today(context)),
                  Spacer(),
                  SizedBox(width: w, child: balance(context)),
                ],
              )),
        )
      ],
    );
  }
}

class Loans_Totals extends StatelessWidget {
  const Loans_Totals({
    Key? key,
    required this.loans,
  }) : super(key: key);

  final List<Loan>? loans;
  final double w = 90;
  @override
  Widget build(BuildContext context) {
    var l = loans
        ?.map((item) => item.Amount_Paid_Today ?? 0)
        .reduce((value, element) => value + element);
    var le = (loans
        ?.map((item) => item.Monthly_Installment ?? item.Monthly_Repayment ?? 0)
        .reduce((value, element) => value + element));
    var amountpaid = 0.0;
    if (l != null && le != null) {
      amountpaid = (l - (le / 30));
    }
    return Container(
      color: amountpaid < 0 ? Colors.red : Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: w, child: totalloans(context)),

          Spacer(),
          SizedBox(width: w, child: arrears(context)),
          Spacer(),
          // savings(context),
          // Spacer(),
          SizedBox(width: w, child: todays(context)), Spacer(),
          SizedBox(width: w, child: balance(context)),
        ],
      ),
    );
  }

  Column arrears(BuildContext context) {
    var l = loans
        ?.map((item) => item.Amount_In_Arreares ?? 0)
        .reduce((value, element) => value + element);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(utilities.formatcurrency.format(l ?? 0),
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        Spacer(),
      ],
    );
  }

  Column balance(BuildContext context) {
    var l = loans
        ?.map((item) => item.loan_balance ?? 0)
        .reduce((value, element) => value + element);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(utilities.formatcurrency.format(l ?? 0),
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        Spacer(),
      ],
    );
  }

  Column todays(BuildContext context) {
    var l = loans
        ?.map((item) => item.Amount_Paid_Today ?? 0)
        .reduce((value, element) => value + element);
    var le = (loans
        ?.map((item) => item.Monthly_Installment ?? item.Monthly_Repayment ?? 0)
        .reduce((value, element) => value + element));
    var amount = 0.0;
    if (l != null && le != null) {
      amount = l - (le / 30);
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(utilities.formatcurrency.format(l ?? 0),
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(utilities.formatcurrency.format(amount),
              style: TextStyle(fontSize: 10, color: Colors.black)),
        ),
      ],
    );
  }

  Column totalloans(BuildContext context) {
    return Column(
      children: [
        Text(
            '${(loans == null ? 0 : loans?.where((e) => (e.Loan_Balance ?? e.Credit_Balance ?? 0) > 0).length)}',
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
