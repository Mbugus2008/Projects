import 'package:flutter_test/flutter_test.dart';
import 'package:matatu/helpers/form_validators.dart';

void main() {
  group('FormValidators Tests', () {
    group('Phone Validation', () {
      test('should accept valid Kenyan phone numbers', () {
        expect(FormValidators.validatePhone('0712345678'), isNull);
        expect(FormValidators.validatePhone('254712345678'), isNull);
        expect(FormValidators.validatePhone('+254712345678'), isNull);
      });

      test('should reject invalid phone numbers', () {
        expect(FormValidators.validatePhone(''), contains('required'));
        expect(FormValidators.validatePhone(null), contains('required'));
        expect(FormValidators.validatePhone('123456789'),
            contains('valid Kenyan'));
        expect(FormValidators.validatePhone('abcd'), contains('valid Kenyan'));
      });
    });

    group('Password Validation', () {
      test('should accept strong passwords', () {
        expect(FormValidators.validatePassword('Password123!'), isNull);
        expect(FormValidators.validatePassword('MyStr0ng@Pass'), isNull);
      });

      test('should reject weak passwords', () {
        expect(FormValidators.validatePassword(''), contains('required'));
        expect(FormValidators.validatePassword(null), contains('required'));
        expect(
            FormValidators.validatePassword('pass'), contains('8 characters'));
        expect(FormValidators.validatePassword('password123'),
            contains('uppercase'));
      });
    });

    group('OTP Validation', () {
      test('should accept valid OTP', () {
        expect(FormValidators.validateOTP('123456'), isNull);
        expect(FormValidators.validateOTP('000000'), isNull);
      });

      test('should reject invalid OTP', () {
        expect(FormValidators.validateOTP(''), contains('required'));
        expect(FormValidators.validateOTP(null), contains('required'));
        expect(FormValidators.validateOTP('12345'), contains('6 digits'));
        expect(FormValidators.validateOTP('1234567'), contains('6 digits'));
        expect(FormValidators.validateOTP('12345a'), contains('numbers'));
      });
    });

    group('Email Validation', () {
      test('should accept valid emails', () {
        expect(FormValidators.validateEmail('user@example.com'), isNull);
        expect(FormValidators.validateEmail('test.email@domain.co.ke'), isNull);
        expect(FormValidators.validateEmail(null), isNull); // Email is optional
        expect(FormValidators.validateEmail(''), isNull); // Email is optional
      });

      test('should reject invalid emails', () {
        expect(FormValidators.validateEmail('invalid-email'),
            contains('valid email'));
        expect(FormValidators.validateEmail('user@'), contains('valid email'));
        expect(FormValidators.validateEmail('@domain.com'),
            contains('valid email'));
      });
    });

    group('Name Validation', () {
      test('should accept valid names', () {
        expect(FormValidators.validateName('John Doe'), isNull);
        expect(FormValidators.validateName('Mary'), isNull);
        expect(FormValidators.validateName('Jean Pierre'), isNull);
      });

      test('should reject invalid names', () {
        expect(FormValidators.validateName(''), contains('required'));
        expect(FormValidators.validateName(null), contains('required'));
        expect(FormValidators.validateName('A'), contains('2 characters'));
        expect(FormValidators.validateName('John123'),
            contains('letters and spaces'));
        expect(FormValidators.validateName('John@Doe'),
            contains('letters and spaces'));
      });
    });

    group('Kenyan ID Validation', () {
      test('should accept valid Kenyan IDs', () {
        expect(FormValidators.validateKenyanID('12345678'), isNull);
        expect(FormValidators.validateKenyanID('1234 5678'), isNull);
        expect(FormValidators.validateKenyanID('1234-5678'), isNull);
      });

      test('should reject invalid Kenyan IDs', () {
        expect(FormValidators.validateKenyanID(''), contains('required'));
        expect(FormValidators.validateKenyanID(null), contains('required'));
        expect(
            FormValidators.validateKenyanID('1234567'), contains('8 digits'));
        expect(
            FormValidators.validateKenyanID('123456789'), contains('8 digits'));
        expect(
            FormValidators.validateKenyanID('1234567a'), contains('numbers'));
      });
    });

    group('Vehicle Number Validation', () {
      test('should accept valid Kenyan vehicle numbers', () {
        expect(FormValidators.validateVehicleNumber('KBA 123A'), isNull);
        expect(FormValidators.validateVehicleNumber('kba123a'),
            isNull); // Case insensitive
        expect(FormValidators.validateVehicleNumber('KCD456B'), isNull);
      });

      test('should reject invalid vehicle numbers', () {
        expect(FormValidators.validateVehicleNumber(''), contains('required'));
        expect(
            FormValidators.validateVehicleNumber(null), contains('required'));
        expect(FormValidators.validateVehicleNumber('ABC123D'),
            contains('valid Kenyan'));
        expect(FormValidators.validateVehicleNumber('KBA1234'),
            contains('valid Kenyan'));
        expect(FormValidators.validateVehicleNumber('12345'),
            contains('valid Kenyan'));
      });
    });

    group('Amount Validation', () {
      test('should accept valid amounts', () {
        expect(FormValidators.validateAmount('100'), isNull);
        expect(FormValidators.validateAmount('1000.50'), isNull);
        expect(FormValidators.validateAmount('1,000'), isNull);
      });

      test('should reject invalid amounts', () {
        expect(FormValidators.validateAmount(''), contains('required'));
        expect(FormValidators.validateAmount(null), contains('required'));
        expect(
            FormValidators.validateAmount('0'), contains('greater than zero'));
        expect(FormValidators.validateAmount('-100'),
            contains('greater than zero'));
        expect(FormValidators.validateAmount('abc'), contains('valid amount'));
      });

      test('should respect min and max amount constraints', () {
        expect(FormValidators.validateAmount('50', minAmount: 100),
            contains('at least'));
        expect(FormValidators.validateAmount('1500', maxAmount: 1000),
            contains('cannot exceed'));
        expect(
            FormValidators.validateAmount('500',
                minAmount: 100, maxAmount: 1000),
            isNull);
      });
    });

    group('Required Field Validation', () {
      test('should accept non-empty values', () {
        expect(FormValidators.validateRequired('Some value', 'Field'), isNull);
        expect(FormValidators.validateRequired('  Text  ', 'Field'), isNull);
      });

      test('should reject empty or null values', () {
        expect(FormValidators.validateRequired('', 'Field'),
            contains('Field is required'));
        expect(FormValidators.validateRequired(null, 'Field'),
            contains('Field is required'));
        expect(FormValidators.validateRequired('   ', 'Field'),
            contains('Field is required'));
      });
    });

    group('Login Identifier Validation', () {
      test('should accept valid phone numbers', () {
        expect(FormValidators.validateLoginIdentifier('0712345678'), isNull);
        expect(FormValidators.validateLoginIdentifier('254712345678'), isNull);
        expect(FormValidators.validateLoginIdentifier('+254712345678'), isNull);
        expect(FormValidators.validateLoginIdentifier('0 712 345 678'), isNull);
      });

      test('should accept valid vehicle numbers', () {
        expect(FormValidators.validateLoginIdentifier('ABC123'), isNull);
        expect(FormValidators.validateLoginIdentifier('abc123'), isNull);
        expect(FormValidators.validateLoginIdentifier('KBA123D'), isNull);
        expect(FormValidators.validateLoginIdentifier('123ABC'), isNull);
        expect(FormValidators.validateLoginIdentifier('A1B2C3'), isNull);
      });

      test('should accept valid member/account numbers', () {
        expect(FormValidators.validateLoginIdentifier('12345'), isNull);
        expect(FormValidators.validateLoginIdentifier('987654321'), isNull);
        expect(FormValidators.validateLoginIdentifier('M001'), isNull);
        expect(FormValidators.validateLoginIdentifier('ACC001'), isNull);
        expect(FormValidators.validateLoginIdentifier('1234567890'), isNull);
      });

      test('should reject empty or null values', () {
        expect(FormValidators.validateLoginIdentifier(null),
            equals('Account identifier is required'));
        expect(FormValidators.validateLoginIdentifier(''),
            equals('Account identifier is required'));
        expect(FormValidators.validateLoginIdentifier('   '),
            equals('Account identifier is required'));
      });

      test('should reject invalid characters', () {
        expect(
            FormValidators.validateLoginIdentifier('!@#\$'),
            equals(
                'Please enter a valid phone number, member number, or vehicle number'));
        expect(
            FormValidators.validateLoginIdentifier('ABC-123'),
            equals(
                'Please enter a valid phone number, member number, or vehicle number'));
        expect(
            FormValidators.validateLoginIdentifier('test@email.com'),
            equals(
                'Please enter a valid phone number, member number, or vehicle number'));
      });

      test('should handle whitespace correctly', () {
        expect(FormValidators.validateLoginIdentifier(' 12345 '), isNull);
        expect(FormValidators.validateLoginIdentifier('  ABC123  '), isNull);
        expect(FormValidators.validateLoginIdentifier(' 0712345678 '), isNull);
      });
    });
  });
}
