import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../common/Apis.dart';
import '../common/Results.dart';
import '../common/utilities.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Schedule implements Tomaps {
  String? Key;
  String? Loan_No;
  String? Member_No;
  String? Loan_Category;
  DateTime? Closed_Date;
  double? Loan_Amount;
  double? Interest_Rate;
  double? Monthly_Repayment;
  String? Member_Name;
  double? Monthly_Interest;
  double? Amount_Repayed;
  DateTime? Repayment_Date;
  double? Principal_Repayment;
  bool? Paid;
  double? Remaining_Debt;
  int? Instalment_No;
  DateTime? Actual_Loan_Repayment_Date;
  String? Repayment_Code;
  String? Group_Code;
  String? Loan_Application_No;
  double? Actual_Principal_Paid;
  double? Actual_Interest_Paid;
  double? Actual_Installment_Paid;
  double? Repayment_Adjustment;
  String? Month;
  bool? Posted;
  double? Loan_Balance;
  DateTime? Recover_in;
  String? Recovery_Month;
  double? Less_Amount;
  bool? Deduct_Less_Amount;
  bool? Ommitted;
  DateTime? Application_Date;
  Schedule({
    this.Key,
    this.Loan_No,
    this.Member_No,
    this.Loan_Category,
    this.Closed_Date,
    this.Loan_Amount,
    this.Interest_Rate,
    this.Monthly_Repayment,
    this.Member_Name,
    this.Monthly_Interest,
    this.Amount_Repayed,
    this.Repayment_Date,
    this.Principal_Repayment,
    this.Paid,
    this.Remaining_Debt,
    this.Instalment_No,
    this.Actual_Loan_Repayment_Date,
    this.Repayment_Code,
    this.Group_Code,
    this.Loan_Application_No,
    this.Actual_Principal_Paid,
    this.Actual_Interest_Paid,
    this.Actual_Installment_Paid,
    this.Repayment_Adjustment,
    this.Month,
    this.Posted,
    this.Loan_Balance,
    this.Recover_in,
    this.Recovery_Month,
    this.Less_Amount,
    this.Deduct_Less_Amount,
    this.Ommitted,
    this.Application_Date,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Loan_No': Loan_No,
      'Member_No': Member_No,
      'Loan_Category': Loan_Category,
      'Closed_Date': Closed_Date?.millisecondsSinceEpoch,
      'Loan_Amount': Loan_Amount,
      'Interest_Rate': Interest_Rate,
      'Monthly_Repayment': Monthly_Repayment,
      'Member_Name': Member_Name,
      'Monthly_Interest': Monthly_Interest,
      'Amount_Repayed': Amount_Repayed,
      'Repayment_Date': Repayment_Date?.toIso8601String(),
      'Principal_Repayment': Principal_Repayment,
      'Paid': Paid,
      'Remaining_Debt': Remaining_Debt,
      'Instalment_No': Instalment_No,
      'Actual_Loan_Repayment_Date':
          Actual_Loan_Repayment_Date?.millisecondsSinceEpoch,
      'Repayment_Code': Repayment_Code,
      'Group_Code': Group_Code,
      'Loan_Application_No': Loan_Application_No,
      'Actual_Principal_Paid': Actual_Principal_Paid,
      'Actual_Interest_Paid': Actual_Interest_Paid,
      'Actual_Installment_Paid': Actual_Installment_Paid,
      'Repayment_Adjustment': Repayment_Adjustment,
      'Month': Month,
      'Posted': Posted,
      'Loan_Balance': Loan_Balance,
      'Recover_in': Recover_in?.millisecondsSinceEpoch,
      'Recovery_Month': Recovery_Month,
      'Less_Amount': Less_Amount,
      'Deduct_Less_Amount': Deduct_Less_Amount,
      'Ommitted': Ommitted,
      'Application_Date': Application_Date?.toIso8601String(),
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
      Member_No: map['Member_No'] != null ? map['Member_No'] as String : null,
      Loan_Category:
          map['Loan_Category'] != null ? map['Loan_Category'] as String : null,
      Closed_Date:
          map['Closed_Date'] != null ? _parseDate(map['Closed_Date']) : null,
      Loan_Amount:
          map['Loan_Amount'] != null ? map['Loan_Amount'] as double : null,
      Interest_Rate:
          map['Interest_Rate'] != null ? map['Interest_Rate'] as double : null,
      Monthly_Repayment: map['Monthly_Repayment'] != null
          ? map['Monthly_Repayment'] as double
          : null,
      Member_Name:
          map['Member_Name'] != null ? map['Member_Name'] as String : null,
      Monthly_Interest: map['Monthly_Interest'] != null
          ? map['Monthly_Interest'] as double
          : null,
      Amount_Repayed: map['Amount_Repayed'] != null
          ? map['Amount_Repayed'] as double
          : null,
      Repayment_Date: map['Repayment_Date'] != null
          ? DateTime.tryParse((map['Repayment_Date'] ?? 0))
          : null,
      Principal_Repayment: map['Principal_Repayment'] != null
          ? map['Principal_Repayment'] as double
          : null,
      Paid: map['Paid'] != null ? map['Paid'] as bool : null,
      Remaining_Debt: map['Remaining_Debt'] != null
          ? map['Remaining_Debt'] as double
          : null,
      Instalment_No:
          map['Instalment_No'] != null ? map['Instalment_No'] as int : null,
      Actual_Loan_Repayment_Date: map['Actual_Loan_Repayment_Date'] != null
          ? _parseDate(map['Actual_Loan_Repayment_Date'])
          : null,
      Repayment_Code: map['Repayment_Code'] != null
          ? map['Repayment_Code'] as String
          : null,
      Group_Code:
          map['Group_Code'] != null ? map['Group_Code'] as String : null,
      Loan_Application_No: map['Loan_Application_No'] != null
          ? map['Loan_Application_No'] as String
          : null,
      Actual_Principal_Paid: map['Actual_Principal_Paid'] != null
          ? map['Actual_Principal_Paid'] as double
          : null,
      Actual_Interest_Paid: map['Actual_Interest_Paid'] != null
          ? map['Actual_Interest_Paid'] as double
          : null,
      Actual_Installment_Paid: map['Actual_Installment_Paid'] != null
          ? map['Actual_Installment_Paid'] as double
          : null,
      Repayment_Adjustment: map['Repayment_Adjustment'] != null
          ? map['Repayment_Adjustment'] as double
          : null,
      Month: map['Month'] != null ? map['Month'] as String : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Loan_Balance:
          map['Loan_Balance'] != null ? map['Loan_Balance'] as double : null,
      Recover_in:
          map['Recover_in'] != null ? _parseDate(map['Recover_in']) : null,
      Recovery_Month: map['Recovery_Month'] != null
          ? map['Recovery_Month'] as String
          : null,
      Less_Amount:
          map['Less_Amount'] != null ? map['Less_Amount'] as double : null,
      Deduct_Less_Amount: map['Deduct_Less_Amount'] != null
          ? map['Deduct_Less_Amount'] as bool
          : null,
      Ommitted: map['Ommitted'] != null ? map['Ommitted'] as bool : null,
      Application_Date: map['Application_Date'] != null
          ? DateTime.tryParse((map['Application_Date'] ?? 0))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Parse a date value that may be a String (ISO 8601) or int (ms since epoch).
  static DateTime? _parseDate(dynamic value) {
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    return null;
  }

  /// Fetch the repayment schedule for a single loan.
  /// Returns the list of schedule entries, or null on failure.
  static Future<List<Schedule>?> fetchForLoan(String loanNo) async {
    final request = Params(Loan_No: loanNo);
    final r = await ApiClient().postdata('RepaymentSchedule', request.toJson());
    if (r.statusCode == 200) {
      final results = Results3<Schedule>.fromJson(r.body, Schedule.fromMap);
      if (results.Code == 0) {
        return results.Contents;
      }
    }
    return null;
  }

  /// Deserialize a list of maps into Schedule objects.
  static List<Schedule> fromMapList(List<dynamic> list) {
    return list
        .map((e) => Schedule.fromMap(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  /// Calculate total arrears from a schedule list.
  ///
  /// Formula: sum of Principal_Repayment for all past-due installments
  ///          minus (Approved_Amount - Outstanding_Balance).
  /// Clamped to 0 if negative (i.e. overpaid or current).
  static double calculateArrears(
    List<Schedule>? schedules, {
    double approvedAmount = 0,
    double outstandingBalance = 0,
  }) {
    if (schedules == null || schedules.isEmpty) return 0;
    final now = DateTime.now();
    double totalPrincipalDue = 0;
    for (final s in schedules) {
      if (s.Repayment_Date == null) continue;
      if (s.Repayment_Date!.isAfter(now)) continue;
      totalPrincipalDue += s.Principal_Repayment ?? 0;
    }
    final principalPaid = approvedAmount - outstandingBalance;
    final arrears = totalPrincipalDue - principalPaid;
    return arrears < 0 ? 0 : arrears;
  }
}

class ScheduleDataSource extends DataGridSource {
  List<Schedule> _Entries = [];

  entriesDataSource({required List<Schedule>? Entries}) {
    final safe = Entries ?? [];
    dataGridRows = safe
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<DateTime>(
                  columnName: 'Date', value: dataGridRow.Repayment_Date),
              DataGridCell<String>(
                  columnName: 'LoanAmount',
                  value: '${dataGridRow.Loan_Amount}'),
              DataGridCell<double>(
                  columnName: 'Repayment',
                  value: dataGridRow.Monthly_Repayment),
              DataGridCell<double>(
                  columnName: 'Principal  ',
                  value: dataGridRow.Principal_Repayment),
              DataGridCell<double>(
                  columnName: 'Interest', value: dataGridRow.Monthly_Interest),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];
  List<GridSummaryColumn> summaryrows = [];
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // Color getRowBackgroundColor() {
    //
    //   final TransactionType salary =  row.getCells()[3].value;
    //   if (salary >= 10000 && salary < 15000) {
    //     return Colors.blue[300]!;
    //   } else if (salary <= 15000) {
    //     return Colors.orange[300]!;
    //   }
    //
    //   return Colors.transparent;
    // }
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'LoanAmount' ||
                dataGridCell.columnName == 'Principal' ||
                dataGridCell.columnName == 'Interest' ||
                dataGridCell.columnName == 'Repayment')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: .0),
        child: Edited(dataGridCell),
      );
    }).toList());
  }

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
      alignment: (summaryColumn?.columnName == 'LoanAmount' ||
              summaryColumn?.columnName == 'Repayment' ||
              summaryColumn?.columnName == 'Interest' ||
              summaryColumn?.columnName == 'Principal')
          ? Alignment.centerRight
          : Alignment.centerLeft,
      padding: EdgeInsets.all(15.0),
      child: Text(summaryValue),
    );
  }

  Widget Edited(DataGridCell<dynamic> dataGridCell) {
    switch (dataGridCell.columnName) {
      case "Date":
        return Text(
          DateFormat('dd-MMM-yy').format(dataGridCell.value),
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        );
      case "LoanAmount":
      case "Repayment":
      case "Interest":
      case "Principal":
        return Text(
          utilities.formatcurrency.format(dataGridCell.value ?? 0),
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        );
      case "Balance":
        return Text(
          utilities.formatcurrency.format(dataGridCell.value ?? 0),
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        );
      default:
        return Text(
          dataGridCell.value.toString(),
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.fade,
        );
    }
  }
}
