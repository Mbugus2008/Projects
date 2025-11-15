class AppConfig {
  // API Configuration
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://nav.trimline.co.ke:4010/api',
  );

  // OTP Configuration
  static const String otpRecipientPhone = String.fromEnvironment(
    'OTP_RECIPIENT_PHONE',
    defaultValue: '', // Remove hardcoded phone number
  );

  // App Configuration
  static const String appName = 'Matatu Investor';
  static const String appVersion = '1.0.0';

  // Security Configuration
  static const int otpLength = 6;
  static const int otpValidityMinutes = 5;
  static const int passwordMinLength = 6;

  // Performance Configuration
  static const Duration cacheShortDuration = Duration(minutes: 5);
  static const Duration cacheMediumDuration = Duration(minutes: 15);
  static const Duration cacheLongDuration = Duration(hours: 1);
  static const int listPageSize = 20;
  static const int maxConcurrentRequests = 3;
  static const Duration apiTimeout = Duration(seconds: 30);

  // Development/Debug flags
  static const bool isDebugMode = bool.fromEnvironment(
    'DEBUG_MODE',
    defaultValue: true,
  );

  // Feature flags
  static const bool enableCaching = true;
  static const bool enableBackgroundSync = true;
  static const bool enablePerformanceMonitoring = false; // Enable in debug only

  // Validation
  static bool get isConfigValid {
    return baseUrl.isNotEmpty;
  }

  // Environment check
  static String get environment {
    if (baseUrl.contains('localhost') || baseUrl.contains('192.168')) {
      return 'development';
    } else if (baseUrl.contains('staging')) {
      return 'staging';
    } else {
      return 'production';
    }
  }
}
