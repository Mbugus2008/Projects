// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'vehicle_types.dart';

class Vehicles {
  String? Key;
  String? Vehicle_Number;
  //enum
  Vehicle_type? Vehicle_Type;
  bool? Vehicle_TypeSpecified;

  double? Daily_Contribution;
  bool? Daily_ContributionSpecified;

  DateTime? Start_Date;
  bool? Start_DateSpecified;

  String? Code;
  String? Name;
  String? Id_Number;
  double? Arrears;

  double? Penalty;

  double? Parking;
  double? Parking_Fee;
  String? Category;
  //enum
  vehicle_Status? Status;
  bool? StatusSpecified;
  String? Fleet_No;
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
    this.Vehicle_TypeSpecified,
    this.Daily_Contribution,
    this.Daily_ContributionSpecified,
    this.Start_Date,
    this.Start_DateSpecified,
    this.Code,
    this.Name,
    this.Id_Number,
    this.Arrears,
    this.Penalty,
    this.Parking,
    this.Parking_Fee,
    this.Category,
    this.Status,
    this.StatusSpecified,
    this.Fleet_No,
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
      'Vehicle_TypeSpecified': Vehicle_TypeSpecified,
      'Daily_Contribution': Daily_Contribution,
      'Daily_ContributionSpecified': Daily_ContributionSpecified,
      'Start_Date': Start_Date?.millisecondsSinceEpoch,
      'Start_DateSpecified': Start_DateSpecified,
      'Code': Code,
      'Name': Name,
      'Id_Number': Id_Number,
      'Arrears': Arrears,
      'Penalty': Penalty,
      'Parking': Parking,
      'Parking_Fee': Parking_Fee,
      'Category': Category,
      'Status': Status?.index,
      'StatusSpecified': StatusSpecified,
      'Fleet_No': Fleet_No,
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
      Vehicle_TypeSpecified: map['Vehicle_TypeSpecified'] != null
          ? map['Vehicle_TypeSpecified'] as bool
          : null,
      Daily_Contribution: map['Daily_Contribution'] != null
          ? (map['Daily_Contribution'] is int
              ? (map['Daily_Contribution'] as int).toDouble()
              : map['Daily_Contribution'] as double)
          : null,
      Daily_ContributionSpecified: map['Daily_ContributionSpecified'] != null
          ? map['Daily_ContributionSpecified'] as bool
          : null,
      Start_Date: map['Start_Date'] != null
          ? DateTime.tryParse(map['Start_Date'].toString())
          : null,
      Start_DateSpecified: map['Start_DateSpecified'] != null
          ? map['Start_DateSpecified'] as bool
          : null,
      Code: map['Code'] != null ? map['Code'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
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
      StatusSpecified: map['StatusSpecified'] != null
          ? map['StatusSpecified'] as bool
          : null,
      Fleet_No: map['Fleet_No'] != null ? map['Fleet_No'] as String : null,
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

// Request class for getting member vehicles
class VehiclesRequest {
  String? Member;

  VehiclesRequest({this.Member});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Member': Member,
    };
  }

  factory VehiclesRequest.fromMap(Map<String, dynamic> map) {
    return VehiclesRequest(
      Member: map['Member'] != null ? map['Member'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehiclesRequest.fromJson(String source) =>
      VehiclesRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

// Results class for vehicles API response
class Vehicles_Results {
  int? Code;
  String? Desc;
  List<Vehicles>? Contents;

  Vehicles_Results({
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.map((x) => x.toMap()).toList(),
    };
  }

  factory Vehicles_Results.fromMap(Map<String, dynamic> map) {
    return Vehicles_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<Vehicles>.from(
              (map['Contents'] as List<dynamic>).map<Vehicles>(
                (x) => Vehicles.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicles_Results.fromJson(String source) =>
      Vehicles_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
