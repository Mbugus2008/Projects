import 'package:flutter/material.dart';

class ThemeConfig {
  // Define color schemes for different clients
  static final Map<String, ClientTheme> _clientThemes = {
    'matatu-investor-flutter': ClientTheme(
      primaryColor: Colors.blue,
      secondaryColor: Colors.blueAccent,
      accentColor: Colors.orange,
      appBarColor: Colors.blue,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      textColor: Colors.black87,
      appName: 'Matatu Investor',
    ),
    // Add more client configurations here
    'client-two': ClientTheme(
      primaryColor: Colors.green,
      secondaryColor: Colors.greenAccent,
      accentColor: Colors.amber,
      appBarColor: Colors.green,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      textColor: Colors.black87,
      appName: 'Client Two',
    ),
  };

  // Get current client theme based on configuration
  static ClientTheme get currentTheme {
    return _clientThemes['matatu-investor-flutter']!;
  }

  // Generate MaterialTheme from client configuration
  static ThemeData get themeData {
    final theme = currentTheme;
    return ThemeData(
      primaryColor: theme.primaryColor,
      scaffoldBackgroundColor: theme.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: theme.appBarColor,
        foregroundColor: Colors.white,
        elevation: 4,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: theme.cardColor,
        elevation: 4,
        margin: EdgeInsets.all(8),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: theme.primaryColor,
        secondary: theme.secondaryColor,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: theme.textColor),
        bodyMedium: TextStyle(color: theme.textColor),
        titleLarge:
            TextStyle(color: theme.textColor, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
      ),
    );
  }
}

class ClientTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color appBarColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color textColor;
  final String appName;

  ClientTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.appBarColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.textColor,
    required this.appName,
  });
}
