import 'package:get/get.dart';

import '../controllers/balances_controller.dart';

class BalancesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BalancesController>(() => BalancesController());
  }
}
