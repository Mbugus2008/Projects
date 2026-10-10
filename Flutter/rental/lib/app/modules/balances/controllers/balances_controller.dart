import 'package:get/get.dart';

import '../../../data/api_service.dart';

/// Computes per-tenant rent balances (Bomahut-style "account balances"):
/// total billed to date vs payments received, and the outstanding balance.
///
/// Deliberately free of snackbars/UI side effects so it stays fully testable
/// in headless environments.
class BalancesController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> rows = <Map<String, dynamic>>[].obs;
  final RxDouble totalOutstanding = 0.0.obs;
  final RxInt tenantsInArrears = 0.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      final leases = await _apiService.getLeases();
      final transactions = await _apiService.getTransactions();
      final tenants = await _apiService.getTenants();
      final properties = await _apiService.getProperties();

      // The API returns flat records with foreign keys; resolve display names
      // and contact details client-side.
      final tenantById = <dynamic, Map<String, dynamic>>{
        for (final tenant in tenants) tenant['id']: tenant,
      };
      final propertyNameById = <dynamic, String>{
        for (final property in properties)
          property['id']: property['name']?.toString() ?? '',
      };

      final now = DateTime.now();
      final computed = <Map<String, dynamic>>[];
      var outstanding = 0.0;
      var arrears = 0;

      for (final lease in leases) {
        final tenantId = lease['tenantId'];
        final tenant = tenantById[tenantId];

        final leaseTenant = (lease['tenant'] ?? '').toString();
        final tenantName = leaseTenant.isNotEmpty
            ? leaseTenant
            : tenant == null
                ? ''
                : '${tenant['firstName'] ?? ''} ${tenant['lastName'] ?? ''}'
                    .trim();

        final propertyName = (lease['property'] ?? '').toString().isNotEmpty
            ? lease['property'].toString()
            : propertyNameById[lease['propertyId']] ?? '';

        final unit = (lease['unit'] ?? lease['unitId'] ?? '').toString();

        final phone = tenant?['phoneNumber']?.toString() ?? '';

        final rent = _toDouble(lease['monthlyRent']);
        final start =
            DateTime.tryParse(lease['startDate']?.toString() ?? '');
        if (tenantName.isEmpty || rent <= 0 || start == null) continue;

        final end = DateTime.tryParse(lease['endDate']?.toString() ?? '');
        var months = (now.year - start.year) * 12 + (now.month - start.month) + 1;
        if (end != null) {
          final endMonths =
              (end.year - start.year) * 12 + (end.month - start.month) + 1;
          if (endMonths < months) months = endMonths;
        }
        if (months < 1) months = 1;
        if (months > 600) months = 600;

        final expected = months * rent;
        final payments = transactions.where((t) {
          if (t['type']?.toString() != 'Income') return false;
          if (t['tenantId'] != null && tenantId != null) {
            return t['tenantId'] == tenantId;
          }
          return t['tenant']?.toString() == tenantName &&
              tenantName.isNotEmpty;
        }).toList()
          ..sort((a, b) => _dateOf(b).compareTo(_dateOf(a)));

        final paid = payments.fold<double>(
          0,
          (sum, t) => sum + _toDouble(t['amount']),
        );
        final lastPayment = payments.isEmpty ? null : payments.first;
        final balance = expected - paid > 0 ? expected - paid : 0.0;

        final status = balance <= 0
            ? 'Paid'
            : (paid <= 0 ? 'Overdue' : 'Partial');

        outstanding += balance;
        if (balance > 0) arrears++;

        computed.add({
          'leaseId': lease['id'],
          'tenant': tenantName,
          'property': propertyName,
          'unit': unit,
          'monthlyRent': rent,
          'expected': expected,
          'paid': paid,
          'balance': balance,
          'status': status,
          'months': months,
          'phone': phone,
          'lastPaymentAmount':
              lastPayment == null ? null : _toDouble(lastPayment['amount']),
          'lastPaymentDate': lastPayment == null
              ? null
              : _dateOf(lastPayment).toIso8601String(),
          'lastPaymentRef': lastPayment == null || lastPayment['id'] == null
              ? null
              : 'RCPT-${lastPayment['id']}',
        });
      }

      rows.value = computed;
      totalOutstanding.value = outstanding;
      tenantsInArrears.value = arrears;
    } catch (_) {
      rows.value = [];
      totalOutstanding.value = 0;
      tenantsInArrears.value = 0;
    } finally {
      isLoading.value = false;
    }
  }

  static double _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '') ?? 0.0;
  }

  static DateTime _dateOf(Map<String, dynamic> t) =>
      DateTime.tryParse((t['transactionDate'] ?? t['date'] ?? '').toString()) ??
      DateTime.fromMillisecondsSinceEpoch(0);
}
