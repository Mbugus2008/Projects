// ignore_for_file: unused_import

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:smobile/myapp/Apis.dart';
import 'package:smobile/myapp/Appbar.dart';
import 'package:smobile/myapp/loans/Loan_Products.dart';
import 'package:smobile/myapp/accounts/Member.dart';
import 'package:smobile/myapp/NewLoan.dart';
import 'package:smobile/myapp/Utilities.dart';

import 'Drawerfile.dart';
import 'appDrawer.dart';
import 'body.dart';


class MyHomePage extends StatefulWidget {
  final Member? member;
  final bool? isMultiSelection;

  MyHomePage({
    Key? key,
    this.member,
    this.isMultiSelection,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DateFormat formatter = DateFormat('dd-MMM-yyyy');
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  List<Loan_Products>? loanproducts;
  bool isNative = false;

  @override
  void initState() {
    super.initState();
  }

  List<Loan_Products> items = <Loan_Products>[];
  Future getproducts() {
    return ApiClient().getdata('/api/loanProducts', "").then((value) {
      if (value.Code == 0) {
        var tagsJson = jsonDecode(value.content.toString()) as List;
        // setState(() {
        loanproducts = tagsJson
            .map((tagJson) => Loan_Products.fromJson(json.encode(tagJson)))
            .toList();
        for (var lp in loanproducts!) {
          Map<String, dynamic> toJson() {
            return {
              "header": {'Userid': "", 'Password': ""},
              "body": {
                "Phone": "+254" +
                    widget.member!.MPESA_Mobile_No!
                        .substring(widget.member!.MPESA_Mobile_No!.length - 9),
                "loantype": lp.Code
              },
            };
          }

          ApiClient()
              .postdata('/api/eligibility', jsonEncode(toJson()).toString())
              .then((loanpr) {
            if (loanpr.Code == 0)
              setState(() {
                lp.isSelected = false;
              });
            else {
              setState(() {
                lp.isSelected = false;
                lp.Comments = loanpr.Desc;
              });

              Fluttertoast.showToast(msg: loanpr.Desc.toString());
            }
          });
        }
        ;
        // }
        //);

        Fluttertoast.showToast(msg: "Ok");
        if (loanproducts!.isNotEmpty) {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  title: Center(
                      child: Text(
                    "New Loans",
                    style: TextStyle(color: Colors.white),
                  )),
                  backgroundColor: Colors.transparent,
                  titleTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  actionsOverflowButtonSpacing: 20,
                  actions: [
                    ElevatedButton(onPressed: () {}, child: Text("Back")),
                    ElevatedButton(onPressed: () {}, child: Text("Apply")),
                  ],
                  content: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Expanded(
                          child: TransparentCard(
                              child: CupertinoScrollbar(child: Text("Ok")))))));
        } else
          Fluttertoast.showToast(msg: "Unable to get loans");
      } else {
        Fluttertoast.showToast(msg: "Unable to get loans");
      }
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  String bal = '0';
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white,
              activeColor[progressVal.value].withOpacity(0.5),
              activeColor[progressVal.value]
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //leading: Icon(Icons.menu),
          centerTitle: false,
          title: Text(
            '${widget.member!.Name} ' +
                "\n" +
                '${widget.member!.MPESA_Mobile_No}' +
                "\n" +
                'Since ${formatter.format(widget.member!.Registration_Date!)}',
            style: TextStyle(fontSize: 12),
          ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          openCloseDial: isDialOpen,
          backgroundColor: Colors.green,
          overlayColor: Colors.grey,
          overlayOpacity: 0.2,
          spacing: 5,
          spaceBetweenChildren: 5,
          closeManually: false,
          children: [
            SpeedDialChild(
                child: Icon(Icons.credit_card_outlined),
                label: 'Apply Loan',
                labelBackgroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                onTap: () {
                  Get.to(() => newloanPage(
                        member: widget.member,
                      ));
                  print('Share Tapped');
                }),
            SpeedDialChild(
                child: Icon(Icons.money_rounded),
                labelBackgroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                label: 'Repay Your Loan',
                onTap: () {
                  print('Mail Tapped');
                  getproducts();
                }),
          ],
        ),
        drawer: Drawer(
          child: Drawerfile(),
        ),
        body: Body(member: widget.member),
      ),
    );
  }

  void selectCountry(Loan_Products country) {
    country.isSelected = true;
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        Get.snackbar('Logout', "This is Center Short Toast");

        break;
      case 'Settings':
        break;
    }
  }
}
