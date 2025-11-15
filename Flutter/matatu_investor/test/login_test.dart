import 'package:flutter_test/flutter_test.dart';
import 'package:matatu/helpers/security_helper.dart';

void main() {
  group('Login Identifier Tests', () {
    test('should detect and format phone numbers correctly', () {
      // Test various phone number formats
      expect(SecurityHelper.isValidKenyanPhone('0710123456'), isTrue);
      expect(SecurityHelper.isValidKenyanPhone('+254710123456'), isTrue);
      expect(SecurityHelper.isValidKenyanPhone('254710123456'), isTrue);

      // Test formatting
      expect(SecurityHelper.formatKenyanPhone('0710123456'),
          equals('254710123456'));
      expect(SecurityHelper.formatKenyanPhone('+254710123456'),
          equals('254710123456'));
      expect(SecurityHelper.formatKenyanPhone('254710123456'),
          equals('254710123456'));
    });

    test('should handle vehicle numbers correctly', () {
      // Test vehicle number patterns
      final vehiclePattern = RegExp(r'^[A-Za-z0-9]{3,8}$');
      expect(vehiclePattern.hasMatch('KBA123A'), isTrue);
      expect(vehiclePattern.hasMatch('KCB456X'), isTrue);
      expect(vehiclePattern.hasMatch('ABC123'), isTrue);
      expect(vehiclePattern.hasMatch('12345AB'), isTrue);

      // Should not match invalid patterns
      expect(vehiclePattern.hasMatch('A'), isFalse); // Too short
      expect(vehiclePattern.hasMatch('VERYLONGNUMBER'), isFalse); // Too long
      expect(
          vehiclePattern.hasMatch('KBA-123'), isFalse); // Contains special char
    });

    test('should handle member numbers correctly', () {
      // Member numbers are typically numeric or alphanumeric
      final memberNumbers = ['12345', 'MEM001', 'A12345', '987654321'];

      for (String memberNumber in memberNumbers) {
        // Should sanitize input properly
        expect(
            SecurityHelper.sanitizeInput(memberNumber), equals(memberNumber));
        expect(SecurityHelper.sanitizeInput('  $memberNumber  '),
            equals(memberNumber));
      }
    });

    test('should sanitize input correctly', () {
      expect(SecurityHelper.sanitizeInput('  test  '), equals('test'));
      expect(
          SecurityHelper.sanitizeInput('test<script>'), equals('testscript'));
      expect(SecurityHelper.sanitizeInput(''), equals(''));
      expect(SecurityHelper.sanitizeInput('normal123'), equals('normal123'));
    });
  });
}
