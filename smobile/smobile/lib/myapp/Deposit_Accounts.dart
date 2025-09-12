import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class depositaccounts {
  String? Account;
  String? Name;
  String? keyword;
  status Type;
  double Balance;
  depositaccounts(
      this.Account, this.Name, this.keyword, this.Type, this.Balance);

  Map<String, dynamic> toMap() {
    return {
      'Account': Account,
      'Name': Name,
      'keyword': keyword,
      'Type': this.Type.index,
      'Balance': Balance,
    };
  }

  factory depositaccounts.fromMap(Map<String, dynamic> map) {
    return depositaccounts(
      map['Account'],
      map['Name'],
      map['keyword'],
      status.values.elementAt(map['Type']),
      map['Balance']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory depositaccounts.fromJson(String source) =>
      depositaccounts.fromMap(json.decode(source));
}

enum status { savings, loans }
