import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/controller.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member.dart';

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
  _MyHomePageState() {}
  Future<List<entries>>? getstatements() async {
    List<entries>? ln;
    var request =
        Params(Acc: Get.find<MemberController>().currentCustomer.value.No);
    final r = await ApiClient().postdata("Statement", request.toJson());
    if (r.statusCode == 200) {
      Results3<entries> results =
          Results3<entries>.fromJson(r.body, entries.fromMap);
      switch (results.Code) {
        case 0:
          {
            ln = results.Contents;
            Get.find<MemberController>().currentCustomer.value.Entries = ln;
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
    final navItems = [
      {
        'icon': Icons.grid_view_rounded,
        'iconOff': Icons.grid_view_outlined,
        'label': 'Overview'
      },
      {
        'icon': Icons.account_balance_wallet_rounded,
        'iconOff': Icons.account_balance_wallet_outlined,
        'label': 'Accounts'
      },
      {
        'icon': Icons.receipt_long_rounded,
        'iconOff': Icons.receipt_long_outlined,
        'label': 'Credit'
      },
    ];

    return Container(
      height: 80,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (i) {
          final active = pageIndex == i;
          return GestureDetector(
            onTap: () => setState(() => pageIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: active
                  ? BoxDecoration(
                      color: Colors.white.withOpacity(0.22),
                      borderRadius: BorderRadius.circular(30),
                    )
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    active
                        ? navItems[i]['icon'] as IconData
                        : navItems[i]['iconOff'] as IconData,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    navItems[i]['label'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: active ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (active)
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      height: 3,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
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
        appBar: utilities()
            .appbar(Get.find<MemberController>().currentCustomer.value, ''),
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
