// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class member_info {
  String? Key;
  String? Member_No;
  String? Phone_No;
  bool? Logged_In;
  String? Password;
  bool? Pin_Changed;
  String First_Pin;
  member_info({
    this.Key,
    this.Member_No,
    this.Phone_No,
    this.Logged_In,
    this.Password,
    this.Pin_Changed,
    this.First_Pin = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Member_No': Member_No,
      'Phone_No': Phone_No,
      'Logged_In': Logged_In,
      'Password': Password,
      'Pin_Changed': Pin_Changed,
      'First_Pin': First_Pin,
    };
  }

  factory member_info.fromMap(Map<String, dynamic> map) {
    return member_info(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Member_No: map['Member_No'] != null ? map['Member_No'] as String : null,
      Phone_No: map['Phone_No'] != null ? map['Phone_No'] as String : null,
      Logged_In: map['Logged_In'] != null ? map['Logged_In'] as bool : null,
      Password: map['Password'] != null ? map['Password'] as String : null,
      Pin_Changed:
          map['Pin_Changed'] != null ? map['Pin_Changed'] as bool : null,
      First_Pin: (map['First_Pin'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory member_info.fromJson(String source) =>
      member_info.fromMap(json.decode(source) as Map<String, dynamic>);
}
