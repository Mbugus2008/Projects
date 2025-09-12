// This was likely present before and is needed by GetX for some things, I will add it back to be safe.

enum WhoToPay {
  Sender,
  Receiver,
}

// Alias for backward compatibility
typedef Who_to_Pay = WhoToPay;

enum ParcelStatus {
  pending,
  inTransit,
  outForDelivery,
  delivered,
  failed,
  returned,
}

class Parcel {
  final String Document_No;
  final DateTime Date_sent;
  final String Sender_Name;
  final String Sender_ID;
  final String Sender_Phone;
  final String From;
  final String To;
  final String Receiver_Name;
  final String Receiver_ID;
  final String Receiver_Phone;
  final ParcelStatus Status;
  final String Driver;
  final String Vehicle;
  final WhoToPay Who_to_Pay; // Field name uses typedef
  final double Amount_Paid;
  final bool Paid;
  final DateTime? Date_Collected;
  final DateTime? Date_Delivered;
  final DateTime? Out_For_Delivery_Time;
  final DateTime? Date_Returned;
  final String? Notes;

  const Parcel({
    required this.Document_No,
    required this.Date_sent,
    required this.Sender_Name,
    required this.Sender_ID,
    required this.Sender_Phone,
    required this.From,
    required this.To,
    required this.Receiver_Name,
    required this.Receiver_ID,
    required this.Receiver_Phone,
    required this.Status,
    required this.Driver,
    required this.Vehicle,
    this.Who_to_Pay = WhoToPay.Sender,
    this.Amount_Paid = 0.0,
    this.Paid = false,
    this.Date_Collected,
    this.Date_Delivered,
    this.Out_For_Delivery_Time,
    this.Date_Returned,
    this.Notes,
  });

  // Convert a Parcel into a Map for general JSON
  Map<String, dynamic> toJson() {
    return {
      'Document_No': Document_No,
      'Date_sent': Date_sent.toIso8601String(),
      'Sender_Name': Sender_Name,
      'Sender_ID': Sender_ID,
      'Sender_Phone': Sender_Phone,
      'From': From,
      'To': To,
      'Receiver_Name': Receiver_Name,
      'Receiver_ID': Receiver_ID,
      'Receiver_Phone': Receiver_Phone,
      'Status': Status.toString().split('.').last,
      'Driver': Driver,
      'Vehicle': Vehicle,
      'Who_to_Pay': Who_to_Pay.toString().split('.').last,
      'Amount_Paid': Amount_Paid,
      'Paid': Paid,
      'Date_Collected': Date_Collected?.toIso8601String(),
      'Date_Delivered': Date_Delivered?.toIso8601String(),
      'Out_For_Delivery_Time': Out_For_Delivery_Time?.toIso8601String(),
      'Date_Returned': Date_Returned?.toIso8601String(),
      'Notes': Notes,
    };
  }

  // Create a Parcel from a general JSON Map
  factory Parcel.fromJson(Map<String, dynamic> json) {
    ParcelStatus parseParcelStatus(String? status) {
      if (status == null) return ParcelStatus.pending;
      return ParcelStatus.values.firstWhere(
        (e) => e.toString() == 'ParcelStatus.${status.replaceAll('ParcelStatus.', '')}',
        orElse: () => ParcelStatus.pending,
      );
    }

    WhoToPay parseWhoToPay(String? whoToPay) {
      if (whoToPay == null) return WhoToPay.Sender;
      return WhoToPay.values.firstWhere(
        (e) => e.toString() == 'WhoToPay.${whoToPay.replaceAll('WhoToPay.', '')}',
        orElse: () => WhoToPay.Sender,
      );
    }

    return Parcel(
      Document_No: json['Document_No'] as String? ?? '',
      Date_sent: DateTime.parse(json['Date_sent'] as String? ?? DateTime.now().toIso8601String()),
      Sender_Name: json['Sender_Name'] as String? ?? '',
      Sender_ID: json['Sender_ID'] as String? ?? '',
      Sender_Phone: json['Sender_Phone'] as String? ?? '',
      From: json['From'] as String? ?? '',
      To: json['To'] as String? ?? '',
      Receiver_Name: json['Receiver_Name'] as String? ?? '',
      Receiver_ID: json['Receiver_ID'] as String? ?? '',
      Receiver_Phone: json['Receiver_Phone'] as String? ?? '',
      Status: parseParcelStatus(json['Status'] as String?),
      Driver: json['Driver'] as String? ?? '',
      Vehicle: json['Vehicle'] as String? ?? '',
      Who_to_Pay: parseWhoToPay(json['Who_to_Pay'] as String?),
      Amount_Paid: (json['Amount_Paid'] != null) ? (json['Amount_Paid'] is int ? (json['Amount_Paid'] as int).toDouble() : json['Amount_Paid'] as double) : 0.0,
      Paid: json['Paid'] as bool? ?? false,
      Date_Collected: json['Date_Collected'] != null 
          ? DateTime.tryParse(json['Date_Collected'] as String)
          : null,
      Date_Delivered: json['Date_Delivered'] != null
          ? DateTime.tryParse(json['Date_Delivered'] as String)
          : null,
      Out_For_Delivery_Time: json['Out_For_Delivery_Time'] != null
          ? DateTime.tryParse(json['Out_For_Delivery_Time'] as String)
          : null,
      Date_Returned: json['Date_Returned'] != null
          ? DateTime.tryParse(json['Date_Returned'] as String)
          : null,
      Notes: json['Notes'] as String?,
    );
  }

  // Convert a Parcel into a Map for DB
  Map<String, dynamic> toDbMap() {
    return {
      'Document_No': Document_No,
      'Date_sent': Date_sent.toIso8601String(),
      'Sender_Name': Sender_Name,
      'Sender_ID': Sender_ID,
      'Sender_Phone': Sender_Phone,
      'From_Location': From, // Map 'From' to 'From_Location'
      'To_Location': To,     // Map 'To' to 'To_Location'
      'Receiver_Name': Receiver_Name,
      'Receiver_ID': Receiver_ID,
      'Receiver_Phone': Receiver_Phone,
      'Status': Status.toString().split('.').last,
      'Driver': Driver,
      'Vehicle': Vehicle,
      'WhoToPay': Who_to_Pay.toString().split('.').last, // DB key is WhoToPay
      'Amount_Paid': Amount_Paid,
      'Paid': Paid ? 1 : 0, // Convert bool to int
      'Date_Collected': Date_Collected?.toIso8601String(),
      'Date_Delivered': Date_Delivered?.toIso8601String(),
      'Out_For_Delivery_Time': Out_For_Delivery_Time?.toIso8601String(),
      'Date_Returned': Date_Returned?.toIso8601String(),
      'Description': Notes, // Map 'Notes' to 'Description'
    };
  }

  // Create a Parcel from a DB Map
  factory Parcel.fromDbMap(Map<String, dynamic> map) {
    ParcelStatus parseParcelStatus(String? status) {
      if (status == null) return ParcelStatus.pending;
      return ParcelStatus.values.firstWhere(
        (e) => e.toString().split('.').last == status,
        orElse: () => ParcelStatus.pending,
      );
    }

    WhoToPay parseWhoToPay(String? whoToPay) {
      if (whoToPay == null) return WhoToPay.Sender;
      return WhoToPay.values.firstWhere(
        (e) => e.toString().split('.').last == whoToPay,
        orElse: () => WhoToPay.Sender,
      );
    }
    
    DateTime? parseOptionalDate(String? dateString) {
      if (dateString == null) return null;
      return DateTime.tryParse(dateString);
    }

    return Parcel(
      Document_No: map['Document_No'] as String? ?? '',
      Date_sent: DateTime.parse(map['Date_sent'] as String? ?? DateTime.now().toIso8601String()),
      Sender_Name: map['Sender_Name'] as String? ?? '',
      Sender_ID: map['Sender_ID'] as String? ?? '',
      Sender_Phone: map['Sender_Phone'] as String? ?? '',
      From: map['From_Location'] as String? ?? '', // Map 'From_Location' back to 'From'
      To: map['To_Location'] as String? ?? '',     // Map 'To_Location' back to 'To'
      Receiver_Name: map['Receiver_Name'] as String? ?? '',
      Receiver_ID: map['Receiver_ID'] as String? ?? '',
      Receiver_Phone: map['Receiver_Phone'] as String? ?? '',
      Status: parseParcelStatus(map['Status'] as String?),
      Driver: map['Driver'] as String? ?? '',
      Vehicle: map['Vehicle'] as String? ?? '',
      Who_to_Pay: parseWhoToPay(map['WhoToPay'] as String?), // DB key is WhoToPay
      Amount_Paid: (map['Amount_Paid'] != null) ? (map['Amount_Paid'] as num).toDouble() : 0.0,
      Paid: (map['Paid'] as int? ?? 0) == 1, // Convert int to bool
      Date_Collected: parseOptionalDate(map['Date_Collected'] as String?),
      Date_Delivered: parseOptionalDate(map['Date_Delivered'] as String?),
      Out_For_Delivery_Time: parseOptionalDate(map['Out_For_Delivery_Time'] as String?),
      Date_Returned: parseOptionalDate(map['Date_Returned'] as String?),
      Notes: map['Description'] as String?, // Map 'Description' back to 'Notes'
    );
  }

  Parcel copyWith({
    String? Document_No,
    DateTime? Date_sent,
    String? Sender_Name,
    String? Sender_ID,
    String? Sender_Phone,
    String? From,
    String? To,
    String? Receiver_Name,
    String? Receiver_ID,
    String? Receiver_Phone,
    ParcelStatus? Status,
    String? Driver,
    String? Vehicle,
    WhoToPay? Who_to_Pay,
    double? Amount_Paid,
    bool? Paid,
    DateTime? Date_Collected,
    DateTime? Date_Delivered,
    DateTime? Out_For_Delivery_Time,
    DateTime? Date_Returned,
    String? Notes,
  }) {
    return Parcel(
      Document_No: Document_No ?? this.Document_No,
      Date_sent: Date_sent ?? this.Date_sent,
      Sender_Name: Sender_Name ?? this.Sender_Name,
      Sender_ID: Sender_ID ?? this.Sender_ID,
      Sender_Phone: Sender_Phone ?? this.Sender_Phone,
      From: From ?? this.From,
      To: To ?? this.To,
      Receiver_Name: Receiver_Name ?? this.Receiver_Name,
      Receiver_ID: Receiver_ID ?? this.Receiver_ID,
      Receiver_Phone: Receiver_Phone ?? this.Receiver_Phone,
      Status: Status ?? this.Status,
      Driver: Driver ?? this.Driver,
      Vehicle: Vehicle ?? this.Vehicle,
      Who_to_Pay: Who_to_Pay ?? this.Who_to_Pay,
      Amount_Paid: Amount_Paid ?? this.Amount_Paid,
      Paid: Paid ?? this.Paid,
      Date_Collected: Date_Collected ?? this.Date_Collected, // Retain null if original was null
      Date_Delivered: Date_Delivered ?? this.Date_Delivered,
      Out_For_Delivery_Time: Out_For_Delivery_Time ?? this.Out_For_Delivery_Time,
      Date_Returned: Date_Returned ?? this.Date_Returned,
      Notes: Notes ?? this.Notes,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Parcel &&
        other.Document_No == Document_No &&
        other.Date_sent == Date_sent &&
        other.Sender_Name == Sender_Name &&
        other.Sender_ID == Sender_ID &&
        other.Sender_Phone == Sender_Phone &&
        other.From == From &&
        other.To == To &&
        other.Receiver_Name == Receiver_Name &&
        other.Receiver_ID == Receiver_ID &&
        other.Receiver_Phone == Receiver_Phone &&
        other.Status == Status &&
        other.Driver == Driver &&
        other.Vehicle == Vehicle &&
        other.Who_to_Pay == Who_to_Pay &&
        other.Amount_Paid == Amount_Paid &&
        other.Paid == Paid &&
        other.Date_Collected == Date_Collected &&
        other.Date_Delivered == Date_Delivered &&
        other.Out_For_Delivery_Time == Out_For_Delivery_Time &&
        other.Date_Returned == Date_Returned &&
        other.Notes == Notes;
  }

  @override
  int get hashCode {
    return Object.hash(
      Document_No,
      Date_sent,
      Sender_Name,
      Sender_ID,
      Sender_Phone,
      From,
      To,
      Receiver_Name,
      Receiver_ID,
      Receiver_Phone,
      Status,
      Driver,
      Vehicle,
      Who_to_Pay,
      Amount_Paid,
      Paid,
      Date_Collected,
      Date_Delivered,
      Out_For_Delivery_Time,
      Date_Returned
       // This comment was the original error source, but the fix means it's now fine.
    );
  }
  @override
  String toString() {
    return 'Parcel{Document_No: $Document_No, Status: $Status, From: $From, To: $To, Sender_Name: $Sender_Name, Receiver_Name: $Receiver_Name, Amount_Paid: $Amount_Paid, Paid: $Paid, Notes: $Notes}';
  }
}