class Validators {
  Validators._();

  /// Validate required field is not empty.
  static String? required(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validate email format.
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// Validate phone number (basic check).
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[\d\s\-()]{7,15}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  /// Validate a numeric field.
  static String? numeric(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value.trim()) == null) {
      return '$fieldName must be a valid number';
    }
    return null;
  }

  /// Validate a positive numeric field.
  static String? positiveNumeric(
    String? value, [
    String fieldName = 'This field',
  ]) {
    final numericError = numeric(value, fieldName);
    if (numericError != null) return numericError;
    final num = double.parse(value!.trim());
    if (num < 0) {
      return '$fieldName must be a positive number';
    }
    return null;
  }

  /// Validate password strength.
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Validate date format (YYYY-MM-DD).
  static String? date(String? value, [String fieldName = 'Date']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(value.trim())) {
      return '$fieldName must be in YYYY-MM-DD format';
    }
    return null;
  }
}
