enum PaymentMethod {
  cash,
  check,
  bankTransfer,
  creditCard,
  debitCard,
  paypal,
  other,
}

extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.check:
        return 'Check';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.debitCard:
        return 'Debit Card';
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.other:
        return 'Other';
    }
  }

  String get value {
    return toString().split('.').last;
  }

  static PaymentMethod fromString(String method) {
    switch (method.toLowerCase()) {
      case 'cash':
        return PaymentMethod.cash;
      case 'check':
        return PaymentMethod.check;
      case 'banktransfer':
        return PaymentMethod.bankTransfer;
      case 'creditcard':
        return PaymentMethod.creditCard;
      case 'debitcard':
        return PaymentMethod.debitCard;
      case 'paypal':
        return PaymentMethod.paypal;
      case 'other':
        return PaymentMethod.other;
      default:
        return PaymentMethod.cash;
    }
  }
}

class Payment {
  final int? id;
  final int invoiceId;
  final double amount;
  final PaymentMethod paymentMethod;
  final DateTime paymentDate;
  final String? referenceNumber;
  final String? notes;
  final DateTime createdAt;

  Payment({
    this.id,
    required this.invoiceId,
    required this.amount,
    required this.paymentMethod,
    required this.paymentDate,
    this.referenceNumber,
    this.notes,
    required this.createdAt,
  });

  // Convert Payment object to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoice_id': invoiceId,
      'amount': amount,
      'payment_method': paymentMethod.value,
      'payment_date': paymentDate.toIso8601String(),
      'reference_number': referenceNumber,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Create Payment object from Map (database result)
  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id']?.toInt(),
      invoiceId: map['invoice_id']?.toInt() ?? 0,
      amount: map['amount']?.toDouble() ?? 0.0,
      paymentMethod: PaymentMethodExtension.fromString(map['payment_method'] ?? 'cash'),
      paymentDate: DateTime.parse(map['payment_date']),
      referenceNumber: map['reference_number'],
      notes: map['notes'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  // Create a copy of Payment with updated fields
  Payment copyWith({
    int? id,
    int? invoiceId,
    double? amount,
    PaymentMethod? paymentMethod,
    DateTime? paymentDate,
    String? referenceNumber,
    String? notes,
    DateTime? createdAt,
  }) {
    return Payment(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentDate: paymentDate ?? this.paymentDate,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // Convert to JSON for API operations
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoiceId': invoiceId,
      'amount': amount,
      'paymentMethod': paymentMethod.value,
      'paymentDate': paymentDate.toIso8601String(),
      'referenceNumber': referenceNumber,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create Payment from JSON
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id']?.toInt(),
      invoiceId: json['invoiceId']?.toInt() ?? 0,
      amount: json['amount']?.toDouble() ?? 0.0,
      paymentMethod: PaymentMethodExtension.fromString(json['paymentMethod'] ?? 'cash'),
      paymentDate: DateTime.parse(json['paymentDate']),
      referenceNumber: json['referenceNumber'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  String toString() {
    return 'Payment{id: $id, invoiceId: $invoiceId, amount: $amount, paymentMethod: $paymentMethod, paymentDate: $paymentDate, referenceNumber: $referenceNumber, notes: $notes, createdAt: $createdAt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Payment &&
        other.id == id &&
        other.invoiceId == invoiceId &&
        other.amount == amount &&
        other.paymentMethod == paymentMethod &&
        other.paymentDate == paymentDate &&
        other.referenceNumber == referenceNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        invoiceId.hashCode ^
        amount.hashCode ^
        paymentMethod.hashCode ^
        paymentDate.hashCode ^
        referenceNumber.hashCode;
  }

  // Get formatted amount
  String get formattedAmount {
    return '\$${amount.toStringAsFixed(2)}';
  }

  // Get formatted payment date
  String get formattedPaymentDate {
    return '${paymentDate.day}/${paymentDate.month}/${paymentDate.year}';
  }

  // Validate payment data
  bool get isValid {
    return amount > 0 && invoiceId > 0;
  }

  // Check if payment has reference number
  bool get hasReferenceNumber {
    return referenceNumber != null && referenceNumber!.isNotEmpty;
  }

  // Get display reference number with fallback
  String get displayReferenceNumber {
    return hasReferenceNumber ? referenceNumber! : 'No Reference';
  }

  // Check if payment method requires reference number
  bool get requiresReferenceNumber {
    return paymentMethod == PaymentMethod.check ||
           paymentMethod == PaymentMethod.bankTransfer ||
           paymentMethod == PaymentMethod.creditCard ||
           paymentMethod == PaymentMethod.debitCard;
  }

  // Get payment method icon (for UI)
  String get paymentMethodIcon {
    switch (paymentMethod) {
      case PaymentMethod.cash:
        return '💵';
      case PaymentMethod.check:
        return '📝';
      case PaymentMethod.bankTransfer:
        return '🏦';
      case PaymentMethod.creditCard:
        return '💳';
      case PaymentMethod.debitCard:
        return '💳';
      case PaymentMethod.paypal:
        return '🅿️';
      case PaymentMethod.other:
        return '💰';
    }
  }
}

