// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class NextOfKin {
  String? Key;
  String? Account_No;
  String? Type; // Next_of_Kin, Spouse, Benevolent_Beneficiary
  String? Name;
  String? ID_No;
  String? Address;
  String? Relationship;
  double? PercentAllocation;
  bool? Beneficiary;
  DateTime? Date_of_Birth;
  String? Telephone;
  String? Fax;
  String? Email;

  NextOfKin({
    this.Key,
    this.Account_No,
    this.Type,
    this.Name,
    this.ID_No,
    this.Address,
    this.Relationship,
    this.PercentAllocation,
    this.Beneficiary,
    this.Date_of_Birth,
    this.Telephone,
    this.Fax,
    this.Email,
  });

  factory NextOfKin.fromMap(Map<String, dynamic> map) {
    return NextOfKin(
      Key: map['Key'] as String?,
      Account_No: map['Account_No'] as String?,
      Type: _parseType(map['Type']),
      Name: map['Name'] as String?,
      ID_No: map['ID_No'] as String?,
      Address: map['Address'] as String?,
      Relationship: map['Relationship'] as String?,
      PercentAllocation: (map['PercentAllocation'] as num?)?.toDouble(),
      Beneficiary: map['Beneficiary'] as bool?,
      Date_of_Birth: map['Date_of_Birth'] != null
          ? DateTime.tryParse(map['Date_of_Birth'].toString())
          : null,
      Telephone: map['Telephone'] as String?,
      Fax: map['Fax'] as String?,
      Email: map['Email'] as String?,
    );
  }

  static String? _parseType(dynamic val) {
    if (val == null) return null;
    if (val is int) {
      const types = ['Next_of_Kin', 'Spouse', 'Benevolent_Beneficiary'];
      return (val >= 0 && val < types.length) ? types[val] : null;
    }
    return val.toString();
  }

  static List<NextOfKin> parseList(dynamic json) {
    if (json == null) return [];
    if (json is! List) return [];
    return json
        .whereType<Map<String, dynamic>>()
        .map((e) => NextOfKin.fromMap(e))
        .toList();
  }
}
