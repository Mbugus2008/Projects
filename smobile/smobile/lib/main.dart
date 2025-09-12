import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smobile/theme/style.dart';
import 'package:get/get.dart';
import 'myapp/Login.dart';
import 'myapp/cert.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'S Mobile',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: LoginPage(),
    );
  }
}
