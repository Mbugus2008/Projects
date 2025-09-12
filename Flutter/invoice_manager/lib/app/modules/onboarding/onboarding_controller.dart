import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final RxInt currentPage = 0.obs;
  final RxBool isLoading = false.obs;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Welcome to Invoice Manager',
      description: 'Manage your invoices, customers, and payments seamlessly with Dynamics 365 integration.',
      icon: Icons.receipt_long,
    ),
    OnboardingPage(
      title: 'Customer Management',
      description: 'Keep track of all your customers and their contact information in one place.',
      icon: Icons.people,
    ),
    OnboardingPage(
      title: 'Invoice Creation',
      description: 'Create professional invoices with line items, taxes, and discounts.',
      icon: Icons.description,
    ),
    OnboardingPage(
      title: 'Payment Tracking',
      description: 'Record payments and track outstanding amounts with real-time updates.',
      icon: Icons.payment,
    ),
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      currentPage.value++;
    } else {
      _signInWithMicrosoft();
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void skipToLogin() {
    _signInWithMicrosoft();
  }

  void _signInWithMicrosoft() async {
    isLoading.value = true;
    
    try {
      // TODO: Implement Microsoft OAuth 2.0 authentication
      // For now, simulate login process
      await Future.delayed(const Duration(seconds: 2));
      
      // Navigate to dashboard after successful login
      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      // Handle login error
      Get.snackbar(
        'Login Error',
        'Failed to sign in. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final IconData icon;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
  });
}

