import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

enum ErrorType { network, timeout, server, authentication, validation, unknown }

/// Generic result wrapper for API calls
class ApiResult<T> {
  final T? data;
  final AppError? error;
  final bool isSuccess;

  ApiResult._({this.data, this.error, required this.isSuccess});

  factory ApiResult.success(T data) {
    return ApiResult._(data: data, isSuccess: true);
  }

  factory ApiResult.error(AppError error) {
    return ApiResult._(error: error, isSuccess: false);
  }

  bool get isError => !isSuccess;
}

class AppError {
  final ErrorType type;
  final String message;
  final String? details;
  final int? statusCode;
  final DateTime timestamp;

  AppError({
    required this.type,
    required this.message,
    this.details,
    this.statusCode,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() {
    return 'AppError(type: $type, message: $message, statusCode: $statusCode, timestamp: $timestamp)';
  }
}

class ErrorHandler {
  static final List<AppError> _errors = [];

  // Get recent errors for debugging
  static List<AppError> get recentErrors => List.from(_errors);

  // Clear error history
  static void clearErrors() => _errors.clear();

  /// Handle and display errors to users
  static void handleError(
    dynamic error, {
    BuildContext? context,
    String? customMessage,
    bool showToast = true,
    VoidCallback? onRetry,
  }) {
    final appError = parseError(error, customMessage);
    _logError(appError);

    if (showToast && context != null) {
      _showErrorToast(context, appError, onRetry);
    }
  }

  /// Parse different types of errors into AppError
  static AppError parseError(dynamic error, String? customMessage) {
    if (error is AppError) {
      return error;
    }

    if (error is SocketException) {
      return AppError(
        type: ErrorType.network,
        message: customMessage ??
            'No internet connection. Please check your network and try again.',
        details: error.toString(),
      );
    }

    if (error is TimeoutException) {
      return AppError(
        type: ErrorType.timeout,
        message: customMessage ?? 'Request timed out. Please try again.',
        details: error.toString(),
      );
    }

    if (error is FormatException) {
      return AppError(
        type: ErrorType.server,
        message: customMessage ?? 'Invalid response from server.',
        details: error.toString(),
      );
    }

    if (error is HttpException) {
      return AppError(
        type: ErrorType.server,
        message: customMessage ?? 'Server error occurred.',
        details: error.toString(),
      );
    }

    // Default unknown error
    return AppError(
      type: ErrorType.unknown,
      message:
          customMessage ?? 'An unexpected error occurred. Please try again.',
      details: error.toString(),
    );
  }

  /// Log error for debugging and analytics
  static void _logError(AppError error) {
    _errors.add(error);

    // Keep only last 50 errors to prevent memory issues
    if (_errors.length > 50) {
      _errors.removeAt(0);
    }

    // Print to console in debug mode
    debugPrint('🔴 Error: ${error.toString()}');
  }

  /// Show error toast to user
  static void _showErrorToast(
      BuildContext context, AppError error, VoidCallback? onRetry) {
    final icon = _getErrorIcon(error.type);
    final color = _getErrorColor(error.type);

    MotionToast(
      icon: icon,
      primaryColor: color,
      title: Text(_getErrorTitle(error.type)),
      description: Text(error.message),
      toastDuration: const Duration(seconds: 4),
      position: MotionToastPosition.bottom,
      width: MediaQuery.of(context).size.width * 0.9,
    ).show(context);

    // Show retry option for network/timeout errors
    if (onRetry != null &&
        (error.type == ErrorType.network || error.type == ErrorType.timeout)) {
      _showRetrySnackbar(error, onRetry);
    }
  }

  /// Show retry snackbar for recoverable errors
  static void _showRetrySnackbar(AppError error, VoidCallback onRetry) {
    Get.showSnackbar(
      GetSnackBar(
        title: 'Connection Error',
        message: 'Tap to retry',
        icon: const Icon(Icons.refresh, color: Colors.white),
        duration: const Duration(seconds: 6),
        backgroundColor: Colors.orange,
        mainButton: TextButton(
          onPressed: () {
            Get.back(); // Close snackbar
            onRetry();
          },
          child: const Text('RETRY', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  /// Get appropriate icon for error type
  static IconData _getErrorIcon(ErrorType type) {
    switch (type) {
      case ErrorType.network:
        return Icons.wifi_off;
      case ErrorType.timeout:
        return Icons.access_time;
      case ErrorType.server:
        return Icons.error_outline;
      case ErrorType.authentication:
        return Icons.lock_outline;
      case ErrorType.validation:
        return Icons.warning_amber_outlined;
      case ErrorType.unknown:
        return Icons.help_outline;
    }
  }

  /// Get appropriate color for error type
  static Color _getErrorColor(ErrorType type) {
    switch (type) {
      case ErrorType.network:
        return Colors.orange;
      case ErrorType.timeout:
        return Colors.amber;
      case ErrorType.server:
        return Colors.red;
      case ErrorType.authentication:
        return Colors.purple;
      case ErrorType.validation:
        return Colors.yellow.shade700;
      case ErrorType.unknown:
        return Colors.grey;
    }
  }

  /// Get appropriate title for error type
  static String _getErrorTitle(ErrorType type) {
    switch (type) {
      case ErrorType.network:
        return 'Network Error';
      case ErrorType.timeout:
        return 'Timeout Error';
      case ErrorType.server:
        return 'Server Error';
      case ErrorType.authentication:
        return 'Authentication Error';
      case ErrorType.validation:
        return 'Validation Error';
      case ErrorType.unknown:
        return 'Unknown Error';
    }
  }

  /// Create specific error types
  static AppError networkError([String? message]) => AppError(
        type: ErrorType.network,
        message: message ?? 'No internet connection available',
      );

  static AppError timeoutError([String? message]) => AppError(
        type: ErrorType.timeout,
        message: message ?? 'Request timed out',
      );

  static AppError serverError([String? message, int? statusCode]) => AppError(
        type: ErrorType.server,
        message: message ?? 'Server error occurred',
        statusCode: statusCode,
      );

  static AppError authenticationError([String? message]) => AppError(
        type: ErrorType.authentication,
        message: message ?? 'Authentication failed',
      );

  static AppError validationError(String message) => AppError(
        type: ErrorType.validation,
        message: message,
      );
}
