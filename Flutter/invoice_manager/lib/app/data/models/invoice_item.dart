class InvoiceItem {
  final int? id;
  final int? invoiceId;
  final String description;
  final double quantity;
  final double unitPrice;
  final double totalPrice;

  InvoiceItem({
    this.id,
    this.invoiceId,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });

  // Convert InvoiceItem object to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoice_id': invoiceId,
      'description': description,
      'quantity': quantity,
      'unit_price': unitPrice,
      'total_price': totalPrice,
    };
  }

  // Create InvoiceItem object from Map (database result)
  factory InvoiceItem.fromMap(Map<String, dynamic> map) {
    return InvoiceItem(
      id: map['id']?.toInt(),
      invoiceId: map['invoice_id']?.toInt(),
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      unitPrice: map['unit_price']?.toDouble() ?? 0.0,
      totalPrice: map['total_price']?.toDouble() ?? 0.0,
    );
  }

  // Create a copy of InvoiceItem with updated fields
  InvoiceItem copyWith({
    int? id,
    int? invoiceId,
    String? description,
    double? quantity,
    double? unitPrice,
    double? totalPrice,
  }) {
    return InvoiceItem(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  // Convert to JSON for API operations
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoiceId': invoiceId,
      'description': description,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'totalPrice': totalPrice,
    };
  }

  // Create InvoiceItem from JSON
  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      id: json['id']?.toInt(),
      invoiceId: json['invoiceId']?.toInt(),
      description: json['description'] ?? '',
      quantity: json['quantity']?.toDouble() ?? 0.0,
      unitPrice: json['unitPrice']?.toDouble() ?? 0.0,
      totalPrice: json['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'InvoiceItem{id: $id, invoiceId: $invoiceId, description: $description, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InvoiceItem &&
        other.id == id &&
        other.invoiceId == invoiceId &&
        other.description == description &&
        other.quantity == quantity &&
        other.unitPrice == unitPrice &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        invoiceId.hashCode ^
        description.hashCode ^
        quantity.hashCode ^
        unitPrice.hashCode ^
        totalPrice.hashCode;
  }

  // Calculate total price based on quantity and unit price
  static double calculateTotalPrice(double quantity, double unitPrice) {
    return quantity * unitPrice;
  }

  // Create a new InvoiceItem with calculated total price
  factory InvoiceItem.withCalculatedTotal({
    int? id,
    int? invoiceId,
    required String description,
    required double quantity,
    required double unitPrice,
  }) {
    return InvoiceItem(
      id: id,
      invoiceId: invoiceId,
      description: description,
      quantity: quantity,
      unitPrice: unitPrice,
      totalPrice: calculateTotalPrice(quantity, unitPrice),
    );
  }

  // Validate invoice item data
  bool get isValid {
    return description.isNotEmpty && 
           quantity > 0 && 
           unitPrice >= 0 && 
           totalPrice >= 0;
  }

  // Get formatted quantity string
  String get formattedQuantity {
    if (quantity == quantity.toInt()) {
      return quantity.toInt().toString();
    }
    return quantity.toStringAsFixed(2);
  }

  // Get formatted unit price string
  String get formattedUnitPrice {
    return '\$${unitPrice.toStringAsFixed(2)}';
  }

  // Get formatted total price string
  String get formattedTotalPrice {
    return '\$${totalPrice.toStringAsFixed(2)}';
  }
}

