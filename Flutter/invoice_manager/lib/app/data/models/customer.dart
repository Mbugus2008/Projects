class Customer {
  final String? id;
  final String name;
  final String? companyName;
  final String email;
  final String? phone;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isContact; // true for D365 contact, false for account

  Customer({
    this.id,
    required this.name,
    this.companyName,
    required this.email,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.createdAt,
    this.updatedAt,
    this.isContact = false,
  });

  // Create Customer from Dynamics 365 Account entity
  factory Customer.fromD365Account(Map<String, dynamic> account) {
    return Customer(
      id: account['accountid'],
      name: account['name'] ?? '',
      companyName: account['name'],
      email: account['emailaddress1'] ?? '',
      phone: account['telephone1'],
      address: account['address1_line1'],
      city: account['address1_city'],
      state: account['address1_stateorprovince'],
      postalCode: account['address1_postalcode'],
      country: account['address1_country'],
      createdAt: account['createdon'] != null ? DateTime.parse(account['createdon']) : null,
      updatedAt: account['modifiedon'] != null ? DateTime.parse(account['modifiedon']) : null,
      isContact: false,
    );
  }

  // Create Customer from Dynamics 365 Contact entity
  factory Customer.fromD365Contact(Map<String, dynamic> contact) {
    return Customer(
      id: contact['contactid'],
      name: contact['fullname'] ?? '',
      email: contact['emailaddress1'] ?? '',
      phone: contact['telephone1'],
      address: contact['address1_line1'],
      city: contact['address1_city'],
      state: contact['address1_stateorprovince'],
      postalCode: contact['address1_postalcode'],
      country: contact['address1_country'],
      createdAt: contact['createdon'] != null ? DateTime.parse(contact['createdon']) : null,
      updatedAt: contact['modifiedon'] != null ? DateTime.parse(contact['modifiedon']) : null,
      isContact: true,
    );
  }

  // Convert to JSON for local storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'companyName': companyName,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isContact': isContact,
    };
  }

  // Create from JSON (for local storage)
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'] ?? '',
      companyName: json['companyName'],
      email: json['email'] ?? '',
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      isContact: json['isContact'] ?? false,
    );
  }

  // Convert to Map for database operations (backward compatibility)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': postalCode,
      'country': country,
      'created_at': createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      'updated_at': updatedAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }

  // Create from Map (backward compatibility)
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id']?.toString(),
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      postalCode: map['zip_code'],
      country: map['country'],
      createdAt: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      isContact: false,
    );
  }

  // Create a copy with updated fields
  Customer copyWith({
    String? id,
    String? name,
    String? companyName,
    String? email,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isContact,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isContact: isContact ?? this.isContact,
    );
  }

  // Get display name
  String get displayName {
    if (companyName?.isNotEmpty == true && !isContact) {
      return companyName!;
    }
    return name.isNotEmpty ? name : 'Unnamed Customer';
  }

  // Get full address
  String get fullAddress {
    final parts = <String>[];
    if (address?.isNotEmpty == true) parts.add(address!);
    if (city?.isNotEmpty == true) parts.add(city!);
    if (state?.isNotEmpty == true) parts.add(state!);
    if (postalCode?.isNotEmpty == true) parts.add(postalCode!);
    if (country?.isNotEmpty == true) parts.add(country!);
    return parts.join(', ');
  }

  // Check if customer has complete contact information
  bool get hasCompleteInfo {
    return name.isNotEmpty && 
           email.isNotEmpty &&
           phone?.isNotEmpty == true;
  }

  // Validation
  bool get isValid {
    return name.isNotEmpty && email.isNotEmpty && _isValidEmail(email);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, email: $email, isContact: $isContact)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Customer && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

