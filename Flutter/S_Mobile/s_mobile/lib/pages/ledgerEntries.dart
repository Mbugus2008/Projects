import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../common/menu.dart';
import '../common/widgets.dart';
import '../members/controller.dart';
import '../members/member.dart';

class Ledgerentries extends StatefulWidget {
  const Ledgerentries({
    Key? key,
    required this.Entries,
  }) : super(key: key);

  final List<entries>? Entries;

  @override
  State<Ledgerentries> createState() => _ledgerentries();
}

class _ledgerentries extends State<Ledgerentries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar:utilities(). appbar(Get.find<MemberController>().currentCustomer.value,''),
        body:  Container(
      decoration: widgets().backgroundimage(context),
      child:
//Menu
          StatefulBuilder(builder: (context, setState) {
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromRGBO(164, 92, 113, 0.5),

              ),

              child: SfDataGrid(
                onQueryRowHeight: (details) {
                  if (details.rowIndex == 0) {
                    return 60.0; // Set a different height for the header row
                  } else {// Calculate row height based on content or index
                    return details.getIntrinsicRowHeight(details.rowIndex);
                  }
                },



                source: entriesDataSource(Entries: widget.Entries ?? []),
                columnWidthMode: ColumnWidthMode.fill,
                columns: [
                  GridColumn(
                      columnName: "Date",
                      label: Container(
                          alignment: Alignment.center, child: Text("Date"))),
                  GridColumn(
                      columnName: "Name",
                      label: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Desc"))),
                  GridColumn(
                      columnName: "Debit",
                      label: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Debit"))),
                  GridColumn(
                      columnName: "Credit",
                      label: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Credit"))),
                  GridColumn(
                      columnName: "Balance",
                      label: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Balance"))),
                  GridColumn(
                      columnName: "Amount",
                      visible: false,
                      label: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Amount")))

                ],
                tableSummaryRows: [
                  GridTableSummaryRow(
                      showSummaryInRow: false,
                      //title: 'Total Salary: {Sum} for 20 employees',
                      columns: [
                        GridSummaryColumn(
                            name: 'Amount',
                            columnName: 'Amount',
                            summaryType: GridSummaryType.sum),
                        GridSummaryColumn(
                            name: 'Credit',
                            columnName: 'Credit',
                            summaryType: GridSummaryType.sum),
                        GridSummaryColumn(
                            name: 'Debit',
                            columnName: 'Debit',
                            summaryType: GridSummaryType.sum)
                      ],
                      position: GridTableSummaryRowPosition.bottom)
                ],
              ),
            );
          }),
          // ConstrainedBox(
          //     constraints: BoxConstraints(
          //         minHeight: 20,
          //         maxHeight: MediaQuery.of(context).size.height / 3),
          //     child: MediaQuery.removePadding(
          //       removeTop: true,
          //       context: context,
          //       child:  widget.Entries != null ? ListView.builder(
          //           shrinkWrap: true,
          //           itemCount: widget.Entries?.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return buildItem(context, index,
          //                 widget.Entries as List<entries>);
          //           }):Text('No Transactions'),
          //     )),
          // Spacer(),


    ));
  }

  buildItem(BuildContext context, int index, List<entries> acc) {
    // var d = acc[index].Product_Category,
    return Row(
      children: [
        Card(
          elevation: 2,
          //color: Color.fromRGBO(164, 92, 113, 0.5),
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 17,
              height: 40,
              child: Row(
                children: [
                  Text(
                    '${DateFormat('dd-MMM-yy').format(acc[index].Posting_Date ?? DateTime.now())}',
                   // style: TextStyle(fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    '${acc[index].Description.toString()}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    '${acc[index].Transaction_Type?.description}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    utilities.formatcurrency.format(acc[index].Debit),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ) ,
                  Spacer(),
                  Text(
                    utilities.formatcurrency.format(acc[index].Credit),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              )),
        )
      ],
    );
  }
}
