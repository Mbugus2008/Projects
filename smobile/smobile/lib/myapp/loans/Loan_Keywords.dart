import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class loan_Keywords {
  String? Key;

  String? Keyword;

  String? Loan_Code;

  int? Destination_Type;

  loan_Keywords({
    required this.Key,
    required this.Keyword,
    required this.Loan_Code,
    required this.Destination_Type,
  });

  Map<String, dynamic> toMap() {
    return {
      'Key': Key,
      'Keyword': Keyword,
      'Loan_Code': Loan_Code,
      'Destination_Type': Destination_Type,
    };
  }

  factory loan_Keywords.fromMap(Map<String, dynamic> map) {
    return loan_Keywords(
      Key: map['Key'],
      Keyword: map['Keyword'],
      Loan_Code: map['Loan_Code'],
      Destination_Type: map['Destination_Type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory loan_Keywords.fromJson(String source) =>
      loan_Keywords.fromMap(json.decode(source));
}

/*enum destination_Type {
  /// <remarks/>
  @JsonValue("0")
  None,

  /// <remarks/>
  @JsonValue("1")
  Loan_Repayment,

  /// <remarks/>
  @JsonValue("2")
  Shares_Capital,

  /// <remarks/>
  @JsonValue("3")
  Deposit_Contribution,

  /// <remarks/>
  @JsonValue("4")
  Toto_Savings,

  /// <remarks/>
  @JsonValue("5")
  Chrismas_savings,

  /// <remarks/>
  @JsonValue("")
  Plaza_shares,

  /// <remarks/>
  @JsonValue("6")
  Plaza_Contribution,

  /// <remarks/>
  @JsonValue("7")
  Sms_Savings,

  /// <remarks/>
  @JsonValue("8")
  RRF,
}*/
