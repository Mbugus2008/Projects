// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'package:android_sms_reader/android_sms_reader.dart' as sms;
import 'package:get/get.dart';
import 'package:trimline_sms_reader/Apis.dart';
import 'package:trimline_sms_reader/Dimensions.dart';
import 'package:trimline_sms_reader/vouchers.dart';

import 't__results.dart';
import 'trans_provider.dart';
import 'transaction.dart';

// SMS Message type from android_sms_reader package
typedef SmsMessage = sms.AndroidSMSMessage;

class SmsController extends GetxController {
  RxList<transaction> messages = <transaction>[].obs;
  RxList<Vouchers> vouchers = <Vouchers>[].obs;
  RxList<Dimensions> dimensions = <Dimensions>[].obs;
  RxBool reading = false.obs;
  final db = transProvider();
  SmsController() {
    opendb();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    final granted = await sms.AndroidSMSReader.requestPermissions();
    if (!granted) {
      print('SMS permissions not granted');
    }
  }

  Future<void> opendb() async {
    await db.open("Kanisa.db");
  }

  Future<void> getsms() async {
    final messages = await sms.AndroidSMSReader.fetchMessages(
      type: sms.AndroidSMSType.inbox,
      start: 0,
      count: 500, // Adjust based on your needs
      query: 'CoopBank', // This will filter messages from CoopBank
    );

    if (messages.isNotEmpty) {
      final filteredMessages = messages
          .where((msg) => msg.body.contains('Dear PCEA KIRIGITI CHURCH'))
          .toList();
      gettrans(filteredMessages);
    }
  }

  Future<void> getsmsequity() async {
    final messages = await sms.AndroidSMSReader.fetchMessages(
      type: sms.AndroidSMSType.inbox,
      start: 0,
      count: 500, // Adjust based on your needs
      query: 'Equity Bank', // This will filter messages from Equity Bank
    );
    if (messages.isNotEmpty) {
      final filteredMessages =
          messages.where((msg) => msg.body.contains('CONFIRMED')).toList();
      gettransequity(filteredMessages);
    }
  }

  Future<void> getsmsequity2() async {
    final messages = await sms.AndroidSMSReader.fetchMessages(
      type: sms.AndroidSMSType.inbox,
      start: 0,
      count: 500, // Adjust based on your needs
      query: 'Equity Bank', // This will filter messages from Equity Bank
    );

    if (messages.isNotEmpty) {
      final filteredMessages = messages
          .where((msg) => msg.body.contains('Your transaction'))
          .toList();
      gettransequity(filteredMessages);
    }
  }

  Future<void> getsavedtrans() async {
    Get.find<SmsController>().reading.value = true;

    List<transaction>? t = await db.getalltrans();
    if (t != null) {
      t.sort((a, b) =>
          b.Completion_Time!.compareTo(a.Completion_Time as DateTime));
      messages.value = t;
    }
    getsmsequity();
    getsmsequity2();
    getsms();
  }

  Future<void> delete(transaction t, int index) async {
    await db.delete(t.Receipt_No.toString());
    messages
        .removeAt(index); //(element) => element.Receipt_No == t.Receipt_No);
  }

  Future<void> gettransequity(List<SmsMessage> mss) async {
    for (var ms in mss) {
      try {
        String? recno;
        if (ms.body.startsWith("CONFIRMED")) {
          recno = ms.body
              .substring(ms.body.indexOf("Ref. ") + 5, ms.body.indexOf(" on "))
              .replaceAll(".", "")
              .replaceAll("\n", "");
        } else {
          recno = ms.body
              .substring(
                  ms.body.indexOf("Ref. ") + 5, ms.body.indexOf(". MPESA Ref"))
              .replaceAll(".", "")
              .replaceAll(" ", "");
        }
        transaction? tr = Get.find<SmsController>()
                .messages
                .firstWhereOrNull((element) => element.Receipt_No == recno) ??
            transaction();
        tr.Transtype = TransType.Payments;
        //Paybill Offering - Collins Mwangi  - Ref:RHK2KTV7QE.. - Undefined
        //CONFIRMED KSh 1000.00 sent to MPesa account 254721311134. Transaction charge Kshs 14.20. Sms charge Kshs 2.26. Ref. 740684363416 on 23/10/23 at 18:24:23.
        //Send money to Equity via Lipa na Mpesa Paybill 247247
        //Your transaction of Kshs. 3000.0  has been credited to  0746460841  FRANCIS MBOGO JOHN. Ref.  590468370836. MPESA Ref.  RJN5A8R7TJ.

        if (ms.body.startsWith("CONFIRMED")) {
          String? date = ms.body
              .substring(ms.body.indexOf(" on ") + 4, ms.body.indexOf(" at "));
          String y = '${20}${date.split(RegExp(r'[/\-]'))[2]}';

          int? year = int.tryParse(y);
          int startindex = ms.body.indexOf(" at ") + 4;

          String? time =
              ms.body.substring(startindex, startindex + 8).replaceAll('.', '');
          tr.Transaction_Date = DateTime(
            year!,
            int.tryParse(date.split(RegExp(r'[/\-]'))[1])!,
            int.tryParse(date.split(RegExp(r'[/\-]'))[0])!,
          );
          tr.Completion_Time = DateTime(
              year,
              int.tryParse(date.split(RegExp(r'[/\-]'))[1])!,
              int.tryParse(date.split(RegExp(r'[/\-]'))[0])!,
              int.tryParse(time.split(':')[0])!,
              int.tryParse(time.split(':')[1])!,
              int.tryParse(time.split(':')[2])!);
          tr.Receipt_No = ms.body
              .substring(ms.body.indexOf("Ref. ") + 5, ms.body.indexOf(" on "))
              .replaceAll(".", "")
              .replaceAll("\n", "");
          tr.Phone = ms.body.substring(ms.body.indexOf("account ") + 8,
              ms.body.indexOf(". Transaction "));
          tr.Withdrawn = double.tryParse(ms.body.substring(
              ms.body.indexOf("KSh ") + 4, ms.body.indexOf(" sent ")));
          try {
            String? charge1 = ms.body.substring(
                ms.body.indexOf("Transaction charge Kshs ") + 24,
                ms.body.indexOf(". Sms charge "));
            String? charge2 = ms.body.substring(
                ms.body.indexOf("Sms charge Kshs ") + 16,
                ms.body.indexOf(". Ref."));
            double? c1 = double.tryParse(charge1);
            double? c2 = double.tryParse(charge2);

            if (c1 != null && c2 != null) {
              tr.Charge = c1 + c2;
            }
          } catch (e) {
            print('Error parsing charges from message: ${e.toString()}');
          }
        }
        if (ms.body.startsWith("Your transaction of ")) {
          tr.Receipt_No = ms.body
              .substring(
                  ms.body.indexOf("Ref. ") + 5, ms.body.indexOf(". MPESA Ref"))
              .replaceAll(".", "")
              .replaceAll(" ", "");
          tr.Name = ms.body.substring(
              ms.body.indexOf("credited to ") + 12, ms.body.indexOf(". Ref"));

          tr.Detaills = "Paybill - ${tr.Name} - Ref:${tr.Receipt_No}";
          tr.Reference = ms.body.substring(
              ms.body.indexOf("MPESA Ref.") + 12, ms.body.indexOf(" on "));
        }
        transaction? exist = Get.find<SmsController>()
            .messages
            .firstWhereOrNull(
                (element) => element.Receipt_No == tr?.Receipt_No);
        //db.insert(tr);
        if (exist == null) {
          //trr.add(tr);
          Get.find<SmsController>().messages.add(tr);
          update();
        }
        ApiClient()
            .postdata("payments", tr.toJson(), 'kirigiti')
            .then((r) async {
          if (r.statusCode == 200) {
            t_Results results = t_Results.fromJson(r.body);
            if (results.Code == 0 && results.Contents != null) {
              final updatedTr = results.Contents;
              if (updatedTr != null) {
                updatedTr.Sent = true;
                updatedTr.Detaills =
                    "Paybill - ${updatedTr.Name ?? ''} - Ref:${updatedTr.Receipt_No ?? ''} - ${updatedTr.Purpose ?? ''}";
                tr = updatedTr;
                //db.update(tr);
              }
            }
          }
        });
      } catch (e) {
        print(ms.body);
        e.printError();
      }
      //  messages.value.add(tr!);
    }
  }

  Future<void> gettrans(List<SmsMessage> mss) async {
    for (var ms in mss) {
      // try{
      transaction? tr = transaction();
      tr.Transtype = TransType.Receipts;
      //Paybill Offering - Collins Mwangi  - Ref:RHK2KTV7QE.. - Undefined

      //Dear PCEA KIRIGITI CHURCH, you have received Ksh. 10905.0 from ISAAC MUNGA KABUTHU for 1767371#JPRC Refund on 05/06/2023 at 07:35:28. MPESA Ref. RE65U10Z31..
      String? date;
      int? year;
      String? time;

      try {
        date = ms.body
            .substring(ms.body.indexOf(" on ") + 4, ms.body.indexOf(" at "));
        year = int.tryParse(date.split(RegExp(r'[/\-]'))[2]);
        time = ms.body
            .substring(ms.body.indexOf(" at ") + 4, ms.body.indexOf("Ref.") - 7)
            .replaceAll('.', '');
      } catch (e) {
        print('Error parsing date/time from message: ${e.toString()}');
        return; // Skip this message if date parsing fails
      }
      tr.Transaction_Date = DateTime(
        year!,
        int.tryParse(date.split(RegExp(r'[/\-]'))[0])!,
        int.tryParse(date.split(RegExp(r'[/\-]'))[1])!,
      );
      tr.Completion_Time = DateTime(
          year,
          int.tryParse(date.split(RegExp(r'[/\-]'))[0])!,
          int.tryParse(date.split(RegExp(r'[/\-]'))[1])!,
          int.tryParse(time.split(':')[0])!,
          int.tryParse(time.split(':')[1])!,
          int.tryParse(time.split(':')[2])!);
      tr.A_C_No = ms.body
          .substring(ms.body.indexOf(" for ") + 5, ms.body.indexOf(" on "));
      tr.Paid_In = double.tryParse(ms.body
          .substring(ms.body.indexOf("Ksh. ") + 5, ms.body.indexOf(" from ")));
      tr.Name = ms.body
          .substring(ms.body.indexOf(" from ") + 6, ms.body.indexOf(" for "));
      tr.Receipt_No = ms.body
          .substring(ms.body.indexOf("MPESA Ref. ") + 11)
          .replaceAll(".", "")
          .replaceAll("\n", "");
      tr.Detaills = "Paybill - ${tr.Name} - Ref:${tr.Receipt_No}";

      transaction? exist = Get.find<SmsController>()
          .messages
          .firstWhereOrNull((element) => element.Receipt_No == tr?.Receipt_No);
      //db.insert(tr);
      if (exist == null) {
        //trr.add(tr);
        Get.find<SmsController>().messages.add(tr);
        update();
      }
      ApiClient().postdata("mpesa", tr.toJson(), 'kirigiti').then((r) async {
        if (r.statusCode == 200) {
          t_Results results = t_Results.fromJson(r.body);
          if (results.Code == 0 && results.Contents != null) {
            final updatedTr = results.Contents;
            if (updatedTr != null) {
              updatedTr.Sent = true;
              updatedTr.Detaills =
                  "Paybill - ${updatedTr.Name ?? ''} - Ref:${updatedTr.Receipt_No ?? ''} - ${updatedTr.Purpose ?? ''}";
              tr = updatedTr;
              //db.update(tr);
            }
          }
        }
      });

      // }
      // catch(e)
      // {
      //   print(e.)
      // }
      //  messages.value.add(tr!);
    }
    Get.find<SmsController>().reading.value = false;
  }
}

const String tabletransactions = 'transactions';
const String columnId_id = "id";
const String columnId_Receipt_No = "Receipt_No";
const String columnId_Completion_Time = "Completion_Time";
const String columnId_Detaills = "Detaills";
const String columnId_Status = "Status";
const String columnId_Withdrawn = "Withdrawn";
const String columnId_Paid_In = "Paid_In";
const String columnId_Other_Party_Info = "Other_Party_Info";
const String columnId_A_C_No_ = "A_C_No_";
const String columnId_Phone = "Phone";
const String columnId_Name = "Name";
const String columnId_Transaction_Date = "Transaction_Date";
const String columnId_Sent = "Sent";
const String columnId_Comments = "Comments";
const String columnId_Purpose = "Purpose";
const String columnId_District = "District";
const String columnId_Charge = "Charge";
const String columnId_Reference = "Reference";
const String columnId_Transtype = "Transtype";
