// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: constant_identifier_names

// import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:t_matatu/controllers/main.dart';
// import 'package:t_matatu/models/Header.dart';
// import 'package:t_matatu/models/Transaction.dart' as tmatatu;
// import 'package:t_matatu/models/Utils/util.dart';
// import 'package:t_matatu/models/summary/Tsummary.dart';
// import 'package:t_matatu/models/vehicles/DeportandFuel.dart';
// import 'package:t_matatu/models/vehicles/vehicle.dart';
// import 'package:t_matatu/pages/Depot.dart';
// import 'package:t_matatu/pages/Fuel.dart';
// import 'package:t_matatu/providers/client.dart';

// import '../../controllers/vehicles/vehicles.dart';
// import '../../pages/widgets/Groupbox.dart';
// import '../../reports/controller.dart';

// enum Receipttype { Member, Crew, Both }

// class Cityhoppa implements BaseClients {
//   @override
//   bool? Auto_Assign = true;
//   @override
//   Future<void> init() async {
//     Vehicles().Daily_Contributions(getdate());
//   }

//   @override
//   Widget homelist() {
//     // TODO: implement homelist
//     return Obx(() {
//       return Get.find<VehiclesController>().dailycollections.isNotEmpty
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   onChanged: (value) {
//                     value = value.toUpperCase();
//                     Get.find<VehiclesController>().dailycollections.value =
//                         Get.find<VehiclesController>()
//                             .dailycollectionsf
//                             .where((item) {
//                       return (item.toString().contains(value) == true);
//                     }).toList();
//                   },
//                   textAlign: TextAlign.center,
//                   // controller: //headerController.amountEditingController.value,
//                   //keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.search_off,
//                         color: Colors.blue,
//                       ),
//                       floatingLabelAlignment: FloatingLabelAlignment.center,
//                       labelText: 'Find Vehicle',
//                       labelStyle: TextStyle(fontSize: 14)),
//                 ),
//                 Expanded(
//                   flex: 7,
//                   child: ListView.builder(
//                       itemExtent: null,
//                       padding: const EdgeInsets.all(0),
//                       shrinkWrap: true,
//                       itemCount: Get.find<VehiclesController>()
//                           .dailycollections
//                           .length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Card(
//                           elevation: 0,
//                           // shape: RoundedRectangleBorder(
//                           //   borderRadius: BorderRadius.circular(
//                           //       5), // Adjust the border radius
//                           //   side: const BorderSide(
//                           //       color: Color.fromARGB(
//                           //           255, 88, 122, 150),
//                           //       width: 2), // Border color and width
//                           // ),
//                           child: ListTile(
//                             leading: Text(Get.find<VehiclesController>()
//                                 .dailycollections[index]
//                                 .Fleet_No!),
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(
//                                       Get.find<VehiclesController>()
//                                           .dailycollections[index]
//                                           .Vehicle_Number
//                                           .toString(),
//                                     ),
//                                     Text(vehicle_type_desc.desc[
//                                             Get.find<VehiclesController>()
//                                                 .dailycollections[index]
//                                                 .Vehicle_Type] ??
//                                         'Unknown'),
//                                   ],
//                                 ),
//                                 Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(NumberFormat("#,##0.00", "en_US")
//                                         .format(Get.find<VehiclesController>()
//                                                 .dailycollections[index]
//                                                 .Management ??
//                                             0)),
//                                     Text(NumberFormat("#,##0.00", "en_US")
//                                         .format(Get.find<VehiclesController>()
//                                                 .dailycollections[index]
//                                                 .Offload ??
//                                             0)),
//                                   ],
//                                 ),
//                                 Text(
//                                   NumberFormat("#,##0.00", "en_US").format(
//                                       Get.find<VehiclesController>()
//                                           .dailycollections[index]
//                                           .total),
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//                 SizedBox(
//                   height: 50,
//                   child: Obx(() {
//                     return Card(
//                       elevation: 20,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                             12), // Adjust the border radius
//                         side: const BorderSide(
//                             color: Color.fromARGB(255, 88, 122, 150),
//                             width: 2), // Border color and width
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '${Get.find<VehiclesController>().dailycollections.where((p0) => ((p0.total > 0))).length} Vehicles',
//                             style: const TextStyle(fontSize: 14),
//                           ), //
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 'Mgmt ${NumberFormat("#,##0.00", "en_US").format(Get.find<VehiclesController>().dailycollections.fold<double>(0.0, (double currentSum, Vehicles item) => currentSum + num.tryParse(item.Management.toString())!))}',
//                                 style: const TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                   'Offd ${NumberFormat("#,##0.00", "en_US").format(Get.find<VehiclesController>().dailycollections.fold<double>(0.0, (double currentSum, Vehicles item) => currentSum + num.tryParse(item.Offload.toString())!))}',
//                                   style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold),
//                                   textAlign: TextAlign.end),
//                             ],
//                           ),
//                           Text(
//                             NumberFormat("#,##0.00", "en_US").format(
//                                 Get.find<VehiclesController>()
//                                     .dailycollections
//                                     .fold<double>(
//                                         0.0,
//                                         (double currentSum, Vehicles item) =>
//                                             currentSum +
//                                             num.tryParse(
//                                                 item.total.toString())!)),
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             )
//           : const Center(
//               child: CircularProgressIndicator(),
//             );
//     });
//   }

//   Receipttype gettype(List<tmatatu.Trans>? t) {
//     tmatatu.Trans? crew = t!.firstWhereOrNull((element) =>
//         element.Type == "SAVINGSCREW" || element.Type == "SAVINGS");
//     tmatatu.Trans? member = t.firstWhereOrNull((element) =>
//         element.Type != "SAVINGSCREW" && element.Type != "SAVINGS");
//     if (crew != null && member != null) return Receipttype.Both;
//     if (crew != null && member == null) return Receipttype.Crew;
//     if (crew == null && member != null) return Receipttype.Member;
//     return Receipttype.Member;
//   }

//   @override
//   Future<List<int>> printReceipt(Header header) async {
//     List<int> bytes = [];
//     Receipttype type = gettype(header.transtions);
//     switch (type) {
//       case Receipttype.Member:
//         {
//           bytes += await getTicket(header);
//           //await BluetoothThermalPrinter.writeBytes(bytes);
//         }
//       case Receipttype.Crew:
//         {
//           for (var element in header.transtions!) {
//             Header h = header.copyWith();
//             if (element.Type == "SAVINGSCREW") h.Account = element.Account_No;
//             h.transtions = [element];
//             h.Total_Amount = element.Amount;
//             bytes += await getTicketcrew(h);
//             //await BluetoothThermalPrinter.writeBytes(bytes);
//             // List<int> bytes1 = await seperator();
//             // await BluetoothThermalPrinter.writeBytes(bytes1);
//           }
//           // bytes += await getTicketcrew(header);
//           //await BluetoothThermalPrinter.writeBytes(bytes);
//         }
//       case Receipttype.Both:
//         {
//           List<tmatatu.Trans> listcopy = header.transtions!;
//           List<tmatatu.Trans> mtr = listcopy
//               .where((element) =>
//                   element.Type != "SAVINGSCREW" && element.Type != "SAVINGS")
//               .toList();
//           if (mtr.isNotEmpty) {
//             Header h = header.copyWith();

//             h.transtions = mtr;
//             h.Total_Amount = mtr.fold<double>(
//                 0.0,
//                 (double currentSum, tmatatu.Trans item) =>
//                     currentSum + num.tryParse(item.Amount.toString())!);
//             bytes += await getTicket(h);
//             // await BluetoothThermalPrinter.writeBytes(bytes);
//           }
//           listcopy = header.transtions!;
//           List<tmatatu.Trans> mtrc = listcopy
//               .where((element) =>
//                   element.Type == "SAVINGSCREW" || element.Type == "SAVINGS")
//               .toList();
//           for (var element in mtrc) {
//             Header h = header.copyWith();
//             if (element.Type == "SAVINGSCREW") h.Account = element.Account_No;
//             h.transtions = [element];
//             h.Total_Amount = element.Amount;
//             bytes += await getTicketcrew(h);
//             //await BluetoothThermalPrinter.writeBytes(bytes);
//             // List<int> bytes1 = await seperator();
//             // await BluetoothThermalPrinter.writeBytes(bytes1);
//           }
//           if (mtrc.isNotEmpty) {}
//         }
//     }
//     return Future.value(bytes);
//   }

//   Future<List<int>> getTicket(Header header) async {
//     List<int> bytes = [];
//     CapabilityProfile profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm58, profile);

//     bytes += generator.text(
//       "Citi hopper Ltd",
//       styles: const PosStyles(
//         align: PosAlign.center,
//         height: PosTextSize.size2,
//         width: PosTextSize.size2,
//       ),
//     );
//     bytes += generator.text(
//       "Chambia House, Ngara P.O Box 74925-00200",
//       styles:
//           const PosStyles(align: PosAlign.center, fontType: PosFontType.fontB),
//     );
//     bytes += generator.text(
//       "Nairobi,",
//       styles: const PosStyles(
//         align: PosAlign.center,
//       ),
//     );
//     bytes += generator.text(
//       "Telephone: 312058/9 Fax: 312057",
//       styles: const PosStyles(
//         align: PosAlign.center,
//       ),
//     );
//     bytes += generator.text("Email: info@citihoppa.co.ke",
//         styles: const PosStyles(
//           align: PosAlign.center,
//         ),
//         linesAfter: 1);
//     bytes += generator.text("Cash Collection Receipt",
//         styles: const PosStyles(
//             align: PosAlign.center, bold: true, fontType: PosFontType.fontA));

//     bytes += generator.hr();
//     bytes += generator.row([
//       PosColumn(
//           text: 'Rec. No:',
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: header.Receipt_No.toString(),
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Member No:',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: header.Account.toString(),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Vehicle:',
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: '${header.Vehicle} - ${header.Fleet}',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Date',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: formattedDate2.format(header.Date!),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     bytes += generator.row([
//       PosColumn(
//           text: 'Time',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: formattedTime.format(DateTime.fromMicrosecondsSinceEpoch(
//               int.tryParse(header.Receipt_No.toString())!)),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     bytes += generator.hr();
//     bytes += generator.row([
//       PosColumn(
//           text: 'Description',
//           width: 9,
//           styles: const PosStyles(align: PosAlign.left, bold: true)),
//       PosColumn(
//           text: 'Amount',
//           width: 3,
//           styles: const PosStyles(align: PosAlign.right, bold: true)),
//     ]);
//     bytes += generator.hr();
//     if (header.transtions != null) {
//       for (var type in header.transtions!.toList()) {
//         bytes += generator.row([
//           PosColumn(
//               text: type.Description.toString(),
//               width: 8,
//               styles: const PosStyles(
//                 align: PosAlign.left,
//               )),
//           PosColumn(
//               text: NumberFormat("#,##0.00", "en_US").format(type.Amount),
//               width: 4,
//               styles: const PosStyles(
//                 align: PosAlign.right,
//               )),
//         ]);
//       }
//     }

//     bytes += generator.hr();

//     bytes += generator.row([
//       PosColumn(
//           text: 'TOTAL',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//             bold: true,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//           )),
//       PosColumn(
//           text: NumberFormat("#,##0.00", "en_US").format(header.Total_Amount),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//             bold: true,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//           )),
//     ]);

//     bytes += generator.hr(ch: '=', linesAfter: 1);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Served by',
//           width: 6,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: Get.find<MainController>().agent.value.Name.toString(),
//           width: 6,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     // ticket.feed(2);

//     bytes += generator.cut();
//     return bytes;
//   }

//   Future<List<int>> getTicketcrew(Header header) async {
//     List<int> bytes = [];
//     CapabilityProfile profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm58, profile);

//     bytes += generator.text(
//       "Citi Travel Savings & Credit",
//       styles: const PosStyles(
//         align: PosAlign.center,
//         height: PosTextSize.size1,
//         width: PosTextSize.size1,
//       ),
//     );
//     bytes += generator.text(
//       "Co-operative Society Ltd",
//       styles: const PosStyles(
//         align: PosAlign.center,
//         height: PosTextSize.size1,
//         width: PosTextSize.size1,
//       ),
//     );
//     bytes += generator.text(
//       "Chambia House, Ngara P.O Box 74925-00200",
//       styles:
//           const PosStyles(align: PosAlign.center, fontType: PosFontType.fontB),
//     );
//     bytes += generator.text(
//       "Nairobi,",
//       styles: const PosStyles(
//         align: PosAlign.center,
//       ),
//     );
//     bytes += generator.text(
//       "Telephone: 312058/9",
//       styles: const PosStyles(
//         align: PosAlign.center,
//       ),
//     );

//     bytes += generator.text("Cash Collection Receipt",
//         styles: const PosStyles(
//             align: PosAlign.center, bold: true, fontType: PosFontType.fontA));

//     bytes += generator.hr();
//     bytes += generator.row([
//       PosColumn(
//           text: 'Rec. No:',
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: header.Receipt_No.toString(),
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//           text: 'No:',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: header.Account.toString(),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Vehicle:',
//           width: 6,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: '${header.Vehicle} - ${header.Fleet}',
//           width: 6,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Date',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: formattedDate2.format(header.Date!),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     bytes += generator.row([
//       PosColumn(
//           text: 'Time',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: formattedTime.format(DateTime.fromMicrosecondsSinceEpoch(
//               int.tryParse(header.Receipt_No.toString())!)),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     bytes += generator.hr();
//     bytes += generator.row([
//       PosColumn(
//           text: 'Description',
//           width: 9,
//           styles: const PosStyles(align: PosAlign.left, bold: true)),
//       PosColumn(
//           text: 'Amount',
//           width: 3,
//           styles: const PosStyles(align: PosAlign.right, bold: true)),
//     ]);
//     bytes += generator.hr();
//     if (header.transtions != null) {
//       for (var type in header.transtions!.toList()) {
//         bytes += generator.row([
//           PosColumn(
//               text: type.Description.toString(),
//               width: 8,
//               styles: const PosStyles(
//                 align: PosAlign.left,
//               )),
//           PosColumn(
//               text: NumberFormat("#,##0.00", "en_US").format(type.Amount),
//               width: 4,
//               styles: const PosStyles(
//                 align: PosAlign.right,
//               )),
//         ]);
//       }
//     }

//     bytes += generator.hr();

//     bytes += generator.row([
//       PosColumn(
//           text: 'TOTAL',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//             bold: true,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//           )),
//       PosColumn(
//           text: NumberFormat("#,##0.00", "en_US").format(header.Total_Amount),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//             bold: true,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//           )),
//     ]);

//     bytes += generator.hr(ch: '=', linesAfter: 1);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Served by',
//           width: 6,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: Get.find<MainController>().agent.value.Name.toString(),
//           width: 6,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     // ticket.feed(2);

//     bytes += generator.cut();
//     return bytes;
//   }

//   @override
//   Future<List<int>> getZreport(Tsummary summary) async {
//     List<int> bytes = [];
//     CapabilityProfile profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm58, profile);

//     bytes += generator.text(
//       "Citi hopper Ltd",
//       styles: const PosStyles(
//         align: PosAlign.center,
//         height: PosTextSize.size2,
//         width: PosTextSize.size2,
//       ),
//     );
//     bytes += generator.text(
//       "Chambia House, Ngara P.O Box 74925-00200",
//       styles:
//           const PosStyles(align: PosAlign.center, fontType: PosFontType.fontB),
//     );
//     bytes += generator.text(
//       "Nairobi,",
//       styles: const PosStyles(
//         align: PosAlign.center,
//       ),
//     );
//     bytes += generator.text(
//       "Telephone: 312058/9 Fax: 312057",
//       styles: const PosStyles(
//         align: PosAlign.center,
//       ),
//     );
//     bytes += generator.text("Email: info@citihoppa.co.ke",
//         styles: const PosStyles(
//           align: PosAlign.center,
//         ),
//         linesAfter: 1);
//     bytes += generator.text("ZReport",
//         styles: const PosStyles(
//             align: PosAlign.center, bold: true, fontType: PosFontType.fontA));

//     bytes += generator.hr();
//     bytes += generator.row([
//       PosColumn(
//           text: 'Date:',
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: formattedDate2.format(summary.Date!),
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     bytes += generator.row([
//       PosColumn(
//           text: 'Agent:',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: summary.Agent!,
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     bytes += generator.hr();
//     if (summary.trans != null) {
//       for (var type in summary.trans!.toList()) {
//         bytes += generator.row([
//           PosColumn(
//               text: type.Description.toString(),
//               width: 8,
//               styles: const PosStyles(
//                 align: PosAlign.left,
//               )),
//           PosColumn(
//               text: NumberFormat("#,##0.00", "en_US").format(type.Total),
//               width: 4,
//               styles: const PosStyles(
//                 align: PosAlign.right,
//               )),
//         ]);
//       }
//     }

//     bytes += generator.hr();

//     bytes += generator.row([
//       PosColumn(
//           text: 'TOTAL',
//           width: 8,
//           styles: const PosStyles(
//             align: PosAlign.left,
//             bold: true,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//           )),
//       PosColumn(
//           text: NumberFormat("#,##0.00", "en_US").format(summary.Total),
//           width: 4,
//           styles: const PosStyles(
//             align: PosAlign.right,
//             bold: true,
//             height: PosTextSize.size1,
//             width: PosTextSize.size1,
//           )),
//     ]);

//     bytes += generator.hr(ch: '=', linesAfter: 1);

//     bytes += generator.row([
//       PosColumn(
//           text: 'Printed by',
//           width: 5,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: Get.find<MainController>().agent.value.Name.toString(),
//           width: 7,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     bytes += generator.row([
//       PosColumn(
//           text: 'Time Printed',
//           width: 5,
//           styles: const PosStyles(
//             align: PosAlign.left,
//           )),
//       PosColumn(
//           text: formattedTime.format(DateTime.now()),
//           width: 7,
//           styles: const PosStyles(
//             align: PosAlign.right,
//           )),
//     ]);
//     // ticket.feed(2);

//     bytes += generator.cut();
//     return bytes;
//   }

//   @override
//   String v_description(Header header) {
//     return '${header.Vehicle ?? ''}- ${header.Fleet}';
//   }

//   @override
//   GroupBox? clientMenu() {
//     return GroupBox("", [
//       ListTile(
//         leading: const Icon(Icons.receipt),
//         onTap: () {
//           ReportController().gettransbydate(DateTime.now());
//           Get.find<ReportController>().selectedDate?.value = DateTime.now();
//           DepotFuel().getNRODefects();
//           DepotFuel().getdata(Get.find<ReportController>().selectedDate!.value);

//           Get.to(() => const Depot());
//         },
//         title: const Text("Dispatch"),
//       ),
//       ListTile(
//         leading: const Icon(Icons.summarize),
//         onTap: () {
//           Get.find<ReportController>().selectedDate?.value = DateTime.now();
//           DepotFuel().getdata(Get.find<ReportController>().selectedDate!.value);

//           Get.to(() => const Fuel());
//         },
//         title: const Text("Fuel"),
//       ),
//     ]);
//   }
// }
