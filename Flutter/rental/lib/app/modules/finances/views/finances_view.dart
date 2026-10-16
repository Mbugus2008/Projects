import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/finances_controller.dart';

class FinancesView extends GetView<FinancesController> {
  const FinancesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finances'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.loadTransactions,
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value && controller.transactions.isEmpty
                ? const LoadingView(label: 'Loading transactions…')
                : _buildContent(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showTransactionForm(context),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Transaction'),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSummaryCards(context),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 4, 20, 8),
          child: Text('Recent Transactions'),
        ),
        Expanded(child: _buildTransactionList(context)),
      ],
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.trending_up_rounded,
                iconColor: AppColors.success,
                value: formatMoney(controller.totalIncome.value),
                label: 'Income',
                compact: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.trending_down_rounded,
                iconColor: AppColors.danger,
                value: formatMoney(controller.totalExpenses.value),
                label: 'Expenses',
                compact: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.account_balance_rounded,
                iconColor: AppColors.primary,
                value: formatMoney(controller.netIncome.value),
                label: 'Net',
                compact: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    if (controller.transactions.isEmpty) {
      return EmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No transactions yet',
        message: 'Record rent payments and expenses to see your cash flow.',
        actionLabel: 'Add Transaction',
        onAction: () => _showTransactionForm(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.loadTransactions(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 96),
        itemCount: controller.transactions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder:
            (context, index) =>
                _buildTransactionCard(context, controller.transactions[index]),
      ),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context,
    Map<String, dynamic> transaction,
  ) {
    final theme = Theme.of(context);
    final isIncome = transaction['type']?.toString() == 'Income';
    final accent = isIncome ? AppColors.success : AppColors.danger;
    final amount = transaction['amount'];
    final description = transaction['description']?.toString() ?? '';
    final category = transaction['category']?.toString() ?? 'Uncategorized';
    final property = transaction['property']?.toString() ?? '';
    final unit = transaction['unit']?.toString() ?? '';
    final tenant = transaction['tenant']?.toString() ?? '';

    final subtitleParts = [
      category,
      if (property.isNotEmpty) property,
      if (unit.isNotEmpty && unit != 'N/A') 'Unit $unit',
    ];

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: () => _showTransactionForm(context, transaction),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              isIncome
                  ? Icons.arrow_upward_rounded
                  : Icons.arrow_downward_rounded,
              color: accent,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description.isEmpty ? category : description,
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  subtitleParts.join(' · '),
                  style: theme.textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (tenant.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    tenant,
                    style: theme.textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isIncome ? '+' : '−'}${formatMoney(amount)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  color: accent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                formatDate(transaction['date']),
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, size: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            onSelected: (value) {
              if (value == 'edit') {
                _showTransactionForm(context, transaction);
              } else if (value == 'delete') {
                _confirmDelete(context, transaction['id'] as int);
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
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline_rounded,
                          size: 19,
                          color: AppColors.danger,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Delete',
                          style: TextStyle(color: AppColors.danger),
                        ),
                      ],
                    ),
                  ),
                ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final initial = DateTime.tryParse(controller.dateController.text) ?? now;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      controller.dateController.text =
          picked.toIso8601String().split('T').first;
    }
  }

  void _showTransactionForm(
    BuildContext context, [
    Map<String, dynamic>? transaction,
  ]) {
    final isEditing = transaction != null;
    final isIncome = isEditing ? transaction['type'] == 'Income' : true;
    final RxBool rxIsIncome = isIncome.obs;

    if (isEditing) {
      controller.dateController.text = transaction['date']?.toString() ?? '';
      controller.amountController.text =
          transaction['amount']?.toString() ?? '';
      controller.categoryController.text =
          transaction['category']?.toString() ?? '';
      controller.propertyController.text =
          transaction['property']?.toString() ?? '';
      controller.unitController.text = transaction['unit']?.toString() ?? '';
      controller.tenantController.text =
          transaction['tenant']?.toString() ?? '';
      controller.descriptionController.text =
          transaction['description']?.toString() ?? '';
    } else {
      controller.clearForm();
      controller.dateController.text =
          DateTime.now().toIso8601String().split('T').first;
    }

    showFormSheet(
      context: context,
      title: isEditing ? 'Edit Transaction' : 'New Transaction',
      subtitle:
          isEditing
              ? 'Update the details of this transaction.'
              : 'Record a rent payment or an expense.',
      submitLabel: isEditing ? 'Save Changes' : 'Add Transaction',
      isLoading: controller.isLoading,
      onSubmit: () {
        if (isEditing) {
          controller.editTransaction(transaction['id'] as int);
        } else {
          controller.addTransaction();
        }
      },
      fields: [
        Obx(
          () => SegmentedButton<bool>(
            segments: const [
              ButtonSegment<bool>(
                value: true,
                label: Text('Income'),
                icon: Icon(Icons.arrow_upward_rounded, size: 17),
              ),
              ButtonSegment<bool>(
                value: false,
                label: Text('Expense'),
                icon: Icon(Icons.arrow_downward_rounded, size: 17),
              ),
            ],
            selected: {rxIsIncome.value},
            onSelectionChanged: (Set<bool> selection) {
              rxIsIncome.value = selection.first;
              if (controller.categoryController.text.trim().isEmpty) {
                controller.categoryController.text =
                    selection.first ? 'Rent' : 'Maintenance';
              }
            },
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.dateController,
          readOnly: true,
          onTap: () => _pickDate(context),
          decoration: const InputDecoration(
            labelText: 'Date',
            prefixIcon: Icon(Icons.event_outlined),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Amount',
            prefixIcon: Icon(Icons.payments_outlined),
          ),
        ),
        const SizedBox(height: 14),
        Obx(
          () => TextField(
            controller: controller.categoryController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Category',
              prefixIcon: const Icon(Icons.sell_outlined),
              hintText:
                  rxIsIncome.value
                      ? 'e.g., Rent, Deposit'
                      : 'e.g., Maintenance, Utilities',
            ),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.propertyController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Property',
            prefixIcon: Icon(Icons.home_work_outlined),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.unitController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Unit',
                  prefixIcon: Icon(Icons.meeting_room_outlined),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller.tenantController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Tenant',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.descriptionController,
          maxLines: 2,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext context, int id) {
    showConfirmDialog(
      context: context,
      title: 'Delete Transaction',
      message:
          'Are you sure you want to delete this transaction? This action cannot be undone.',
      confirmLabel: 'Delete',
      onConfirm: () => controller.deleteTransaction(id),
    );
  }
}
