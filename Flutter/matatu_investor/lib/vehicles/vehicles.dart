// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'vehicle_types.dart';

class Vehicles {
  String? Key;
  String? Vehicle_Number;
  //enum
  Vehicle_type? Vehicle_Type;

  double? Daily_Contribution;

  DateTime? Start_Date;

  String? Code;
  String? Id_Number;
  double? Arrears;

  double? Penalty;

  double? Parking;
  double? Parking_Fee;
  String? Category;
  //enum
  vehicle_Status? Status;
  double? Buses;
  double? Buses_Balance;
  double? Operation;
  double? Parking_Balance;

  DateTime? Last_Transaction_Date;
  double? Savings_and_xmas;
  double? Operation_1;
  double? Operation_2;
  double? Total_collection;
  Vehicles({
    this.Key,
    this.Vehicle_Number,
    this.Vehicle_Type,
    this.Daily_Contribution,
    this.Start_Date,
    this.Code,
    this.Id_Number,
    this.Arrears,
    this.Penalty,
    this.Parking,
    this.Parking_Fee,
    this.Category,
    this.Status,
    this.Buses,
    this.Buses_Balance,
    this.Operation,
    this.Parking_Balance,
    this.Last_Transaction_Date,
    this.Savings_and_xmas,
    this.Operation_1,
    this.Operation_2,
    this.Total_collection,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Vehicle_Number': Vehicle_Number,
      'Vehicle_Type': Vehicle_Type?.index,
      'Daily_Contribution': Daily_Contribution,
      'Start_Date': Start_Date?.millisecondsSinceEpoch,
      'Code': Code,
      'Id_Number': Id_Number,
      'Arrears': Arrears,
      'Penalty': Penalty,
      'Parking': Parking,
      'Parking_Fee': Parking_Fee,
      'Category': Category,
      'Status': Status?.index,
      'Buses': Buses,
      'Buses_Balance': Buses_Balance,
      'Operation': Operation,
      'Parking_Balance': Parking_Balance,
      'Last_Transaction_Date': Last_Transaction_Date?.millisecondsSinceEpoch,
      'Savings_and_xmas': Savings_and_xmas,
      'Operation_1': Operation_1,
      'Operation_2': Operation_2,
      'Total_collection': Total_collection,
    };
  }

  factory Vehicles.fromMap(Map<String, dynamic> map) {
    return Vehicles(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Vehicle_Number: map['Vehicle_Number'] != null
          ? map['Vehicle_Number'] as String
          : null,
      Vehicle_Type: map['Vehicle_Type'] != null
          ? Vehicle_type.values[(map['Vehicle_Type'] ?? 0) as int]
          : null,
      Daily_Contribution: map['Daily_Contribution'] != null
          ? map['Daily_Contribution'] as double
          : null,
      Start_Date: map['Start_Date'] != null
          ? DateTime.tryParse((map['Start_Date'] ?? 0))
          : null,
      Code: map['Code'] != null ? map['Code'] as String : null,
      Id_Number: map['Id_Number'] != null ? map['Id_Number'] as String : null,
      Arrears: map['Arrears'] != null ? map['Arrears'] as double : null,
      Penalty: map['Penalty'] != null ? map['Penalty'] as double : null,
      Parking: map['Parking'] != null ? map['Parking'] as double : null,
      Parking_Fee:
          map['Parking_Fee'] != null ? map['Parking_Fee'] as double : null,
      Category: map['Category'] != null ? map['Category'] as String : null,
      Status: map['Status'] != null
          ? vehicle_Status.values[(map['Status'] ?? 0) as int]
          : null,
      Buses: map['Buses'] != null ? map['Buses'] as double : null,
      Buses_Balance:
          map['Buses_Balance'] != null ? map['Buses_Balance'] as double : null,
      Operation: map['Operation'] != null ? map['Operation'] as double : null,
      Parking_Balance: map['Parking_Balance'] != null
          ? map['Parking_Balance'] as double
          : null,
      Last_Transaction_Date: map['Last_Transaction_Date'] != null
          ? DateTime.tryParse((map['Last_Transaction_Date'] ?? 0))
          : null,
      Savings_and_xmas: map['Savings_and_xmas'] != null
          ? map['Savings_and_xmas'] as double
          : null,
      Operation_1:
          map['Operation_1'] != null ? map['Operation_1'] as double : null,
      Operation_2:
          map['Operation_2'] != null ? map['Operation_2'] as double : null,
      Total_collection: map['Total_collection'] != null
          ? map['Total_collection'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicles.fromJson(String source) =>
      Vehicles.fromMap(json.decode(source) as Map<String, dynamic>);
}
