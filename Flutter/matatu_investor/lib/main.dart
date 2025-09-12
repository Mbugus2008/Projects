import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/helpers/init.dart';
import 'package:matatu/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Investor',
      //theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      // primarySwatch: Colors.green,
      // ),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 185, 224, 243),
        // Define the default font family.
        fontFamily: 'georgia',
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
            titleMedium: TextStyle(
                fontSize: 10.0,
                color: Colors.blue,
                decoration: TextDecoration.overline),
            bodySmall: TextStyle(
                color: Colors.black,
                fontSize: 12.5,
                fontWeight: FontWeight.bold)),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      home: Login(title: 'Investor'),
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
