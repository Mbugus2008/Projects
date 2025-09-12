// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:matatu/loans/loan.dart';
import 'package:matatu/member/member.dart';
import 'package:matatu/member/statistics.dart';

class Member_Results {
  int? Code = 0;
  String? Desc = "Successful";
  member? Contents;
  Member_Results({
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

  factory Member_Results.fromMap(Map<String, dynamic> map) {
    return Member_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? member.fromMap(map['Contents'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Member_Results.fromJson(String source) =>
      Member_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}


class Statistics_Results {
  int? Code = 0;
  String? Desc = "Successful";
  Statistic? Contents;
  Statistics_Results({
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

  factory Statistics_Results.fromMap(Map<String, dynamic> map) {
    return Statistics_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? Statistic.fromMap(map['Contents'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Statistics_Results.fromJson(String source) =>
      Statistics_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Loans_Results {
  int? Code = 0;
  String? Desc = "Successful";
  List<Loan>? Contents;
  Loans_Results({
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

  factory Loans_Results.fromMap(Map<String, dynamic> map) {
    return Loans_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<Loan>.from(
              (map['Contents'] as List<dynamic>).map<Loan?>(
                (x) => Loan.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Loans_Results.fromJson(String source) =>
      Loans_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
