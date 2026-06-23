import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_mobile/login.dart';
import 'package:s_mobile/members/controller.dart';

void main() {
  Get.put(MemberController());
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
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromRGBO(164, 92, 113, 0.5),
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
