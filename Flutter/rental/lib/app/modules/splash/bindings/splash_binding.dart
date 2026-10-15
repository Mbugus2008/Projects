import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Eager registration: the splash view is static, so a lazy controller
    // would never be instantiated and its onInit navigation would never run.
    Get.put<SplashController>(SplashController());
  }
}
