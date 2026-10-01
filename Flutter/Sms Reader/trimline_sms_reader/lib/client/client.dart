abstract class SmsClients {
  Future<void> getsms();

  /// True when the SMS body is a Kirigiti church M-Pesa receipt,
  /// regardless of which greeting variant was used.
  static bool isKirigitiSms(String body) =>
      body.contains('Dear PCEA T/A PCEA KIRIGITI CHURCH') ||
      body.contains('Dear PCEA KIRIGITI CHURCH');

  /// Maps the greeting in the SMS body to a source tag.
  /// The T/A greeting must be checked first because it does not contain
  /// the plain 'Dear PCEA KIRIGITI CHURCH' substring.
  static String sourceFromBody(String body) {
    if (body.contains('Dear PCEA T/A PCEA KIRIGITI CHURCH')) {
      return 'KIRIGITI_TA';
    } else if (body.contains('Dear PCEA KIRIGITI CHURCH')) {
      return 'KIRIGITI';
    }
    return 'UNKNOWN';
  }
}
