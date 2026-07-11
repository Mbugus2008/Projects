import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../common/enums.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@JsonSerializable()
class Account {
  String? Key;
  String? No;
  String? Name;
  String? ID_No;
  //enum
  blocked? Blocked;
  String? Phone_No;
  double? Balance;
  String? Product_Type;
  String? ATM_No;
  String? MPESA_Mobile_No;
  String? Member_No;
  //enum
  status? Status;
  String? Product_Name;
  String? Employee_Code;
  //enum
  product_Category? Product_Category;
  String? E_Mail;
  String? Agent_Code;

  /// From the API: "transaction_Type": 36
  int? transaction_Type;

  List<TransactionType> get transTypes {
    // If API provided a transaction_Type, use it directly
    if (transaction_Type != null && transaction_Type! > 0) {
      final type = safeTransactionType(transaction_Type!);
      if (type != null) return [type];
    }
    // Fallback to legacy hardcoded mapping
    List<TransactionType> types = [];
    if (No == null) return types;
    String? acc = No!.toUpperCase();
    switch (acc) {
      case 'DEPOSITS':
        return [TransactionType.Deposit_Contribution];
      case 'SHARES':
        return [TransactionType.Shares_Capital];
      case 'LOANS':
        return [
          TransactionType.Loan,
          TransactionType.Repayment,
          TransactionType.Interest_Due,
          TransactionType.Interest_Paid
        ];
    }
    return types;
  }

  Account({
    this.Key,
    this.No,
    this.Name,
    this.ID_No,
    this.Blocked,
    this.Phone_No,
    this.Balance,
    this.Product_Type,
    this.ATM_No,
    this.MPESA_Mobile_No,
    this.Member_No,
    this.Status,
    this.Product_Name,
    this.Employee_Code,
    this.Product_Category,
    this.E_Mail,
    this.Agent_Code,
    this.transaction_Type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'No': No,
      'Name': Name,
      'ID_No': ID_No,
      'Blocked': Blocked?.index,
      'Phone_No': Phone_No,
      'Balance': Balance,
      'Product_Type': Product_Type,
      'ATM_No': ATM_No,
      'MPESA_Mobile_No': MPESA_Mobile_No,
      'Member_No': Member_No,
      'Status': Status?.index,
      'Product_Name': Product_Name,
      'Employee_Code': Employee_Code,
      'Product_Category': Product_Category?.index,
      'E_Mail': E_Mail,
      'Agent_Code': Agent_Code,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      Key: map['Key'] != null ? map['Key'] as String : null,
      No: (map['No'] ?? map['Account']) as String?,
      Name: map['Name'] != null ? map['Name'] as String : null,
      ID_No: map['ID_No'] != null ? map['ID_No'] as String : null,
      Blocked: map['Blocked'] != null
          ? blocked?.values[(map['Blocked'] ?? 0) as int]
          : null,
      Phone_No: map['Phone_No'] != null ? map['Phone_No'] as String : null,
      Balance: map['Balance'] != null ? map['Balance'] as double : null,
      Product_Type:
          map['Product_Type'] != null ? map['Product_Type'] as String : null,
      ATM_No: map['ATM_No'] != null ? map['ATM_No'] as String : null,
      MPESA_Mobile_No: map['MPESA_Mobile_No'] != null
          ? map['MPESA_Mobile_No'] as String
          : null,
      Member_No: map['Member_No'] != null ? map['Member_No'] as String : null,
      Status: map['Status'] != null
          ? status?.values[(map['Status'] ?? 0) as int]
          : null,
      Product_Name:
          map['Product_Name'] != null ? map['Product_Name'] as String : null,
      Employee_Code:
          map['Employee_Code'] != null ? map['Employee_Code'] as String : null,
      Product_Category: map['Product_Category'] != null
          ? product_Category?.values[(map['Product_Category'] ?? 0) as int]
          : (map['Type'] as int?) == 1
              ? product_Category.Share_Capital
              : null,
      E_Mail: map['E_Mail'] != null ? map['E_Mail'] as String : null,
      Agent_Code:
          map['Agent_Code'] != null ? map['Agent_Code'] as String : null,
      transaction_Type:
          map['transaction_Type'] as int? ?? map['transactionType'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Parse NAV/Bridge DepositAccount format:
  /// {"Account":"Mobile","Name":"Mobile Money","keyword":"...","Balance":0.88,...}
  factory Account.fromDepositMap(Map<String, dynamic> map) {
    return Account(
      No: map['Account'] ?? map['No'],
      Name: map['Name'],
      Balance: (map['Balance'] as num?)?.toDouble(),
      Product_Name: map['Name'],
      Key: map['Key'] ?? map['keyword'],
      transaction_Type:
          map['transaction_Type'] as int? ?? map['transactionType'] as int?,
      Product_Category:
          (map['Type'] as int?) == 1 ? product_Category.Share_Capital : null,
    );
  }
}

class accountsDataSource extends DataGridSource {
  accountsDataSource({required List<Account> Entries}) {
    dataGridRows =
        Entries.map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Acc', value: dataGridRow.No),
              DataGridCell<String>(columnName: 'Name', value: dataGridRow.Name),
              DataGridCell<double>(
                  columnName: 'Balance', value: dataGridRow.Balance),
            ])).toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: (dataGridCell.columnName == 'Balance')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: .0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.visible,
          ));
    }).toList());
  }
}
