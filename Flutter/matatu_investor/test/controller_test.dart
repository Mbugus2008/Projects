import 'package:flutter_test/flutter_test.dart';
import 'package:matatu/common/Controller.dart';

void main() {
  group('MemberController Login Identifier Tests', () {
    late MemberController controller;

    setUp(() {
      controller = MemberController();
    });

    test('should format phone numbers correctly', () {
      // Test different phone number formats
      expect(controller.formatLoginIdentifier('0712345678'),
          equals('254712345678'));
      expect(controller.formatLoginIdentifier('254712345678'),
          equals('254712345678'));
      expect(controller.formatLoginIdentifier('+254712345678'),
          equals('254712345678'));
      expect(controller.formatLoginIdentifier('0 712 345 678'),
          equals('254712345678'));
    });

    test('should format vehicle numbers correctly', () {
      // Test vehicle number formats
      expect(controller.formatLoginIdentifier('ABC123'), equals('ABC123'));
      expect(controller.formatLoginIdentifier('abc123'), equals('ABC123'));
      expect(controller.formatLoginIdentifier('KBA123D'), equals('KBA123D'));
      expect(controller.formatLoginIdentifier('123ABC'), equals('123ABC'));
    });

    test('should handle member numbers correctly', () {
      // Test member number formats
      expect(controller.formatLoginIdentifier('12345'), equals('12345'));
      expect(
          controller.formatLoginIdentifier('987654321'), equals('987654321'));
      expect(controller.formatLoginIdentifier('M001'), equals('M001'));
      expect(controller.formatLoginIdentifier(' M001 '), equals('M001'));
    });

    test('should handle account numbers correctly', () {
      // Test account number formats
      expect(controller.formatLoginIdentifier('ACC001'), equals('ACC001'));
      expect(
          controller.formatLoginIdentifier('1234567890'), equals('1234567890'));
      expect(controller.formatLoginIdentifier('A1B2C3'), equals('A1B2C3'));
    });

    test('should clean whitespace from all identifiers', () {
      expect(controller.formatLoginIdentifier(' 12345 '), equals('12345'));
      expect(controller.formatLoginIdentifier('  ABC123  '), equals('ABC123'));
      expect(controller.formatLoginIdentifier(' 0712345678 '),
          equals('254712345678'));
    });
  });
}
