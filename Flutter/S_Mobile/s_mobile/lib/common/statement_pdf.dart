import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/controller.dart';
import 'package:s_mobile/members/entries.dart';

/// Builds a PDF statement from ledger entries and opens the share sheet
/// (save to file / send). Client-side only — no backend calls.
class StatementPdf {
  static final DateFormat _df = DateFormat('dd/MM/yyyy');
  static final PdfColor _green = PdfColor.fromHex('#2E7D32');
  static final PdfColor _red = PdfColor.fromHex('#C62828');
  static final PdfColor _greyBorder = PdfColor.fromHex('#CCCCCC');
  static final PdfColor _greyText = PdfColor.fromHex('#757575');
  static final PdfColor _headerBg = PdfColor.fromHex('#E8F5E9');

  static Future<void> share({
    required String title,
    required List<entries> items,
    String? subtitle,
  }) async {
    final member = Get.find<MemberController>().currentCustomer.value;
    final fmt = utilities.formatcurrency;
    final doc = pw.Document();

    double credit = 0;
    double debit = 0;
    for (final e in items) {
      credit += e.Credit ?? 0;
      debit += e.Debit ?? 0;
    }

    final rows = items.map((e) {
      return pw.TableRow(children: [
        _cell(e.Posting_Date != null ? _df.format(e.Posting_Date!) : ''),
        _cell(e.Description ??
            e.Transaction_Type?.description ??
            e.Document_No ??
            ''),
        _cell((e.Debit ?? 0) > 0 ? fmt.format(e.Debit) : '', color: _red),
        _cell((e.Credit ?? 0) > 0 ? fmt.format(e.Credit) : '', color: _green),
        _cell(fmt.format(e.Balance ?? 0)),
      ]);
    }).toList();

    doc.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(28),
      build: (context) => [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('BARAKA YETU SACCO',
                      style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: _green)),
                  pw.SizedBox(height: 2),
                  pw.Text(title,
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold)),
                  if (subtitle != null)
                    pw.Text(subtitle,
                        style: pw.TextStyle(fontSize: 10, color: _greyText)),
                ]),
            pw.Text('Generated: ${_df.format(DateTime.now())}',
                style: pw.TextStyle(fontSize: 9, color: _greyText)),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Text('Member: ${member.Name ?? ''}  |  No: ${member.No ?? ''}',
            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 10),
        pw.Table(
          border: pw.TableBorder.all(color: _greyBorder, width: 0.5),
          columnWidths: const {
            0: pw.FlexColumnWidth(1.3),
            1: pw.FlexColumnWidth(3.4),
            2: pw.FlexColumnWidth(1.1),
            3: pw.FlexColumnWidth(1.1),
            4: pw.FlexColumnWidth(1.2),
          },
          children: [
            pw.TableRow(
              decoration: pw.BoxDecoration(color: _headerBg),
              children: [
                _cell('Date', bold: true),
                _cell('Description', bold: true),
                _cell('Debit', bold: true),
                _cell('Credit', bold: true),
                _cell('Balance', bold: true),
              ],
            ),
            ...rows,
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
              'Total Debit: ${fmt.format(debit)}    Total Credit: ${fmt.format(credit)}',
              style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
        ),
        pw.SizedBox(height: 6),
        pw.Text(
            '${items.length} entries. This statement is computer generated.',
            style: pw.TextStyle(fontSize: 8, color: _greyText)),
      ],
    ));

    final bytes = await doc.save();
    await Printing.sharePdf(
        bytes: Uint8List.fromList(bytes),
        filename: 'statement_${DateTime.now().millisecondsSinceEpoch}.pdf');
  }

  static pw.Widget _cell(String text, {bool bold = false, PdfColor? color}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: pw.Text(text,
          style: pw.TextStyle(
              fontSize: 8.5,
              fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
              color: color)),
    );
  }
}
