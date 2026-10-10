import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/maintenance_controller.dart';

class MaintenanceView extends GetView<MaintenanceController> {
  const MaintenanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.loadMaintenanceRequests,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value &&
                controller.maintenanceRequests.isEmpty
            ? const LoadingView(label: 'Loading requests…')
            : _buildList(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(context),
        icon: const Icon(Icons.build_circle_outlined),
        label: const Text('New Request'),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (controller.maintenanceRequests.isEmpty) {
      return EmptyState(
        icon: Icons.build_outlined,
        title: 'No maintenance requests',
        message:
            'Log repairs and track their progress so nothing gets forgotten.',
        actionLabel: 'New Request',
        onAction: () => _showForm(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.loadMaintenanceRequests(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
        itemCount: controller.maintenanceRequests.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => _buildRequestCard(
          context,
          controller.maintenanceRequests[index],
        ),
      ),
    );
  }

  Widget _buildRequestCard(
    BuildContext context,
    Map<String, dynamic> request,
  ) {
    final theme = Theme.of(context);
    final title = request['title']?.toString() ?? '—';
    final description = request['description']?.toString() ?? '';
    final property = request['property']?.toString() ?? '';
    final unit = request['unit']?.toString() ?? '';
    final priority = request['priority']?.toString() ?? 'Medium';
    final status = request['status']?.toString() ?? 'Open';
    final assignedTo = request['assignedTo']?.toString() ?? '';
    final location = [
      property,
      if (unit.isNotEmpty && unit != 'N/A') 'Unit $unit',
    ].where((s) => s.isNotEmpty).join(' · ');

    final priorityColor = _priorityColor(priority);

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
                  color: priorityColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  _priorityIcon(priority),
                  color: priorityColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      location.isEmpty ? 'No location' : location,
                      style: theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _buildMenu(context, request),
            ],
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              description,
              style: theme.textTheme.bodyMedium,
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
              StatusChip(label: '$priority priority', color: priorityColor),
              if (assignedTo.isNotEmpty)
                StatusChip(label: assignedTo, color: AppColors.info),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.event_outlined,
                size: 15,
                color: theme.textTheme.bodySmall?.color,
              ),
              const SizedBox(width: 6),
              Text(
                formatDate(request['createdDate']),
                style: theme.textTheme.bodySmall,
              ),
              const Spacer(),
              Icon(
                Icons.payments_outlined,
                size: 16,
                color: theme.textTheme.bodySmall?.color,
              ),
              const SizedBox(width: 2),
              Text(
                formatMoney(request['estimatedCost']),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, Map<String, dynamic> request) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) {
        if (value == 'edit') {
          _showForm(context, request);
        } else if (value == 'status') {
          _showStatusUpdate(context, request);
        } else if (value == 'delete') {
          _confirmDelete(context, request['id'] as int);
        }
      },
      itemBuilder: (context) => [
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
          value: 'status',
          child: Row(
            children: [
              Icon(Icons.track_changes_rounded, size: 19),
              SizedBox(width: 10),
              Text('Update Status'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete_outline_rounded,
                  size: 19, color: AppColors.danger),
              SizedBox(width: 10),
              Text('Delete', style: TextStyle(color: AppColors.danger)),
            ],
          ),
        ),
      ],
    );
  }

  IconData _priorityIcon(String priority) {
    switch (priority) {
      case 'High':
        return Icons.priority_high_rounded;
      case 'Low':
        return Icons.arrow_downward_rounded;
      default:
        return Icons.drag_handle_rounded;
    }
  }

  Color _priorityColor(String priority) {
    switch (priority) {
      case 'High':
        return AppColors.danger;
      case 'Medium':
        return AppColors.warning;
      case 'Low':
        return AppColors.success;
      default:
        return AppColors.info;
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Open':
        return AppColors.danger;
      case 'In Progress':
        return AppColors.warning;
      case 'Scheduled':
        return AppColors.info;
      case 'Completed':
        return AppColors.success;
      default:
        return AppColors.info;
    }
  }

  void _showForm(BuildContext context, [Map<String, dynamic>? request]) {
    final isEditing = request != null;

    if (isEditing) {
      controller.titleController.text = request['title']?.toString() ?? '';
      controller.descriptionController.text =
          request['description']?.toString() ?? '';
      controller.propertyController.text =
          request['property']?.toString() ?? '';
      controller.unitController.text = request['unit']?.toString() ?? '';
      controller.priorityController.text =
          request['priority']?.toString() ?? 'Medium';
      controller.statusController.text =
          request['status']?.toString() ?? 'Open';
      controller.assignedToController.text =
          request['assignedTo']?.toString() ?? '';
      controller.estimatedCostController.text =
          request['estimatedCost']?.toString() ?? '';
    } else {
      controller.clearForm();
      controller.priorityController.text = 'Medium';
      controller.statusController.text = 'Open';
    }

    showFormSheet(
      context: context,
      title: isEditing ? 'Edit Request' : 'New Request',
      subtitle: isEditing
          ? 'Update the details of this maintenance request.'
          : 'Log a repair or maintenance task.',
      submitLabel: isEditing ? 'Save Changes' : 'Add Request',
      isLoading: controller.isLoading,
      onSubmit: () {
        if (isEditing) {
          controller.editMaintenanceRequest(request['id'] as int);
        } else {
          controller.addMaintenanceRequest();
        }
      },
      fields: [
        TextField(
          controller: controller.titleController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Title',
            prefixIcon: Icon(Icons.title_rounded),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.descriptionController,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.propertyController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Property',
                  prefixIcon: Icon(Icons.home_work_outlined),
                ),
              ),
            ),
            const SizedBox(width: 12),
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
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.priorityController,
                readOnly: true,
                onTap: () => _showPrioritySelectionDialog(context),
                decoration: const InputDecoration(
                  labelText: 'Priority',
                  prefixIcon: Icon(Icons.flag_outlined),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller.statusController,
                readOnly: true,
                onTap: () => _showStatusSelectionDialog(context),
                decoration: const InputDecoration(
                  labelText: 'Status',
                  prefixIcon: Icon(Icons.pending_actions_outlined),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.assignedToController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Assigned to',
            prefixIcon: Icon(Icons.engineering_outlined),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.estimatedCostController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Estimated cost',
            prefixIcon: Icon(Icons.payments_outlined),
          ),
        ),
      ],
    );
  }

  void _showStatusUpdate(BuildContext context, Map<String, dynamic> request) {
    // Prefill every field so saving only changes the status.
    controller.titleController.text = request['title']?.toString() ?? '';
    controller.descriptionController.text =
        request['description']?.toString() ?? '';
    controller.propertyController.text = request['property']?.toString() ?? '';
    controller.unitController.text = request['unit']?.toString() ?? '';
    controller.priorityController.text =
        request['priority']?.toString() ?? 'Medium';
    controller.statusController.text = request['status']?.toString() ?? 'Open';
    controller.assignedToController.text =
        request['assignedTo']?.toString() ?? '';
    controller.estimatedCostController.text =
        request['estimatedCost']?.toString() ?? '';

    showFormSheet(
      context: context,
      title: 'Update Status',
      subtitle: request['title']?.toString() ?? '',
      submitLabel: 'Update Status',
      isLoading: controller.isLoading,
      onSubmit: () => controller.editMaintenanceRequest(request['id'] as int),
      fields: [
        TextField(
          controller: controller.statusController,
          readOnly: true,
          onTap: () => _showStatusSelectionDialog(context),
          decoration: const InputDecoration(
            labelText: 'Status',
            prefixIcon: Icon(Icons.pending_actions_outlined),
          ),
        ),
      ],
    );
  }

  void _showPrioritySelectionDialog(BuildContext context) {
    Get.dialog(
      SimpleDialog(
        title: const Text('Select Priority'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        children: [
          _dialogOption(
            icon: Icons.priority_high_rounded,
            color: AppColors.danger,
            label: 'High',
            onTap: () {
              controller.priorityController.text = 'High';
              Get.back();
            },
          ),
          _dialogOption(
            icon: Icons.drag_handle_rounded,
            color: AppColors.warning,
            label: 'Medium',
            onTap: () {
              controller.priorityController.text = 'Medium';
              Get.back();
            },
          ),
          _dialogOption(
            icon: Icons.arrow_downward_rounded,
            color: AppColors.success,
            label: 'Low',
            onTap: () {
              controller.priorityController.text = 'Low';
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void _showStatusSelectionDialog(BuildContext context) {
    Get.dialog(
      SimpleDialog(
        title: const Text('Select Status'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        children: [
          _dialogOption(
            icon: Icons.fiber_new_rounded,
            color: AppColors.danger,
            label: 'Open',
            onTap: () {
              controller.statusController.text = 'Open';
              Get.back();
            },
          ),
          _dialogOption(
            icon: Icons.hourglass_top_rounded,
            color: AppColors.warning,
            label: 'In Progress',
            onTap: () {
              controller.statusController.text = 'In Progress';
              Get.back();
            },
          ),
          _dialogOption(
            icon: Icons.event_available_rounded,
            color: AppColors.info,
            label: 'Scheduled',
            onTap: () {
              controller.statusController.text = 'Scheduled';
              Get.back();
            },
          ),
          _dialogOption(
            icon: Icons.check_circle_rounded,
            color: AppColors.success,
            label: 'Completed',
            onTap: () {
              controller.statusController.text = 'Completed';
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  Widget _dialogOption({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return SimpleDialogOption(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 14),
          Text(label),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, int id) {
    showConfirmDialog(
      context: context,
      title: 'Delete Request',
      message:
          'Are you sure you want to delete this maintenance request? This action cannot be undone.',
      confirmLabel: 'Delete',
      onConfirm: () => controller.deleteMaintenanceRequest(id),
    );
  }
}
