import 'dart:math';

import 'package:android_sms_reader/android_sms_reader.dart' as sms;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trimline_sms_reader/Apis.dart';
import 'package:trimline_sms_reader/Controller.dart';
import 'package:trimline_sms_reader/client/client.dart';
import 'package:trimline_sms_reader/t__results.dart';
import 'package:trimline_sms_reader/transaction.dart';

class kiriigiti extends SmsClients {
  @override
  Future<void> getsms() async {
    // Check permissions using the SMS Reader package
    final granted = await sms.AndroidSMSReader.requestPermissions();
    if (!granted) {
      print('SMS permissions not granted');
      return;
    }

    // Use the SMS Reader package to fetch messages
    List<sms.AndroidSMSMessage> messages = [];
    try {
      messages = await sms.AndroidSMSReader.fetchMessages(
        type: sms.AndroidSMSType.inbox,
        start: 0,
        count: 500,
        query: 'CoopBank',
      );
    } on PlatformException catch (pe) {
      print('PlatformException when fetching SMS: ${pe.code} - ${pe.message}');
      return;
    } catch (e, st) {
      print('Unexpected error while fetching SMS: $e');
      print(st.toString());
      return;
    }

    if (messages.isNotEmpty) {
      print('Found ${messages.length} messages from CoopBank');
      messages = messages.where((element) {
        final body = element.body;
        print(
            'Checking message: ${body.substring(0, min(50, body.length))}...');
        // Changed from startsWith to contains to be more lenient with message format
        final isMatch = body.contains('Dear PCEA KIRIGITI CHURCH') ||
            body.contains('Dear PCEA T/A PCEA KIRIGITI CHURCH');
        if (isMatch) {
          print('Found matching message: $body');
        }
        return isMatch;
      }).toList();
      print(
          'After filtering: ${messages.length} messages match the church criteria');
    } else {
      print('No messages found from CoopBank');
    }

    await gettrans(messages);
  }

  // Pure parsing function that attempts to parse a MPESA SMS into a transaction
  transaction? parseMpesaSms(String? body) {
    if (body == null || body.trim().isEmpty) return null;

    try {
      final amountRe = RegExp(r'Ksh\.?\s*([0-9,\.]+)', caseSensitive: false);
      final fromRe = RegExp(r'from\s+(.+?)\s+for\s', caseSensitive: false);
      final forRe = RegExp(r'for\s+(.+?)\s+on\s', caseSensitive: false);
      final dateTimeRe = RegExp(
          r'on\s+([0-9]{1,2}[\/\-][0-9]{1,2}[\/\-][0-9]{2,4})\s+at\s+([0-9]{1,2}:[0-9]{2}:[0-9]{2})',
          caseSensitive: false);
      final refRe =
          RegExp(r'MPESA\s+Ref\.?\s*([A-Za-z0-9]+)', caseSensitive: false);

      final amountMatch = amountRe.firstMatch(body);
      final fromMatch = fromRe.firstMatch(body);
      final forMatch = forRe.firstMatch(body);
      final dateTimeMatch = dateTimeRe.firstMatch(body);
      final refMatch = refRe.firstMatch(body);

      if (amountMatch == null ||
          fromMatch == null ||
          forMatch == null ||
          dateTimeMatch == null ||
          refMatch == null) {
        return null; // required fields missing
      }

      String rawAmount = amountMatch.group(1)!.replaceAll(',', '');
      final amount = double.tryParse(rawAmount);
      if (amount == null) return null;

      final name = fromMatch.group(1)!.trim();
      final account = forMatch.group(1)!.trim();
      final dateRaw = dateTimeMatch.group(1)!;
      final timeRaw = dateTimeMatch.group(2)!;
      final ref = refMatch.group(1)!.trim();

      // Parse date components (assumes dd/mm/yyyy)
      final parts = dateRaw.split(RegExp(r'[\/\-]'));
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2].length == 2 ? '20${parts[2]}' : parts[2]);

      final timeParts = timeRaw.split(':').map((s) => int.parse(s)).toList();
      final transactionDate = DateTime(year, month, day);
      final completionTime =
          DateTime(year, month, day, timeParts[0], timeParts[1], timeParts[2]);

      final t = transaction();
      t.Transtype = TransType.Receipts;
      t.Transaction_Date = transactionDate;
      t.Completion_Time = completionTime;
      t.A_C_No = account;
      t.Paid_In = amount;
      t.Name = name;
      t.Receipt_No = ref;
      t.Detaills = 'Paybill - ${t.Name} - Ref:${t.Receipt_No}';

      // detect source by greeting variants
      if (body.contains('Dear PCEA KIRIGITI CHURCH')) {
        t.Source = 'KIRIGITI';
      } else if (body.contains('Dear PCEA T/A KIRIGITI CHURCH')) {
        t.Source = 'KIRIGITI_TA';
      } else {
        t.Source = 'UNKNOWN';
      }

      return t;
    } catch (e) {
      // parsing failed
      return null;
    }
  }

  Future<void> gettrans(List<SmsMessage> mss) async {
    final controller = Get.find<SmsController>();
    for (var ms in mss) {
      try {
        final tr = parseMpesaSms(ms.body);
        if (tr == null) {
          // couldn't parse; skip
          continue;
        }

        // dedupe by receipt and source — allow same receipt from different sources
        final exist = controller.messages.firstWhereOrNull((element) =>
            element.Receipt_No == tr.Receipt_No && element.Source == tr.Source);
        if (exist == null) {
          controller.messages.add(tr);
        }

        final resp =
            await ApiClient().postdata("mpesa", tr.toJson(), 'kirigiti');
        if (resp.statusCode == 200) {
          final results = t_Results.fromJson(resp.body);
          if (results.Code == 0) {
            final updated = results.Contents;
            if (updated != null) {
              updated.Sent = true;
              updated.Detaills =
                  "Paybill - ${updated.Name} - Ref:${updated.Receipt_No} - ${updated.Purpose}";
              // update local record if you persist to DB
            }
          }
        }
      } catch (e, st) {
        // Log error with context
        // Using Get/print for now; replace with your logger
        print('Failed to parse/process SMS: ${e.toString()}');
        print(st.toString());
      }
    }
    controller.reading.value = false;
  }

  DateTime convert12To24Hour(String time12h) {
    final DateFormat format12Hour = DateFormat('hh:mm a');
    DateTime dateTime = format12Hour.parse(time12h);
    return dateTime;
  }
}
