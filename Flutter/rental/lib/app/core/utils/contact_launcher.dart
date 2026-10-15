import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

/// Deep-link helpers for calling and messaging tenants.
///
/// Kenya-focused: phone numbers are normalised to the 254XXXXXXXXX form used
/// by wa.me links, tolerating '+254 712 345 678', '0712 345 678' and
/// '712345678' inputs.
class ContactLauncher {
  ContactLauncher._();

  /// Normalises a Kenyan phone number to `2547XXXXXXXX`.
  static String normalizeKePhone(String raw) {
    var digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.startsWith('0')) return '254${digits.substring(1)}';
    if (digits.startsWith('254')) return digits;
    if (digits.length == 9) return '254$digits';
    return digits;
  }

  static Future<void> call(String phone) =>
      _launch(Uri(scheme: 'tel', path: _clean(phone)));

  static Future<void> sms(String phone, String message) => _launch(
    Uri(scheme: 'sms', path: _clean(phone), queryParameters: {'body': message}),
  );

  static Future<void> whatsApp(String phone, String message) => _launch(
    Uri.parse(
      'https://wa.me/${normalizeKePhone(phone)}'
      '?text=${Uri.encodeComponent(message)}',
    ),
  );

  /// Copies a message to the clipboard (fallback when no SMS app is set up).
  static Future<void> copy(String message) async {
    await Clipboard.setData(ClipboardData(text: message));
  }

  static Future<void> _launch(Uri uri) async {
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!opened) {
        _notify('Could not open the messaging app on this device.');
      }
    } catch (_) {
      _notify('Could not open the messaging app on this device.');
    }
  }

  static void _notify(String message) {
    // Guard: snackbars are unsafe in headless test environments.
    if (Get.testMode) return;
    Get.snackbar(
      'Action unavailable',
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static String _clean(String phone) => phone.replaceAll(' ', '');
}
