
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:t_matatu/controllers/Members.dart';
import 'package:t_matatu/controllers/TypesController.dart';
import 'package:t_matatu/controllers/agent.dart';
import 'package:t_matatu/controllers/expenses.dart';
import 'package:t_matatu/controllers/header.dart';
import 'package:t_matatu/controllers/main.dart';
import 'package:t_matatu/controllers/trans.dart';
import 'package:t_matatu/controllers/vehicles/vehicles.dart';
import 'package:t_matatu/models/Header.dart';
import 'package:t_matatu/models/Hires.dart';
import 'package:t_matatu/models/Reversal.dart';
import 'package:t_matatu/models/Tamounts.dart';
import 'package:t_matatu/models/Transaction.dart' as tmatatu;
import 'package:t_matatu/models/accounttypes.dart';
import 'package:t_matatu/models/expences.dart';
import 'package:t_matatu/models/trantypes.dart';
import 'package:t_matatu/models/vehicles/DeportandFuel.dart';
import 'package:t_matatu/network/Apis.dart';
import 'package:t_matatu/network/results/results.dart';
import 'package:t_matatu/pages/widgets/bluetoothManager.dart';
import 'package:t_matatu/providers/colors.dart';
import 'package:t_matatu/providers/db.dart';
import 'package:t_matatu/reports/controller.dart';
import 'package:uuid/uuid.dart';
import 'package:t_matatu/providers/logger.dart';




@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {

}

Future<void> initializedata() async {
  //MainController().devices();
  MainController().getagents();
  MainController().getvehicles();
  MainController().getmembers();

  Expenses().download();
  TranTypes().getttypes();
  Tamounts().getttypesamounts();
  Account_Types().get_account_Types();
  //
  //Hires().getthires();
  // db_Provider().transactionprocess();
}

Future<void> upload() async {
  sendtrans();
  sendtransdetails();
}

Future<void> sendtrans() async {
  final app = await Get.find<db_Provider>()
      .getpendingheadertrans(Header.columns, Header.table);
  List<Header> up = app.map((row) {
    return Header.fromMap_d2(row);
  }).toList();
  for (var element in up) {
    try {
      await ApiClient()
          .postdata("transheader", element.toJson())
          .then((r) async {
        if (r.statusCode == 200) {
          Results2<Header> results =
              Results2<Header>.fromJson(r.body, Header.fromMap);
          if (results.Code == 0) {
            if (results.Contents != null) {
              final h = results.Contents;
              if (h?.Key != null) {
                h!.sent = true;
                Get.find<db_Provider>().insert(Header.table, h);
              }
            }
          }
        }
      });
    } catch (e) {
      e.printError();
    }
  }
}

Future<void> sendtransdetails() async {
  final appd = await Get.find<db_Provider>()
      .getpendingtrans(tmatatu.Trans.columns, tmatatu.Trans.tabletrans);
  List<tmatatu.Trans> upd = appd.map((row) {
    return tmatatu.Trans.fromMap_d(row);
  }).toList();
  for (var element in upd) {
    try {
      await ApiClient()
          .postdata("transactions", element.toJson())
          .then((r) async {
        if (r.statusCode == 200) {
          Results2<tmatatu.Trans> results =
              Results2<tmatatu.Trans>.fromJson(r.body, tmatatu.Trans.fromMap);
          if (results.Code == 0) {
            if (results.Contents != null) {
              final h = results.Contents;
              if (h?.Key != null) {
                h!.sent = true;
                Get.find<db_Provider>().insert(tmatatu.Trans.tabletrans, h);
              }
            }
          }
        }
      });
    } catch (e) {
      e.printError();
    }
  }
}

Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {
    print('Selected time: ${pickedTime.format(context)}');
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.accentColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<void> init() async {
 Get.put(MainController(),permanent: true);  
 Get.put(LoggerService(),permanent: true);
  Get.put(DepotController(), permanent: true);
  Get.put(HeaderController(),permanent: true);
  Get.put(db_Provider(),permanent: true);
 
  Get.put(ReversalController(),permanent: true);
  Get.put(AgentController(),permanent: true);
  Get.put(VehiclesController(),permanent: true);
  //Get.lazyPut(() => DepotController());
  Get.put(ExpenseController(),permanent: true);
  Get.put(TransTypeController(),permanent: true);
  Get.put(ReportController(),permanent: true);
  Get.put(TransController(),permanent: true);
  Get.put(MemberController(),permanent: true);
  Get.put(BluetoothManager(),permanent: true);
  Get.put(HiresController(),permanent: true);
  BluetoothManager().Scan();
  BluetoothManager().Subscriptionstatus();
  //Get.put(Bluetooth(),permanent: true);
  // Get.find<ExpenseController>().onInit();
  //Get.find<TransTypeController>().onInit();
}
Future<String> generateCustomCode() async {
  var uuid = Uuid().v4();
  var bytes = utf8.encode(uuid);
  return sha1.convert(bytes).toString().substring(0, 20);
}