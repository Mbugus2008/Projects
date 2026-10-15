import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/leases_controller.dart';

class LeasesView extends GetView<LeasesController> {
  const LeasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leases'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.loadLeases,
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value && controller.leases.isEmpty
                ? const LoadingView(label: 'Loading leases…')
                : _buildList(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(context),
        icon: const Icon(Icons.post_add_rounded),
        label: const Text('Add Lease'),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (controller.leases.isEmpty) {
      return EmptyState(
        icon: Icons.description_outlined,
        title: 'No leases yet',
        message:
            'Create a lease to connect a tenant to a unit and start tracking rent.',
        actionLabel: 'Add Lease',
        onAction: () => _showForm(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.loadLeases(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
        itemCount: controller.leases.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder:
            (context, index) =>
                _buildLeaseCard(context, controller.leases[index]),
      ),
    );
  }

  Widget _buildLeaseCard(BuildContext context, Map<String, dynamic> lease) {
    final theme = Theme.of(context);
    final property = lease['property']?.toString() ?? '';
    final unit = lease['unit']?.toString() ?? '';
    final tenant = lease['tenant']?.toString() ?? '';
    final startDate = lease['startDate']?.toString() ?? '';
    final endDate = lease['endDate']?.toString() ?? '';
    final status = lease['status']?.toString() ?? 'Active';

    final end = DateTime.tryParse(endDate);
    final daysRemaining =
        end == null ? null : end.difference(DateTime.now()).inDays;

    Color statusColor = AppColors.primary;
    String statusLabel = status;
    final isActive = status.toLowerCase() == 'active';
    if (daysRemaining != null && daysRemaining < 0) {
      statusColor = AppColors.danger;
      statusLabel = 'Expired';
    } else if (isActive && daysRemaining != null && daysRemaining < 30) {
      statusColor = AppColors.warning;
      statusLabel = 'Expiring Soon';
    } else if (isActive) {
      statusColor = AppColors.success;
    }

    final title = [
      property,
      if (unit.isNotEmpty) 'Unit $unit',
    ].where((s) => s.isNotEmpty).join(' · ');

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
                  color: AppColors.accent.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.description_rounded,
                  color: AppColors.accent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.isEmpty ? 'Lease #${lease['id']}' : title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      tenant.isEmpty ? 'No tenant assigned' : tenant,
                      style: theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _buildMenu(context, lease),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              StatusChip(label: statusLabel, color: statusColor),
              StatusChip(
                label: '${formatMoney(lease['monthlyRent'])}/mo',
                color: AppColors.teal,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _detail(context, 'Start', formatDate(startDate))),
              Expanded(child: _detail(context, 'End', formatDate(endDate))),
              Expanded(
                child: _detail(
                  context,
                  'Deposit',
                  formatMoney(lease['securityDeposit']),
                ),
              ),
            ],
          ),
          if (daysRemaining != null && daysRemaining >= 0) ...[
            const SizedBox(height: 10),
            Text(
              daysRemaining == 0
                  ? 'Ends today'
                  : '$daysRemaining days remaining',
              style: theme.textTheme.bodySmall?.copyWith(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _detail(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodySmall),
        const SizedBox(height: 3),
        Text(
          value.isEmpty ? '—' : value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildMenu(BuildContext context, Map<String, dynamic> lease) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) {
        if (value == 'edit') {
          _showForm(context, lease);
        } else if (value == 'renew') {
          _showRenewalForm(context, lease);
        } else if (value == 'delete') {
          _confirmDelete(context, lease['id'] as int);
        }
      },
      itemBuilder:
          (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit_outlined, size: 19),
                  SizedBox(width: 10),
                  Text('Edit'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'renew',
              child: Row(
                children: [
                  Icon(Icons.autorenew_rounded, size: 19),
                  SizedBox(width: 10),
                  Text('Renew'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(
                    Icons.delete_outline_rounded,
                    size: 19,
                    color: AppColors.danger,
                  ),
                  SizedBox(width: 10),
                  Text('Delete', style: TextStyle(color: AppColors.danger)),
                ],
              ),
            ),
          ],
    );
  }

  Future<void> _pickDate(
    BuildContext context,
    TextEditingController target,
  ) async {
    final now = DateTime.now();
    final initial = DateTime.tryParse(target.text) ?? now;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      target.text = picked.toIso8601String().split('T').first;
    }
  }

  List<Widget> _dateFields(
    BuildContext context,
    String startLabel,
    String endLabel,
  ) {
    return [
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.startDateController,
              readOnly: true,
              onTap: () => _pickDate(context, controller.startDateController),
              decoration: InputDecoration(
                labelText: startLabel,
                prefixIcon: const Icon(Icons.event_outlined),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller.endDateController,
              readOnly: true,
              onTap: () => _pickDate(context, controller.endDateController),
              decoration: InputDecoration(
                labelText: endLabel,
                prefixIcon: const Icon(Icons.event_available_outlined),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 14),
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.monthlyRentController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Monthly rent',
                prefixIcon: Icon(Icons.payments_outlined),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller.securityDepositController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Security deposit',
                prefixIcon: Icon(Icons.shield_outlined),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  void _showForm(BuildContext context, [Map<String, dynamic>? lease]) {
    final isEditing = lease != null;

    if (isEditing) {
      controller.unitController.text = lease['unit']?.toString() ?? '';
      controller.tenantController.text = lease['tenant']?.toString() ?? '';
      controller.startDateController.text = formatDateInput(lease['startDate']);
      controller.endDateController.text = formatDateInput(lease['endDate']);
      controller.monthlyRentController.text =
          lease['monthlyRent']?.toString() ?? '';
      controller.securityDepositController.text =
          lease['securityDeposit']?.toString() ?? '';
      controller.leaseTermsController.text =
          lease['leaseTerms']?.toString() ?? '';
    } else {
      controller.clearForm();
    }

    showFormSheet(
      context: context,
      title: isEditing ? 'Edit Lease' : 'New Lease',
      subtitle:
          isEditing
              ? 'Update the terms of this lease.'
              : 'Set up a new lease for a unit and tenant.',
      submitLabel: isEditing ? 'Save Changes' : 'Add Lease',
      isLoading: controller.isLoading,
      onSubmit: () {
        if (isEditing) {
          controller.editLease(lease['id'] as int);
        } else {
          controller.addLease();
        }
      },
      fields: [
        TextField(
          controller: controller.unitController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Unit',
            prefixIcon: Icon(Icons.meeting_room_outlined),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.tenantController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Tenant',
            prefixIcon: Icon(Icons.person_outline_rounded),
          ),
        ),
        const SizedBox(height: 14),
        ..._dateFields(context, 'Start date', 'End date'),
        const SizedBox(height: 14),
        TextField(
          controller: controller.leaseTermsController,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Lease terms'),
        ),
      ],
    );
  }

  void _showRenewalForm(BuildContext context, Map<String, dynamic> lease) {
    final currentEndDate =
        DateTime.tryParse(lease['endDate']?.toString() ?? '') ?? DateTime.now();
    final newStartDate = currentEndDate.add(const Duration(days: 1));
    final newEndDate = DateTime(
      newStartDate.year + 1,
      newStartDate.month,
      newStartDate.day,
    );

    controller.unitController.text = lease['unit']?.toString() ?? '';
    controller.tenantController.text = lease['tenant']?.toString() ?? '';
    controller.startDateController.text =
        newStartDate.toIso8601String().split('T').first;
    controller.endDateController.text =
        newEndDate.toIso8601String().split('T').first;
    controller.monthlyRentController.text =
        lease['monthlyRent']?.toString() ?? '';
    controller.securityDepositController.text =
        lease['securityDeposit']?.toString() ?? '';

    showFormSheet(
      context: context,
      title: 'Renew Lease',
      subtitle: 'Create a renewal starting right after the current end date.',
      submitLabel: 'Renew Lease',
      isLoading: controller.isLoading,
      onSubmit: () => controller.renewLease(lease['id'] as int),
      fields: _dateFields(context, 'New start date', 'New end date'),
    );
  }

  void _confirmDelete(BuildContext context, int id) {
    showConfirmDialog(
      context: context,
      title: 'Delete Lease',
      message:
          'Are you sure you want to delete this lease? This action cannot be undone.',
      confirmLabel: 'Delete',
      onConfirm: () => controller.deleteLease(id),
    );
  }
}
