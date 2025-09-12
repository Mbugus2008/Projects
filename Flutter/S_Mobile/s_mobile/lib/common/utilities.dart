// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sms_receiver/sms_receiver.dart';

import 'package:s_mobile/members/member.dart';
import 'package:s_mobile/members/member_info.dart';

import '../members/controller.dart';

class utilities {
  static DateFormat formatter = DateFormat('dd-MMM-yyyy');
  static final DateFormat loandateformatter = DateFormat('MMM-yyyy');
  static NumberFormat formatcurrency =
  NumberFormat.currency(locale: "en_KE", symbol: "");

  static final NumberFormat formatno = NumberFormat("#", "en_Ke");

  int Getrandom() {
    var random = Random();
    return random.nextInt(999999) + 100000;
  }

  static double vehicletiles_width = 50;

  Future<member_info> changpin(BuildContext context,
      member_info? meminfo) async {
    member_info? otpok = member_info();
    late final oldpassword = TextEditingController(text: "");
    late final newPassword = TextEditingController(text: "");
    late final confirmPassword = TextEditingController(text: "");
    String? otperror;
    return await showDialog(
        context: context,
        builder: (context) =>
            StatefulBuilder(
                builder: (context, setState) =>
                    AlertDialog(
                      title: Center(child: Text("Change Password")),
                      content: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 20,
                            maxHeight: MediaQuery
                                .of(context)
                                .size
                                .height / 3),
                        child: Column(
                          children: [
                            TextField(
                              controller: oldpassword,
                              //obscureText: true,
                              textAlign: TextAlign.center,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              onChanged: (value) {
                                setState(() {
                                  otperror = "";
                                });
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Old Password',
                                  hintText: 'Enter Old Password',
                                  errorText: otperror,
                                  hintStyle: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium),
                            ),
                            Spacer(),
                            TextField(
                              controller: newPassword,
                              //obscureText: true,
                              textAlign: TextAlign.center,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              onChanged: (value) {
                                setState(() {
                                  otperror = "";
                                });
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'New Password',
                                  hintText: 'Enter Old Password',
                                  errorText: otperror,
                                  hintStyle: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium),
                            ),
                            Spacer(),
                            TextField(
                              controller: confirmPassword,
                              //obscureText: true,
                              textAlign: TextAlign.center,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              onChanged: (value) {
                                setState(() {
                                  otperror = "";
                                });
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Confirm Password',
                                  hintText: 'Enter New Password',
                                  errorText: otperror,
                                  hintStyle: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context, otpok);
                          },
                          child: Text(
                            "Cancel",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge,
                          ),
                        ),
                        MaterialButton(
                          child: Text("Change"),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context, otpok);
                            });
                          },
                        ),
                      ],
                    )));
  }

  late final otp = TextEditingController(text: "");
  String? otperror;

  String? _textContent = 'Waiting for messages...';
  SmsReceiver? _smsReceiver;

  Future<bool> Otp(BuildContext context, String compareotp) async {
    bool? otpok;

    return await showDialog(
        context: context,
        builder: (context) =>
            StatefulBuilder(
                builder: (context, setState) =>
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0))),
                      contentPadding: EdgeInsets.only(top: 10.0),
                      title: Center(
                          child: Text(
                            "Otp",
                            style: Theme
                                .of(context)
                                .textTheme
                                .displaySmall,
                          )),
                      content: SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            Spacer(),
                            TextField(
                              controller: otp,
                              //obscureText: true,
                              textAlign: TextAlign.center,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              onChanged: (value) {
                                setState(() {
                                  otperror = "";
                                });
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Otp',
                                  hintText: 'Enter Otp',
                                  errorText: otperror,
                                  hintStyle: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            otpok = false;
                            Navigator.pop(context, otpok);
                          },
                          child: Text(
                            "Cancel",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge,
                          ),
                        ),
                        MaterialButton(
                          child: Text("Yes"),
                          onPressed: () {
                            setState(() {
                              if (otp.text == compareotp) {
                                otpok = true;
                                Navigator.pop(context, otpok);
                              } else {
                                otpok = false;
                                otperror = "Invalid otp";
                              }
                            });
                          },
                        ),
                      ],
                    )));
  }

  AppBar appbar(Member? member, String? title) {
    return AppBar(
      backgroundColor: Color.fromRGBO(164, 92, 113, 0.5),
      title:  Column(
        children: [
          Text(
            '${Get
                .find<MemberController>()
                .currentCustomer
                .value
                ?.Name}  (${Get
                .find<MemberController>()
                .currentCustomer
                .value
                ?.No})',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '${title ??''}',
            style: TextStyle(fontSize: 20),
          ),

        ],
      ),
      centerTitle: true,
    );
  }
}

class payfrom {
  String? code;
  String? Name;
  payfrom({
    this.code,
    this.Name,
  });
}
