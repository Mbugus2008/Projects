import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  void _initializeApp() async {
    // Simulate app initialization
    await Future.delayed(const Duration(seconds: 2));
    
    // Check if user is logged in
    bool isLoggedIn = await _checkLoginStatus();
    
    if (isLoggedIn) {
      // Navigate to dashboard
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      // Navigate to onboarding
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }

  Future<bool> _checkLoginStatus() async {
    // TODO: Implement actual login check with Dynamics 365
    // For now, return false to show onboarding
    return false;
  }
}

