import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matatu/member/accounts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../common/Controller.dart';
import '../../member/ledger/grid.dart';

class ledgerpage extends StatelessWidget {
  final accounts? acc;

  ledgerpage({Key? key, this.acc}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    print(acc?.toJson());
    return GetX<MemberController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Container(
              child: Column(
                children: [
                  Text(
                    acc!.name.toString(),
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(NumberFormat("#,##0.00", "en_US").format(acc!.balance))
                ],
              ),
            ),
            centerTitle: true,
          ),
          body: controller.ledgerentries.value.length > 0
              ? SfDataGridTheme(
                  data:
                      SfDataGridThemeData(headerColor: const Color(0xff009889)),
                  child: SfDataGrid(
                    source: ledgerDataSource(controller.ledgerentries.value,
                        controller.ledgerentries.value),
                    columnWidthMode: ColumnWidthMode.fill,
                    columns: <GridColumn>[
                      GridColumn(
                          columnName: 'id',
                          visible: false,
                          label: Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerRight,
                              child: Text(
                                'ID',
                              ))),
                      GridColumn(
                          columnName: 'Date',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                              //padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Date',
                                overflow: TextOverflow.visible,
                              ))),
                      GridColumn(
                          columnName: 'Desc',
                          width: 120,
                          label: Container(
                              //padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Description',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18),
                              ))),
                      GridColumn(
                          columnName: 'Debit',
                          label: Container(
                              //padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerRight,
                              child: Text('Debit'))),
                      GridColumn(
                          columnName: 'Credit',
                          label: Container(
                              //padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerRight,
                              child: Text('Credit'))),
                    ],
                    tableSummaryRows: [
                      GridTableSummaryRow(
                          showSummaryInRow: false,
                          title: 'Total Salary: {Sum} for 20 employees',
                          columns: [
                            GridSummaryColumn(
                                name: 'Sum',
                                columnName: 'Debit',
                                summaryType: GridSummaryType.sum),
                            GridSummaryColumn(
                                name: 'Sum',
                                columnName: 'Credit',
                                summaryType: GridSummaryType.sum)
                          ],
                          position: GridTableSummaryRowPosition.bottom),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()));
    });
  }
}
