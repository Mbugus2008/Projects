import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/member/accounts.dart';
import 'package:matatu/vehicles/vehicle_types.dart';
import 'package:matatu/vehicles/vehicle_widgets.dart';
import 'package:matatu/vehicles/vehicles.dart';

import 'helpers/init.dart';
import 'loans/widgets.dart';
import 'widgets/widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MemberController>(builder: (controller) {
      return Container(
          child: Scaffold(
              appBar: AppBar(
                title: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: Text(
                    controller.data.value.Name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),

                backgroundColor: Colors.blue, // Custom background color
                elevation: 20, // Remove shadow
              ),
              //drawer: MyDrawer(),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(1),
                decoration: widgets().container2(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 20,
                      margin: EdgeInsets.only(top: 1),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          controller.maccounts.value.isNotEmpty
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        controller.maccounts.value.length,
                                    itemBuilder: (context, index) {
                                      return accountsmodel(
                                          acc: controller
                                              .maccounts.value[index]);
                                    },
                                  ),
                                )
                              : CircularProgressIndicator()
                        ],

                        //Kifedha System@2018
                      ),
                    ),
                    // Spacer(),
                    //Vehicles
                    Expanded(
                      flex: 200,
                      child: Card(
                        elevation: 20,
                        color: Colors.transparent,
                        borderOnForeground: true,
                        child: Column(
                          children: [
                            // Header Row for labels
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                    flex: 2,
                                    child: Center(child: Text('Vehicle Info')),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 1,
                                    child: Center(child: Text('Op1')),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 1,
                                    child: Center(child: Text('Op2')),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 1,
                                    child: Center(child: Text('Total\nToday')),
                                  ),
                                ],
                              ),
                            ),
                            Divider(), // Optional divider for clarity

                            // ListView to display vehicle data
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: controller.data.value.vehicles?.length ?? 0,
                                itemBuilder: (context, index) {
                                  var vehicle = controller.data.value.vehicles?[index]; // Access once
                                  bool isFirst = index == 0;
                                  return GestureDetector(
                                    onTap: () {
                                      // Handle tap event
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Text(
                                                  '${vehicle?.Vehicle_Number ?? ''}\n'
                                                      '${vehicle?.Vehicle_Type?.value ?? ''}\n'
                                                      '${DateFormat('dd-MMM-yy').format(vehicle?.Start_Date ?? DateTime(2019,01,01))}',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Expanded(
                                              flex: 1,
                                              child: Center(
                                                child: Text(
                                                  '${utilities.formatcurrency.format(vehicle?.Operation_1 ?? 0)}',
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Expanded(
                                              flex: 1,
                                              child: Center(
                                                child: Text(
                                                  '${utilities.formatcurrency.format(vehicle?.Operation_2 ?? 0)}',
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Expanded(
                                              flex: 1,
                                              child: Center(
                                                child: Text(
                                                  '${utilities.formatcurrency.format(vehicle?.Total_collection ?? 0)}',
                                                  textAlign: TextAlign.right,
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
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Expanded(
                    //   flex: 200,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.vertical,
                    //     itemCount:controller.data.value.loans?.length, // Replace with the length of your data list
                    //     itemBuilder: (context, index) {
                    //       return  GestureDetector(
                    //           onTap: () {
                    //           },
                    //           child: Card(
                    //
                    //             child: Container(
                    //               margin: EdgeInsets.only(left: 10,right: 10),
                    //               child: Row(
                    //                 mainAxisSize: MainAxisSize.min,
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   Center(child: Text('${controller.data.value.loans?[index].Credit_Number}\n'
                    //                       '${controller.data.value.loans?[index].Product_Name}\n'
                    //                       '${utilities.formatter.format(controller.data.value.loans?[index].Credit_Disbursement_Date ??DateTime(01,01,01))}')),
                    //
                    //                   Spacer(),
                    //                   Text('Int\n${utilities.formatcurrency.format(controller.data.value.loans?[index].Interest_Balance)}'),
                    //                   Spacer(),
                    //                   Text('${utilities.formatcurrency.format(controller.data.value.loans?[index].Credit_Balance)}'),
                    //                 ],
                    //               ),
                    //             ),
                    //           )
                    //       );
                    //     },
                    //   ),
                    // ),
                    // Card(
                    //   elevation: 20,
                    //   //color: Colors.transparent,
                    //   child: Container(
                    //     decoration: widgets().border(context),
                    //     //padding: EdgeInsets.only(bottom: 10),
                    //     child: Column(
                    //       children: [
                    //         if ((controller.data.value.vehicles != null))
                    //           Card(
                    //             elevation: 20,
                    //             margin: EdgeInsets.only(left: 1, bottom: 2),
                    //             child: Container(
                    //               height: 30,
                    //               decoration: widgets().container3(context),
                    //               width: MediaQuery.of(context).size.width - 2,
                    //               padding: EdgeInsets.only(left: 5),
                    //               child: Vsummary(
                    //                   vehicles: controller.data.value.vehicles),
                    //             ),
                    //           ),
                    //         // Divider(color: Colors.black),
                    //         ConstrainedBox(
                    //             constraints: BoxConstraints(
                    //                 minHeight: 20,
                    //                 maxHeight:
                    //                     MediaQuery.of(context).size.height /
                    //                         2.3),
                    //             child: MediaQuery.removePadding(
                    //               removeTop: true,
                    //               context: context,
                    //               child: ListView.builder(
                    //                   shrinkWrap: true,
                    //                   itemCount:
                    //                       controller.data.value.vehicles == null
                    //                           ? 0
                    //                           : controller
                    //                               .data.value.vehicles?.length,
                    //                   itemBuilder:
                    //                       (BuildContext context, int index) {
                    //                     return Vehicles_widgets().buildItem(
                    //                         context,
                    //                         index,
                    //                         controller.data.value.vehicles
                    //                             as List<Vehicles>);
                    //                   }),
                    //             )),
                    //         if ((controller.data.value.vehicles != null))
                    //           Card(
                    //             elevation: 20,
                    //             margin: EdgeInsets.only(left: 1, top: 2),
                    //             child: Container(
                    //               height: 20,
                    //               decoration: widgets().container3(context),
                    //               //width: MediaQuery.of(context).size.width - 2,
                    //               //padding: EdgeInsets.only(left: 5),
                    //               child: Vtotals(
                    //                   vehicles: controller.data.value.vehicles),
                    //             ),
                    //           ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Spacer(),
                    //Loans

                    // Card(
                    //   color: Colors.transparent,
                    //   elevation: 20,
                    //   child: SizedBox(
                    //     //height: MediaQuery.of(context).size.height / 4,
                    //     //decoration: widgets().border(context),
                    //     child: Column(
                    //       children: [
                    //         //Obx(() {
                    //         controller.Outstandingloan.value.isNotEmpty
                    //             ? Column(children: [
                    //                 Card(
                    //                   elevation: 20,
                    //                   child: Container(
                    //                     height: 30,
                    //                     decoration:
                    //                         widgets().container3(context),
                    //                     //padding: EdgeInsets.only(left: 5),
                    //                     child: Loans_summary(),
                    //                   ),
                    //                 ),
                    //                 //Divider(color: Colors.black),
                    //                 MediaQuery.removePadding(
                    //                   removeTop: true,
                    //                   context: context,
                    //                   child: ListView.builder(
                    //                       shrinkWrap: true,
                    //                       itemCount: controller
                    //                           .Outstandingloan.value.length,
                    //                       itemBuilder: (BuildContext context,
                    //                           int index) {
                    //                         return Loans_widgets(
                    //                           loans: controller
                    //                               .Outstandingloan.value[index],
                    //                           index: index,
                    //                         );
                    //                       }),
                    //                 ),
                    //
                    //                 Card(
                    //                   elevation: 20,
                    //                   child: Container(
                    //                     height: 30,
                    //                     decoration:
                    //                         widgets().container3(context),
                    //                     padding: EdgeInsets.only(left: 5),
                    //                     child: Loans_Totals(
                    //                         loans: controller
                    //                             .Outstandingloan.value),
                    //                   ),
                    //                 ),
                    //               ])
                    //             : CircularProgressIndicator(
                    //                 semanticsLabel: "Getting loans")
                    //
                    //         // }),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )));
    });
  }
}
