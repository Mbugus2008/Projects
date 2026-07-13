class AppDocument {
  final int? id;
  final String title;
  final String? description;
  final String category;
  final int? propertyId;
  final int? unitId;
  final int? tenantId;
  final String? expirationDate;
  final String uploadDate;
  final String fileType;
  final int fileSize;
  final String filePath;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AppDocument({
    this.id,
    required this.title,
    this.description,
    required this.category,
    this.propertyId,
    this.unitId,
    this.tenantId,
    this.expirationDate,
    required this.uploadDate,
    this.fileType = 'PDF',
    this.fileSize = 0,
    this.filePath = '',
    this.createdAt,
    this.updatedAt,
  });

  factory AppDocument.fromJson(Map<String, dynamic> json) {
    return AppDocument(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}'),
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString(),
      category: json['category']?.toString() ?? '',
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
      expirationDate: json['expirationDate']?.toString(),
      uploadDate: json['uploadDate']?.toString() ?? '',
      fileType: json['fileType']?.toString() ?? 'PDF',
      fileSize:
          json['fileSize'] is int
              ? json['fileSize']
              : int.tryParse('${json['fileSize']}') ?? 0,
      filePath: json['filePath']?.toString() ?? '',
      createdAt: _parseDateTime(json['createdAt']),
      updatedAt: _parseDateTime(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'propertyId': propertyId,
      'unitId': unitId,
      'tenantId': tenantId,
      'expirationDate': expirationDate,
      'uploadDate': uploadDate,
      'fileType': fileType,
      'fileSize': fileSize,
      'filePath': filePath,
    };
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }
}
