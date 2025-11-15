import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class SecurityHelper {
  // Password hashing using SHA-256 with salt
  static String hashPassword(String password, String salt) {
    final bytes = utf8.encode(password + salt);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Generate a random salt
  static String generateSalt([int length = 16]) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    final salt =
        List.generate(length, (index) => chars[random.nextInt(chars.length)]);
    return salt.join();
  }

  // Verify password against hash
  static bool verifyPassword(String password, String hash, String salt) {
    final hashedInput = hashPassword(password, salt);
    return hashedInput == hash;
  }

  // Generate secure OTP
  static String generateOTP([int length = 6]) {
    final random = Random.secure();
    String otp = '';
    for (int i = 0; i < length; i++) {
      otp += random.nextInt(10).toString();
    }
    return otp;
  }

  // Validate phone number format (Kenyan format)
  static bool isValidKenyanPhone(String phone) {
    // Remove any spaces, dashes, or plus signs
    final cleanPhone = phone.replaceAll(RegExp(r'[\s\-\+]'), '');

    // Check for Kenyan phone number patterns
    final kenyanPattern = RegExp(r'^(254|0)[17][0-9]{8}$');
    return kenyanPattern.hasMatch(cleanPhone);
  }

  // Format phone number to standard format
  static String formatKenyanPhone(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[\s\-\+]'), '');

    if (cleanPhone.startsWith('0')) {
      return '254${cleanPhone.substring(1)}';
    } else if (cleanPhone.startsWith('254')) {
      return cleanPhone;
    }

    return cleanPhone; // Return as-is if format is unknown
  }

  // Input sanitization
  static String sanitizeInput(String input) {
    return input.trim().replaceAll(RegExp(r'[<>";%()&+]'), '');
  }

  // Validate password strength
  static bool isStrongPassword(String password) {
    if (password.length < 8) return false;

    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumbers = password.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasUppercase && hasLowercase && hasNumbers && hasSpecialCharacters;
  }

  // Get password strength score
  static int getPasswordStrength(String password) {
    int score = 0;

    if (password.length >= 8) score++;
    if (password.length >= 12) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[a-z]'))) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score++;

    return score;
  }
}
