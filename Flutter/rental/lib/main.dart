import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/app/data/auth_service.dart';
import 'package:rental/app/di/dependency_injection.dart';
import 'package:rental/app/routes/app_pages.dart';
import 'package:rental/app/routes/app_routes.dart';
import 'package:rental/app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  final authService = Get.find<AuthService>();

  runApp(
    GetMaterialApp(
      title: 'Rental Management',
      initialRoute:
          authService.isAuthenticated.value ? AppPages.INITIAL : Routes.LOGIN,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    ),
  );
}
