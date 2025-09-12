import 'package:get/get.dart';
import '../controllers/finances_controller.dart';

class FinancesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancesController>(
      () => FinancesController(),
    );
  }
}
