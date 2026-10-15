import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_ui.dart';
import '../../../theme/app_theme.dart';
import '../controllers/documents_controller.dart';

class DocumentsView extends GetView<DocumentsController> {
  const DocumentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh',
            onPressed: controller.loadDocuments,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value && controller.documents.isEmpty
            ? const LoadingView(label: 'Loading documents…')
            : _buildList(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(context),
        icon: const Icon(Icons.upload_file_rounded),
        label: const Text('Upload Document'),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (controller.documents.isEmpty) {
      return EmptyState(
        icon: Icons.folder_open_outlined,
        title: 'No documents yet',
        message:
            'Keep leases, insurance and other records organised in one place.',
        actionLabel: 'Upload Document',
        onAction: () => _showForm(context),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => controller.loadDocuments(),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
        itemCount: controller.documents.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) =>
            _buildDocumentCard(context, controller.documents[index]),
      ),
    );
  }

  Widget _buildDocumentCard(
    BuildContext context,
    Map<String, dynamic> document,
  ) {
    final theme = Theme.of(context);
    final title = document['title']?.toString() ?? '—';
    final description = document['description']?.toString() ?? '';
    final category = document['category']?.toString() ?? '';
    final fileType = document['fileType']?.toString() ?? '';
    final fileSize = document['fileSize']?.toString() ?? '';
    final expiration = document['expirationDate']?.toString() ?? '';
    final hasExpiration = expiration.isNotEmpty && expiration != 'N/A';

    final (icon, color) = _fileIcon(fileType);
    final sizeLabel = [fileSize, fileType]
        .where((s) => s.isNotEmpty)
        .join(' ');

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: () => _showForm(context, document),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 24),
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
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: theme.textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (category.isNotEmpty)
                      StatusChip(label: category, color: AppColors.primary),
                    if (sizeLabel.isNotEmpty)
                      StatusChip(label: sizeLabel, color: AppColors.info),
                    if (hasExpiration)
                      StatusChip(
                        label: 'Expires ${formatDate(expiration)}',
                        color: AppColors.warning,
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, size: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            onSelected: (value) {
              if (value == 'edit') {
                _showForm(context, document);
              } else if (value == 'delete') {
                _confirmDelete(context, document['id'] as int);
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
          ),
        ],
      ),
    );
  }

  (IconData, Color) _fileIcon(String fileType) {
    switch (fileType.toUpperCase()) {
      case 'PDF':
        return (Icons.picture_as_pdf_rounded, AppColors.danger);
      case 'DOC':
      case 'DOCX':
        return (Icons.article_outlined, AppColors.primary);
      case 'XLS':
      case 'XLSX':
        return (Icons.table_chart_outlined, AppColors.success);
      case 'JPG':
      case 'JPEG':
      case 'PNG':
        return (Icons.image_outlined, AppColors.purple);
      default:
        return (Icons.insert_drive_file_outlined, AppColors.textSecondary);
    }
  }

  Future<void> _pickExpirationDate(BuildContext context) async {
    final now = DateTime.now();
    final initial =
        DateTime.tryParse(controller.expirationDateController.text) ?? now;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 15),
    );
    if (picked != null) {
      controller.expirationDateController.text =
          picked.toIso8601String().split('T').first;
    }
  }

  void _showForm(BuildContext context, [Map<String, dynamic>? document]) {
    final isEditing = document != null;

    if (isEditing) {
      controller.titleController.text = document['title']?.toString() ?? '';
      controller.descriptionController.text =
          document['description']?.toString() ?? '';
      controller.categoryController.text =
          document['category']?.toString() ?? '';
      controller.propertyController.text =
          document['property']?.toString() ?? '';
      controller.unitController.text = document['unit']?.toString() ?? '';
      controller.tenantController.text = document['tenant']?.toString() ?? '';
      final expiration = document['expirationDate']?.toString() ?? '';
      controller.expirationDateController.text =
          expiration == 'N/A' ? '' : expiration;
    } else {
      controller.clearForm();
    }

    showFormSheet(
      context: context,
      title: isEditing ? 'Edit Document' : 'Upload Document',
      subtitle: isEditing
          ? 'Update the details of this document.'
          : 'Add a document record to keep it organised.',
      submitLabel: isEditing ? 'Save Changes' : 'Upload',
      isLoading: controller.isLoading,
      onSubmit: () {
        if (isEditing) {
          controller.editDocument(document['id'] as int);
        } else {
          controller.addDocument();
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
          maxLines: 2,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.categoryController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Category',
            prefixIcon: Icon(Icons.sell_outlined),
            hintText: 'e.g., Lease, Insurance, Legal',
          ),
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
        TextField(
          controller: controller.tenantController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Tenant',
            prefixIcon: Icon(Icons.person_outline_rounded),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: controller.expirationDateController,
          readOnly: true,
          onTap: () => _pickExpirationDate(context),
          decoration: const InputDecoration(
            labelText: 'Expiration date (optional)',
            prefixIcon: Icon(Icons.event_outlined),
          ),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext context, int id) {
    showConfirmDialog(
      context: context,
      title: 'Delete Document',
      message:
          'Are you sure you want to delete this document? This action cannot be undone.',
      confirmLabel: 'Delete',
      onConfirm: () => controller.deleteDocument(id),
    );
  }
}
