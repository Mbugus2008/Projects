// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:matatu/member/ledger/ledgers.dart';

class Ledger_Results {
  int? Code = 0;
  String? Desc = "Successful";
  List<ledgers>? Contents;
  Ledger_Results({
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

  factory Ledger_Results.fromMap(Map<String, dynamic> map) {
    return Ledger_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<ledgers>.from(
              (map['Contents'] as List<dynamic>).map<ledgers?>(
                (x) => ledgers.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ledger_Results.fromJson(String source) =>
      Ledger_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
