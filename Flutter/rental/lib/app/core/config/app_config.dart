class AppConfig {
  AppConfig._();

  /// Base URL for the API.
  ///
  /// Production default (main.trimline.co.ke). Override per environment with
  /// --dart-define, e.g.:
  /// - Android emulator (local dev API): `flutter run --dart-define=API_BASE_URL=http://10.0.2.2:7171/api`
  /// - Physical device (local dev API):  `flutter run --dart-define=API_BASE_URL=http://192.168.8.226:7171/api`
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://main.trimline.co.ke:4018/api',
  );

  /// Connect / read timeouts in seconds.
  static const int httpTimeoutSeconds = 30;

  /// Storage keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
}
