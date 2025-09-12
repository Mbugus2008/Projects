import 'package:get/get.dart';

class CustomersController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList customers = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() async {
    isLoading.value = true;
    // TODO: Load from Dynamics 365
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }
}

