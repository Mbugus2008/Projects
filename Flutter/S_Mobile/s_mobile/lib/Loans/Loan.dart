// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../common/utilities.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@JsonSerializable()
class Loan {
  String? Key;
  String? Loan_No;
  DateTime? Application_Date;
  String? Loan_Product_Type;
  String? Client_Code;
  double? Outstanding_Balance;
  //enum
  status? Status;
  double? Approved_Amount;
  String? Telephone;
  String? Loan_Name;
  int? Installments;
  DateTime? Disbursement_Date;
  String? Loan_Product_Type_Name;
  double? Outstanding_Interest;
  String? Client_Name;
  double? Repayment;
  String? Loan_Account;
  bool? Posted;
  DateTime? Repayment_Start_Date;
  //enum
  loans_Category_SASRA? Loans_Category_SASRA;
  String? Loan_Appl_form_No;
  String? Captured_By;
  double? Outstanding_Bills;
  Loan({
    this.Key,
    this.Loan_No,
    this.Application_Date,
    this.Loan_Product_Type,
    this.Client_Code,
    this.Outstanding_Balance,
    this.Status,
    this.Approved_Amount,
    this.Telephone,
    this.Loan_Name,
    this.Installments,
    this.Disbursement_Date,
    this.Loan_Product_Type_Name,
    this.Outstanding_Interest,
    this.Client_Name,
    this.Repayment,
    this.Loan_Account,
    this.Posted,
    this.Repayment_Start_Date,
    this.Loans_Category_SASRA,
    this.Loan_Appl_form_No,
    this.Captured_By,
    this.Outstanding_Bills,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Loan_No': Loan_No,
      'Application_Date': Application_Date?.toIso8601String(),
      'Loan_Product_Type': Loan_Product_Type,
      'Client_Code': Client_Code,
      'Outstanding_Balance': Outstanding_Balance,
      'Status': Status?.index,
      'Approved_Amount': Approved_Amount,
      'Telephone': Telephone,
      'Loan_Name': Loan_Name,
      'Installments': Installments,
      'Disbursement_Date': Disbursement_Date?.toIso8601String(),
      'Loan_Product_Type_Name': Loan_Product_Type_Name,
      'Outstanding_Interest': Outstanding_Interest,
      'Client_Name': Client_Name,
      'Repayment': Repayment,
      'Loan_Account': Loan_Account,
      'Posted': Posted,
      'Repayment_Start_Date': Repayment_Start_Date?.toIso8601String(),
      'Loans_Category_SASRA': Loans_Category_SASRA?.index,
      'Loan_Appl_form_No': Loan_Appl_form_No,
      'Captured_By': Captured_By,
      'Outstanding_Bills': Outstanding_Bills,
    };
  }

  factory Loan.fromMap(Map<String, dynamic> map) {
    return Loan(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
      Application_Date: map['Application_Date'] != null
          ? DateTime.tryParse((map['Application_Date'] ?? 0))
          : null,
      Loan_Product_Type: map['Loan_Product_Type'] != null
          ? map['Loan_Product_Type'] as String
          : null,
      Client_Code:
          map['Client_Code'] != null ? map['Client_Code'] as String : null,
      Outstanding_Balance: map['Outstanding_Balance'] != null
          ? map['Outstanding_Balance'] as double
          : null,
      Status: map['Status'] != null
          ? status.values[(map['Status'] ?? 0) as int]
          : null,
      Approved_Amount: map['Approved_Amount'] != null
          ? map['Approved_Amount'] as double
          : null,
      Telephone: map['Telephone'] != null ? map['Telephone'] as String : null,
      Loan_Name: map['Loan_Name'] != null ? map['Loan_Name'] as String : null,
      Installments:
          map['Installments'] != null ? map['Installments'] as int : null,
      Disbursement_Date: map['Disbursement_Date'] != null
          ? DateTime.tryParse((map['Disbursement_Date'] ?? 0))
          : null,
      Loan_Product_Type_Name: map['Loan_Product_Type_Name'] != null
          ? map['Loan_Product_Type_Name'] as String
          : null,
      Outstanding_Interest: map['Outstanding_Interest'] != null
          ? map['Outstanding_Interest'] as double
          : null,
      Client_Name:
          map['Client_Name'] != null ? map['Client_Name'] as String : null,
      Repayment: map['Repayment'] != null ? map['Repayment'] as double : null,
      Loan_Account:
          map['Loan_Account'] != null ? map['Loan_Account'] as String : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Repayment_Start_Date: map['Repayment_Start_Date'] != null
          ? DateTime.tryParse((map['Repayment_Start_Date'] ?? 0))
          : null,
      Loans_Category_SASRA: map['Loans_Category_SASRA'] != null
          ? loans_Category_SASRA
              .values[(map['Loans_Category_SASRA'] ?? 0) as int]
          : null,
      Loan_Appl_form_No: map['Loan_Appl_form_No'] != null
          ? map['Loan_Appl_form_No'] as String
          : null,
      Captured_By:
          map['Captured_By'] != null ? map['Captured_By'] as String : null,
      Outstanding_Bills: map['Outstanding_Bills'] != null
          ? map['Outstanding_Bills'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loan.fromJson(String source) =>
      Loan.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum status {
  /// <remarks/>
  Open,

  /// <remarks/>
  Pending_Approval,

  /// <remarks/>
  Approved,

  /// <remarks/>
  Rejected,

  /// <remarks/>
  Deffered,

  /// <remarks/>
  Posted,
}

/// <remarks/>
enum loans_Category_SASRA {
  /// <remarks/>
  Perfoming,

  /// <remarks/>
  Watch,

  /// <remarks/>
  Substandard,

  /// <remarks/>
  Doubtful,

  /// <remarks/>
  Loss,

  /// <remarks/>
  Closed_Account,
}
class LoansDataSource extends DataGridSource {

  List<Loan> _Entries =[];

  LoansDataSource({required List<Loan> Entries}) {
    dataGridRows =
        Entries.map<DataGridRow>((dataGridRow) =>
            DataGridRow(cells: [
              DataGridCell<DateTime>(
                  columnName: 'Date', value: dataGridRow.Application_Date),
              DataGridCell<String>(
                  columnName: 'Loan', value: '${dataGridRow.Loan_No}'),
              DataGridCell<String>(
                  columnName: 'Type', value: dataGridRow.Loan_Name ),
              DataGridCell<int>(
                  columnName: 'Installements', value: dataGridRow.Installments),
              DataGridCell<double>(
                  columnName: 'Balance', value:  (dataGridRow.Outstanding_Balance ??0) + (dataGridRow.Outstanding_Interest ?? 0)),

            ])).toList();

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
            alignment: (dataGridCell.columnName == 'Installements' ||
                dataGridCell.columnName == 'Balance')
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
      alignment: (summaryColumn?.columnName == 'Installements' ||
          summaryColumn?.columnName == 'Balance')
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
      case "Installements":
        return Text(
          dataGridCell.value.toString(),
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.fade,
        );
      case "Balance":
        return Text(
          utilities.formatcurrency.format(dataGridCell.value ?? 0),
          style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
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
