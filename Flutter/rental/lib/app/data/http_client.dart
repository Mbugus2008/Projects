import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/config/app_config.dart';
import 'auth_service.dart';

/// Thin wrapper around the http package that injects auth headers
/// and the base URL from AppConfig.
class HttpClient {
  final String authToken;

  HttpClient({required this.authToken});

  /// Prefers the live token from [AuthService] so a login that happens after
  /// app startup propagates to every request; falls back to the token
  /// captured at construction time.
  String get _token {
    if (Get.isRegistered<AuthService>()) {
      return Get.find<AuthService>().token.value;
    }
    return authToken;
  }

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $_token',
  };

  Uri _uri(String path) => Uri.parse('${AppConfig.baseUrl}$path');

  Future<http.Response> get(String path) =>
      http.get(_uri(path), headers: _headers);

  Future<http.Response> post(String path, Map<String, dynamic> body) =>
      http.post(_uri(path), headers: _headers, body: jsonEncode(body));

  Future<http.Response> put(String path, Map<String, dynamic> body) =>
      http.put(_uri(path), headers: _headers, body: jsonEncode(body));

  Future<http.Response> delete(String path) =>
      http.delete(_uri(path), headers: _headers);
}
