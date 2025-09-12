import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matatu/common/Controller.dart';

Future<void> init() async {
  Get.lazyPut(() => MemberController());
}
class utilities {
static DateFormat formatter = DateFormat('dd-MMM-yyyy');
static final DateFormat loandateformatter = DateFormat('MMM-yyyy');
static NumberFormat formatcurrency =
NumberFormat.currency(locale: "en_KE", symbol: "");

}