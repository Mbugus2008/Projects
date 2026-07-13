class Lease {
  final int? id;
  final int unitId;
  final int tenantId;
  final String startDate;
  final String endDate;
  final double monthlyRent;
  final double securityDeposit;
  final String? leaseTerms;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Lease({
    this.id,
    required this.unitId,
    required this.tenantId,
    required this.startDate,
    required this.endDate,
    required this.monthlyRent,
    required this.securityDeposit,
    this.leaseTerms,
    this.status = 'Active',
    this.createdAt,
    this.updatedAt,
  });

  factory Lease.fromJson(Map<String, dynamic> json) {
    return Lease(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}'),
      unitId:
          json['unitId'] is int
              ? json['unitId']
              : int.tryParse('${json['unitId']}') ?? 0,
      tenantId:
          json['tenantId'] is int
              ? json['tenantId']
              : int.tryParse('${json['tenantId']}') ?? 0,
      startDate: json['startDate']?.toString() ?? '',
      endDate: json['endDate']?.toString() ?? '',
      monthlyRent: _parseDouble(json['monthlyRent']) ?? 0.0,
      securityDeposit: _parseDouble(json['securityDeposit']) ?? 0.0,
      leaseTerms: json['leaseTerms']?.toString(),
      status: json['status']?.toString() ?? 'Active',
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: _parseDateTime(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'unitId': unitId,
      'tenantId': tenantId,
      'startDate': startDate,
      'endDate': endDate,
      'monthlyRent': monthlyRent,
      'securityDeposit': securityDeposit,
      'leaseTerms': leaseTerms,
      'status': status,
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
