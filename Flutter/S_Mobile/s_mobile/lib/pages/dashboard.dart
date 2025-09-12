import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/login.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/pages/accounts.dart';
import 'package:s_mobile/pages/ledgerEntries.dart';
import 'package:s_mobile/pages/loan_list.dart';
import 'package:s_mobile/transaction/enums.dart';

import '../common/menu.dart';
import '../common/widgets.dart';
import '../master_page.dart';
import '../members/controller.dart';
import '../members/member.dart';

class dashboard extends StatelessWidget {
  const dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          //color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          decoration: widgets().backgroundimage(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Get.find<MemberController>().currentCustomer.value.Accounts?.length, // Replace with the length of your data list
                itemBuilder: (context, index) {
                  return  GestureDetector(
                    onTap: () {
                      var acc = Get
                          .find<MemberController>()
                          .currentCustomer
                          .value
                          .Accounts?[index];
                      var ttypes = acc?.transTypes;
                      List<entries>? entriess = Get
                          .find<MemberController>()
                          .currentCustomer
                          .value
                          .Entries
                          ?.where((ent) {
                        if (ent.Transaction_Type != null) {
                          bool? cont = ttypes?.contains(ent.Transaction_Type);
                          return cont!;
                        } else
                          return false;
                      }).toList();
                      if (acc?.Name == 'Loans')
                        Get.to(Master(
                          member: Get
                              .find<MemberController>()
                              .currentCustomer
                              .value,
                          widgets: loans_page(member: Get
                              .find<MemberController>()
                              .currentCustomer
                              .value),
                          title: '${acc?.Name} [Bal: ${utilities.formatcurrency
                              .format(acc?.Balance ?? 0) }]',
                        ));
                      else
                        Get.to(Master(
                          member: Get
                              .find<MemberController>()
                              .currentCustomer
                              .value,
                          widgets:Ledgerentries(Entries: entries()
                              .calculateRunningBalance(entriess)),
                          title: '${acc?.Name} [Bal: ${utilities.formatcurrency
                              .format(acc?.Balance ?? 0) }]',
                        ));
                      //Get.to(Ledgerentries(Entries: entries ));

                    },
                    child: Container(
                      decoration: widgets().backgroundimage(context),
                      margin: EdgeInsets.only(left: 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Card(
                                elevation: 20,
                                margin: EdgeInsets.only(right: 10),
                                color: Theme.of(context)
                                    .primaryColor, // Color.fromRGBO(164, 92, 113, 0.5),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Container(
                                        color: Colors.transparent,
                                      child: Text(
                                        utilities.formatcurrency.format(Get.find<MemberController>().currentCustomer.value.Accounts?[index].Balance ?? 0)              ,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      Get.find<MemberController>().currentCustomer.value.Accounts?[index].Name ?? "",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              Spacer(),
        //Menu
              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                color: Theme.of(context).primaryColor,
                child: menu(
                  member: Get.find<MemberController>().currentCustomer.value,
                  Name: "Balances",
                  menus: Menus.Balance,
                ),
              ),
              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                color: Theme.of(context).primaryColor,
                child: menu(
                  member: Get.find<MemberController>().currentCustomer.value,
                  Name: "Ministatement",
                  menus: Menus.Ministatement,
                ),
              ),

              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                color: Theme.of(context).primaryColor,
                child: menu(
                  member: Get.find<MemberController>().currentCustomer.value,
                  Name: "Transfer",
                  menus: Menus.Transfer,
                ),
              ),

              // Card(
              //   elevation: 20,
              //   margin: EdgeInsets.only(left: 50, right: 50, bottom: 20),
              //   color: Theme.of(context).primaryColor,
              //   child: menu(
              //     member: member,
              //     Name: "Pay",
              //     menus: Menus.Pay,
              //   ),
              // ),

              // Card(
              //   elevation: 20,
              //   margin: EdgeInsets.only(left: 50, right: 50, bottom: 20),
              //   color: Theme.of(context).primaryColor,
              //   child: menu(
              //     member: member,
              //     Name: "Apply Loan",
              //     menus: Menus.Apply_Loan,
              //   ),
              // ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
