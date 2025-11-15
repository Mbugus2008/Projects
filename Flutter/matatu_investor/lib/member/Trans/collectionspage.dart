import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/member/Trans/grid.dart';
import 'package:matatu/vehicles/vehicles.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../common/Controller.dart';

class collectionspage extends StatelessWidget {
  collectionspage({super.key, this.veh});
  final Vehicles? veh;
  @override
  Widget build(BuildContext context) {
    return GetX<MemberController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Container(
              child: Column(
                children: [
                  Text(
                    veh!.Vehicle_Number.toString(),
                    style: TextStyle(fontSize: 11),
                  ),
                  //   Text(NumberFormat("#,##0.00", "en_US").format(acc!.balance))
                ],
              ),
            ),
            centerTitle: true,
          ),
          body: controller.collections.length > 0
              ? SfDataGridTheme(
                  data:
                      SfDataGridThemeData(headerColor: const Color(0xff009889)),
                  child: SfDataGrid(
                    source: collDataSource(
                      controller.collections,
                    ),
                    onQueryRowHeight: (details) {
                      return 30;
                      // details.getIntrinsicRowHeight(details.rowIndex);
                    },
                    columnWidthMode: ColumnWidthMode.fill,
                    columns: <GridColumn>[
                      GridColumn(
                          columnName: 'Documentno',
                          label: Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Document No',
                                overflow: TextOverflow.ellipsis,
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
                          columnName: 'Amount',
                          label: Container(
                              //padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerRight,
                              child: Text('Amount'))),
                    ],
                    tableSummaryRows: [
                      GridTableSummaryRow(
                          showSummaryInRow: false,
                          title: 'Total Salary: {Sum} for 20 employees',
                          columns: [
                            GridSummaryColumn(
                                name: 'Amount',
                                columnName: 'Amount',
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
