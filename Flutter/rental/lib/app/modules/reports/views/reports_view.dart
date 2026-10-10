import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.loadReports,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingView(label: 'Crunching numbers…')
            : _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Financial Summary'),
          const SizedBox(height: 12),
          _buildSummaryCards(context),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Available Reports'),
          const SizedBox(height: 12),
          ..._buildReportCards(context),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return Obx(
      () => GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.45,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          StatCard(
            icon: Icons.trending_up_rounded,
            iconColor: AppColors.success,
            value: formatMoney(controller.totalRevenue.value),
            label: 'Total Revenue',
          ),
          StatCard(
            icon: Icons.trending_down_rounded,
            iconColor: AppColors.danger,
            value: formatMoney(controller.totalExpenses.value),
            label: 'Total Expenses',
          ),
          StatCard(
            icon: Icons.account_balance_rounded,
            iconColor: AppColors.primary,
            value: formatMoney(controller.netIncome.value),
            label: 'Net Income',
          ),
          StatCard(
            icon: Icons.pie_chart_outline_rounded,
            iconColor: AppColors.warning,
            value: '${controller.occupancyRate.value.toStringAsFixed(1)}%',
            label: 'Occupancy Rate',
          ),
        ],
      ),
    );
  }

  List<Widget> _buildReportCards(BuildContext context) {
    final reports = [
      (
        title: 'Income Report',
        description: 'Detailed breakdown of all income sources',
        icon: Icons.trending_up_rounded,
        color: AppColors.success,
        onGenerate: controller.generateIncomeReport,
      ),
      (
        title: 'Expense Report',
        description: 'Detailed breakdown of all expenses',
        icon: Icons.trending_down_rounded,
        color: AppColors.danger,
        onGenerate: controller.generateExpenseReport,
      ),
      (
        title: 'Occupancy Report',
        description: 'Current and historical occupancy rates',
        icon: Icons.pie_chart_outline_rounded,
        color: AppColors.primary,
        onGenerate: controller.generateOccupancyReport,
      ),
      (
        title: 'Lease Expiration Report',
        description: 'Upcoming lease expirations',
        icon: Icons.event_note_outlined,
        color: AppColors.warning,
        onGenerate: controller.generateLeaseExpirationReport,
      ),
      (
        title: 'Maintenance Report',
        description: 'Summary of maintenance requests and costs',
        icon: Icons.build_outlined,
        color: AppColors.purple,
        onGenerate: controller.generateMaintenanceReport,
      ),
    ];

    return reports.map((report) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: AppCard(
          padding: const EdgeInsets.all(16),
          onTap: report.onGenerate,
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: report.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(report.icon, color: report.color, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 15),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      report.description,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              IconButton(
                icon: const Icon(Icons.download_rounded, size: 21),
                tooltip: 'Export to PDF',
                onPressed: () => controller.exportReportToPdf(report.title),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
