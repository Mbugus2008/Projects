import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/properties_controller.dart';

class PropertiesView extends GetView<PropertiesController> {
  const PropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.loadProperties,
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value && controller.properties.isEmpty
                ? const LoadingView(label: 'Loading properties…')
                : _buildList(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(context),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Property'),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (controller.properties.isEmpty) {
      return EmptyState(
        icon: Icons.home_work_outlined,
        title: 'No properties yet',
        message:
            'Add your first property to start tracking units, leases and tenants.',
        actionLabel: 'Add Property',
        onAction: () => _showForm(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.loadProperties(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
        itemCount: controller.properties.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder:
            (context, index) =>
                _buildPropertyCard(context, controller.properties[index]),
      ),
    );
  }

  Widget _buildPropertyCard(
    BuildContext context,
    Map<String, dynamic> property,
  ) {
    final theme = Theme.of(context);
    final name = property['name']?.toString() ?? '—';
    final address = property['address']?.toString() ?? '';
    final city = property['city']?.toString() ?? '';
    final state = property['state']?.toString() ?? '';
    final type = property['propertyType']?.toString() ?? '';
    final units = property['totalUnits']?.toString() ?? '0';
    final description = property['description']?.toString() ?? '';
    final location = [city, state].where((s) => s.isNotEmpty).join(', ');

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
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.home_work_rounded,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
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
                      address.isEmpty ? '—' : address,
                      style: theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _buildMenu(context, property),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              StatusChip(
                label: type.isEmpty ? 'Residential' : type,
                color: AppColors.primary,
              ),
              StatusChip(label: '$units units', color: AppColors.teal),
              if (location.isNotEmpty)
                StatusChip(label: location, color: AppColors.info),
            ],
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              description,
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, Map<String, dynamic> property) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) {
        if (value == 'edit') {
          _showForm(context, property);
        } else if (value == 'delete') {
          _confirmDelete(context, property['id'] as int);
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
                  Text('Delete', style: TextStyle(color: AppColors.danger)),
                ],
              ),
            ),
          ],
    );
  }

  void _showForm(BuildContext context, [Map<String, dynamic>? property]) {
    final isEditing = property != null;

    if (isEditing) {
      controller.nameController.text = property['name']?.toString() ?? '';
      controller.addressController.text = property['address']?.toString() ?? '';
      controller.cityController.text = property['city']?.toString() ?? '';
      controller.stateController.text = property['state']?.toString() ?? '';
      controller.zipCodeController.text = property['zipCode']?.toString() ?? '';
      controller.propertyTypeController.text =
          property['propertyType']?.toString() ?? '';
      controller.totalUnitsController.text =
          property['totalUnits']?.toString() ?? '';
      controller.purchasePriceController.text =
          property['purchasePrice']?.toString() ?? '';
      controller.currentValueController.text =
          property['marketValue']?.toString() ?? '';
      controller.notesController.text =
          property['description']?.toString() ?? '';
    } else {
      controller.clearForm();
    }

    showFormSheet(
      context: context,
      title: isEditing ? 'Edit Property' : 'New Property',
      subtitle:
          isEditing
              ? 'Update the details for this property.'
              : 'Fill in the details to add a property to your portfolio.',
      submitLabel: isEditing ? 'Save Changes' : 'Add Property',
      isLoading: controller.isLoading,
      onSubmit: () {
        if (isEditing) {
          controller.editProperty(property['id'] as int);
        } else {
          controller.addProperty();
        }
      },
      fields: [
        TextField(
          controller: controller.nameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Property name',
            prefixIcon: Icon(Icons.home_work_outlined),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.addressController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Address',
            prefixIcon: Icon(Icons.location_on_outlined),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                controller: controller.cityController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'City'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller.stateController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'County'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.zipCodeController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Postal code'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller.propertyTypeController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Type'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.totalUnitsController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Total units'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller.purchasePriceController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Purchase price'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.currentValueController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: 'Current value'),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.notesController,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Notes'),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext context, int id) {
    showConfirmDialog(
      context: context,
      title: 'Delete Property',
      message:
          'Are you sure you want to delete this property? This action cannot be undone.',
      confirmLabel: 'Delete',
      onConfirm: () => controller.deleteProperty(id),
    );
  }
}
