// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:s_mobile/members/member.dart';

import 'accounts.dart';

class account_Results {
  int? Code = 0;
  String? Desc = "Successful";
  List<Account>? Contents;
  account_Results({
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.map((x) => x?.toMap()).toList(),
    };
  }

  factory account_Results.fromMap(Map<String, dynamic> map) {
    return account_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<Account>.from(
              (map['Contents']).map<Account?>(
                (x) => Account.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory account_Results.fromJson(String source) =>
      account_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class member_Results {
  int? Code = 0;
  String? Desc = "Successful";
  Member? Contents;
  member_Results({
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

  factory member_Results.fromMap(Map<String, dynamic> map) {
    return member_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? Member.fromMap(map['Contents'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory member_Results.fromJson(String source) =>
      member_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
