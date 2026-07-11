// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../common/Apis.dart';
import '../common/Results.dart';
import 'controller.dart';

class entries implements Tomaps {
  String? Key;
  DateTime? Posting_Date;
  int? Entry_No;
  String? Document_No;
  double? Amount;
  String? Customer_No;
  String? Description;
  double? Balance;
  TransactionType? Transaction_Type;
  double? Credit;
  double? Debit;
  String? Loan_No;
  entries(
      {this.Key,
      this.Posting_Date,
      this.Entry_No,
      this.Document_No,
      this.Amount,
      this.Customer_No,
      this.Description,
      this.Balance,
      this.Transaction_Type,
      this.Credit,
      this.Debit,
      this.Loan_No});
  @override
  String toString() {
    return '$Posting_Date $Document_No $Amount $Customer_No $Description $Balance $Transaction_Type';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Posting_Date': Posting_Date?.toIso8601String(),
      'Entry_No': Entry_No,
      'Document_No': Document_No,
      'Amount': Amount,
      'Customer_No': Customer_No,
      'Description': Description,
      'Balance': Balance,
      'Transaction_Type': Transaction_Type?.index,
      'Credit': Credit,
      'Debit': Debit,
      'Loan_No': Loan_No,
    };
  }

  factory entries.fromMap(Map<String, dynamic> map) {
    return entries(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Posting_Date: map['Posting_Date'] != null
          ? DateTime.tryParse((map['Posting_Date'] ?? 0))
          : null,
      Entry_No: map['Entry_No'] != null ? map['Entry_No'] as int : null,
      Document_No:
          map['Document_No'] != null ? map['Document_No'] as String : null,
      Amount: map['Amount'] != null ? map['Amount'] as double : null,
      Customer_No:
          map['Customer_No'] != null ? map['Customer_No'] as String : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
      Balance: map['Balance'] != null ? map['Balance'] as double : null,
      Transaction_Type: map['Transaction_Type'] != null
          ? safeTransactionType((map['Transaction_Type']) as int)
          : null,
      Credit: (map['Credit_Amount'] ??
          map['Credit_AmountSpecified'] ??
          map['Credit']) as double?,
      Debit: (map['Debit_Amount'] ??
          map['Debit_AmountSpecified'] ??
          map['Debit']) as double?,
    );
  }

  String toJson() => json.encode(toMap());

  factory entries.fromJson(String source) =>
      entries.fromMap(json.decode(source) as Map<String, dynamic>);

  List<entries>? calculateRunningBalance(List<entries>? amounts) {
    if (amounts == null) return amounts;
    // Sort ascending to compute running balance correctly
    amounts.sort((a, b) => (a.Posting_Date ??
            DateTime.fromMillisecondsSinceEpoch(0))
        .compareTo(b.Posting_Date ?? DateTime.fromMillisecondsSinceEpoch(0)));
    double currentBalance = 0;
    for (var amount in amounts) {
      currentBalance += amount.Credit ?? 0;
      currentBalance -= amount.Debit ?? 0;
      amount.Balance = currentBalance;
    }
    // Return newest-first (descending)
    return amounts.reversed.toList();
  }

  /// Fetch entries for an account, optionally filtered by transaction type.
  /// Returns the entries list (or null on failure).
  Future<List<entries>?> fetchEntries({
    required String account,
    int? transactionType,
  }) async {
    final request = Params(
      Acc: account,
      Transaction_Type: transactionType,
    );
    final r = await ApiClient().postdata('Statement', request.toJson());
    if (r.statusCode == 200) {
      Results3<entries> results =
          Results3<entries>.fromJson(r.body, entries.fromMap);
      if (results.Code == 0) {
        return results.Contents;
      }
    }
    return null;
  }

  Future<void>? Getentries(BuildContext context, String? account) async {
    List<entries>? ln;
    var request = Params(Acc: account.toString());
    final r = await ApiClient().postdata("Statement", request.toJson());
    if (r.statusCode == 200) {
      entries_Results results = entries_Results.fromJson(r.body);
      switch (results.Code) {
        case 0:
          {
            for (var value1 in results.Contents!) {
              print(value1.toString());
            }
            Get.find<MemberController>().currentstatement.value =
                results.Contents!;
          }
          break;
        default:
          {
            if (!context.mounted) return await Future.value(ln);
            MotionToast.error(
              description: Text(results.Desc.toString()),
              title: Text("Login"),
            ).show(context);
          }
      }
    } else {
      if (!context.mounted) return await Future.value(ln);
      MotionToast.error(
        description: Text(r.body.toString()),
        title: Text("Login"),
      ).show(context);
    }
    return await Future.value();
  }
}

/// Safely resolve a transaction type index, returning null for out-of-range values.
TransactionType? safeTransactionType(int index) {
  if (index >= 0 && index < TransactionType.values.length) {
    return TransactionType.values[index];
  }
  return null;
}

enum TransactionType {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Registration_Fee,

  /// <remarks/>
  Loan,

  /// <remarks/>
  Repayment,

  /// <remarks/>
  Withdrawal,

  /// <remarks/>
  Interest_Due,

  /// <remarks/>
  Interest_Paid,

  /// <remarks/>
  Benevolent_Fund,

  /// <remarks/>
  Deposit_Contribution,

  /// <remarks/>
  Penalty_Charged,

  /// <remarks/>
  Application_Fee,

  /// <remarks/>
  Appraisal_Fee,

  /// <remarks/>
  Retirement,

  /// <remarks/>
  Unallocated_Funds,

  /// <remarks/>
  Shares_Capital,

  /// <remarks/>
  Loan_Adjustment,

  /// <remarks/>
  Dividend,

  /// <remarks/>
  Withholding_Tax,

  /// <remarks/>
  Toto_Savings,

  /// <remarks/>
  Insurance_Contribution,

  /// <remarks/>
  Prepayment,

  /// <remarks/>
  Pamoja_Savings,

  /// <remarks/>
  Xmas_Contribution,

  /// <remarks/>
  Penalty_Paid,

  /// <remarks/>
  Plaza_Shares,

  /// <remarks/>
  Co_op_Shares,

  /// <remarks/>
  Welfare_Registration,

  /// <remarks/>
  Idd_Fitr,

  /// <remarks/>
  Pass_Book_Fee,

  /// <remarks/>
  Loan_Form_Fee,

  /// <remarks/>
  Xmass_CardBook_Fee,

  /// <remarks/>
  Sacco_ID_Fee,

  /// <remarks/>
  T_Shirt_Fee,

  /// <remarks/>
  Exit_Fee,

  /// <remarks/>
  Plaza_Savings,

  /// <remarks/>
  Sms_Savings,
}

extension StatusDescription on TransactionType {
  String get description {
    switch (this) {
      case TransactionType._blank_:
        return '';
      case TransactionType.Application_Fee:
        return 'Application Fee';
      case TransactionType.Appraisal_Fee:
        return 'Appraisal Fee';
      case TransactionType.Benevolent_Fund:
        return 'Benevolent Fund';
      case TransactionType.Co_op_Shares:
        return 'Co op Shares';
      case TransactionType.Deposit_Contribution:
        return 'Deposit Contribution';
      case TransactionType.Dividend:
        return 'Dividend';
      case TransactionType.Exit_Fee:
        return 'Exit Fee';
      case TransactionType.Idd_Fitr:
        return 'Idd Fitr';
      case TransactionType.Insurance_Contribution:
        return 'Insurance Contribution';
      case TransactionType.Interest_Due:
        return 'Interest Due';
      case TransactionType.Interest_Paid:
        return 'Interest Paid';
      case TransactionType.Loan:
        return 'Loan';
      case TransactionType.Loan_Adjustment:
        return 'Loan Adjustment';
      case TransactionType.Loan_Form_Fee:
        return 'Loan Form Fee';
      case TransactionType.Pamoja_Savings:
        return 'Pamoja Savings';
      case TransactionType.Pass_Book_Fee:
        return 'Pass Book Fee';
      case TransactionType.Penalty_Charged:
        return 'Penalty Charged';
      case TransactionType.Penalty_Paid:
        return 'Penalty Paid';
      case TransactionType.Plaza_Savings:
        return 'Plaza Savings';
      case TransactionType.Plaza_Shares:
        return 'Plaza Shares';
      case TransactionType.Prepayment:
        return 'Prepayment';
      case TransactionType.Registration_Fee:
        return 'Registration Fee';
      case TransactionType.Repayment:
        return 'Repayment';
      case TransactionType.Retirement:
        return 'Retirement';
      case TransactionType.Sacco_ID_Fee:
        return 'Sacco ID Fee';
      case TransactionType.Shares_Capital:
        return 'Shares Capital';
      case TransactionType.Sms_Savings:
        return 'Sms Savings';
      case TransactionType.T_Shirt_Fee:
        return 'T Shirt Fee';
      case TransactionType.Toto_Savings:
        return 'Toto Savings';
      case TransactionType.Unallocated_Funds:
        return 'Unallocated Funds';
      case TransactionType.Welfare_Registration:
        return 'Welfare Registration';
      case TransactionType.Withdrawal:
        return 'Withdrawal';
      case TransactionType.Withholding_Tax:
        return 'Withholding Tax';
      case TransactionType.Xmas_Contribution:
        return 'Xmas Contribution';
      case TransactionType.Xmass_CardBook_Fee:
        return 'Xmass CardBook Feea';

      default:
        return 'Unknown status';
    }
  }
}

class entriesDataSource extends DataGridSource {
  List<entries> _Entries = [];

  entriesDataSource({required List<entries>? Entries}) {
    final safe = Entries ?? [];
    dataGridRows = safe
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<DateTime>(
                  columnName: 'Date', value: dataGridRow.Posting_Date),
              DataGridCell<String>(columnName: 'Name', value: dsc(dataGridRow)),
              DataGridCell<double>(
                  columnName: 'Debit', value: dataGridRow.Debit),
              DataGridCell<double>(
                  columnName: 'Credit', value: dataGridRow.Credit),
              DataGridCell<double>(
                  columnName: 'Balance', value: dataGridRow.Balance),
              DataGridCell<double>(
                  columnName: 'Amount', value: dataGridRow.Amount),
            ]))
        .toList();
  }
  String? dsc(entries ent) {
    switch (ent.Transaction_Type) {
      case TransactionType._blank_:
        return ent.Description;
      default:
        return '${ent.Description}\n${ent.Transaction_Type?.description}';
    }
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
        alignment: (dataGridCell.columnName == 'Credit' ||
                dataGridCell.columnName == 'Debit' ||
                dataGridCell.columnName == 'Amount')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: .0),
        child: Edited(dataGridCell),

        // dataGridCell.columnName == "Date"?
        // Text(//0722901237
        //     DateFormat('dd-MMM-yy').format(dataGridCell.value),
        //   style: TextStyle(fontSize: 12),
        //   overflow: TextOverflow.ellipsis,
        // ):
        // Text(
        // dataGridCell.value.toString(),
        //   style: TextStyle(fontSize: 12),
        //   overflow: TextOverflow.ellipsis,
        // )
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
      alignment: (summaryColumn?.columnName == 'Credit' ||
              summaryColumn?.columnName == 'Debit' ||
              summaryColumn?.columnName == 'Amount')
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
      case "Debit":
        return Text(
          utilities.formatcurrency.format(dataGridCell.value ?? 0),
          style: TextStyle(fontSize: 12, color: Colors.red),
          overflow: TextOverflow.ellipsis,
        );
      case "Credit":
        return Text(
          utilities.formatcurrency.format(dataGridCell.value ?? 0),
          style: TextStyle(fontSize: 12, color: Colors.green),
          overflow: TextOverflow.ellipsis,
        );
      case "Balance":
      case "Amount":
        return Text(
          utilities.formatcurrency.format(dataGridCell.value ?? 0),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

class entries_Results {
  int? Code = 0;
  String? Desc = "Successful";
  List<entries>? Contents;
  entries_Results({
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.map((x) => x?.toMap()).toList(),
    };
  }

  factory entries_Results.fromMap(Map<String, dynamic> map) {
    return entries_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<entries>.from(
              (map['Contents']).map<entries?>(
                (x) => entries.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory entries_Results.fromJson(String source) =>
      entries_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
