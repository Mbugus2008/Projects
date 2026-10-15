import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/contact_launcher.dart';
import '../../../core/utils/rent_messages.dart';
import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/balances_controller.dart';

/// Rent collection view: who has paid, who is behind, and quick actions to
/// remind, invoice and share statements over SMS / WhatsApp.
class BalancesView extends GetView<BalancesController> {
  const BalancesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent Balances'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.load,
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value && controller.rows.isEmpty
                ? const LoadingView(label: 'Checking tenant balances…')
                : _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (controller.rows.isEmpty) {
      return EmptyState(
        icon: Icons.account_balance_wallet_outlined,
        title: 'No balances to track',
        message: 'Add a lease to start following rent collection.',
        actionLabel: 'Go to Leases',
        onAction: () => Get.toNamed('/leases'),
      );
    }

    return Column(children: [_buildSummary(), Expanded(child: _buildList())]);
  }

  Widget _buildSummary() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.payments_outlined,
                iconColor: AppColors.danger,
                value: formatMoney(controller.totalOutstanding.value),
                label: 'Outstanding',
                compact: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.person_off_outlined,
                iconColor: AppColors.warning,
                value: controller.tenantsInArrears.value.toString(),
                label: 'In Arrears',
                compact: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return RefreshIndicator(
      onRefresh: () async => controller.load(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: controller.rows.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder:
            (context, index) => _buildRowCard(context, controller.rows[index]),
      ),
    );
  }

  Widget _buildRowCard(BuildContext context, Map<String, dynamic> row) {
    final theme = Theme.of(context);
    final name = row['tenant']?.toString() ?? '—';
    final property = row['property']?.toString() ?? '';
    final unit = row['unit']?.toString() ?? '';
    final rent = (row['monthlyRent'] as num).toDouble();
    final expected = (row['expected'] as num).toDouble();
    final paid = (row['paid'] as num).toDouble();
    final balance = (row['balance'] as num).toDouble();
    final status = row['status']?.toString() ?? '';
    final months = row['months'] as int;

    final statusColor =
        status == 'Paid'
            ? AppColors.success
            : status == 'Partial'
            ? AppColors.warning
            : AppColors.danger;

    final location = [
      property,
      if (unit.isNotEmpty && unit != 'N/A') 'Unit $unit',
    ].where((s) => s.isNotEmpty).join(' · ');

    final nameParts = name.split(' ');
    final initials =
        nameParts.length > 1
            ? initialsOf(nameParts.first, nameParts[1])
            : initialsOf(name, '');

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InitialsAvatar(initials: initials, color: statusColor, size: 46),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      location.isEmpty ? '—' : location,
                      style: theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _buildMenu(context, row),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              StatusChip(label: status, color: statusColor),
              StatusChip(
                label: '${formatMoney(rent)}/mo',
                color: AppColors.teal,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: LabeledValue(
                  label: 'Billed ($months mo)',
                  value: formatMoney(expected),
                ),
              ),
              Expanded(
                child: LabeledValue(label: 'Paid', value: formatMoney(paid)),
              ),
              Expanded(
                child: LabeledValue(
                  label: 'Balance',
                  value: formatMoney(balance),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, Map<String, dynamic> row) {
    final phone = row['phone']?.toString() ?? '';
    final hasPhone = phone.trim().isNotEmpty;
    final hasReceipt = row['lastPaymentAmount'] != null;

    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) => _onAction(context, row, value),
      itemBuilder:
          (context) => [
            const PopupMenuItem(
              value: 'payment',
              child: _MenuRow(Icons.payments_outlined, 'Record Payment'),
            ),
            if (hasPhone) ...[
              const PopupMenuItem(
                value: 'call',
                child: _MenuRow(Icons.call_outlined, 'Call'),
              ),
              const PopupMenuItem(
                value: 'reminder_sms',
                child: _MenuRow(Icons.sms_outlined, 'Reminder via SMS'),
              ),
              const PopupMenuItem(
                value: 'reminder_wa',
                child: _MenuRow(Icons.chat_outlined, 'Reminder via WhatsApp'),
              ),
              const PopupMenuItem(
                value: 'invoice_sms',
                child: _MenuRow(Icons.receipt_long_outlined, 'Invoice via SMS'),
              ),
              const PopupMenuItem(
                value: 'invoice_wa',
                child: _MenuRow(
                  Icons.receipt_long_outlined,
                  'Invoice via WhatsApp',
                ),
              ),
              if (hasReceipt) ...[
                const PopupMenuItem(
                  value: 'receipt_sms',
                  child: _MenuRow(Icons.task_alt_rounded, 'Receipt via SMS'),
                ),
                const PopupMenuItem(
                  value: 'receipt_wa',
                  child: _MenuRow(
                    Icons.task_alt_rounded,
                    'Receipt via WhatsApp',
                  ),
                ),
              ],
              const PopupMenuItem(
                value: 'statement_wa',
                child: _MenuRow(
                  Icons.description_outlined,
                  'Statement via WhatsApp',
                ),
              ),
            ],
          ],
    );
  }

  void _onAction(
    BuildContext context,
    Map<String, dynamic> row,
    String action,
  ) {
    final phone = row['phone']?.toString() ?? '';
    final name = row['tenant']?.toString() ?? '';
    final property = row['property']?.toString() ?? '';
    final unit = row['unit']?.toString() ?? '';
    final rent = (row['monthlyRent'] as num).toDouble();
    final expected = (row['expected'] as num).toDouble();
    final paid = (row['paid'] as num).toDouble();
    final balance = (row['balance'] as num).toDouble();

    switch (action) {
      case 'payment':
        Get.toNamed('/finances');
        break;
      case 'call':
        ContactLauncher.call(phone);
        break;
      case 'reminder_sms':
        ContactLauncher.sms(
          phone,
          RentMessages.reminder(
            tenant: name,
            property: property,
            unit: unit,
            balance: balance,
          ),
        );
        break;
      case 'reminder_wa':
        ContactLauncher.whatsApp(
          phone,
          RentMessages.reminder(
            tenant: name,
            property: property,
            unit: unit,
            balance: balance,
          ),
        );
        break;
      case 'invoice_sms':
        ContactLauncher.sms(
          phone,
          RentMessages.invoice(
            tenant: name,
            property: property,
            unit: unit,
            rent: rent,
          ),
        );
        break;
      case 'statement_wa':
        ContactLauncher.whatsApp(
          phone,
          RentMessages.statement(
            tenant: name,
            property: property,
            unit: unit,
            expected: expected,
            paid: paid,
            balance: balance,
          ),
        );
        break;
      case 'invoice_wa':
        ContactLauncher.whatsApp(
          phone,
          RentMessages.invoice(
            tenant: name,
            property: property,
            unit: unit,
            rent: rent,
          ),
        );
        break;
      case 'receipt_sms':
        ContactLauncher.sms(phone, _receiptText(row));
        break;
      case 'receipt_wa':
        ContactLauncher.whatsApp(phone, _receiptText(row));
        break;
    }
  }

  String _receiptText(Map<String, dynamic> row) {
    return RentMessages.receipt(
      tenant: row['tenant']?.toString() ?? '',
      amount: (row['lastPaymentAmount'] as num?)?.toDouble() ?? 0.0,
      date: DateTime.tryParse(row['lastPaymentDate']?.toString() ?? ''),
      reference: row['lastPaymentRef']?.toString(),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow(this.icon, this.label);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon, size: 19), const SizedBox(width: 10), Text(label)],
    );
  }
}
