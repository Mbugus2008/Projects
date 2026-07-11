import 'package:get/get.dart';
import 'package:s_mobile/Loans/Schedule.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member.dart';

class MemberController extends GetxController {
  Rx<Member> currentCustomer = Member().obs;
  RxList<entries> currentstatement = <entries>[].obs;

  /// Loan number → repayment schedule entries
  final loanSchedules = <String, List<Schedule>>{}.obs;

  /// The phone number used during login (set after successful authentication).
  String? loginPhone;
}
