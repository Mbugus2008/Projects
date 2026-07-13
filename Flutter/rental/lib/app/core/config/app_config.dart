class AppConfig {
  AppConfig._();

  /// Base URL for the API. Override per environment.
  static const String baseUrl = 'https://192.168.0.100:7170/api';

  /// Connect / read timeouts in seconds.
  static const int httpTimeoutSeconds = 30;

  /// Storage keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
}
