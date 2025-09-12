import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/auth_service.dart';

class ApiMiddleware extends GetMiddleware {
  final AuthService _authService = Get.find<AuthService>();
  
  @override
  RouteSettings? redirect(String? route) {
    // Allow access to authentication routes without token
    if (route == '/login' || route == '/register' || route == '/splash') {
      return null;
    }
    
    // Check if user is authenticated
    if (!_authService.isAuthenticated.value) {
      return const RouteSettings(name: '/login');
    }
    
    return null;
  }
  
  @override
  GetPage? onPageCalled(GetPage? page) {
    return page;
  }
  
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return bindings;
  }
  
  @override
  Widget onPageBuilt(Widget page) {
    return page;
  }
  
  @override
  void onPageDispose() {}
}
