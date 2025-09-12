import 'invoice_item.dart';

enum InvoiceStatus {
  draft,
  sent,
  paid,
  overdue,
  cancelled,
}

extension InvoiceStatusExtension on InvoiceStatus {
  String get displayName {
    switch (this) {
      case InvoiceStatus.draft:
        return 'Draft';
      case InvoiceStatus.sent:
        return 'Sent';
      case InvoiceStatus.paid:
        return 'Paid';
      case InvoiceStatus.overdue:
        return 'Overdue';
      case InvoiceStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get value {
    return toString().split('.').last;
  }

  static InvoiceStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'draft':
        return InvoiceStatus.draft;
      case 'sent':
        return InvoiceStatus.sent;
      case 'paid':
        return InvoiceStatus.paid;
      case 'overdue':
        return InvoiceStatus.overdue;
      case 'cancelled':
        return InvoiceStatus.cancelled;
      default:
        return InvoiceStatus.draft;
    }
  }
}

class Invoice {
  final int? id;
  final String invoiceNumber;
  final int customerId;
  final DateTime issueDate;
  final DateTime dueDate;
  final double subtotal;
  final double taxRate;
  final double taxAmount;
  final double discountRate;
  final double discountAmount;
  final double totalAmount;
  final InvoiceStatus status;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<InvoiceItem>? items;

  Invoice({
    this.id,
    required this.invoiceNumber,
    required this.customerId,
    required this.issueDate,
    required this.dueDate,
    required this.subtotal,
    this.taxRate = 0.0,
    this.taxAmount = 0.0,
    this.discountRate = 0.0,
    this.discountAmount = 0.0,
    required this.totalAmount,
    this.status = InvoiceStatus.draft,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.items,
  });

  // Convert Invoice object to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoice_number': invoiceNumber,
      'customer_id': customerId,
      'issue_date': issueDate.toIso8601String(),
      'due_date': dueDate.toIso8601String(),
      'subtotal': subtotal,
      'tax_rate': taxRate,
      'tax_amount': taxAmount,
      'discount_rate': discountRate,
      'discount_amount': discountAmount,
      'total_amount': totalAmount,
      'status': status.value,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // Create Invoice object from Map (database result)
  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id']?.toInt(),
      invoiceNumber: map['invoice_number'] ?? '',
      customerId: map['customer_id']?.toInt() ?? 0,
      issueDate: DateTime.parse(map['issue_date']),
      dueDate: DateTime.parse(map['due_date']),
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
      taxRate: map['tax_rate']?.toDouble() ?? 0.0,
      taxAmount: map['tax_amount']?.toDouble() ?? 0.0,
      discountRate: map['discount_rate']?.toDouble() ?? 0.0,
      discountAmount: map['discount_amount']?.toDouble() ?? 0.0,
      totalAmount: map['total_amount']?.toDouble() ?? 0.0,
      status: InvoiceStatusExtension.fromString(map['status'] ?? 'draft'),
      notes: map['notes'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  // Create a copy of Invoice with updated fields
  Invoice copyWith({
    int? id,
    String? invoiceNumber,
    int? customerId,
    DateTime? issueDate,
    DateTime? dueDate,
    double? subtotal,
    double? taxRate,
    double? taxAmount,
    double? discountRate,
    double? discountAmount,
    double? totalAmount,
    InvoiceStatus? status,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<InvoiceItem>? items,
  }) {
    return Invoice(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      customerId: customerId ?? this.customerId,
      issueDate: issueDate ?? this.issueDate,
      dueDate: dueDate ?? this.dueDate,
      subtotal: subtotal ?? this.subtotal,
      taxRate: taxRate ?? this.taxRate,
      taxAmount: taxAmount ?? this.taxAmount,
      discountRate: discountRate ?? this.discountRate,
      discountAmount: discountAmount ?? this.discountAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      items: items ?? this.items,
    );
  }

  // Convert to JSON for API operations
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoiceNumber': invoiceNumber,
      'customerId': customerId,
      'issueDate': issueDate.toIso8601String(),
      'dueDate': dueDate.toIso8601String(),
      'subtotal': subtotal,
      'taxRate': taxRate,
      'taxAmount': taxAmount,
      'discountRate': discountRate,
      'discountAmount': discountAmount,
      'totalAmount': totalAmount,
      'status': status.value,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }

  // Create Invoice from JSON
  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id']?.toInt(),
      invoiceNumber: json['invoiceNumber'] ?? '',
      customerId: json['customerId']?.toInt() ?? 0,
      issueDate: DateTime.parse(json['issueDate']),
      dueDate: DateTime.parse(json['dueDate']),
      subtotal: json['subtotal']?.toDouble() ?? 0.0,
      taxRate: json['taxRate']?.toDouble() ?? 0.0,
      taxAmount: json['taxAmount']?.toDouble() ?? 0.0,
      discountRate: json['discountRate']?.toDouble() ?? 0.0,
      discountAmount: json['discountAmount']?.toDouble() ?? 0.0,
      totalAmount: json['totalAmount']?.toDouble() ?? 0.0,
      status: InvoiceStatusExtension.fromString(json['status'] ?? 'draft'),
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      items: json['items'] != null
          ? (json['items'] as List).map((item) => InvoiceItem.fromJson(item)).toList()
          : null,
    );
  }

  @override
  String toString() {
    return 'Invoice{id: $id, invoiceNumber: $invoiceNumber, customerId: $customerId, issueDate: $issueDate, dueDate: $dueDate, subtotal: $subtotal, taxRate: $taxRate, taxAmount: $taxAmount, discountRate: $discountRate, discountAmount: $discountAmount, totalAmount: $totalAmount, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Invoice &&
        other.id == id &&
        other.invoiceNumber == invoiceNumber &&
        other.customerId == customerId &&
        other.issueDate == issueDate &&
        other.dueDate == dueDate &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        invoiceNumber.hashCode ^
        customerId.hashCode ^
        issueDate.hashCode ^
        dueDate.hashCode ^
        status.hashCode;
  }

  // Calculate subtotal from items
  static double calculateSubtotal(List<InvoiceItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  // Calculate tax amount based on subtotal and tax rate
  static double calculateTaxAmount(double subtotal, double taxRate) {
    return subtotal * (taxRate / 100);
  }

  // Calculate discount amount based on subtotal and discount rate
  static double calculateDiscountAmount(double subtotal, double discountRate) {
    return subtotal * (discountRate / 100);
  }

  // Calculate total amount
  static double calculateTotalAmount(double subtotal, double taxAmount, double discountAmount) {
    return subtotal + taxAmount - discountAmount;
  }

  // Create invoice with calculated amounts
  factory Invoice.withCalculatedAmounts({
    int? id,
    required String invoiceNumber,
    required int customerId,
    required DateTime issueDate,
    required DateTime dueDate,
    required List<InvoiceItem> items,
    double taxRate = 0.0,
    double discountRate = 0.0,
    InvoiceStatus status = InvoiceStatus.draft,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) {
    final subtotal = calculateSubtotal(items);
    final taxAmount = calculateTaxAmount(subtotal, taxRate);
    final discountAmount = calculateDiscountAmount(subtotal, discountRate);
    final totalAmount = calculateTotalAmount(subtotal, taxAmount, discountAmount);

    return Invoice(
      id: id,
      invoiceNumber: invoiceNumber,
      customerId: customerId,
      issueDate: issueDate,
      dueDate: dueDate,
      subtotal: subtotal,
      taxRate: taxRate,
      taxAmount: taxAmount,
      discountRate: discountRate,
      discountAmount: discountAmount,
      totalAmount: totalAmount,
      status: status,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      items: items,
    );
  }

  // Check if invoice is overdue
  bool get isOverdue {
    return DateTime.now().isAfter(dueDate) && status != InvoiceStatus.paid;
  }

  // Get days until due date (negative if overdue)
  int get daysUntilDue {
    return dueDate.difference(DateTime.now()).inDays;
  }

  // Get formatted amounts
  String get formattedSubtotal => '\$${subtotal.toStringAsFixed(2)}';
  String get formattedTaxAmount => '\$${taxAmount.toStringAsFixed(2)}';
  String get formattedDiscountAmount => '\$${discountAmount.toStringAsFixed(2)}';
  String get formattedTotalAmount => '\$${totalAmount.toStringAsFixed(2)}';

  // Get formatted tax rate
  String get formattedTaxRate => '${taxRate.toStringAsFixed(1)}%';

  // Get formatted discount rate
  String get formattedDiscountRate => '${discountRate.toStringAsFixed(1)}%';

  // Check if invoice can be edited
  bool get canBeEdited {
    return status == InvoiceStatus.draft;
  }

  // Check if invoice can be sent
  bool get canBeSent {
    return status == InvoiceStatus.draft && items != null && items!.isNotEmpty;
  }

  // Check if invoice can be marked as paid
  bool get canBeMarkedAsPaid {
    return status == InvoiceStatus.sent || status == InvoiceStatus.overdue;
  }
}

