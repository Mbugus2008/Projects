// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Results {
  int? Code = 0;
  String? Desc = "Successful";

  Results({
    this.Code,
    this.Desc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
    };
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      Code: (map['Code'] ?? map['code']) as int? ?? 0,
      Desc: (map['Desc'] ?? map['desc']) as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Results2<T extends Tomaps> {
  int? Code = 0;
  String? Desc = "Successful";
  T? Contents;
  Results2({
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
      'Contents': Contents?.toMap(), //
    };
  }

  factory Results2.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) createT) {
    return Results2(
        Code: (map['Code'] ?? map['code']) as int? ?? 0,
        Desc: (map['Desc'] ?? map['desc']) as String? ?? '',
        Contents: (map['Contents'] ?? map['contents']) != null
            ? createT((map['Contents'] ?? map['contents']))
            : null);
  }

  String toJson() => json.encode(toMap());

  factory Results2.fromJson(
          String source, T Function(Map<String, dynamic>) createT) =>
      Results2.fromMap(json.decode(source) as Map<String, dynamic>, createT);
}

abstract class Tomaps<T> {
  Map<String, dynamic> toMap();
}

class Results3<T extends Tomaps> {
  int? Code = 0;
  String? Desc = "Successful";
  List<T>? Contents;
  Results3({
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
      'Contents': Contents?.map((x) => x.toMap()).toList(),
    };
  }

  factory Results3.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) createT) {
    return Results3(
      Code: (map['Code'] ?? map['code']) as int? ?? 0,
      Desc: (map['Desc'] ?? map['desc']) as String? ?? '',
      Contents: (map['Contents'] ?? map['contents']) != null
          ? ((map['Contents'] ?? map['contents']) as List<dynamic>)
              .map((x) => createT(x as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Results3.fromJson(
          String source, T Function(Map<String, dynamic>) createT) =>
      Results3.fromMap(json.decode(source) as Map<String, dynamic>, createT);
}
