import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:smobile/myapp/accounts/Member.dart';

@JsonSerializable()
class Results {
  int? Code = 0;
  String? Desc = "Successful";
  String ? content = null;
  String ? Content = null;

  Results({
    this.Code,
    this.Desc,
    this.content,
    this.Content,
  });

  Map<String, dynamic> toMap() {
    return {
      'Code': Code,
      'Desc': Desc,
      'content': content,
      'Content': Content,
    };
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      Code: map['Code'],
      Desc: map['Desc'],
      content:json.encode(map['content']) ,
      Content:json.encode(map['Content']) ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source));
}
