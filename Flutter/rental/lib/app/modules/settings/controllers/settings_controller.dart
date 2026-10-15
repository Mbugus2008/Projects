import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api_service.dart';

/// App-wide settings: global billing values shared across invoices.
///
/// Rent is not configured here on purpose — each tenant's rent comes from
/// their lease and is preset automatically when creating an invoice.
class SettingsController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  final RxBool isLoading = false.obs;
  final RxBool isSaving = false.obs;

  final TextEditingController waterRateController = TextEditingController();
  final TextEditingController garbageFeeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  @override
  void onClose() {
    waterRateController.dispose();
    garbageFeeController.dispose();
    super.onClose();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      final settings = await _apiService.getSettings();
      waterRateController.text = _format(settings['waterRatePerUnit']);
      garbageFeeController.text = _format(settings['garbageFee']);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> save() async {
    isSaving.value = true;
    try {
      return await _apiService.updateSettings({
        'waterRatePerUnit':
            double.tryParse(waterRateController.text.trim()) ?? 0,
        'garbageFee': double.tryParse(garbageFeeController.text.trim()) ?? 0,
      });
    } finally {
      isSaving.value = false;
    }
  }

  static String _format(dynamic value) {
    final parsed =
        value is num
            ? value.toDouble()
            : double.tryParse(value?.toString() ?? '') ?? 0;
    return parsed == parsed.roundToDouble()
        ? parsed.toStringAsFixed(0)
        : parsed.toString();
  }
}
