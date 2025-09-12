import 'package:get/get.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member.dart';

class MemberController extends GetxController {
  Rx<Member> currentCustomer = Member().obs;
  RxList<entries> currentstatement = <entries>[].obs;
}
