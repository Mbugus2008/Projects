// ignore_for_file: unused_import

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smobile/myapp/accounts/Member.dart';

import 'Drawerfile.dart';
import 'appDrawer.dart';
import 'body.dart';

class newloanPage extends StatefulWidget {
  final Member? member;

  newloanPage({
    Key? key,
    this.member,
  }) : super(key: key);

  @override
  _newloanState createState() => _newloanState();
}

class _newloanState extends State<newloanPage> {
  final DateFormat formatter = DateFormat('dddd-MMM-yyyy');
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    print("ok");
    print(widget.member!.Name!);
  }

  String bal = '0';
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          if(isDialOpen.value){
            isDialOpen.value = false;
            return false;
          }else{
            return true;
          }
        },child: Scaffold(
      appBar: AppBar(
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

      drawer: Drawer(
        child: Drawerfile(),
      ),
      body: null,
    ));
  }

  Widget loans() {
    return new ListView.builder(
      itemCount: widget.member!.Loans!.length,
      itemBuilder: (context, index) {
        var product = widget.member!.Loans![index].Loan_Product_Type;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        return Container(
            height: 70,
            width: double.infinity,
            //color: msgCount[index]>=10? Colors.blue[400]:
            //msgCount[index]>3? Colors.blue[100]: Colors.grey,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.member!.Loans![index].Loan_Product_Type} ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      '${widget.member!.Loans![index].Application_Date!.day.toString()}- ${widget.member!.Loans![index].Application_Date!.month.toString()} -${widget.member!.Loans![index].Application_Date!.year.toString()}',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      '${widget.member!.Loans![index].Outstanding_Balance} ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }

  Widget loanDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.5),
      child: Container(
        //color: Colors.lightBlue[50],
        width: double.infinity,
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 75,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlue[100],
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Share Capital",
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "\KES ${widget.member!.Shares_Capital}",
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.blue[700],
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 75,
                width: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red[100],
                  border: Border.all(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deposits",
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "\KES ${widget.member!.Current_Shares}",
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.red[700],
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 75,
                width: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[100],
                  border: Border.all(
                    width: 2,
                    color: Colors.green,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Xmas Contributions",
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "\KES ${widget.member!.Chrismas_Contribution}",
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.green[700],
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
