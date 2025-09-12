import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/Loans/Loan_Type.dart';
import 'package:s_mobile/Loans/Loan_data.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/accounts_data.dart';
import 'package:s_mobile/members/controller.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member.dart';
import 'package:s_mobile/pages/ledgerEntries.dart';

import 'Loans/Loan.dart';
import 'common/Apis.dart';
import 'common/Results.dart';
import 'common/widgets.dart';
import 'pages/accounts.dart';
import 'pages/dashboard.dart';
import 'pages/loan_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.member}) : super(key: key);
  final Member? member;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {

  }
  Future<List<entries>>? getstatements() async {
    List<entries>? ln;
    var request = Params(Acc: Get.find<MemberController>().currentCustomer.value.No);
    final r = await ApiClient().postdata("Statement", request.toJson());
    if (r.statusCode == 200) {
      Results3<entries> results = Results3<entries>.fromJson(r.body, entries.fromMap);
      switch (results.Code) {
        case 0:
          {
            ln = results.Contents;
            Get.find<MemberController>().currentCustomer.value.Entries= ln;
          }
          break;
        default:
          {
            if (!mounted) return await Future.value(ln);
            MotionToast.error(
              description: Text(results.Desc.toString()),
              title: const Text("Login"),
            ).show(context);
          }
      }
    } else {
      if (!mounted) return await Future.value(ln);
      MotionToast.error(
        description: Text(r.body.toString()),
        title: const Text("Login"),
      ).show(context);
    }
    return await Future.value(ln);
  }
  @override
  void initState() {
    super.initState();
getstatements();
  }
  int pageIndex = 0;

  get pages => [
        dashboard(),
        accounts(member: widget.member),
        loans_page(member: widget.member),
      ];

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      // decoration: widgets().backgroundimage(context),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(164, 92, 113, 0.5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            label: Column(
              children: [
                pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                const Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            icon: const Icon(null),
          ),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              label: Column(
                children: [
                  pageIndex == 1
                      ? const Icon(
                          Icons.work_rounded,
                          color: Colors.white,
                          size: 35,
                        )
                      : const Icon(
                          Icons.work_outline_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                  const Text(
                    "Accounts",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              icon: const Icon(null)),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              label: Column(
                children: [
                  pageIndex == 2
                      ? const Icon(
                          Icons.widgets_rounded,
                          color: Colors.white,
                          size: 35,
                        )
                      : const Icon(
                          Icons.widgets_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                  const Text(
                    "Loans",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              icon: const Icon(null)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    List<Loan>? loans = widget.member?.Loans;
    List<Loan>? activeloans;
    if (loans != null) {
      activeloans = loans.where((e) => e.Outstanding_Balance! > 0).toList();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: widgets().backgroundimage(context),
      child: Scaffold(
        bottomNavigationBar: buildMyNavBar(context),
        drawer: const Drawer(),
        appBar:utilities().appbar(Get.find<MemberController>().currentCustomer.value, '') ,
        //   AppBar(
        //   backgroundColor: const Color.fromRGBO(164, 92, 113, 0.5),
        //   title: Column(
        //     children: [
        //       Row(
        //         children: [
        //           const Spacer(),
        //           Text(
        //             '${Get.find<MemberController>().currentCustomer.value.Name}',
        //             style: const TextStyle(fontSize: 20),
        //           ),
        //           const Spacer(),
        //         ],
        //       ),
        //       Row(children: [
        //         const Spacer(),
        //         Text(
        //           '${Get.find<MemberController>().currentCustomer.value.No}',
        //           style: const TextStyle(fontSize: 12),
        //         ),
        //         Text(
        //           Get.find<MemberController>().currentCustomer.value.ID_No ??
        //               '',
        //           style: const TextStyle(fontSize: 12),
        //         ),
        //         const Spacer()
        //       ])
        //     ],
        //   ),
        // ),
        body: pages[
            pageIndex], // dashboard(member: widget.member), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
