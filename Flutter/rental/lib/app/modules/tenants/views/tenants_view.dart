import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/contact_launcher.dart';
import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/tenants_controller.dart';

class TenantsView extends GetView<TenantsController> {
  const TenantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenants'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.loadTenants,
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value && controller.tenants.isEmpty
                ? const LoadingView(label: 'Loading tenants…')
                : _buildList(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(context),
        icon: const Icon(Icons.person_add_alt_1_rounded),
        label: const Text('Add Tenant'),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (controller.tenants.isEmpty) {
      return EmptyState(
        icon: Icons.people_outline_rounded,
        title: 'No tenants yet',
        message: 'Add your first tenant to link them to leases and payments.',
        actionLabel: 'Add Tenant',
        onAction: () => _showForm(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.loadTenants(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
        itemCount: controller.tenants.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder:
            (context, index) =>
                _buildTenantCard(context, controller.tenants[index]),
      ),
    );
  }

  Widget _buildTenantCard(BuildContext context, Map<String, dynamic> tenant) {
    final theme = Theme.of(context);
    final firstName = tenant['firstName']?.toString() ?? '';
    final lastName = tenant['lastName']?.toString() ?? '';
    final email = tenant['email']?.toString() ?? '';
    final phone = tenant['phoneNumber']?.toString() ?? '';
    final notes = tenant['notes']?.toString() ?? '';

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InitialsAvatar(
                initials: initialsOf(firstName, lastName),
                color: AppColors.teal,
                size: 48,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName'.trim().isEmpty
                          ? '—'
                          : '$firstName $lastName'.trim(),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      email.isEmpty ? 'No email on file' : email,
                      style: theme.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _buildMenu(context, tenant),
            ],
          ),
          if (phone.isNotEmpty) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  size: 16,
                  color: theme.textTheme.bodySmall?.color,
                ),
                const SizedBox(width: 8),
                Text(phone, style: theme.textTheme.bodyMedium),
              ],
            ),
          ],
          if (notes.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              notes,
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, Map<String, dynamic> tenant) {
    final phone = tenant['phoneNumber']?.toString() ?? '';
    final hasPhone = phone.trim().isNotEmpty;
    final name =
        '${tenant['firstName'] ?? ''} ${tenant['lastName'] ?? ''}'.trim();

    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) {
        if (value == 'edit') {
          _showForm(context, tenant);
        } else if (value == 'delete') {
          _confirmDelete(context, tenant['id'] as int);
        } else if (value == 'call') {
          ContactLauncher.call(phone);
        } else if (value == 'sms') {
          ContactLauncher.sms(phone, 'Hello $name, ');
        } else if (value == 'whatsapp') {
          ContactLauncher.whatsApp(phone, 'Hello $name, ');
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
            if (hasPhone) ...[
              const PopupMenuItem(
                value: 'call',
                child: Row(
                  children: [
                    Icon(Icons.call_outlined, size: 19),
                    SizedBox(width: 10),
                    Text('Call'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'sms',
                child: Row(
                  children: [
                    Icon(Icons.sms_outlined, size: 19),
                    SizedBox(width: 10),
                    Text('SMS'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'whatsapp',
                child: Row(
                  children: [
                    Icon(Icons.chat_outlined, size: 19),
                    SizedBox(width: 10),
                    Text('WhatsApp'),
                  ],
                ),
              ),
            ],
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

  void _showForm(BuildContext context, [Map<String, dynamic>? tenant]) {
    final isEditing = tenant != null;

    if (isEditing) {
      controller.firstNameController.text =
          tenant['firstName']?.toString() ?? '';
      controller.lastNameController.text = tenant['lastName']?.toString() ?? '';
      controller.emailController.text = tenant['email']?.toString() ?? '';
      controller.phoneController.text = tenant['phoneNumber']?.toString() ?? '';
      controller.emergencyContactController.text =
          tenant['emergencyContactName']?.toString() ?? '';
      controller.emergencyPhoneController.text =
          tenant['emergencyContactPhone']?.toString() ?? '';
      controller.notesController.text = tenant['notes']?.toString() ?? '';
    } else {
      controller.clearForm();
    }

    showFormSheet(
      context: context,
      title: isEditing ? 'Edit Tenant' : 'New Tenant',
      subtitle:
          isEditing
              ? 'Update contact details for this tenant.'
              : 'Add a tenant and their contact information.',
      submitLabel: isEditing ? 'Save Changes' : 'Add Tenant',
      isLoading: controller.isLoading,
      onSubmit: () {
        if (isEditing) {
          controller.editTenant(tenant['id'] as int);
        } else {
          controller.addTenant();
        }
      },
      fields: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.firstNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'First name'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller.lastNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Last name'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Email address',
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.phoneController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Phone number',
            hintText: '+254 7XX XXX XXX',
            prefixIcon: Icon(Icons.phone_outlined),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.emergencyContactController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Emergency contact',
            prefixIcon: Icon(Icons.contact_phone_outlined),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.emergencyPhoneController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Emergency phone',
            hintText: '+254 7XX XXX XXX',
            prefixIcon: Icon(Icons.call_outlined),
          ),
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
      title: 'Delete Tenant',
      message:
          'Are you sure you want to delete this tenant? This action cannot be undone.',
      confirmLabel: 'Delete',
      onConfirm: () => controller.deleteTenant(id),
    );
  }
}
