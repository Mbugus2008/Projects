import 'dart:convert';

import 'package:trimline_sms_reader/t__results.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class Dimensions implements Tomaps {
  String? Key;
  String? Code;
  String? Name;
  String? Map_to_IC_Dimension_Value_Code;
  String? Consolidation_Code;
  String? Dimension_Code;
  Dimensions({
    this.Key,
    this.Code,
    this.Name,
    this.Map_to_IC_Dimension_Value_Code,
    this.Consolidation_Code,
    this.Dimension_Code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Code': Code,
      'Name': Name,
      'Map_to_IC_Dimension_Value_Code': Map_to_IC_Dimension_Value_Code,
      'Consolidation_Code': Consolidation_Code,
      'Dimension_Code': Dimension_Code,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Code: map['Code'] != null ? map['Code'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      Map_to_IC_Dimension_Value_Code:
          map['Map_to_IC_Dimension_Value_Code'] != null
              ? map['Map_to_IC_Dimension_Value_Code'] as String
              : null,
      Consolidation_Code: map['Consolidation_Code'] != null
          ? map['Consolidation_Code'] as String
          : null,
      Dimension_Code: map['Dimension_Code'] != null
          ? map['Dimension_Code'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) =>
      Dimensions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  fromMap_table(Map<String, dynamic> map) {
    return Dimensions(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Code: map['Code'] != null ? map['Code'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      Map_to_IC_Dimension_Value_Code:
          map['Map_to_IC_Dimension_Value_Code'] != null
              ? map['Map_to_IC_Dimension_Value_Code'] as String
              : null,
      Consolidation_Code: map['Consolidation_Code'] != null
          ? map['Consolidation_Code'] as String
          : null,
      Dimension_Code: map['Dimension_Code'] != null
          ? map['Dimension_Code'] as String
          : null,
    );
  }
}
