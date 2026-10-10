import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rental/app/core/utils/contact_launcher.dart';
import 'package:rental/app/core/utils/rent_messages.dart';
import 'package:rental/app/data/api_service.dart';
import 'package:rental/app/modules/balances/controllers/balances_controller.dart';

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

  group('ContactLauncher.normalizeKePhone', () {
    test('keeps 254-prefixed numbers', () {
      expect(ContactLauncher.normalizeKePhone('254712345678'), '254712345678');
    });

    test('converts +254 with spaces', () {
      expect(ContactLauncher.normalizeKePhone('+254 712 345 678'),
          '254712345678');
    });

    test('converts leading 0 format', () {
      expect(ContactLauncher.normalizeKePhone('0712 345 678'), '254712345678');
    });

    test('prepends 254 to bare 9-digit numbers', () {
      expect(ContactLauncher.normalizeKePhone('712345678'), '254712345678');
    });

    test('strips dashes and parentheses', () {
      expect(ContactLauncher.normalizeKePhone('(0712) 345-678'),
          '254712345678');
    });
  });

  group('RentMessages', () {
    test('reminder mentions tenant, location and balance', () {
      final message = RentMessages.reminder(
        tenant: 'Wanjiru Kamau',
        property: 'Kilimani Heights',
        unit: '3',
        balance: 85000,
      );
      expect(message, contains('Wanjiru Kamau'));
      expect(message, contains('Kilimani Heights - Unit 3'));
      expect(message, contains('KSh 85,000.00'));
      expect(message, contains('M-PESA'));
    });

    test('invoice shows rent and period', () {
      final message = RentMessages.invoice(
        tenant: 'Otieno Odhiambo',
        property: 'Nyali Palms',
        unit: '1',
        rent: 95000,
        period: DateTime(2026, 10, 5),
      );
      expect(message, contains('RENT INVOICE'));
      expect(message, contains('KSh 95,000.00'));
      expect(message, contains('1 Oct 2026'));
    });

    test('statement shows billed, paid and balance', () {
      final message = RentMessages.statement(
        tenant: 'Aisha Hassan',
        property: 'Kilimani Heights',
        unit: '7',
        expected: 255000,
        paid: 170000,
        balance: 85000,
      );
      expect(message, contains('KSh 255,000.00'));
      expect(message, contains('KSh 170,000.00'));
      expect(message, contains('KSh 85,000.00'));
    });

    test('receipt shows amount, date and reference', () {
      final message = RentMessages.receipt(
        tenant: 'Wanjiru Kamau',
        amount: 85000,
        date: DateTime(2026, 10, 8),
        reference: 'MPESA-QGR7X1',
      );
      expect(message, contains('RENT RECEIPT'));
      expect(message, contains('8 Oct 2026'));
      expect(message, contains('MPESA-QGR7X1'));
    });

    test('handles leases without a unit', () {
      final message = RentMessages.reminder(
        tenant: 'A',
        property: 'Kilimani Heights',
        unit: 'N/A',
        balance: 1000,
      );
      expect(message, contains('Kilimani Heights is'));
      expect(message, isNot(contains('Unit')));
    });
  });

  group('BalancesController', () {
    late FakeApiService api;

    setUp(() {
      api = FakeApiService();
      Get.put<ApiService>(api);
    });

    void seedLease({
      required DateTime start,
      DateTime? end,
      double rent = 85000,
      String tenant = 'Wanjiru Kamau',
    }) {
      api.store['leases']!.add({
        'id': 1,
        'tenantId': 1,
        'tenant': tenant,
        'property': 'Kilimani Heights',
        'unit': '3',
        'monthlyRent': rent,
        'startDate': start.toIso8601String(),
        'endDate': end?.toIso8601String(),
        'status': 'Active',
      });
    }

    test('computes billed, paid and balance per tenant', () async {
      final now = DateTime.now();
      seedLease(start: DateTime(now.year, now.month - 2, 1));
      api.store['transactions']!.addAll([
        {'id': 1, 'type': 'Income', 'amount': 85000.0, 'tenant': 'Wanjiru Kamau'},
        {'id': 2, 'type': 'Income', 'amount': 85000.0, 'tenant': 'Wanjiru Kamau'},
        {'id': 3, 'type': 'Expense', 'amount': 12500.0, 'tenant': 'Wanjiru Kamau'},
      ]);
      api.store['tenants']!.add({
        'id': 1,
        'firstName': 'Wanjiru',
        'lastName': 'Kamau',
        'phoneNumber': '+254 712 345 678',
      });

      final controller = Get.put(BalancesController());
      await flush();

      expect(controller.rows.length, 1);
      final row = controller.rows.first;
      expect(row['months'], 3);
      expect(row['expected'], 255000.0);
      expect(row['paid'], 170000.0);
      expect(row['balance'], 85000.0);
      expect(row['status'], 'Partial');
      expect(row['phone'], '+254 712 345 678');
      expect(row['lastPaymentAmount'], 85000.0);
      expect(row['lastPaymentRef'], startsWith('RCPT-'));
      expect(controller.totalOutstanding.value, 85000.0);
      expect(controller.tenantsInArrears.value, 1);
      controller.onClose();
    });

    test('fully paid tenant is not in arrears', () async {
      final now = DateTime.now();
      seedLease(start: DateTime(now.year, now.month - 1, 1));
      api.store['transactions']!.addAll([
        {'id': 1, 'type': 'Income', 'amount': 85000.0, 'tenant': 'Wanjiru Kamau'},
        {'id': 2, 'type': 'Income', 'amount': 85000.0, 'tenant': 'Wanjiru Kamau'},
      ]);

      final controller = Get.put(BalancesController());
      await flush();

      final row = controller.rows.first;
      expect(row['status'], 'Paid');
      expect(row['balance'], 0.0);
      expect(controller.totalOutstanding.value, 0.0);
      expect(controller.tenantsInArrears.value, 0);
      controller.onClose();
    });

    test('tenant with no payments is overdue', () async {
      final now = DateTime.now();
      seedLease(start: DateTime(now.year, now.month, 1));

      final controller = Get.put(BalancesController());
      await flush();

      final row = controller.rows.first;
      expect(row['status'], 'Overdue');
      expect(row['paid'], 0.0);
      expect(row['balance'], 85000.0);
      expect(row['lastPaymentAmount'], isNull);
      controller.onClose();
    });

    test('caps billing at the lease end date', () async {
      // Lease ended ~1 month after starting two months ago: only 2 months
      // should be billed, not 3.
      final now = DateTime.now();
      final start = DateTime(now.year, now.month - 2, 1);
      final end = DateTime(now.year, now.month - 1, 1);
      seedLease(start: start, end: end);

      final controller = Get.put(BalancesController());
      await flush();

      expect(controller.rows.first['months'], 2);
      controller.onClose();
    });

    test('skips leases without tenant or rent', () async {
      api.store['leases']!.addAll([
        {'id': 1, 'tenant': '', 'monthlyRent': 85000.0, 'startDate': '2026-01-01'},
        {'id': 2, 'tenant': 'Someone', 'monthlyRent': 0.0, 'startDate': '2026-01-01'},
        {'id': 3, 'tenant': 'No Start', 'monthlyRent': 5000.0},
      ]);

      final controller = Get.put(BalancesController());
      await flush();

      expect(controller.rows, isEmpty);
      controller.onClose();
    });
  });
}
