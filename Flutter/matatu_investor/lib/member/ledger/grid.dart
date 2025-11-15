import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matatu/member/ledger/ledgers.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../Assets/utils.dart';

class ledgerDataSource extends DataGridSource {
  ledgerDataSource(List<ledgers> value, List<ledgers> l) {
    l.forEach((element) {
      print(element.toJson());
    });
    _ledger = l
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.Entry_No),
              DataGridCell<String>(
                  columnName: 'Date',
                  value: customFormat.format(e.Posting_Date!)),
              DataGridCell<String>(
                  columnName: 'Desc',
                  value: e.Description.toString().toLowerCase()),
              DataGridCell<String>(
                  columnName: 'Debit',
                  value:
                      NumberFormat("#,##0.00", "en_US").format(e.Debit_Amount)),
              DataGridCell<String>(
                  columnName: 'Credit',
                  value: NumberFormat("#,##0.00", "en_US")
                      .format(e.Credit_Amount)),
            ]))
        .toList();
  }

  List<DataGridRow> _ledger = [];

  @override
  List<DataGridRow> get rows => _ledger;
  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Text(summaryValue),
    );
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'Debit' ||
                dataGridCell.columnName == 'Date' ||
                dataGridCell.columnName == 'Credit')
            ? Alignment.centerRight
            : Alignment.center,
        padding: EdgeInsets.all(2.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
