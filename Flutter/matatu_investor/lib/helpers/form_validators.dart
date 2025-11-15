import 'package:flutter/material.dart';
import 'package:matatu/helpers/security_helper.dart';

class FormValidators {
  // Login identifier validation (phone, member number, or vehicle number)
  static String? validateLoginIdentifier(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account identifier is required';
    }

    String cleaned = value.trim().replaceAll(' ', '');

    // Check if cleaned value is empty (was just whitespace)
    if (cleaned.isEmpty) {
      return 'Account identifier is required';
    }

    // Accept if it's a valid phone number
    if (SecurityHelper.isValidKenyanPhone(cleaned)) {
      return null;
    }

    // Accept if it's a vehicle number (3-8 alphanumeric characters)
    if (RegExp(r'^[A-Za-z0-9]{3,8}$').hasMatch(cleaned)) {
      return null;
    }

    // Accept if it's a member/account number (at least 1 character, numbers or alphanumeric)
    if (RegExp(r'^[A-Za-z0-9]+$').hasMatch(cleaned)) {
      return null;
    }

    return 'Please enter a valid phone number, member number, or vehicle number';
  }

  // Phone number validation (kept for backward compatibility)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    if (!SecurityHelper.isValidKenyanPhone(value)) {
      return 'Please enter a valid Kenyan phone number (e.g., 0712345678 or +254712345678)';
    }

    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!SecurityHelper.isStrongPassword(value)) {
      return 'Password must contain uppercase, lowercase, numbers, and special characters';
    }

    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword(
      String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  // OTP validation
  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }

    if (value.length != 6) {
      return 'OTP must be 6 digits';
    }

    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'OTP must contain only numbers';
    }

    return null;
  }

  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Email is optional in most cases
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // Name validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }

    return null;
  }

  // ID number validation (Kenyan format)
  static String? validateKenyanID(String? value) {
    if (value == null || value.isEmpty) {
      return 'ID number is required';
    }

    // Remove any spaces or dashes
    final cleanValue = value.replaceAll(RegExp(r'[\s\-]'), '');

    if (cleanValue.length != 8) {
      return 'Kenyan ID number must be 8 digits';
    }

    if (!RegExp(r'^\d{8}$').hasMatch(cleanValue)) {
      return 'ID number must contain only numbers';
    }

    return null;
  }

  // Vehicle number validation
  static String? validateVehicleNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vehicle number is required';
    }

    // Kenyan vehicle number format: KXX 123X or KXX123X
    final kenyanPlateRegex =
        RegExp(r'^K[A-Z]{2}[\s]?\d{3}[A-Z]$', caseSensitive: false);

    if (!kenyanPlateRegex.hasMatch(value.toUpperCase())) {
      return 'Please enter a valid Kenyan vehicle number (e.g., KBA 123A)';
    }

    return null;
  }

  // Amount validation
  static String? validateAmount(String? value,
      {double? minAmount, double? maxAmount}) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }

    final amount = double.tryParse(value.replaceAll(',', ''));
    if (amount == null) {
      return 'Please enter a valid amount';
    }

    if (amount <= 0) {
      return 'Amount must be greater than zero';
    }

    if (minAmount != null && amount < minAmount) {
      return 'Amount must be at least KES ${minAmount.toStringAsFixed(2)}';
    }

    if (maxAmount != null && amount > maxAmount) {
      return 'Amount cannot exceed KES ${maxAmount.toStringAsFixed(2)}';
    }

    return null;
  }

  // Generic required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}

/// Custom form field with built-in validation
class ValidatedTextFormField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final VoidCallback? onTap;
  final bool enabled;
  final bool readOnly;
  final TextCapitalization textCapitalization;

  const ValidatedTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.hint,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  State<ValidatedTextFormField> createState() => _ValidatedTextFormFieldState();
}

class _ValidatedTextFormFieldState extends State<ValidatedTextFormField> {
  String? _errorText;
  bool _hasBeenValidated = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    if (_hasBeenValidated && widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(widget.controller.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          textCapitalization: widget.textCapitalization,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            errorText: _errorText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: (value) {
            _hasBeenValidated = true;
            if (widget.validator != null) {
              final error = widget.validator!(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _errorText = error;
                  });
                }
              });
              return error;
            }
            return null;
          },
        ),
        if (_errorText != null && _errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 12),
            child: Text(
              _errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
