import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:telephony/telephony.dart';
import 'package:trimline_sms_reader/Apis.dart';
import 'package:trimline_sms_reader/Controller.dart' hide SmsMessage;
import 'package:trimline_sms_reader/client/client.dart';
import 'package:trimline_sms_reader/t__results.dart';
import 'package:trimline_sms_reader/transaction.dart';

class Kcb extends SmsClients {
  final Telephony telephony = Telephony.instance;
  @override
  Future<void> getsms() async {
    List<SmsMessage> messages = await telephony.getInboxSms(
        filter: SmsFilter.where(SmsColumn.ADDRESS)
            .equals("KCB")
            //.equals("+254708344220")
            .and(SmsColumn.DATE)
            .greaterThan(
                DateTime(2024, 05, 27).millisecondsSinceEpoch.toString()),
        sortOrder: [
          OrderBy(SmsColumn.DATE, sort: Sort.DESC),
          OrderBy(SmsColumn.BODY)
        ]);
    // if (messages.isNotEmpty) {
    //   messages = messages
    //       .where(
    //           (element) => element.body!.contains('Dear PCEA KIRIGITI CHURCH'))
    //       .toList();
    // }
    //print(messages.length);
    gettrans(messages);
  }

  Future<void> gettrans(List<SmsMessage> mss) async {
    for (var ms in mss) {
      try {
        transaction? tr = transaction();
        tr.Transtype = TransType.Receipts;
        //SEA9T9FL41 completed. You have received KES 460 from JAMES NDIRANGU 254725403841 for account RUTH MUTHONI NJOGU 7742891 on 10/05/2024 at 05:14 PM. KCB Go Ahead.
        String? date = ms.body!
            .substring(ms.body!.indexOf(" on ") + 4, ms.body!.indexOf(" at "));
        int? year = int.tryParse(date.split(RegExp(r'[/\-]'))[2]);
        String? time = ms.body!
            .substring(ms.body!.indexOf(" at ") + 4, ms.body!.indexOf("M.") + 2)
            .replaceAll('.', '');
        tr.Transaction_Date = DateTime(
          year!,
          int.tryParse(date.split(RegExp(r'[/\-]'))[1])!,
          int.tryParse(date.split(RegExp(r'[/\-]'))[0])!,
        );
        DateTime tim = convert12To24Hour(time);
        tr.Completion_Time = DateTime(
            year,
            int.tryParse(date.split(RegExp(r'[/\-]'))[1])!,
            int.tryParse(date.split(RegExp(r'[/\-]'))[0])!,
            tim.hour,
            tim.minute,
            tim.second);
        // int.tryParse(time.split(':')[2])!);
        tr.A_C_No = ms.body!.substring(
            ms.body!.indexOf(" for account ") + 13, ms.body!.indexOf(" on "));
        tr.Paid_In = double.tryParse(ms.body!.substring(
            ms.body!.indexOf("KES ") + 4, ms.body!.indexOf(" from ")));
        tr.Name = ms.body!.substring(
            ms.body!.indexOf(" from ") + 6, ms.body!.indexOf(" for account"));
        tr.Receipt_No = ms.body!
            .substring(0, ms.body!.indexOf(" completed"))
            .replaceAll(".", "")
            .replaceAll("\n", "");
        //tr.Detaills = "Paybill - ${tr.Name} - Ref:${tr.Receipt_No}";
        if (tr.Name != null) {
          var s = tr.Name!.split(' ');
          tr.Phone = s[s.length - 1];
        }
        transaction? exist = Get.find<SmsController>()
            .messages
            .firstWhereOrNull(
                (element) => element.Receipt_No == tr?.Receipt_No);
        //db.insert(tr);
        if (exist == null) {
          //trr.add(tr);
          Get.find<SmsController>().messages.add(tr);
        }
        ApiClient().postdata("mpesa", tr.toJson(), 'Blazing').then((r) async {
          if (r.statusCode == 200) {
            t_Results results = t_Results.fromJson(r.body);
            if (results.Code == 0) {
              tr = results.Contents;
              tr!.Sent = true;
              tr!.Detaills =
                  "Paybill - ${tr!.Name} - Ref:${tr!.Receipt_No} - ${tr!.Purpose}";
              //db.update(tr!);
            }
          }
        });
      } catch (e) {
        e.printError();
      }
      //  messages.value.add(tr!);
    }
    Get.find<SmsController>().reading.value = false;
  }

  DateTime convert12To24Hour(String time12h) {
    final DateFormat format12Hour = DateFormat('hh:mm a');
    final DateFormat format24Hour = DateFormat('HH:mm');

    DateTime dateTime = format12Hour.parse(time12h);
    String time24h = format24Hour.format(dateTime);

    // You can return the DateTime object if you need to use it later.
    return dateTime;
  }
}
