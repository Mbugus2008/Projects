import 'package:get/get.dart';
import '../controllers/tenants_controller.dart';

class TenantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TenantsController>(
      () => TenantsController(),
    );
  }
}
