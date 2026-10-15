import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rental/app/core/utils/rent_messages.dart';
import 'package:rental/app/data/api_service.dart';
import 'package:rental/app/modules/invoices/controllers/invoices_controller.dart';

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

  group('Invoice messages', () {
    test('itemized invoice lists each amenity, amounts and total', () {
      final message = RentMessages.itemizedInvoice(
        tenant: 'Wanjiru Kamau',
        invoiceNumber: 'INV-0003',
        property: 'Kilimani Heights',
        unit: '3',
        lines: const [
          {'description': 'Rent', 'amount': 85000},
          {'description': 'Water', 'amount': 2700},
          {'description': 'Garbage', 'amount': 500},
        ],
        total: 88200,
        dueDate: DateTime(2026, 10, 15),
      );

      expect(message, contains('RENT INVOICE INV-0003'));
      expect(message, contains('Wanjiru Kamau'));
      expect(message, contains('Kilimani Heights - Unit 3'));
      expect(message, contains('- Rent: KSh 85,000.00'));
      expect(message, contains('- Water: KSh 2,700.00'));
      expect(message, contains('- Garbage: KSh 500.00'));
      expect(message, contains('Total: KSh 88,200.00'));
      expect(message, contains('Due: 15 Oct 2026'));
      expect(message, contains('M-PESA'));
    });

    test('receipt references the invoice it is issued against', () {
      final message = RentMessages.receiptForInvoice(
        tenant: 'Wanjiru Kamau',
        invoiceNumber: 'INV-0003',
        amount: 88200,
        date: DateTime(2026, 10, 8),
      );

      expect(message, contains('RENT RECEIPT'));
      expect(message, contains('Against invoice: INV-0003'));
      expect(message, contains('KSh 88,200.00'));
      expect(message, contains('8 Oct 2026'));
    });
  });

  group('InvoicesController', () {
    late FakeApiService api;

    setUp(() {
      api = FakeApiService();
      Get.put<ApiService>(api);
      api.store['tenants']!.add({
        'id': 1,
        'firstName': 'Wanjiru',
        'lastName': 'Kamau',
        'phoneNumber': '+254 712 345 678',
      });
      api.store['properties']!.add({'id': 1, 'name': 'Kilimani Heights'});
    });

    test('loads invoices with tenant and property resolution', () async {
      api.store['invoices']!.add({
        'id': 1,
        'invoiceNumber': 'INV-0003',
        'tenantId': 1,
        'propertyId': 1,
        'totalAmount': 88200.0,
        'amountPaid': 0.0,
        'status': 'Sent',
      });

      final controller = Get.put(InvoicesController());
      await flush();

      expect(controller.invoices.length, 1);
      expect(controller.tenantName(1), 'Wanjiru Kamau');
      expect(controller.tenantPhone(1), '+254 712 345 678');
      expect(controller.propertyName(1), 'Kilimani Heights');
      controller.onClose();
    });

    test('buildPayload requires a tenant and valid lines', () async {
      final controller = Get.put(InvoicesController());
      await flush();

      // No tenant, no lines.
      expect(controller.buildPayload(), isNull);

      // Lines but no tenant.
      controller.addLine('Rent');
      controller.lineAmounts[0].text = '85000';
      expect(controller.buildPayload(), isNull);

      // Tenant but lines with zero/empty amounts are skipped.
      controller.draftTenantId.value = 1;
      controller.lineAmounts[0].text = '0';
      expect(controller.buildPayload(), isNull);

      controller.lineAmounts[0].text = '85000';
      controller.addLine('Water');
      controller.lineAmounts[1].text = '2700';
      controller.addLine('Garbage');
      controller.lineAmounts[2].text = 'abc';

      final payload = controller.buildPayload()!;
      expect(payload['tenantId'], 1);
      expect(payload['status'], 'Sent');
      final lines = payload['lines'] as List;
      expect(lines.length, 2);
      expect(lines[0]['description'], 'Rent');
      expect(lines[0]['amount'], 85000.0);
      expect(lines[1]['description'], 'Water');
      expect(controller.draftTotal, 87700.0);
      controller.onClose();
    });

    test('saveDraft creates the invoice and clears the draft', () async {
      final controller = Get.put(InvoicesController());
      await flush();

      controller.draftTenantId.value = 1;
      controller.addLine('Rent');
      controller.lineAmounts[0].text = '85000';
      controller.addLine('Water');
      controller.lineAmounts[1].text = '2700';

      final success = await controller.saveDraft();
      await flush();

      expect(success, isTrue);
      expect(api.addCalls, 1);
      expect(api.lastPayload!['lines'], hasLength(2));
      expect(controller.invoices.length, 1); // fake store now has one
      expect(controller.lineDescriptions, isEmpty);
      expect(controller.draftTenantId.value, 0);
      controller.onClose();
    });

    test('saveDraft returns false and keeps draft on API failure', () async {
      api.addResult = false;
      final controller = Get.put(InvoicesController());
      await flush();

      controller.draftTenantId.value = 1;
      controller.addLine('Rent');
      controller.lineAmounts[0].text = '85000';

      final success = await controller.saveDraft();

      expect(success, isFalse);
      expect(controller.lineDescriptions.length, 1);
      controller.onClose();
    });

    test(
      'recordPayment marks a full payment as Paid and logs income',
      () async {
        final controller = Get.put(InvoicesController());
        await flush();

        final invoice = {
          'id': 3,
          'invoiceNumber': 'INV-0003',
          'tenantId': 1,
          'propertyId': 1,
          'totalAmount': 88200.0,
          'amountPaid': 0.0,
        };

        final success = await controller.recordPayment(invoice, 88200);
        await flush();

        expect(success, isTrue);
        expect(api.updateCalls, 1);
        expect(api.lastId, 3);
        expect(api.lastUpdatePayload!['amountPaid'], 88200.0);
        expect(api.lastUpdatePayload!['status'], 'Paid');
        expect(api.addCalls, 1);
        expect(api.lastPayload!['description'], 'Payment for INV-0003');
        controller.onClose();
      },
    );

    test('recordPayment marks a partial payment as Partial', () async {
      final controller = Get.put(InvoicesController());
      await flush();

      final invoice = {
        'id': 3,
        'invoiceNumber': 'INV-0003',
        'tenantId': 1,
        'totalAmount': 88200.0,
        'amountPaid': 0.0,
      };

      await controller.recordPayment(invoice, 40000);
      await flush();

      expect(api.lastUpdatePayload!['amountPaid'], 40000.0);
      expect(api.lastUpdatePayload!['status'], 'Partial');
      controller.onClose();
    });

    test('removeInvoice deletes and reloads', () async {
      api.store['invoices']!.add({'id': 9, 'totalAmount': 100.0});
      final controller = Get.put(InvoicesController());
      await flush();

      final success = await controller.removeInvoice(9);

      expect(success, isTrue);
      expect(api.deleteCalls, 1);
      expect(controller.invoices, isEmpty);
      controller.onClose();
    });

    test('loads global billing settings', () async {
      api.settingsData = {'waterRatePerUnit': 180.0, 'garbageFee': 700.0};
      final controller = Get.put(InvoicesController());
      await flush();

      expect(controller.waterRate.value, 180.0);
      expect(controller.garbageFee.value, 700.0);
      controller.onClose();
    });

    test('selecting a tenant presets the rent from their lease', () async {
      api.store['leases']!.add({
        'id': 1,
        'tenantId': 1,
        'monthlyRent': 85000.0,
        'status': 'Active',
        'startDate': '2026-01-01',
      });
      final controller = Get.put(InvoicesController());
      await flush();

      controller.clearDraft();
      controller.addLine('Rent');
      controller.onTenantChanged(1);

      expect(controller.draftTenantId.value, 1);
      expect(controller.lineDescriptions[0].text, 'Rent');
      expect(controller.lineAmounts[0].text, '85000');
      controller.onClose();
    });

    test(
      'rent preset fills an existing empty Rent line, not a new one',
      () async {
        api.store['leases']!.add({
          'id': 1,
          'tenantId': 1,
          'monthlyRent': 52000.0,
          'status': 'Active',
        });
        final controller = Get.put(InvoicesController());
        await flush();

        controller.clearDraft();
        controller.addLine('Rent');
        controller.addLine('Water (3 units)');
        controller.onTenantChanged(1);

        expect(controller.lineAmounts.length, 2);
        expect(controller.lineAmounts[0].text, '52000');
        expect(controller.lineAmounts[1].text, '');
        controller.onClose();
      },
    );

    test('garbage quick-add uses the global monthly fee', () async {
      api.settingsData = {'waterRatePerUnit': 180.0, 'garbageFee': 700.0};
      final controller = Get.put(InvoicesController());
      await flush();

      controller.clearDraft();
      controller.addGarbageLine();

      expect(controller.lineDescriptions[0].text, 'Garbage');
      expect(controller.lineAmounts[0].text, '700');
      controller.onClose();
    });

    test('water quick-add bills units × the price per unit', () async {
      api.settingsData = {'waterRatePerUnit': 180.0, 'garbageFee': 700.0};
      final controller = Get.put(InvoicesController());
      await flush();

      controller.clearDraft();
      controller.addWaterLine(12);
      controller.addWaterLine(2.5);

      expect(controller.lineDescriptions[0].text, 'Water (12 units)');
      expect(controller.lineAmounts[0].text, '2160');
      expect(controller.lineDescriptions[1].text, 'Water (2.5 units)');
      expect(controller.lineAmounts[1].text, '450');
      controller.onClose();
    });

    test('preset lines flow into the saved invoice payload', () async {
      api.settingsData = {'waterRatePerUnit': 150.0, 'garbageFee': 500.0};
      api.store['leases']!.add({
        'id': 1,
        'tenantId': 1,
        'monthlyRent': 85000.0,
        'status': 'Active',
      });
      final controller = Get.put(InvoicesController());
      await flush();

      controller.clearDraft();
      controller.unitController.text = '3';
      controller.onTenantChanged(1);
      controller.addWaterLine(10);
      controller.addGarbageLine();

      final success = await controller.saveDraft();
      await flush();

      expect(success, isTrue);
      final lines = api.lastPayload!['lines'] as List;
      expect(lines.length, 3);
      expect(lines[0], {'description': 'Rent', 'amount': 85000.0});
      expect(lines[1], {'description': 'Water (10 units)', 'amount': 1500.0});
      expect(lines[2], {'description': 'Garbage', 'amount': 500.0});
      controller.onClose();
    });
  });
}
