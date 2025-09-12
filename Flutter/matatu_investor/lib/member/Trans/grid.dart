import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matatu/member/Trans/collections.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../Assets/utils.dart';

class collDataSource extends DataGridSource {
  collDataSource(List<Collections> l) {
    if (l != null) {
      _ledger = l
          .map<DataGridRow>((e) => DataGridRow(cells: [
                DataGridCell<String>(
                    columnName: 'Documentno', value: e.Document_No),
                DataGridCell<String>(
                    columnName: 'Date',
                    value: customFormat.format(e.Transaction_Date!)),
                DataGridCell<String>(
                    columnName: 'Desc', value: e.Type.toString().toLowerCase()),
                DataGridCell<String>(
                    columnName: 'Amount',
                    value: NumberFormat("#,##0.00", "en_US").format(e.Amount)),
              ]))
          .toList();
    }
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
                dataGridCell.columnName == 'Amount')
            ? Alignment.centerRight
            : Alignment.center,
        padding: EdgeInsets.all(2.0),
        child: Text(
          dataGridCell.value.toString(),
          style: TextStyle(fontSize: 10),
        ),
      );
    }).toList());
  }
}
