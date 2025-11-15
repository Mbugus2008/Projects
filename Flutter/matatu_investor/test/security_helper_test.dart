import 'package:flutter_test/flutter_test.dart';
import 'package:matatu/helpers/security_helper.dart';

void main() {
  group('SecurityHelper Tests', () {
    test('should generate secure OTP of correct length', () {
      final otp = SecurityHelper.generateOTP(6);

      expect(otp.length, equals(6));
      expect(RegExp(r'^\d{6}$').hasMatch(otp), isTrue);
    });

    test('should validate Kenyan phone numbers correctly', () {
      // Valid Kenyan phone numbers
      expect(SecurityHelper.isValidKenyanPhone('0712345678'), isTrue);
      expect(SecurityHelper.isValidKenyanPhone('254712345678'), isTrue);
      expect(SecurityHelper.isValidKenyanPhone('+254712345678'), isTrue);
      expect(SecurityHelper.isValidKenyanPhone('0700123456'), isTrue);
      expect(SecurityHelper.isValidKenyanPhone('254700123456'), isTrue);

      // Invalid phone numbers
      expect(
          SecurityHelper.isValidKenyanPhone('071234567'), isFalse); // Too short
      expect(SecurityHelper.isValidKenyanPhone('07123456789'),
          isFalse); // Too long
      expect(SecurityHelper.isValidKenyanPhone('0812345678'),
          isFalse); // Invalid prefix
      expect(SecurityHelper.isValidKenyanPhone('abc123456'),
          isFalse); // Contains letters
      expect(SecurityHelper.isValidKenyanPhone(''), isFalse); // Empty
    });

    test('should format Kenyan phone numbers correctly', () {
      expect(SecurityHelper.formatKenyanPhone('0712345678'),
          equals('254712345678'));
      expect(SecurityHelper.formatKenyanPhone('254712345678'),
          equals('254712345678'));
      expect(SecurityHelper.formatKenyanPhone('+254712345678'),
          equals('254712345678'));
      expect(SecurityHelper.formatKenyanPhone('07 12 34 56 78'),
          equals('254712345678'));
    });

    test('should validate password strength correctly', () {
      // Strong passwords
      expect(SecurityHelper.isStrongPassword('Password123!'), isTrue);
      expect(SecurityHelper.isStrongPassword('MyStr0ng@Pass'), isTrue);

      // Weak passwords
      expect(SecurityHelper.isStrongPassword('password'),
          isFalse); // No uppercase, numbers, special chars
      expect(SecurityHelper.isStrongPassword('PASSWORD'),
          isFalse); // No lowercase, numbers, special chars
      expect(SecurityHelper.isStrongPassword('12345678'),
          isFalse); // No letters, special chars
      expect(SecurityHelper.isStrongPassword('Pass123'), isFalse); // Too short
      expect(SecurityHelper.isStrongPassword(''), isFalse); // Empty
    });

    test('should sanitize input correctly', () {
      expect(
          SecurityHelper.sanitizeInput('normal text'), equals('normal text'));
      expect(SecurityHelper.sanitizeInput('text with <script>'),
          equals('text with script'));
      expect(SecurityHelper.sanitizeInput('user@example.com'),
          equals('user@example.com')); // @ is not in the sanitize pattern
      expect(SecurityHelper.sanitizeInput('  spaced text  '),
          equals('spaced text'));
      expect(SecurityHelper.sanitizeInput('text<script>alert()'),
          equals('textscriptalert'));
    });

    test('should calculate password strength score correctly', () {
      expect(SecurityHelper.getPasswordStrength('password'),
          equals(2)); // Length + lowercase
      expect(SecurityHelper.getPasswordStrength('Password'),
          equals(3)); // Length + lowercase + uppercase
      expect(SecurityHelper.getPasswordStrength('Password1'),
          equals(4)); // + numbers
      expect(SecurityHelper.getPasswordStrength('Password1!'),
          equals(5)); // + special chars
      expect(SecurityHelper.getPasswordStrength('VeryLongPassword1!'),
          equals(6)); // + extra length
      expect(
          SecurityHelper.getPasswordStrength(''), equals(0)); // Empty password
    });

    test('should hash passwords securely', () {
      const password = 'TestPassword123!';
      const salt = 'randomsalt123';

      final hash1 = SecurityHelper.hashPassword(password, salt);
      final hash2 = SecurityHelper.hashPassword(password, salt);

      // Same password + salt should produce same hash
      expect(hash1, equals(hash2));

      // Hash should be different from original password
      expect(hash1, isNot(equals(password)));

      // Hash should be consistent length (SHA-256 produces 64 character hex)
      expect(hash1.length, equals(64));
    });

    test('should verify passwords correctly', () {
      const password = 'TestPassword123!';
      const wrongPassword = 'WrongPassword123!';
      const salt = 'randomsalt123';

      final hash = SecurityHelper.hashPassword(password, salt);

      expect(SecurityHelper.verifyPassword(password, hash, salt), isTrue);
      expect(SecurityHelper.verifyPassword(wrongPassword, hash, salt), isFalse);
    });

    test('should generate unique salts', () {
      final salt1 = SecurityHelper.generateSalt();
      final salt2 = SecurityHelper.generateSalt();

      expect(salt1, isNot(equals(salt2)));
      expect(salt1.length, equals(16)); // Default length
      expect(salt2.length, equals(16));

      // Test custom length
      final customSalt = SecurityHelper.generateSalt(32);
      expect(customSalt.length, equals(32));
    });
  });
}
