import 'dart:convert';

class MemberAccount {
  String? Key;
  String? No;
  String? Name;
  String? Search_Name;
  String? Name_2;
  double? Net_Change;
  bool? Net_ChangeSpecified;
  int? Posting_Type;
  bool? Posting_TypeSpecified;
  String? Member_No;

  MemberAccount({
    this.Key,
    this.No,
    this.Name,
    this.Search_Name,
    this.Name_2,
    this.Net_Change,
    this.Net_ChangeSpecified,
    this.Posting_Type,
    this.Posting_TypeSpecified,
    this.Member_No,
  });

  Map<String, dynamic> toMap() {
    return {
      'Key': Key,
      'No': No,
      'Name': Name,
      'Search_Name': Search_Name,
      'Name_2': Name_2,
      'Net_Change': Net_Change,
      'Net_ChangeSpecified': Net_ChangeSpecified,
      'Posting_Type': Posting_Type,
      'Posting_TypeSpecified': Posting_TypeSpecified,
      'Member_No': Member_No,
    };
  }

  factory MemberAccount.fromMap(Map<String, dynamic> map) {
    return MemberAccount(
      Key: map['Key'],
      No: map['No'],
      Name: map['Name'],
      Search_Name: map['Search_Name'],
      Name_2: map['Name_2'],
      Net_Change: map['Net_Change']?.toDouble(),
      Net_ChangeSpecified: map['Net_ChangeSpecified'],
      Posting_Type: map['Posting_Type'] is double
          ? (map['Posting_Type'] as double).toInt()
          : map['Posting_Type'] as int?,
      Posting_TypeSpecified: map['Posting_TypeSpecified'],
      Member_No: map['Member_No'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberAccount.fromJson(String source) =>
      MemberAccount.fromMap(json.decode(source));
}

class MemberAccountsResults {
  int? Code;
  String? Desc;
  List<MemberAccount>? Contents;

  MemberAccountsResults({
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return {
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.map((x) => x.toMap()).toList(),
    };
  }

  factory MemberAccountsResults.fromMap(Map<String, dynamic> map) {
    return MemberAccountsResults(
      Code: map['Code'] is double
          ? (map['Code'] as double).toInt()
          : map['Code'] as int?,
      Desc: map['Desc'],
      Contents: map['Contents'] != null
          ? List<MemberAccount>.from(
              (map['Contents'] as List).map((x) => MemberAccount.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberAccountsResults.fromJson(String source) =>
      MemberAccountsResults.fromMap(json.decode(source));
}
