import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/base_controller.dart';
import '../../../data/api_service.dart';
import '../../../data/auth_service.dart';
import '../../../data/repositories/lease_repository.dart';
import '../../../data/repositories/maintenance_repository.dart';
import '../../../data/repositories/property_repository.dart';
import '../../../data/repositories/transaction_repository.dart';
import '../../../routes/app_routes.dart';

class DashboardController extends BaseController {
  final AuthService _authService = Get.find<AuthService>();
  final ApiService _apiService = Get.find<ApiService>();
  final PropertyRepository _propertyRepo = Get.find<PropertyRepository>();
  final LeaseRepository _leaseRepo = Get.find<LeaseRepository>();
  final TransactionRepository _transactionRepo =
      Get.find<TransactionRepository>();
  final MaintenanceRepository _maintenanceRepo =
      Get.find<MaintenanceRepository>();

  final RxInt selectedIndex = 0.obs;

  // Dashboard metrics (loaded from the API)
  final RxInt totalProperties = 0.obs;
  final RxInt totalUnits = 0.obs;
  final RxInt occupiedUnits = 0.obs;
  final RxInt vacantUnits = 0.obs;
  final RxDouble occupancyRate = 0.0.obs;
  final RxDouble totalRentCollected = 0.0.obs;
  final RxInt pendingMaintenance = 0.obs;
  final RxInt upcomingLeaseRenewals = 0.obs;
  final RxDouble pendingInvoiceAmount = 0.0.obs;
  final RxInt pendingInvoiceCount = 0.obs;

  // Navigation items
  final List<Map<String, dynamic>> navigationItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'route': Routes.dashboard},
    {
      'title': 'Properties',
      'icon': Icons.home_work,
      'route': Routes.properties,
    },
    {'title': 'Tenants', 'icon': Icons.people, 'route': Routes.tenants},
    {'title': 'Leases', 'icon': Icons.description, 'route': Routes.leases},
    {'title': 'Finances', 'icon': Icons.attach_money, 'route': Routes.finances},
    {
      'title': 'Balances',
      'icon': Icons.account_balance_wallet,
      'route': Routes.balances,
    },
    {'title': 'Invoices', 'icon': Icons.receipt_long, 'route': Routes.invoices},
    {'title': 'Maintenance', 'icon': Icons.build, 'route': Routes.maintenance},
    {'title': 'Documents', 'icon': Icons.folder, 'route': Routes.documents},
    {'title': 'Reports', 'icon': Icons.bar_chart, 'route': Routes.reports},
    {'title': 'Settings', 'icon': Icons.settings, 'route': Routes.settings},
  ];

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    await runWithLoading(() async {
      final properties = await _propertyRepo.getAll();
      final leases = await _leaseRepo.getAll();
      final transactions = await _transactionRepo.getAll();
      final maintenanceRequests = await _maintenanceRepo.getAll();
      final invoices = await _apiService.getInvoices();

      totalProperties.value = properties.length;
      totalUnits.value = properties.fold(0, (sum, p) => sum + p.totalUnits);

      // Active leases = occupied units
      final activeLeases = leases.where((l) => l.status == 'Active').length;
      occupiedUnits.value = activeLeases;
      vacantUnits.value = totalUnits.value - activeLeases;
      occupancyRate.value =
          totalUnits.value > 0 ? (activeLeases / totalUnits.value) * 100 : 0.0;

      // Sum income transactions
      totalRentCollected.value = transactions
          .where((t) => t.type == 'Income')
          .fold(0.0, (sum, t) => sum + t.amount);

      // Outstanding invoice balances (drafts are not billed yet)
      var outstanding = 0.0;
      var awaitingPayment = 0;
      for (final invoice in invoices) {
        if (invoice['status']?.toString() == 'Draft') continue;
        final balance =
            _amount(invoice['totalAmount']) - _amount(invoice['amountPaid']);
        if (balance > 0) {
          outstanding += balance;
          awaitingPayment++;
        }
      }
      pendingInvoiceAmount.value = outstanding;
      pendingInvoiceCount.value = awaitingPayment;

      // Count open maintenance requests
      pendingMaintenance.value =
          maintenanceRequests.where((m) => m.status == 'Open').length;

      // Leases ending within the next 30 days
      final now = DateTime.now();
      final thirtyDaysFromNow = now.add(const Duration(days: 30));
      upcomingLeaseRenewals.value =
          leases.where((l) {
            final endDate = DateTime.tryParse(l.endDate);
            return endDate != null &&
                endDate.isAfter(now) &&
                endDate.isBefore(thirtyDaysFromNow);
          }).length;
    }, errorContext: 'Dashboard');
  }

  void changeTab(int index) {
    selectedIndex.value = index;
    Get.toNamed(navigationItems[index]['route'] as String);
  }

  static double _amount(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '') ?? 0.0;
  }

  Future<void> logout() async {
    await _authService.logout();
    Get.offAllNamed(Routes.login);
  }
}
