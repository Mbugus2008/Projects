class Property {
  final int? id;
  final String name;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String? country;
  final String propertyType;
  final int totalUnits;
  final double? purchasePrice;
  final double? marketValue;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Property({
    this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    this.country,
    required this.propertyType,
    required this.totalUnits,
    this.purchasePrice,
    this.marketValue,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}'),
      name: json['name']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      city: json['city']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      zipCode: json['zipCode']?.toString() ?? '',
      country: json['country']?.toString(),
      propertyType: json['propertyType']?.toString() ?? '',
      totalUnits:
          json['totalUnits'] is int
              ? json['totalUnits']
              : int.tryParse('${json['totalUnits']}') ?? 0,
      purchasePrice: _parseDouble(json['purchasePrice']),
      marketValue: _parseDouble(json['marketValue']),
      description: json['description']?.toString(),
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: _parseDateTime(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'propertyType': propertyType,
      'totalUnits': totalUnits,
      'purchasePrice': purchasePrice,
      'marketValue': marketValue,
      'description': description,
    };
  }

  Property copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? propertyType,
    int? totalUnits,
    double? purchasePrice,
    double? marketValue,
    String? description,
  }) {
    return Property(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      propertyType: propertyType ?? this.propertyType,
      totalUnits: totalUnits ?? this.totalUnits,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      marketValue: marketValue ?? this.marketValue,
      description: description ?? this.description,
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    return double.tryParse(value.toString());
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}
