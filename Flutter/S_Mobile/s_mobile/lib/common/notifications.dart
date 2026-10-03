import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Thin wrapper around local (on-device) notifications.
///
/// Used for alerts raised by the app itself (overdue loans, upcoming
/// repayments, money received). True server-initiated push requires FCM
/// with a Firebase project (google-services.json) — see project notes.
class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  static bool _ready = false;

  static Future<void> init() async {
    if (_ready) return;
    try {
      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const settings = InitializationSettings(android: android);
      await _plugin.initialize(settings);
      await _plugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      _ready = true;
    } catch (_) {}
  }

  static Future<void> show(String title, String body) async {
    try {
      if (!_ready) await init();
      const details = NotificationDetails(
        android: AndroidNotificationDetails(
          's_mobile_alerts',
          'Alerts & reminders',
          channelDescription: 'Loan repayment reminders and account alerts',
          importance: Importance.high,
          priority: Priority.high,
        ),
      );
      await _plugin.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000 % 100000,
        title,
        body,
        details,
      );
    } catch (_) {}
  }
}
