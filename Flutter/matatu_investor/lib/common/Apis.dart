// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:matatu/common/Interface.dart';
import 'package:matatu/config/app_config.dart';
import 'package:matatu/helpers/error_handler.dart';
import 'package:matatu/services/cache_service.dart';

class ApiClient<T extends investor> extends ChangeNotifier {
  String get baseUrl => AppConfig.baseUrl;

  // Connection pool for reusing HTTP connections
  static final http.Client _client = http.Client();

  // Cache service instance
  CacheService? _cacheService;

  // Initialize cache service
  Future<void> initCache() async {
    _cacheService = await CacheService.getInstance();
  }

  Future<ApiResult<Response>> postdata(
    String url,
    String data, {
    bool useCache = false,
    String? cacheKey,
    Duration? cacheDuration,
  }) async {
    try {
      // Check cache first if enabled
      if (useCache && cacheKey != null && _cacheService != null) {
        final cached = _cacheService!.getCache<Map<String, dynamic>>(cacheKey);
        if (cached != null) {
          if (AppConfig.isDebugMode) {
            print('📦 Cache hit for: $cacheKey');
          }
          // Return cached data as a mock response
          final response = Response(
            jsonEncode(cached),
            200,
            headers: {'content-type': 'application/json'},
          );
          return ApiResult.success(response);
        }
      }

      final requestUrl = '$baseUrl/$url';

      if (AppConfig.isDebugMode) {
        print('🌐 API Request: $requestUrl');
        print('📤 Request Body: $data');
      }

      final response = await _client.post(
        Uri.parse(requestUrl),
        body: data,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          'X-Client-Identifier': 'REMBOCLASIC',
        },
      ).timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException('Request timeout', const Duration(seconds: 30));
      });

      if (AppConfig.isDebugMode) {
        print('📥 Response Status: ${response.statusCode}');
        print('📥 Response Body: ${response.body}');
      }

      // Cache successful responses if caching is enabled
      if (useCache &&
          cacheKey != null &&
          _cacheService != null &&
          response.statusCode == 200) {
        try {
          final data = jsonDecode(response.body);
          await _cacheService!
              .setCache(cacheKey, data, duration: cacheDuration);
          if (AppConfig.isDebugMode) {
            print('💾 Cached response for: $cacheKey');
          }
        } catch (e) {
          // Ignore cache errors
          if (AppConfig.isDebugMode) {
            print('⚠️ Failed to cache response: $e');
          }
        }
      }

      // Check for HTTP error status codes
      if (response.statusCode >= 400) {
        final errorType = response.statusCode == 401
            ? ErrorType.authentication
            : ErrorType.server;

        return ApiResult.error(AppError(
          type: errorType,
          message: _getHttpErrorMessage(response.statusCode),
          statusCode: response.statusCode,
          details: response.body,
        ));
      }

      return ApiResult.success(response);
    } catch (e) {
      final appError = ErrorHandler.parseError(e, null);
      return ApiResult.error(appError);
    }
  }

  // Legacy method for backward compatibility
  Future<Response> postdataLegacy(String url, String data) async {
    final result = await postdata(url, data);

    if (result.isSuccess) {
      return result.data!;
    } else {
      // Return error response for backward compatibility
      return Response(jsonEncode({'error': result.error!.message}),
          result.error!.statusCode ?? 400);
    }
  }

  String _getHttpErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request - please check your input';
      case 401:
        return 'Authentication failed - please login again';
      case 403:
        return 'Access denied';
      case 404:
        return 'Service not found';
      case 500:
        return 'Server error - please try again later';
      case 502:
        return 'Service temporarily unavailable';
      case 503:
        return 'Service unavailable - please try again later';
      default:
        return 'Server error occurred (Status: $statusCode)';
    }
  }
}

class Request {
  Header? header;
  String? body;
  String? No;
  String? Otp;
  String? phone;
  String? Otp_message;
  String? bookmark;
  int? size;
  String? vehicle;
  String? Account;
  String? Member;

  Request({
    required this.header,
    this.body = '',
    this.No,
    this.Otp = '',
    this.phone = '',
    this.Otp_message = '',
    this.bookmark,
    this.size,
    this.vehicle,
    this.Account,
    this.Member,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'header': header?.toMap(),
      'body': body,
      'No': No,
      'Otp': Otp,
      'phone': phone,
      'Otp_message': Otp_message,
    };

    // Only add optional fields if they have values
    if (bookmark != null) map['bookmark'] = bookmark;
    if (size != null) map['size'] = size;
    if (vehicle != null) map['vehicle'] = vehicle;
    if (Account != null) map['Account'] = Account;
    if (Member != null) map['Member'] = Member;

    return map;
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      header: map['header'] != null
          ? Header.fromMap(map['header'] as Map<String, dynamic>)
          : null,
      body: map['body'] != null ? map['body'] as String : null,
      No: map['No'] != null ? map['No'] as String : null,
      Otp: map['Otp'] != null ? map['Otp'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      Otp_message:
          map['Otp_message'] != null ? map['Otp_message'] as String : null,
      bookmark: map['bookmark'] != null ? map['bookmark'] as String : null,
      size: map['size'] != null ? map['size'] as int : null,
      vehicle: map['vehicle'] != null ? map['vehicle'] as String : null,
      Account: map['Account'] != null ? map['Account'] as String : null,
      Member: map['Member'] != null ? map['Member'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Request.fromJson(String source) =>
      Request.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Header {
  String? Userid;
  String? Password;
  Header({
    this.Userid = '',
    this.Password = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Userid': Userid,
      'Password': Password,
    };
  }

  factory Header.fromMap(Map<String, dynamic> map) {
    return Header(
      Userid: map['Userid'] != null ? map['Userid'] as String : null,
      Password: map['Password'] != null ? map['Password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Header.fromJson(String source) =>
      Header.fromMap(json.decode(source) as Map<String, dynamic>);
}
