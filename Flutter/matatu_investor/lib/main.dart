import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:matatu/common/Apis.dart';
import 'package:matatu/config/app_config.dart';
import 'package:matatu/helpers/init.dart';
import 'package:matatu/screens/modern_login.dart';
import 'package:matatu/services/cache_service.dart';
import 'package:matatu/widgets/performance_monitor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services before app starts
  await _initializeServices();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Optimize performance
  _optimizePerformance();

  await init();
  runApp(const MyApp());
}

Future<void> _initializeServices() async {
  // Initialize cache service
  await CacheService.getInstance();

  // Initialize API client cache
  await ApiClient().initCache();
}

void _optimizePerformance() {
  // Enable hardware acceleration
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // Reduce unnecessary rebuilds
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.red.shade100,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error: ${details.exception}',
                style: const TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PerformanceMonitor(
      enabled: AppConfig.isDebugMode && AppConfig.enablePerformanceMonitoring,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Matatu Investor',
        // Use lazy loading for routes
        // Disable unnecessary transitions on slow devices
        defaultTransition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 200),
        // Enable smart management for better memory handling
        smartManagement: SmartManagement.keepFactory,
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
          primaryColor: Colors.blue.shade400,
          scaffoldBackgroundColor: Colors.grey.shade50,
          cardTheme: CardThemeData(
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue.shade700,
            shadowColor: Colors.transparent,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          fontFamily: 'georgia',
          textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              titleLarge:
                  TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyMedium: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
              titleMedium: TextStyle(
                  fontSize: 10.0,
                  color: Colors.blue,
                  decoration: TextDecoration.overline),
              bodySmall: TextStyle(
                  color: Colors.black87,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500)),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textTheme: ButtonTextTheme.accent,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        home: const ModernLogin(),
      ),
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
