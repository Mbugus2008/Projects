import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_matatu/controllers/main.dart';
import 'package:t_matatu/models/Header.dart';
import 'package:t_matatu/models/Utils/util.dart';
import 'package:t_matatu/models/summary/Tsummary.dart';
import 'package:t_matatu/pages/widgets/Groupbox.dart';
import 'package:t_matatu/pages/widgets/dayreceipts.dart';
import 'package:t_matatu/providers/client.dart';
import 'package:t_matatu/reports/controller.dart';
import 'package:t_matatu/reports/receipts.dart';

import '../../models/summary/TsummaryDetails.dart';
import '../../reports/Daily Summary.dart';

class EmbaShuttle implements BaseClients {
  @override
  Future<void> init() async {}
  @override
  Widget homelist() {
    return Daysreport();
  }

  @override
  String v_description(Header header) {
    return '${header.Vehicle ?? ''}';
  }

  @override
  bool? Auto_Assign = false;

  @override
  Future<List<int>> printReceipt(Header header) async {
    List<int> bytes = [];

    bytes = await getHeader() + await getTicket(header);

    return Future.value(bytes);
  }

  Future<List<int>> getHeader() async {
    List<int> bytes = [];
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    bytes += generator.text(
      "Embakasi Shuttle",
      styles: const PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size1,
      ),
    );

    bytes += generator.text(
      "Faulu Biulding, Edhan Hse",
      styles:
          const PosStyles(align: PosAlign.center, fontType: PosFontType.fontB),
    );
    bytes += generator.text(
      "2rd floor, Outering road",
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );
    bytes += generator.text(
      "P.O Box 6800-00300, Nairobi",
      styles: const PosStyles(
        align: PosAlign.center,
      ),
    );

    bytes += generator.text("Tel: 0713020712",
        styles: const PosStyles(
          align: PosAlign.center,
        ),
        linesAfter: 1);
    return bytes;
  }

  Future<List<int>> getTicket(Header header) async {
    List<int> bytes = [];
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    bytes += generator.text("Cash Collection Receipt",
        styles: const PosStyles(
            align: PosAlign.center, bold: true, fontType: PosFontType.fontA));

    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
          text: 'Rec. No:',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: header.Receipt_No.toString(),
          width: 4,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);

    bytes += generator.row([
      PosColumn(
          text: 'Member No:',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: header.Account.toString(),
          width: 4,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);

    bytes += generator.row([
      PosColumn(
          text: 'Vehicle:',
          width: 4,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: '${header.Vehicle}',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);

    bytes += generator.row([
      PosColumn(
          text: 'Date',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: formattedDate2.format(header.Date!),
          width: 4,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);
    bytes += generator.row([
      PosColumn(
          text: 'Time',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: formattedTime.format(DateTime.fromMicrosecondsSinceEpoch(
              int.tryParse(header.Receipt_No.toString())!)),
          width: 4,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
          text: 'Description',
          width: 9,
          styles: const PosStyles(align: PosAlign.left, bold: true)),
      PosColumn(
          text: 'Amount',
          width: 3,
          styles: const PosStyles(align: PosAlign.right, bold: true)),
    ]);
    bytes += generator.hr();
    if (header.transtions != null) {
      for (var type in header.transtions!.toList()) {
        bytes += generator.row([
          PosColumn(
              text: type.Description.toString(),
              width: 8,
              styles: const PosStyles(
                align: PosAlign.left,
              )),
          PosColumn(
              text: NumberFormat("#,##0.00", "en_US").format(type.Amount),
              width: 4,
              styles: const PosStyles(
                align: PosAlign.right,
              )),
        ]);
      }
    }

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
          text: 'TOTAL',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.left,
            bold: true,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          )),
      PosColumn(
          text: NumberFormat("#,##0.00", "en_US").format(header.Total_Amount),
          width: 4,
          styles: const PosStyles(
            align: PosAlign.right,
            bold: true,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          )),
    ]);

    bytes += generator.hr(ch: '=', linesAfter: 1);

    bytes += generator.row([
      PosColumn(
          text: 'Served by',
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: Get.find<MainController>().agent.value.Name.toString(),
          width: 6,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);
    // ticket.feed(2);

    bytes += generator.cut();
    return bytes;
  }

  @override
  Future<List<int>> getZreport(Tsummary summary) async {
    // TODO: implement getZreport
    List<int> bytes = [];
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    bytes += await getHeader();

    bytes += generator.text("ZReport",
        styles: const PosStyles(
            align: PosAlign.center, bold: true, fontType: PosFontType.fontA));

    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
          text: 'Date:',
          width: 4,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: formattedDate2.format(summary.Date!),
          width: 8,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);
    bytes += generator.row([
      PosColumn(
          text: 'Agent:',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: summary.Agent!,
          width: 4,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);
    bytes += generator.hr();
    if (summary.trans != null) {
      for (var type in summary.trans!.toList()) {
        bytes += generator.row([
          PosColumn(
              text: type.Description.toString(),
              width: 8,
              styles: const PosStyles(
                align: PosAlign.left,
              )),
          PosColumn(
              text: NumberFormat("#,##0.00", "en_US").format(type.Total),
              width: 4,
              styles: const PosStyles(
                align: PosAlign.right,
              )),
        ]);
      }
    }

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
          text: 'TOTAL',
          width: 8,
          styles: const PosStyles(
            align: PosAlign.left,
            bold: true,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          )),
      PosColumn(
          text: NumberFormat("#,##0.00", "en_US").format(summary.Total),
          width: 4,
          styles: const PosStyles(
            align: PosAlign.right,
            bold: true,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          )),
    ]);

    bytes += generator.hr(ch: '=', linesAfter: 1);

    bytes += generator.row([
      PosColumn(
          text: 'Printed by',
          width: 5,
          styles: const PosStyles(
            align: PosAlign.left,
          )),
      PosColumn(
          text: Get.find<MainController>().agent.value.Name.toString(),
          width: 7,
          styles: const PosStyles(
            align: PosAlign.right,
          )),
    ]);
    // ticket.feed(2);

    bytes += generator.cut();
    return bytes;
  }

  @override
  GroupBox? clientMenu() {
    return null;
  }
  


   @override
  String? clientName = 'Embakasi Shuttle';
}
