import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Show a standardized error snackbar.
  static void showError(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  /// Show a standardized success snackbar.
  static void showSuccess(String message, {String title = 'Success'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  /// Show an info snackbar.
  static void showInfo(String message, {String title = 'Info'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  /// Handle an exception and show appropriate feedback.
  static void handleException(dynamic error, {String? context}) {
    final prefix = context != null ? '$context: ' : '';
    if (error is String) {
      showError('$prefix$error');
    } else if (error is Exception) {
      showError('$prefix${error.toString()}');
    } else {
      showError('${prefix}An unexpected error occurred');
    }
  }
}
