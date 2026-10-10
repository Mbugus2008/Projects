import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rental/app/data/api_service.dart';
import 'package:rental/app/modules/settings/controllers/settings_controller.dart';

import 'fakes.dart';

Future<void> flush() async {
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);
}

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('SettingsController', () {
    late FakeApiService api;

    setUp(() {
      api = FakeApiService();
      Get.put<ApiService>(api);
    });

    test('loads the current billing values into the form', () async {
      api.settingsData = {'waterRatePerUnit': 180.0, 'garbageFee': 700.0};
      final controller = Get.put(SettingsController());
      await flush();

      expect(controller.waterRateController.text, '180');
      expect(controller.garbageFeeController.text, '700');
      expect(controller.isLoading.value, isFalse);
      controller.onClose();
    });

    test('save sends the parsed values and updates the store', () async {
      final controller = Get.put(SettingsController());
      await flush();

      controller.waterRateController.text = '200';
      controller.garbageFeeController.text = '650';
      final success = await controller.save();

      expect(success, isTrue);
      expect(api.updateCalls, 1);
      expect(api.lastPayload!['waterRatePerUnit'], 200.0);
      expect(api.lastPayload!['garbageFee'], 650.0);
      expect(api.settingsData['waterRatePerUnit'], 200.0);
      expect(api.settingsData['garbageFee'], 650.0);
      controller.onClose();
    });

    test('save reports failure when the API rejects', () async {
      final controller = Get.put(SettingsController());
      await flush();

      api.updateResult = false;
      final success = await controller.save();

      expect(success, isFalse);
      controller.onClose();
    });
  });
}
