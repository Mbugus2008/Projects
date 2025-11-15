// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:matatu/vehicles/vehicles.dart';

import '../loans/loan.dart';
import '../member/statistics.dart';

@JsonSerializable()
class member {
  String? Key;
  String? No;
  String? Name;
  String? Phone_No;
  String? ID_No;
  //enum
  gender? Gender;
  String? E_Mail;
  //enum
  status? Status;
  bool? Send_Parking_Notifications;
  bool? Logged_In;
  String? Password;
  List<Vehicles>? vehicles;
  List<Loan>? loans;
  Statistic? statistics;

  // New fields from API
  String? Customer_Posting_Group;
  String? Bank_Name;
  String? Bank_Account;
  int? Blocked;
  bool? BlockedSpecified;
  int? Loans;
  bool? LoansSpecified;
  int? Crew_Type;
  bool? Crew_TypeSpecified;
  String? Vehicle;

  member({
    this.Key,
    this.No,
    this.Name,
    this.Phone_No,
    this.ID_No,
    this.Gender,
    this.E_Mail,
    this.Status,
    this.Send_Parking_Notifications,
    this.Logged_In,
    this.Password,
    this.vehicles,
    this.loans = const [],
    this.statistics,
    this.Customer_Posting_Group,
    this.Bank_Name,
    this.Bank_Account,
    this.Blocked,
    this.BlockedSpecified,
    this.Loans,
    this.LoansSpecified,
    this.Crew_Type,
    this.Crew_TypeSpecified,
    this.Vehicle,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'No': No,
      'Name': Name,
      'Phone_No': Phone_No,
      'ID_No': ID_No,
      'Gender': Gender?.index,
      'E_Mail': E_Mail,
      'Status': Status?.index,
      'Send_Parking_Notifications': Send_Parking_Notifications,
      'Logged_In': Logged_In,
      'Password': Password,
      'vehicles': vehicles?.map((x) => x.toMap()).toList(),
      'loans': loans?.map((x) => x.toMap()).toList(),
      'statistics': statistics?.toMap(),
      'Customer_Posting_Group': Customer_Posting_Group,
      'Bank_Name': Bank_Name,
      'Bank_Account': Bank_Account,
      'Blocked': Blocked,
      'BlockedSpecified': BlockedSpecified,
      'Loans': Loans,
      'LoansSpecified': LoansSpecified,
      'Crew_Type': Crew_Type,
      'Crew_TypeSpecified': Crew_TypeSpecified,
      'Vehicle': Vehicle,
    };
  }

  factory member.fromMap(Map<String, dynamic> map) {
    return member(
      Key: map['Key'] != null ? map['Key'] as String : null,
      No: map['No'] != null ? map['No'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      Phone_No: map['Phone_No'] != null ? map['Phone_No'] as String : null,
      ID_No: map['ID_No'] != null ? map['ID_No'] as String : null,
      Gender: map['Gender'] != null
          ? gender.values[((map['Gender'] ?? 0) is double
              ? (map['Gender'] as double).toInt()
              : map['Gender'] as int)]
          : null,
      E_Mail: map['E_Mail'] != null ? map['E_Mail'] as String : null,
      Status: map['Status'] != null
          ? status.values[((map['Status'] ?? 0) is double
              ? (map['Status'] as double).toInt()
              : map['Status'] as int)]
          : null,
      Send_Parking_Notifications: map['Send_Parking_Notifications'] != null
          ? map['Send_Parking_Notifications'] as bool
          : null,
      Logged_In: map['Logged_In'] != null ? map['Logged_In'] as bool : null,
      Password: map['Password'] != null ? map['Password'] as String : null,
      vehicles: map['vehicles'] != null
          ? List<Vehicles>.from(
              (map['vehicles'] as List<dynamic>).map<Vehicles?>(
                (x) => Vehicles.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      loans: map['loans'] != null
          ? List<Loan>.from(
              (map['loans'] as List<int>).map<Loan?>(
                (x) => Loan.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      statistics: map['statistics'] != null
          ? Statistic.fromMap(map['statistics'] as Map<String, dynamic>)
          : null,
      Customer_Posting_Group: map['Customer_Posting_Group'] != null
          ? map['Customer_Posting_Group'] as String
          : null,
      Bank_Name: map['Bank_Name'] != null ? map['Bank_Name'] as String : null,
      Bank_Account:
          map['Bank_Account'] != null ? map['Bank_Account'] as String : null,
      Blocked: map['Blocked'] != null
          ? (map['Blocked'] is double
              ? (map['Blocked'] as double).toInt()
              : map['Blocked'] as int)
          : null,
      BlockedSpecified: map['BlockedSpecified'] != null
          ? map['BlockedSpecified'] as bool
          : null,
      Loans: map['Loans'] != null
          ? (map['Loans'] is double
              ? (map['Loans'] as double).toInt()
              : map['Loans'] as int)
          : null,
      LoansSpecified:
          map['LoansSpecified'] != null ? map['LoansSpecified'] as bool : null,
      Crew_Type: map['Crew_Type'] != null
          ? (map['Crew_Type'] is double
              ? (map['Crew_Type'] as double).toInt()
              : map['Crew_Type'] as int)
          : null,
      Crew_TypeSpecified: map['Crew_TypeSpecified'] != null
          ? map['Crew_TypeSpecified'] as bool
          : null,
      Vehicle: map['Vehicle'] != null ? map['Vehicle'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory member.fromJson(String source) =>
      member.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum gender {
  /// <remarks/>
  Male,

  /// <remarks/>
  Female,
}

enum status {
  /// <remarks/>
  Active,

  /// <remarks/>
  Dormant,
}

class member_model extends GetxController {
  member? Member;
}
