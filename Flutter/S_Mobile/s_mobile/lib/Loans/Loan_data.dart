// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:s_mobile/Loans/Loan.dart';

class loan_Results {
  int? Code = 0;
  String? Desc = "Successful";
  List<Loan>? Contents;
  loan_Results({
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

  factory loan_Results.fromMap(Map<String, dynamic> map) {
    return loan_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<Loan>.from(
              (map['Contents']).map<Loan?>(
                (x) => Loan.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory loan_Results.fromJson(String source) =>
      loan_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
