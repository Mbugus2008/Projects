import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reports_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildReportsContent(context),
      ),
    );
  }

  Widget _buildReportsContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Financial Summary',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            _buildSummaryCards(context),
            const SizedBox(height: 24),
            Text(
              'Available Reports',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            _buildReportCards(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return Obx(
      () => GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildSummaryCard(
            context,
            'Total Revenue',
            '\$${controller.totalRevenue.value.toStringAsFixed(2)}',
            Icons.arrow_upward,
            Colors.green,
          ),
          _buildSummaryCard(
            context,
            'Total Expenses',
            '\$${controller.totalExpenses.value.toStringAsFixed(2)}',
            Icons.arrow_downward,
            Colors.red,
          ),
          _buildSummaryCard(
            context,
            'Net Income',
            '\$${controller.netIncome.value.toStringAsFixed(2)}',
            Icons.account_balance,
            Colors.blue,
          ),
          _buildSummaryCard(
            context,
            'Occupancy Rate',
            '${controller.occupancyRate.value.toStringAsFixed(1)}%',
            Icons.people,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCards(BuildContext context) {
    final reports = [
      {
        'title': 'Income Report',
        'description': 'Detailed breakdown of all income sources',
        'icon': Icons.attach_money,
        'color': Colors.green,
        'onTap': controller.generateIncomeReport,
      },
      {
        'title': 'Expense Report',
        'description': 'Detailed breakdown of all expenses',
        'icon': Icons.money_off,
        'color': Colors.red,
        'onTap': controller.generateExpenseReport,
      },
      {
        'title': 'Occupancy Report',
        'description': 'Current and historical occupancy rates',
        'icon': Icons.people,
        'color': Colors.blue,
        'onTap': controller.generateOccupancyReport,
      },
      {
        'title': 'Lease Expiration Report',
        'description': 'Upcoming lease expirations',
        'icon': Icons.event,
        'color': Colors.orange,
        'onTap': controller.generateLeaseExpirationReport,
      },
      {
        'title': 'Maintenance Report',
        'description': 'Summary of maintenance requests and costs',
        'icon': Icons.build,
        'color': Colors.purple,
        'onTap': controller.generateMaintenanceReport,
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final report = reports[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: (report['color'] as Color).withOpacity(0.2),
              child: Icon(
                report['icon'] as IconData,
                color: report['color'] as Color,
              ),
            ),
            title: Text(
              report['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(report['description'] as String),
            trailing: PopupMenuButton(
              onSelected: (value) {
                if (value == 'generate') {
                  (report['onTap'] as Function)();
                } else if (value == 'export') {
                  controller.exportReportToPdf(report['title'] as String);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'generate',
                  child: Row(
                    children: [
                      Icon(Icons.refresh),
                      SizedBox(width: 8),
                      Text('Generate'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'export',
                  child: Row(
                    children: [
                      Icon(Icons.download),
                      SizedBox(width: 8),
                      Text('Export to PDF'),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () => (report['onTap'] as Function)(),
          ),
        );
      },
    );
  }
}
