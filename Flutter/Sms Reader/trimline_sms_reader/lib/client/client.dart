import 'package:telephony/telephony.dart';

abstract class SmsClients {
  final Telephony telephony = Telephony.instance;
  Future<void> getsms();
}
