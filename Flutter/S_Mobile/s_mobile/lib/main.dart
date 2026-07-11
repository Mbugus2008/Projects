import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_mobile/common/payment_cart.dart';
import 'package:s_mobile/login.dart';
import 'package:s_mobile/members/controller.dart';

void main() {
  Get.put(MemberController());
  Get.put(PaymentCartController());
  Get.put(PaymentTemplateController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'S_Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF2E7D32),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFF9C27B0),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const Login(),
    );
  }
}

extension CustomStyles on TextTheme {
  TextStyle get vamounts => const TextStyle(
        fontSize: 10.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
  TextStyle get vamounts_header => const TextStyle(
      fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.bold);
}

class Clients {
  String get Name => "BarakaYetu";
}
