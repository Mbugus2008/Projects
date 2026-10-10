import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rental/app/data/api_service.dart';
import 'package:rental/app/modules/finances/controllers/finances_controller.dart';
import 'package:rental/app/modules/leases/controllers/leases_controller.dart';
import 'package:rental/app/modules/properties/controllers/properties_controller.dart';
import 'package:rental/app/modules/tenants/controllers/tenants_controller.dart';

import 'fakes.dart';

/// Flushes pending microtasks so controller `onInit` loads complete.
Future<void> flush() async {
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);
}

// NOTE: the legacy module controllers call `Get.snackbar` on add/edit/delete
// success. GetX snackbars need an app Overlay that the headless test
// environment cannot resolve (they render fine in the running app), so those
// flows are covered by on-device verification; the tests here cover the
// headless logic: loading, state mapping, form resets and computed totals.

void main() {
  late FakeApiService api;

  setUp(() {
    Get.testMode = true;
    api = FakeApiService();
    Get.put<ApiService>(api);
  });

  tearDown(Get.reset);

  group('PropertiesController', () {
    test('loads properties on init', () async {
      api.store['properties']!.addAll([
        {'id': 1, 'name': 'Kilimani Heights', 'city': 'Nairobi'},
        {'id': 2, 'name': 'Nyali Palms', 'city': 'Mombasa'},
      ]);

      final controller = Get.put(PropertiesController());
      await flush();

      expect(controller.properties.length, 2);
      expect(controller.isLoading.value, isFalse);
      controller.onClose();
    });

    test('clearForm resets every field', () async {
      final controller = Get.put(PropertiesController());
      await flush();

      controller.nameController.text = 'A';
      controller.cityController.text = 'B';
      controller.notesController.text = 'C';
      controller.clearForm();

      expect(controller.nameController.text, isEmpty);
      expect(controller.cityController.text, isEmpty);
      expect(controller.notesController.text, isEmpty);
      controller.onClose();
    });
  });

  group('TenantsController', () {
    test('loads tenants on init', () async {
      api.store['tenants']!.add({
        'id': 1,
        'firstName': 'Wanjiru',
        'lastName': 'Kamau',
        'phoneNumber': '+254 712 345 678',
      });

      final controller = Get.put(TenantsController());
      await flush();

      expect(controller.tenants.length, 1);
      expect(controller.tenants.first['firstName'], 'Wanjiru');
      controller.onClose();
    });

    test('clearForm resets contact fields', () async {
      final controller = Get.put(TenantsController());
      await flush();

      controller.firstNameController.text = 'Aisha';
      controller.phoneController.text = '+254 733 456 789';
      controller.clearForm();

      expect(controller.firstNameController.text, isEmpty);
      expect(controller.phoneController.text, isEmpty);
      controller.onClose();
    });
  });

  group('LeasesController', () {
    test('loads leases from the API', () async {
      api.store['leases']!.addAll([
        {
          'id': 1,
          'tenant': 'Wanjiru Kamau',
          'property': 'Kilimani Heights',
          'monthlyRent': 85000.0,
          'status': 'Active',
        },
      ]);

      final controller = Get.put(LeasesController());
      await flush();

      expect(controller.leases.length, 1);
      expect(controller.leases.first['monthlyRent'], 85000.0);
      controller.onClose();
    });

    test('clearForm resets lease fields', () async {
      final controller = Get.put(LeasesController());
      await flush();

      controller.monthlyRentController.text = '85000';
      controller.tenantController.text = 'Wanjiru Kamau';
      controller.clearForm();

      expect(controller.monthlyRentController.text, isEmpty);
      expect(controller.tenantController.text, isEmpty);
      controller.onClose();
    });
  });

  group('FinancesController', () {
    test('computes income, expenses and net income', () async {
      api.store['transactions']!.addAll([
        {'id': 1, 'type': 'Income', 'amount': 85000.0, 'category': 'Rent'},
        {'id': 2, 'type': 'Income', 'amount': 95000.0, 'category': 'Rent'},
        {'id': 3, 'type': 'Expense', 'amount': 12500.0, 'category': 'Maintenance'},
      ]);

      final controller = Get.put(FinancesController());
      await flush();

      expect(controller.totalIncome.value, 180000.0);
      expect(controller.totalExpenses.value, 12500.0);
      expect(controller.netIncome.value, 167500.0);
      controller.onClose();
    });
  });
}
