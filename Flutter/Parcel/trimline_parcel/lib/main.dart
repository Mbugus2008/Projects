import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trimline_parcel/pages/login.dart';
import 'controllers/parcel_controller.dart';
import 'pages/parcellist.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers
    Get.put(ParcelController());
    
    return GetMaterialApp(
      title: 'Parcel Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color.fromARGB(255, 26, 177, 46),
          secondary: const Color.fromARGB(255, 29, 182, 131),
          surface: Colors.white,
          background: AppColors.backgroundColor,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: const Color.fromARGB(255, 6, 184, 95), // Match the iconTheme color
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 6, 184, 95),
          ),
        ),
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 6, 184, 95),
        ),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



