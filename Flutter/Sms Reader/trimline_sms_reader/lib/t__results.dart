// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:trimline_sms_reader/transaction.dart';

class t_Results {
  int? Code = 0;
  String? Desc = "Successful";
  transaction? Contents;
  t_Results({
    int? code,
    String? desc,
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.toMap(),
    };
  }

  factory t_Results.fromMap(Map<String, dynamic> map) {
    return t_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? transaction.fromMap(map['Contents'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory t_Results.fromJson(String source) =>
      t_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Results<T extends Tomaps> {
  int? Code = 0;
  String? Desc = "Successful";
  List<T>? Contents;
  Results({
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

  factory Results.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) createT) {
    return Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? (map['Contents'] as List<dynamic>)
              .map((x) => createT(x as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(
          String source, T Function(Map<String, dynamic>) createT) =>
      Results.fromMap(json.decode(source) as Map<String, dynamic>, createT);
}

abstract class Tomaps<T> {
  Map<String, dynamic> toMap();
  T fromMap_table(Map<String, dynamic> map);
}
