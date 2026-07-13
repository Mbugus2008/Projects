class Transaction {
  final int? id;
  final String transactionDate;
  final double amount;
  final String category;
  final String type;
  final int? propertyId;
  final int? unitId;
  final int? tenantId;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Transaction({
    this.id,
    required this.transactionDate,
    required this.amount,
    required this.category,
    required this.type,
    this.propertyId,
    this.unitId,
    this.tenantId,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}'),
      transactionDate: json['transactionDate']?.toString() ?? '',
      amount: _parseDouble(json['amount']) ?? 0.0,
      category: json['category']?.toString() ?? '',
      type: json['type']?.toString() ?? 'Expense',
      propertyId:
          json['propertyId'] is int
              ? json['propertyId']
              : int.tryParse('${json['propertyId']}'),
      unitId:
          json['unitId'] is int
              ? json['unitId']
              : int.tryParse('${json['unitId']}'),
      tenantId:
          json['tenantId'] is int
              ? json['tenantId']
              : int.tryParse('${json['tenantId']}'),
      description: json['description']?.toString(),
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: _parseDateTime(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'transactionDate': transactionDate,
      'amount': amount,
      'category': category,
      'type': type,
      'propertyId': propertyId,
      'unitId': unitId,
      'tenantId': tenantId,
      'description': description,
    };
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
