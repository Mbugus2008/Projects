import 'package:intl/intl.dart';
import 'package:kanisa/Network/results.dart';
import 'package:kanisa/Utils/util.dart';

class Customer implements  Tomaps {
  String? Key;
  String? No;
  String? Name;
  String? Phone_No;
  String?  Global_Dimension_1_Code;
  String? Global_Dimension_2_Code;
  String? E_Mail;
  double? Balance_LCY;
String? Occupation;
DateTime? Date_of_Birth ;
DateTime? Baptism_Date ;
String? Baptised_by ;
bool? Confirmed ;
String? Other_Information ;
  gender? Gender ;
  List<MemberGroups>? MembersGroups;
  Customer({
    this.Key,
    this.No,
    this.Name,

    this.Phone_No,
    this.Global_Dimension_1_Code,

    this.Global_Dimension_2_Code,
    this.E_Mail,

    this.Balance_LCY,
    this.Occupation,

    this.Date_of_Birth,
    
    this.Baptism_Date,
  
    this.Baptised_by,
     this.Confirmed,
 
    this.Other_Information,

    this.Gender,
    this.MembersGroups,
  });


  @override
  String toString() {
    return '$No $Name $Phone_No $Global_Dimension_1_Code $Global_Dimension_2_Code $Occupation $Confirmed' ;
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      Key: map['Key'] as String?,
      Name: map['Name'] as String?,
      Phone_No: map['Phone_No'] as String?,
      Global_Dimension_1_Code: map['Global_Dimension_1_Code'] as String?,
      Global_Dimension_2_Code: map['Global_Dimension_2_Code'] as String?,
      E_Mail: map['E_Mail'] as String?,
      Balance_LCY: map['Balance_LCY']?.toDouble(),
      Occupation: map['Occupation'] as String?,
      Confirmed: map['Confirmed'] as bool?,
      Date_of_Birth: map['Date_of_Birth'] is String 
          ? DateFormat('dd-MM-yyyy').parse(map['Date_of_Birth']) 
          : map['Date_of_Birth'] as DateTime?,
      Baptism_Date: map['Baptism_Date'] is String
          ? DateFormat('dd-MM-yyyy').parse(map['Baptism_Date'])
          : map['Baptism_Date'] as DateTime?,
      Baptised_by: map['Baptised_by'] as String?,
      Other_Information: map['Other_Information'] as String?,
      Gender: map['Gender'] is String 
          ? gender.values.firstWhere(
              (e) => e.toString() == 'gender.${map['Gender']}',
              orElse: () => gender._blank_,
            )
          : map['Gender'] as gender?,
      MembersGroups: map['MembersGroups'] != null 
          ? List<MemberGroups>.from(
              (map['MembersGroups'] as List).map(
                (x) => x is Map<String, dynamic> 
                    ? MemberGroups.fromMap(x) 
                    : x as MemberGroups
              )
            )
          : null,
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      Key: json['Key'],
      No: json['No'],
      Name: json['Name'],
      Occupation: json['Occupation'],
      Phone_No: json['Phone_No'],
      Global_Dimension_1_Code: json['Global_Dimension_1_Code'],
      Global_Dimension_2_Code: json['Global_Dimension_2_Code'],
      E_Mail: json['E_Mail'],
      Balance_LCY: json['Balance_LCY']?.toDouble(),
      Confirmed: json['Confirmed'],
      Date_of_Birth: json['Date_of_Birth'] != null ?  parseDate(json['Date_of_Birth']) : null,
      Baptism_Date: json['Baptism_Date'] != null ? parseDate(json['Baptism_Date']) : null,
      Baptised_by: json['Baptised_by'],
      Other_Information: json['Other_Information'],
       Gender: json['Gender'] != null && json['Gender'] is int
      ? gender.values.elementAt(json['Gender'])
      : gender._blank_,
      MembersGroups: json['MembersGroups'] != null ? List<MemberGroups>.from(json['MembersGroups']?.map((x) => MemberGroups.fromJson(x))) : null,
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'Key': Key,
      'No': No,
      'Name': Name,
      
      'Phone_No': Phone_No,
      'Occupation': Occupation,
      'Global_Dimension_1_Code': Global_Dimension_1_Code,
      'Global_Dimension_2_Code': Global_Dimension_2_Code,
      'E_Mail': E_Mail,
      'Balance_LCY': Balance_LCY,
      'Confirmed': Confirmed,
      'Date_of_Birth': Date_of_Birth != null ? formattedMMDD.format(Date_of_Birth!) : null,
      'Baptism_Date': Baptism_Date != null ? formattedMMDD.format(Baptism_Date!) : null,
      'Baptised_by': Baptised_by,
      'Other_Information': Other_Information,
      'Gender': Gender != null ? Gender!.index : null,
      'MembersGroups': MembersGroups != null ? MembersGroups!.map((e) => e.toJson()).toList() : null,
    };
  }
  
  @override
  Map<String, dynamic> toMap() {

    
     return <String, dynamic>{
      'Key': Key,
      'No': No,
      'Name': Name,
      'Occupation': Occupation,
      'Phone_No': Phone_No,
      'Global_Dimension_1_Code': Global_Dimension_1_Code,
      'Global_Dimension_2_Code': Global_Dimension_2_Code,
      'E_Mail': E_Mail,
      'Balance_LCY': Balance_LCY,
      'Confirmed': Confirmed,
      'Date_of_Birth': Date_of_Birth != null ? formattedDDMM.format(Date_of_Birth!) : null,
      'Baptism_Date': Baptism_Date != null ? formattedDDMM.format(Baptism_Date!) : null,
      'Baptised_by': Baptised_by,
      'Other_Information': Other_Information,
      'Gender': Gender != null ? Gender!.index : null,
      'MembersGroups': MembersGroups != null ? MembersGroups!.map((e) => e.toMap()).toList() : null,
     };
  }
}

class MemberGroups implements Tomaps {
  String? Customer;
  String? Global_Dimension_2_Code;
  List<String>? Group_Codes;

  MemberGroups({
    this.Customer,
    this.Global_Dimension_2_Code,
    this.Group_Codes,
  });

  factory MemberGroups.fromMap(Map<String, dynamic> map) {
    return MemberGroups(
      Customer: map['Customer'] as String?,
      Global_Dimension_2_Code: map['Global_Dimension_2_Code'] as String?,
      Group_Codes: map['Group_Codes'] != null ? List<String>.from(map['Group_Codes']) : null,
    );
  }

  factory MemberGroups.fromJson(Map<String, dynamic> json) {
    return MemberGroups(
      Customer: json['Customer'] as String?,
      Global_Dimension_2_Code: json['Global_Dimension_2_Code'] as String?,
      Group_Codes: json['Group_Codes'] != null ? List<String>.from(json['Group_Codes']) : null,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'Customer': Customer,
      'Global_Dimension_2_Code': Global_Dimension_2_Code,
      'Group_Codes': Group_Codes,
    };
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }
}

  enum gender {
     _blank_,
     Male,
     Female,
 }
