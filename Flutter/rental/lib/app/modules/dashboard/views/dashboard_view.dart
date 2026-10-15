import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_ui.dart';
import '../../../data/auth_service.dart';
import '../../../theme/app_theme.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context, authService),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatsGrid(context),
                  const SizedBox(height: 26),
                  const SectionHeader(title: 'Quick Actions'),
                  _buildQuickActions(context),
                  const SizedBox(height: 14),
                  const SectionHeader(title: 'Lease Renewals'),
                  _buildRenewalsCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Builder(
        builder:
            (ctx) => Obx(
              () => BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: (index) {
                  if (index == 3) {
                    Scaffold.of(ctx).openDrawer();
                    return;
                  }
                  if (index == controller.selectedIndex.value) return;
                  controller.changeTab(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_rounded),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_work_rounded),
                    label: 'Properties',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people_alt_rounded),
                    label: 'Tenants',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz_rounded),
                    label: 'More',
                  ),
                ],
              ),
            ),
      ),
      drawer: _buildDrawer(context, authService),
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  String _displayName(Map<dynamic, dynamic> user) {
    final name = [
      user['firstName'],
      user['lastName'],
    ].whereType<String>().where((s) => s.trim().isNotEmpty).join(' ');
    return name.isEmpty ? 'Landlord' : name;
  }

  Widget _buildHeader(BuildContext context, AuthService authService) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.brandGradient,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.paddingOf(context).top + 18,
        20,
        26,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            final user = authService.currentUser;
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _greeting(),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _displayName(user),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                InitialsAvatar(
                  initials: initialsOf(
                    user['firstName']?.toString(),
                    user['lastName']?.toString(),
                  ),
                  color: Colors.white,
                  size: 48,
                ),
              ],
            );
          }),
          const SizedBox(height: 20),
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.pie_chart_rounded,
                    color: Colors.white70,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Portfolio occupancy',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${controller.occupancyRate.value.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return Obx(
      () => GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.22,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          StatCard(
            icon: Icons.home_work_rounded,
            iconColor: AppColors.primary,
            value: controller.totalProperties.value.toString(),
            label: 'Properties',
            caption: '${controller.totalUnits.value} total units',
          ),
          StatCard(
            icon: Icons.trending_up_rounded,
            iconColor: AppColors.success,
            value: formatMoney(controller.totalRentCollected.value),
            label: 'Rent Collected',
            caption: 'income recorded',
          ),
          StatCard(
            icon: Icons.pending_actions_rounded,
            iconColor: AppColors.danger,
            value: formatMoney(controller.pendingInvoiceAmount.value),
            label: 'Pending Invoices',
            caption:
                controller.pendingInvoiceCount.value == 1
                    ? '1 awaiting payment'
                    : '${controller.pendingInvoiceCount.value} awaiting payment',
          ),
          StatCard(
            icon: Icons.build_circle_rounded,
            iconColor: AppColors.warning,
            value: controller.pendingMaintenance.value.toString(),
            label: 'Maintenance',
            caption: 'open requests',
          ),
          StatCard(
            icon: Icons.meeting_room_rounded,
            iconColor: AppColors.purple,
            value: controller.vacantUnits.value.toString(),
            label: 'Vacant Units',
            caption: 'of ${controller.totalUnits.value} units',
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      (
        'Add Property',
        Icons.add_home_rounded,
        AppColors.primary,
        '/properties',
      ),
      (
        'Add Tenant',
        Icons.person_add_alt_1_rounded,
        AppColors.success,
        '/tenants',
      ),
      (
        'Record Payment',
        Icons.payments_rounded,
        AppColors.warning,
        '/finances',
      ),
      ('New Request', Icons.handyman_rounded, AppColors.danger, '/maintenance'),
    ];

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 2.6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:
          actions
              .map(
                (action) => AppCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  onTap: () => Get.toNamed(action.$4),
                  child: Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: action.$3.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Icon(action.$2, color: action.$3, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          action.$1,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(fontSize: 13.5),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildRenewalsCard(BuildContext context) {
    return Obx(() {
      final count = controller.upcomingLeaseRenewals.value;
      return AppCard(
        onTap: () => Get.toNamed('/leases'),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.event_available_rounded,
                color: AppColors.info,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    count == 0
                        ? 'No renewals due'
                        : '$count lease${count == 1 ? '' : 's'} expiring soon',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Within the next 30 days',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDrawer(BuildContext context, AuthService authService) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(gradient: AppColors.brandGradient),
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.paddingOf(context).top + 24,
              20,
              24,
            ),
            child: Obx(() {
              final user = authService.currentUser;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InitialsAvatar(
                    initials: initialsOf(
                      user['firstName']?.toString(),
                      user['lastName']?.toString(),
                    ),
                    color: Colors.white,
                    size: 56,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    _displayName(user),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    user['email']?.toString() ?? '',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 12.5,
                    ),
                  ),
                ],
              );
            }),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              children: [
                ...controller.navigationItems
                    .where((item) => item['route'] != '/dashboard')
                    .map(
                      (item) => ListTile(
                        leading: Icon(item['icon'] as IconData, size: 21),
                        title: Text(item['title'] as String),
                        onTap: () {
                          Get.back();
                          Get.toNamed(item['route'] as String);
                        },
                      ),
                    ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_rounded,
                    size: 21,
                    color: AppColors.danger,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: AppColors.danger,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                    controller.logout();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
