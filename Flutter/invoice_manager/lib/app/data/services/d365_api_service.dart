import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'd365_auth_service.dart';

class D365ApiService extends GetxService {
  static D365ApiService get to => Get.find();

  late final Dio _dio;
  final D365AuthService _authService = D365AuthService.to;

  @override
  void onInit() {
    super.onInit();
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio();
    
    // Add request interceptor for authentication
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final headers = await _authService.getAuthHeaders();
          if (headers != null) {
            options.headers.addAll(headers);
          }
          
          // Set base URL if available
          if (_authService.webApiUrl != null && !options.path.startsWith('http')) {
            options.baseUrl = _authService.webApiUrl!;
          }
          
          handler.next(options);
        },
        onError: (error, handler) async {
          // Handle 401 Unauthorized - token might be expired
          if (error.response?.statusCode == 401) {
            // Try to refresh token and retry
            final refreshed = await _authService._refreshToken();
            if (refreshed) {
              // Retry the request with new token
              final headers = await _authService.getAuthHeaders();
              if (headers != null) {
                error.requestOptions.headers.addAll(headers);
                final response = await _dio.fetch(error.requestOptions);
                handler.resolve(response);
                return;
              }
            }
            // If refresh failed, sign out user
            await _authService.signOut();
          }
          handler.next(error);
        },
      ),
    );

    // Add logging interceptor for debugging
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) => print('D365 API: $object'),
      ),
    );
  }

  /// Generic GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Generic POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Generic PATCH request (for updates)
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Generic DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// OData query builder helper
  String buildODataQuery({
    List<String>? select,
    String? filter,
    List<String>? orderBy,
    int? top,
    int? skip,
    List<String>? expand,
  }) {
    final queryParts = <String>[];

    if (select != null && select.isNotEmpty) {
      queryParts.add('\$select=${select.join(',')}');
    }

    if (filter != null && filter.isNotEmpty) {
      queryParts.add('\$filter=$filter');
    }

    if (orderBy != null && orderBy.isNotEmpty) {
      queryParts.add('\$orderby=${orderBy.join(',')}');
    }

    if (top != null) {
      queryParts.add('\$top=$top');
    }

    if (skip != null) {
      queryParts.add('\$skip=$skip');
    }

    if (expand != null && expand.isNotEmpty) {
      queryParts.add('\$expand=${expand.join(',')}');
    }

    return queryParts.isEmpty ? '' : '?${queryParts.join('&')}';
  }

  /// Handle API errors
  void _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          Get.snackbar(
            'Connection Error',
            'Request timed out. Please check your internet connection.',
            snackPosition: SnackPosition.BOTTOM,
          );
          break;
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final message = error.response?.data?['error']?['message'] ?? 
                          'Server error occurred';
          Get.snackbar(
            'Server Error ($statusCode)',
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
          break;
        case DioExceptionType.cancel:
          // Request was cancelled, no need to show error
          break;
        case DioExceptionType.unknown:
          Get.snackbar(
            'Network Error',
            'Please check your internet connection and try again.',
            snackPosition: SnackPosition.BOTTOM,
          );
          break;
        default:
          Get.snackbar(
            'Error',
            'An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM,
          );
      }
    }
  }

  /// Check if service is ready to make API calls
  bool get isReady {
    return _authService.isAuthenticated.value && _authService.isConfigured;
  }

  /// Get entity metadata
  Future<Map<String, dynamic>?> getEntityMetadata(String entityName) async {
    try {
      final response = await get('/EntityDefinitions(LogicalName=\'$entityName\')');
      return response.data;
    } catch (e) {
      print('Error getting entity metadata: $e');
      return null;
    }
  }

  /// Batch request helper
  Future<Response> batchRequest(List<Map<String, dynamic>> requests) async {
    final batchId = 'batch_${DateTime.now().millisecondsSinceEpoch}';
    final changesetId = 'changeset_${DateTime.now().millisecondsSinceEpoch}';

    // Build batch request body
    final batchBody = StringBuffer();
    batchBody.writeln('--$batchId');
    batchBody.writeln('Content-Type: multipart/mixed;boundary=$changesetId');
    batchBody.writeln();

    for (int i = 0; i < requests.length; i++) {
      final request = requests[i];
      batchBody.writeln('--$changesetId');
      batchBody.writeln('Content-Type: application/http');
      batchBody.writeln('Content-Transfer-Encoding:binary');
      batchBody.writeln();
      batchBody.writeln('${request['method']} ${request['url']} HTTP/1.1');
      batchBody.writeln('Content-Type: application/json;type=entry');
      batchBody.writeln();
      if (request['data'] != null) {
        batchBody.writeln(request['data']);
      }
      batchBody.writeln();
    }

    batchBody.writeln('--$changesetId--');
    batchBody.writeln('--$batchId--');

    return await post(
      '/\$batch',
      data: batchBody.toString(),
      options: Options(
        headers: {
          'Content-Type': 'multipart/mixed;boundary=$batchId',
        },
      ),
    );
  }
}

