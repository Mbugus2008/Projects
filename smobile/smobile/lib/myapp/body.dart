import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:smobile/myapp/accounts/Member.dart';

import 'loans/Loans.dart';
import 'Utilities.dart';

class Body extends StatefulWidget {
  final Member? member;
  const Body({Key? key, required this.member}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    print(widget.member!.Loans);
    var loan = widget.member!.Loans;
    print(loan);
    List<loans> pastloans = [];
    List<loans> outlons = [];
    if (loan != null) {
      outlons = loan.where((e) => e.Outstanding_Balance! > 0 &&
          e.Loan_Product_Type != null).toList();
      pastloans = loan.where((element) => element.Outstanding_Balance! == 0 &&
          element.Loan_Product_Type != null)
          .toList();
    }

    return SafeArea(

       child: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,


      child: ListView(
          children: <Widget>[
            SizedBox(),

            Text(
              "Accounts", textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                // fontFamily: 'cursive'
              ),
            ),

            Accounts(member: widget.member!),
            SizedBox(),
            Text(
              "Current Loans",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                // fontStyle: FontStyle.italic,
                // fontFamily: 'cursive'
              ),
            ),
            loanwidget(loan: outlons),
            SizedBox(),
            Text(
              "Previous Loans",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                // fontStyle: FontStyle,
                // fontFamily: 'cursive'
              ),
            ),
           loanwidget(
                loan: pastloans),


          ],
      ),),

    );
  }
}
