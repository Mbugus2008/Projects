class MaintenanceRequest {
  final int? id;
  final String title;
  final String description;
  final int propertyId;
  final int? unitId;
  final String priority;
  final String status;
  final String? assignedTo;
  final double? estimatedCost;
  final String requestDate;
  final String? completedDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MaintenanceRequest({
    this.id,
    required this.title,
    required this.description,
    required this.propertyId,
    this.unitId,
    required this.priority,
    this.status = 'Open',
    this.assignedTo,
    this.estimatedCost,
    required this.requestDate,
    this.completedDate,
    this.createdAt,
    this.updatedAt,
  });

  factory MaintenanceRequest.fromJson(Map<String, dynamic> json) {
    return MaintenanceRequest(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}'),
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      propertyId:
          json['propertyId'] is int
              ? json['propertyId']
              : int.tryParse('${json['propertyId']}') ?? 0,
      unitId:
          json['unitId'] is int
              ? json['unitId']
              : int.tryParse('${json['unitId']}'),
      priority: json['priority']?.toString() ?? 'Medium',
      status: json['status']?.toString() ?? 'Open',
      assignedTo: json['assignedTo']?.toString(),
      estimatedCost: _parseDouble(json['estimatedCost']),
      requestDate: json['requestDate']?.toString() ?? '',
      completedDate: json['completedDate']?.toString(),
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: _parseDateTime(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'propertyId': propertyId,
      'unitId': unitId,
      'priority': priority,
      'status': status,
      'assignedTo': assignedTo,
      'estimatedCost': estimatedCost,
      'requestDate': requestDate,
      'completedDate': completedDate,
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
