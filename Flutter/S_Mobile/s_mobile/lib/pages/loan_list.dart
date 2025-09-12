import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:s_mobile/Loans/Loan.dart';
import 'package:s_mobile/Loans/Schedule.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/master_page.dart';
import 'package:s_mobile/pages/ledgerEntries.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../common/menu.dart';
import '../common/widgets.dart';
import '../members/controller.dart';
import '../members/entries.dart';
import '../members/member.dart';

class loans_page extends StatefulWidget {
  const loans_page({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Member? member;

  @override
  State<loans_page> createState() => _loans_pageState();
}

class _loans_pageState extends State<loans_page> {
  @override
  Widget build(BuildContext context) {
    LoansDataSource _loansds= LoansDataSource(Entries: widget.member?.Loans ?? []);
    return  Scaffold(

      body: Container(
        decoration: widgets().backgroundimage(context),
        child:

        StatefulBuilder(builder: (context, setState) {
          return SfDataGridTheme(
            data: SfDataGridThemeData(
              headerColor: const Color.fromRGBO(164, 92, 113, 0.5),
            ),
            child: SfDataGrid(

              onCellTap: (DataGridCellTapDetails details) {
                if (details.rowColumnIndex.rowIndex != 0) {
                  int selectedRowIndex = details.rowColumnIndex.rowIndex - 1;
                  var row =
                  _loansds.effectiveRows.elementAt(selectedRowIndex);
                  // Assuming your data source has a 'name' property
                  print(row.getCells()[1].value);

                  List<TransactionType> type = [
                    TransactionType.Loan,
                    TransactionType.Repayment,
                    TransactionType.Interest_Paid,
                    TransactionType.Interest_Due
                  ];
                  List<entries>? entriess = Get
                      .find<MemberController>()
                      .currentCustomer
                      .value
                      .Entries
                      ?.where((ent) =>
                  ent.Transaction_Type != null && type?.contains(ent
                      .Transaction_Type) == true && ent.Loan_No == row
                      .getCells()[1].value)
                      .toList();
                entriess?.forEach((d)=> print(d));

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Master(widgets: Ledgerentries(Entries:entries().calculateRunningBalance(entriess)),title: '${row
                      .getCells()[2]} - ${ row
                      .getCells()[1]}',)));
                }
                //Get.to(Master(widgets: Text('data'), ));

              },
              source: _loansds,
              columnWidthMode: ColumnWidthMode.fill,
              columns: [
                GridColumn(
                    columnName: "Date",
                    label: Container(
                        alignment: Alignment.center, child: Text("Date"))),
                GridColumn(
                    columnName: "Loan",
                    label: Container(
                        alignment: Alignment.centerRight,
                        child: Text("LoanAmount"))),
                GridColumn(
                    columnName: "Type",
                    label: Container(
                        alignment: Alignment.centerRight,
                        child: Text("Type"))),
                GridColumn(
                    columnName: "Installements",
                    label: Container(
                        alignment: Alignment.centerRight,
                        child: Text("Installements"))),
                GridColumn(
                    columnName: "Balance",
                    label: Container(
                        alignment: Alignment.centerRight,
                        child: Text("Balance"))),
              ],
              tableSummaryRows: [
                GridTableSummaryRow(
                    showSummaryInRow: false,
                    //title: 'Total Salary: {Sum} for 20 employees',
                    columns: [
                      GridSummaryColumn(
                          name: 'Principal',
                          columnName: 'Principal',
                          summaryType: GridSummaryType.sum),
                      GridSummaryColumn(
                          name: 'Interest',
                          columnName: 'Interest',
                          summaryType: GridSummaryType.sum),
                      GridSummaryColumn(
                          name: 'Repayment',
                          columnName: 'Repayment',
                          summaryType: GridSummaryType.sum)
                    ],
                    position: GridTableSummaryRowPosition.bottom)
              ],
            ),
          );
        }),
        // Column(
        //   children: [
        //     ConstrainedBox(
        //         constraints: BoxConstraints(
        //             minHeight: 20,
        //             maxHeight: MediaQuery.of(context).size.height / 3),
        //         child: MediaQuery.removePadding(
        //           removeTop: true,
        //           context: context,
        //           child: ListView.builder(
        //               shrinkWrap: true,
        //               itemCount: widget.member?.Loans == null
        //                   ? 0
        //                   : widget.member?.Loans?.length,
        //               itemBuilder: (BuildContext context, int index) {
        //                 return buildItem(
        //                     context, index, widget.member?.Loans as List<Loan>);
        //               }),
        //         )),
        //     Spacer(),
        //     Spacer()
        //   ],
        // ),
      ),
   floatingActionButton: InkWell(
     onTap: () {
       // Handle button tap
     },
     child: Container(
       padding: EdgeInsets.all(12),
       decoration: BoxDecoration(
         border: Border.all(color: Colors.blue),
         borderRadius: BorderRadius.circular(8),
       ),
       child: Row(
         mainAxisSize: MainAxisSize.min,
         children: [
           Icon(Icons.add, color: Colors.blue),
           SizedBox(width: 8),
           Text('new Loan', style: TextStyle(color: Colors.blue)),
         ],
       ),
     ),
   )
   
    );
  }

  buildItem(BuildContext context, int index, List<Loan> acc) {
    return Row(
      children: [
        Card(
          elevation: 10,
          //color: Color.fromRGBO(164, 92, 113, 0.5),
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 17,
              height: 40,
              child: Row(
                children: [
                  Text('${acc[index].Loan_No}', style: TextStyle(fontSize: 10)),
                  Spacer(),
                  Text('${acc[index].Loan_Name}',
                      style: TextStyle(fontSize: 10)),
                  Spacer(),
                  Text('${acc[index].Installments}',
                      style: TextStyle(fontSize: 10)),
                  Spacer(),
                  Text(DateFormat('dd-MMM-yy').format(acc[index].Application_Date! ),
                      style: TextStyle(fontSize: 10)),
                  Spacer(),
                  Text(
                      utilities.formatcurrency
                          .format((acc[index].Outstanding_Balance)),
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                ],
              )),
        )
      ],
    );
  }
}
