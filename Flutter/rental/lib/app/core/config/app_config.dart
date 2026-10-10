class AppConfig {
  AppConfig._();

  /// Base URL for the API.
  ///
  /// Override per environment with --dart-define, e.g.:
  /// - Android emulator: `flutter run --dart-define=API_BASE_URL=http://10.0.2.2:7171/api`
  /// - Physical device:  `flutter run --dart-define=API_BASE_URL=http://192.168.8.226:7171/api`
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://192.168.0.100:7170/api',
  );

  /// Connect / read timeouts in seconds.
  static const int httpTimeoutSeconds = 30;

  /// Storage keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
}
