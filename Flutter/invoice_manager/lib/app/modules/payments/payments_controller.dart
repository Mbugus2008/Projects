import 'package:get/get.dart';

class PaymentsController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList payments = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadPayments();
  }

  void loadPayments() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }
}
