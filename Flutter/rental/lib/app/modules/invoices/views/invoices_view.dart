import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/contact_launcher.dart';
import '../../../core/utils/rent_messages.dart';
import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/invoices_controller.dart';

/// Invoice management: create itemised invoices (rent, water, garbage, …),
/// send them via SMS/WhatsApp, record payments, and issue receipts against
/// the invoice.
class InvoicesView extends GetView<InvoicesController> {
  const InvoicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.load,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value && controller.invoices.isEmpty
            ? const LoadingView(label: 'Loading invoices…')
            : _buildList(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateSheet(context),
        icon: const Icon(Icons.note_add_rounded),
        label: const Text('New Invoice'),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (controller.invoices.isEmpty) {
      return EmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No invoices yet',
        message:
            'Create an invoice for rent, water, garbage and other charges.',
        actionLabel: 'New Invoice',
        onAction: () => _showCreateSheet(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.load(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
        itemCount: controller.invoices.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) =>
            _buildInvoiceCard(context, controller.invoices[index]),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Paid':
        return AppColors.success;
      case 'Partial':
        return AppColors.warning;
      case 'Draft':
        return AppColors.textSecondary;
      default:
        return AppColors.info;
    }
  }

  Widget _buildInvoiceCard(
    BuildContext context,
    Map<String, dynamic> invoice,
  ) {
    final theme = Theme.of(context);
    final number = invoice['invoiceNumber']?.toString() ?? '';
    final tenant = controller.tenantName(invoice['tenantId'] as int?);
    final status = invoice['status']?.toString() ?? 'Sent';
    final paid = (invoice['amountPaid'] as num?)?.toDouble() ?? 0.0;
    final lines = (invoice['lines'] as List?) ?? const [];
    final descriptions = lines
        .map((line) => (line as Map)['description']?.toString() ?? '')
        .where((text) => text.isNotEmpty)
        .join(' · ');
    final due = invoice['dueDate'] != null
        ? ' · Due ${formatDate(invoice['dueDate'])}'
        : '';

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _statusColor(status).withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.receipt_long_rounded,
                  color: _statusColor(status),
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$number · ${tenant.isEmpty ? '—' : tenant}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${formatDate(invoice['invoiceDate'])}$due',
                      style: theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _buildMenu(context, invoice),
            ],
          ),
          if (descriptions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              descriptions,
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              StatusChip(label: status, color: _statusColor(status)),
              StatusChip(
                label: formatMoney(invoice['totalAmount']),
                color: AppColors.teal,
              ),
              if (paid > 0 && status != 'Paid')
                StatusChip(
                  label: 'Paid ${formatMoney(paid)}',
                  color: AppColors.success,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, Map<String, dynamic> invoice) {
    final phone = controller.tenantPhone(invoice['tenantId'] as int?);
    final hasPhone = phone.trim().isNotEmpty;
    final paid = (invoice['amountPaid'] as num?)?.toDouble() ?? 0.0;

    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) => _onAction(context, invoice, value),
      itemBuilder: (context) => [
        if (hasPhone) ...[
          const PopupMenuItem(
            value: 'send_sms',
            child: _MenuRow(Icons.sms_outlined, 'Send via SMS'),
          ),
          const PopupMenuItem(
            value: 'send_wa',
            child: _MenuRow(Icons.chat_outlined, 'Send via WhatsApp'),
          ),
        ],
        const PopupMenuItem(
          value: 'payment',
          child: _MenuRow(Icons.payments_outlined, 'Record Payment'),
        ),
        if (paid > 0 && hasPhone) ...[
          const PopupMenuItem(
            value: 'receipt_sms',
            child: _MenuRow(Icons.task_alt_rounded, 'Receipt via SMS'),
          ),
          const PopupMenuItem(
            value: 'receipt_wa',
            child: _MenuRow(Icons.task_alt_rounded, 'Receipt via WhatsApp'),
          ),
        ],
        const PopupMenuItem(
          value: 'delete',
          child: _MenuRow(
            Icons.delete_outline_rounded,
            'Delete',
            color: AppColors.danger,
          ),
        ),
      ],
    );
  }

  void _onAction(
    BuildContext context,
    Map<String, dynamic> invoice,
    String action,
  ) {
    final phone = controller.tenantPhone(invoice['tenantId'] as int?);
    final tenant = controller.tenantName(invoice['tenantId'] as int?);
    final number = invoice['invoiceNumber']?.toString() ?? '';
    final paid = (invoice['amountPaid'] as num?)?.toDouble() ?? 0.0;

    switch (action) {
      case 'send_sms':
        ContactLauncher.sms(phone, _invoiceMessage(invoice));
        break;
      case 'send_wa':
        ContactLauncher.whatsApp(phone, _invoiceMessage(invoice));
        break;
      case 'payment':
        _showPaymentSheet(context, invoice);
        break;
      case 'receipt_sms':
        ContactLauncher.sms(
          phone,
          RentMessages.receiptForInvoice(
            tenant: tenant,
            invoiceNumber: number,
            amount: paid,
          ),
        );
        break;
      case 'receipt_wa':
        ContactLauncher.whatsApp(
          phone,
          RentMessages.receiptForInvoice(
            tenant: tenant,
            invoiceNumber: number,
            amount: paid,
          ),
        );
        break;
      case 'delete':
        _confirmDelete(context, invoice);
        break;
    }
  }

  String _invoiceMessage(Map<String, dynamic> invoice) {
    final lines = <Map<String, dynamic>>[];
    for (final line in ((invoice['lines'] as List?) ?? const [])) {
      lines.add(Map<String, dynamic>.from(line as Map));
    }
    return RentMessages.itemizedInvoice(
      tenant: controller.tenantName(invoice['tenantId'] as int?),
      invoiceNumber: invoice['invoiceNumber']?.toString() ?? '',
      property: controller.propertyName(invoice['propertyId'] as int?),
      unit: invoice['unitId']?.toString() ?? '',
      lines: lines,
      total: (invoice['totalAmount'] as num?)?.toDouble() ?? 0.0,
      dueDate: DateTime.tryParse(invoice['dueDate']?.toString() ?? ''),
    );
  }

  void _showCreateSheet(BuildContext context) {
    controller.clearDraft();
    controller.addLine('Rent');

    showFormSheet(
      context: context,
      title: 'New Invoice',
      subtitle: 'Add items such as rent, water and garbage, then send it.',
      submitLabel: 'Create Invoice',
      isLoading: controller.isLoading,
      onSubmit: () async {
        final success = await controller.saveDraft();
        if (success) {
          Get.back();
          Get.snackbar(
            'Invoice created',
            'Open its menu to send it to the tenant.',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            'Could not create invoice',
            'Pick a tenant and add at least one item with an amount.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      fields: [
        Obx(
          () => DropdownButtonFormField<int>(
            value: controller.draftTenantId.value == 0
                ? null
                : controller.draftTenantId.value,
            decoration: const InputDecoration(
              labelText: 'Tenant',
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
            items: [
              for (final tenant in controller.tenants)
                DropdownMenuItem(
                  value: tenant['id'] as int,
                  child: Text(
                    '${tenant['firstName'] ?? ''} ${tenant['lastName'] ?? ''}'
                        .trim(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: (value) => controller.onTenantChanged(value ?? 0),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.unitController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Unit (optional)',
            prefixIcon: Icon(Icons.meeting_room_outlined),
          ),
        ),
        const SizedBox(height: 14),
        Text('Quick add', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ActionChip(
              label: const Text('Rent'),
              avatar: const Icon(Icons.home_outlined, size: 18),
              onPressed: controller.addRentLine,
            ),
            ActionChip(
              label: const Text('Water'),
              avatar: const Icon(Icons.water_drop_outlined, size: 18),
              onPressed: () => _showWaterDialog(context),
            ),
            ActionChip(
              label: const Text('Garbage'),
              avatar: const Icon(Icons.delete_outline_rounded, size: 18),
              onPressed: controller.addGarbageLine,
            ),
            ActionChip(
              label: const Text('Service Charge'),
              onPressed: () => controller.addLine('Service Charge'),
            ),
            ActionChip(
              label: const Text('Security'),
              onPressed: () => controller.addLine('Security'),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Obx(
          () => Text(
            'Water ${formatMoney(controller.waterRate.value)}/unit · '
            'Garbage ${formatMoney(controller.garbageFee.value)}/month',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 14),
        Obx(
          () => Column(
            children: [
              for (var i = 0; i < controller.lineDescriptions.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: controller.lineDescriptions[i],
                          decoration: const InputDecoration(
                            labelText: 'Item',
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: controller.lineAmounts[i],
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => controller.lineAmounts.refresh(),
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline_rounded,
                          size: 22,
                        ),
                        onPressed: () => controller.removeLine(i),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () => controller.addLine(),
            icon: const Icon(Icons.add_rounded, size: 20),
            label: const Text('Add item'),
          ),
        ),
        Obx(() {
          controller.lineAmounts.length; // depend on line mutations
          return Row(
            children: [
              Text('Total', style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              Text(
                formatMoney(controller.draftTotal),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          );
        }),
        const SizedBox(height: 14),
        TextField(
          controller: controller.notesController,
          maxLines: 2,
          decoration: const InputDecoration(labelText: 'Notes (optional)'),
        ),
      ],
    );
  }

  Future<void> _showWaterDialog(BuildContext context) async {
    final units = await showDialog<double>(
      context: context,
      builder: (_) => _WaterUnitsDialog(rate: controller.waterRate.value),
    );
    if (units != null && units > 0) {
      controller.addWaterLine(units);
    }
  }

  void _showPaymentSheet(BuildContext context, Map<String, dynamic> invoice) {
    final total = (invoice['totalAmount'] as num?)?.toDouble() ?? 0.0;
    final paid = (invoice['amountPaid'] as num?)?.toDouble() ?? 0.0;
    final outstanding = total - paid > 0 ? total - paid : 0.0;
    final amountController = TextEditingController(
      text: outstanding.toStringAsFixed(0),
    );

    showFormSheet(
      context: context,
      title: 'Record Payment',
      subtitle:
          '${invoice['invoiceNumber']} · Outstanding ${formatMoney(outstanding)}',
      submitLabel: 'Record Payment',
      isLoading: controller.isLoading,
      onSubmit: () async {
        final amount = double.tryParse(amountController.text.trim()) ?? 0;
        if (amount <= 0) {
          Get.snackbar(
            'Enter an amount',
            'The payment amount must be greater than zero.',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
        final success = await controller.recordPayment(invoice, amount);
        if (success) {
          Get.back();
          Get.snackbar(
            'Payment recorded',
            'A receipt is now available in the invoice menu.',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            'Could not record payment',
            'Please try again.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      fields: [
        TextField(
          controller: amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Amount received',
            prefixIcon: Icon(Icons.payments_outlined),
          ),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext context, Map<String, dynamic> invoice) {
    showConfirmDialog(
      context: context,
      title: 'Delete Invoice',
      message:
          'Delete ${invoice['invoiceNumber']}? This action cannot be undone.',
      confirmLabel: 'Delete',
      onConfirm: () => controller.removeInvoice(invoice['id'] as int),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow(this.icon, this.label, {this.color});

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 19, color: color),
        const SizedBox(width: 10),
        Text(label, style: color == null ? null : TextStyle(color: color)),
      ],
    );
  }
}

/// Asks for the water consumption in units and returns it on submit.
class _WaterUnitsDialog extends StatefulWidget {
  const _WaterUnitsDialog({required this.rate});

  final double rate;

  @override
  State<_WaterUnitsDialog> createState() => _WaterUnitsDialogState();
}

class _WaterUnitsDialogState extends State<_WaterUnitsDialog> {
  final TextEditingController _unitsController = TextEditingController();

  @override
  void dispose() {
    _unitsController.dispose();
    super.dispose();
  }

  void _submit() {
    final units = double.tryParse(_unitsController.text.trim()) ?? 0;
    Navigator.of(context).pop(units);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Water consumption'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Billed at ${formatMoney(widget.rate)} per unit.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _unitsController,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Units consumed',
              prefixIcon: Icon(Icons.water_drop_outlined),
            ),
            onSubmitted: (_) => _submit(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
