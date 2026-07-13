import 'package:get/get.dart';

import '../utils/error_handler.dart';

/// Base controller providing common functionality for all module controllers.
/// Controllers should extend this instead of directly extending [GetxController].
abstract class BaseController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  /// Whether the controller is currently loading data.
  bool get isLoadingData => isLoading.value;

  /// Execute an async operation with loading state and error handling.
  /// Returns `true` on success, `false` on failure.
  Future<bool> runWithLoading(
    Future<void> Function() operation, {
    String? errorContext,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await operation();
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      ErrorHandler.handleException(e, context: errorContext);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Execute an async operation that returns a value, with loading state.
  Future<T?> runWithLoadingValue<T>(
    Future<T> Function() operation, {
    String? errorContext,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      return await operation();
    } catch (e) {
      errorMessage.value = e.toString();
      ErrorHandler.handleException(e, context: errorContext);
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
