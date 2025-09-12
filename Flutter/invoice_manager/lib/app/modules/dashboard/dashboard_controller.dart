import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxMap<String, dynamic> dashboardStats = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  void loadDashboardData() async {
    isLoading.value = true;
    
    try {
      // TODO: Load data from Dynamics 365
      // For now, use mock data
      await Future.delayed(const Duration(seconds: 1));
      
      dashboardStats.value = {
        'totalRevenue': 25000.00,
        'outstandingInvoices': 5,
        'paidInvoices': 12,
        'overdueInvoices': 2,
        'totalCustomers': 8,
        'thisMonthRevenue': 8500.00,
      };
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load dashboard data',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void refreshData() {
    loadDashboardData();
  }

  void navigateToCreateInvoice() {
    Get.toNamed('/create-invoice');
  }

  void navigateToRecordPayment() {
    Get.toNamed('/record-payment');
  }

  void navigateToAddCustomer() {
    Get.toNamed('/add-customer');
  }
}

