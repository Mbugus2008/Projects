import 'package:get/get.dart';

class InvoicesController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList invoices = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadInvoices();
  }

  void loadInvoices() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }
}
