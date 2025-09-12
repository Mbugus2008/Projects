import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/auth_service.dart';
import '../data/api_service.dart';

class DependencyInjection {
  static Future<void> init() async {
    // Initialize services
    final authService = await Get.putAsync(() => AuthService().init());
    
    // Initialize API service with auth token
        Get.put<ApiService>(ApiService(authToken: authService.token.value), permanent: true);
  }
}
