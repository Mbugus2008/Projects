import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends GetxService {
  static const String baseUrl = 'https://192.168.0.100:7170/api';
  final storage = const FlutterSecureStorage();
  
  final RxBool isAuthenticated = false.obs;
  final RxString token = ''.obs;
  final RxMap<String, dynamic> currentUser = <String, dynamic>{}.obs;
  
  // Initialize the service
  Future<AuthService> init() async {
    // Check if we have a stored token
    final storedToken = await storage.read(key: 'auth_token');
    if (storedToken != null) {
      token.value = storedToken;
      isAuthenticated.value = true;
      await _fetchUserProfile();
    }
    return this;
  }
  
  // JWT Authentication
  Future<bool> loginWithJWT(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        token.value = data['token'];
        await storage.write(key: 'auth_token', value: token.value);
        isAuthenticated.value = true;
        await _fetchUserProfile();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }
  
  // OAuth2 Authentication
  Future<bool> loginWithOAuth(String provider) async {
    try {
      // In a real implementation, this would redirect to the OAuth provider
      // For now, we'll simulate a successful OAuth login
      final response = await http.post(
        Uri.parse('$baseUrl/auth/oauth/$provider'),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        token.value = data['token'];
        await storage.write(key: 'auth_token', value: token.value);
        isAuthenticated.value = true;
        await _fetchUserProfile();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('OAuth login error: $e');
      return false;
    }
  }
  
  // Register new user
  Future<bool> register(Map<String, dynamic> userData) async {
    try {
      print(jsonEncode(userData));
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );
      print(response.statusCode);
      return response.statusCode == 200;
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }
  
  // Logout
  Future<void> logout() async {
    token.value = '';
    isAuthenticated.value = false;
    currentUser.clear();
    await storage.delete(key: 'auth_token');
  }
  
  // Get auth headers for API requests
  Map<String, String> get authHeaders => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${token.value}',
  };
  
  // Fetch user profile
  Future<void> _fetchUserProfile() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/profile'),
        headers: authHeaders,
      );
      
      if (response.statusCode == 200) {
        currentUser.value = jsonDecode(response.body);
      } else {
        // Token might be invalid or expired
        await logout();
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }
  
  // Check if token is valid
  Future<bool> validateToken() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/auth/validate'),
        headers: authHeaders,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Token validation error: $e');
      return false;
    }
  }
  
  // Refresh token
  Future<bool> refreshToken() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/refresh'),
        headers: authHeaders,
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        token.value = data['token'];
        await storage.write(key: 'auth_token', value: token.value);
        return true;
      } else {
        await logout();
        return false;
      }
    } catch (e) {
      print('Token refresh error: $e');
      await logout();
      return false;
    }
  }
}
