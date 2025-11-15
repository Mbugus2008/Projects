import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matatu/helpers/error_handler.dart';

void main() {
  group('ErrorHandler Tests', () {
    setUp(() {
      // Clear errors before each test
      ErrorHandler.clearErrors();
    });

    test('should parse SocketException correctly', () {
      final socketException = const SocketException('Connection failed');
      final error = ErrorHandler.parseError(socketException, null);

      expect(error.type, equals(ErrorType.network));
      expect(error.message, contains('internet connection'));
    });

    test('should parse TimeoutException correctly', () {
      final timeoutException =
          TimeoutException('Request timeout', const Duration(seconds: 15));
      final error = ErrorHandler.parseError(timeoutException, null);

      expect(error.type, equals(ErrorType.timeout));
      expect(error.message, contains('timed out'));
    });

    test('should parse FormatException correctly', () {
      final formatException = const FormatException('Invalid format');
      final error = ErrorHandler.parseError(formatException, null);

      expect(error.type, equals(ErrorType.server));
      expect(error.message, contains('Invalid response'));
    });

    test('should use custom message when provided', () {
      final exception = Exception('Generic error');
      final customMessage = 'Custom error message';
      final error = ErrorHandler.parseError(exception, customMessage);

      expect(error.message, equals(customMessage));
      expect(error.type, equals(ErrorType.unknown));
    });

    test('should handle AppError passthrough', () {
      final originalError = AppError(
        type: ErrorType.authentication,
        message: 'Auth failed',
      );

      final parsedError = ErrorHandler.parseError(originalError, null);

      expect(parsedError.type, equals(ErrorType.authentication));
      expect(parsedError.message, equals('Auth failed'));
    });

    test('should store and retrieve errors', () {
      final error1 = ErrorHandler.networkError('Network issue');
      final error2 = ErrorHandler.serverError('Server issue');

      // Simulate handling errors
      ErrorHandler.handleError(error1, showToast: false);
      ErrorHandler.handleError(error2, showToast: false);

      final recentErrors = ErrorHandler.recentErrors;
      expect(recentErrors.length, equals(2));
      expect(
          recentErrors.any((e) => e.message.contains('Network issue')), isTrue);
      expect(
          recentErrors.any((e) => e.message.contains('Server issue')), isTrue);
    });

    test('should limit stored errors to prevent memory issues', () {
      // Add more than 50 errors
      for (int i = 0; i < 60; i++) {
        final error = ErrorHandler.networkError('Error $i');
        ErrorHandler.handleError(error, showToast: false);
      }

      final recentErrors = ErrorHandler.recentErrors;
      expect(recentErrors.length, equals(50));

      // Should keep the most recent errors
      expect(recentErrors.last.message, contains('Error 59'));
      expect(recentErrors.first.message, contains('Error 10'));
    });

    test('should clear errors correctly', () {
      final error = ErrorHandler.networkError('Test error');
      ErrorHandler.handleError(error, showToast: false);

      expect(ErrorHandler.recentErrors.length, equals(1));

      ErrorHandler.clearErrors();
      expect(ErrorHandler.recentErrors.length, equals(0));
    });

    test('should create specific error types correctly', () {
      final networkError = ErrorHandler.networkError('Network failed');
      expect(networkError.type, equals(ErrorType.network));
      expect(networkError.message, equals('Network failed'));

      final timeoutError = ErrorHandler.timeoutError('Timeout occurred');
      expect(timeoutError.type, equals(ErrorType.timeout));
      expect(timeoutError.message, equals('Timeout occurred'));

      final serverError = ErrorHandler.serverError('Server error', 500);
      expect(serverError.type, equals(ErrorType.server));
      expect(serverError.message, equals('Server error'));
      expect(serverError.statusCode, equals(500));

      final authError = ErrorHandler.authenticationError('Auth failed');
      expect(authError.type, equals(ErrorType.authentication));
      expect(authError.message, equals('Auth failed'));

      final validationError = ErrorHandler.validationError('Invalid input');
      expect(validationError.type, equals(ErrorType.validation));
      expect(validationError.message, equals('Invalid input'));
    });
  });

  group('ApiResult Tests', () {
    test('should create success result correctly', () {
      final result = ApiResult.success('test data');

      expect(result.isSuccess, isTrue);
      expect(result.isError, isFalse);
      expect(result.data, equals('test data'));
      expect(result.error, isNull);
    });

    test('should create error result correctly', () {
      final error = AppError(type: ErrorType.network, message: 'Network error');
      final result = ApiResult<String>.error(error);

      expect(result.isSuccess, isFalse);
      expect(result.isError, isTrue);
      expect(result.data, isNull);
      expect(result.error, equals(error));
    });
  });
}
