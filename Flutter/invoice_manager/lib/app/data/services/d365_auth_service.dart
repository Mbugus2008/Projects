import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class D365AuthService extends GetxService {
  static D365AuthService get to => Get.find();

  final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Configuration - These should be provided by the user
  String? _organizationUrl;
  String? _clientId;
  String? _tenantId;
  String? _redirectUri;

  // Token storage keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';

  // Observable authentication state
  final RxBool isAuthenticated = false.obs;
  final RxBool isLoading = false.obs;
  final Rx<String?> currentUser = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    _initializeService();
  }

  void _initializeService() async {
    // Check if user is already authenticated
    await _checkExistingAuth();
  }

  /// Configure the service with Dynamics 365 environment details
  void configure({
    required String organizationUrl,
    required String clientId,
    required String tenantId,
    required String redirectUri,
  }) {
    _organizationUrl = organizationUrl;
    _clientId = clientId;
    _tenantId = tenantId;
    _redirectUri = redirectUri;
  }

  /// Check if user has valid authentication
  Future<void> _checkExistingAuth() async {
    try {
      final accessToken = await _secureStorage.read(key: _accessTokenKey);
      final expiryString = await _secureStorage.read(key: _tokenExpiryKey);

      if (accessToken != null && expiryString != null) {
        final expiry = DateTime.parse(expiryString);
        if (DateTime.now().isBefore(expiry)) {
          isAuthenticated.value = true;
          await _getUserInfo();
        } else {
          // Token expired, try to refresh
          await _refreshToken();
        }
      }
    } catch (e) {
      print('Error checking existing auth: $e');
      await _clearTokens();
    }
  }

  /// Initiate OAuth 2.0 authentication flow
  Future<bool> signIn() async {
    if (_organizationUrl == null || _clientId == null || _tenantId == null) {
      throw Exception('D365 service not configured. Call configure() first.');
    }

    isLoading.value = true;

    try {
      // TODO: Implement actual OAuth 2.0 flow with flutter_appauth
      // For now, simulate successful authentication
      await Future.delayed(const Duration(seconds: 2));

      // Mock tokens - replace with actual OAuth response
      final mockAccessToken = 'mock_access_token_${DateTime.now().millisecondsSinceEpoch}';
      final mockRefreshToken = 'mock_refresh_token_${DateTime.now().millisecondsSinceEpoch}';
      final expiry = DateTime.now().add(const Duration(hours: 1));

      await _storeTokens(mockAccessToken, mockRefreshToken, expiry);
      
      isAuthenticated.value = true;
      await _getUserInfo();

      return true;
    } catch (e) {
      print('Sign in error: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Sign out and clear tokens
  Future<void> signOut() async {
    await _clearTokens();
    isAuthenticated.value = false;
    currentUser.value = null;
  }

  /// Get current access token
  Future<String?> getAccessToken() async {
    final token = await _secureStorage.read(key: _accessTokenKey);
    
    if (token != null) {
      // Check if token is expired
      final expiryString = await _secureStorage.read(key: _tokenExpiryKey);
      if (expiryString != null) {
        final expiry = DateTime.parse(expiryString);
        if (DateTime.now().isAfter(expiry)) {
          // Token expired, try to refresh
          final refreshed = await _refreshToken();
          if (refreshed) {
            return await _secureStorage.read(key: _accessTokenKey);
          } else {
            return null;
          }
        }
      }
    }
    
    return token;
  }

  /// Refresh access token using refresh token
  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
      if (refreshToken == null) return false;

      // TODO: Implement actual token refresh with Azure AD
      // For now, simulate successful refresh
      await Future.delayed(const Duration(seconds: 1));

      final newAccessToken = 'refreshed_access_token_${DateTime.now().millisecondsSinceEpoch}';
      final newRefreshToken = 'refreshed_refresh_token_${DateTime.now().millisecondsSinceEpoch}';
      final expiry = DateTime.now().add(const Duration(hours: 1));

      await _storeTokens(newAccessToken, newRefreshToken, expiry);
      
      return true;
    } catch (e) {
      print('Token refresh error: $e');
      await _clearTokens();
      return false;
    }
  }

  /// Store authentication tokens securely
  Future<void> _storeTokens(String accessToken, String refreshToken, DateTime expiry) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
    await _secureStorage.write(key: _tokenExpiryKey, value: expiry.toIso8601String());
  }

  /// Clear all stored tokens
  Future<void> _clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    await _secureStorage.delete(key: _tokenExpiryKey);
  }

  /// Get current user information
  Future<void> _getUserInfo() async {
    try {
      // TODO: Call Microsoft Graph API to get user info
      // For now, use mock user data
      currentUser.value = 'test.user@company.com';
    } catch (e) {
      print('Error getting user info: $e');
    }
  }

  /// Get authorization header for API requests
  Future<Map<String, String>?> getAuthHeaders() async {
    final token = await getAccessToken();
    if (token != null) {
      return {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'OData-MaxVersion': '4.0',
        'OData-Version': '4.0',
        'Accept': 'application/json',
      };
    }
    return null;
  }

  /// Check if service is properly configured
  bool get isConfigured {
    return _organizationUrl != null && 
           _clientId != null && 
           _tenantId != null && 
           _redirectUri != null;
  }

  /// Get organization URL
  String? get organizationUrl => _organizationUrl;

  /// Get Web API base URL
  String? get webApiUrl {
    if (_organizationUrl != null) {
      return '$_organizationUrl/api/data/v9.2';
    }
    return null;
  }
}

