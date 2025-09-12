import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/documents_controller.dart';

class DocumentsView extends GetView<DocumentsController> {
  const DocumentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildDocumentsList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDocumentForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDocumentsList(BuildContext context) {
    return controller.documents.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.description_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  'No documents found',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to add your first document',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.documents.length,
            itemBuilder: (context, index) {
              final document = controller.documents[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: _buildDocumentIcon(document['fileType']),
                  title: Text(
                    document['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(document['description']),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _buildInfoChip(document['category'], Colors.blue),
                          const SizedBox(width: 8),
                          _buildInfoChip('${document['fileSize']} ${document['fileType']}', Colors.grey),
                        ],
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'view') {
                        // View document - will be implemented with API integration
                      } else if (value == 'edit') {
                        _showDocumentForm(context, document);
                      } else if (value == 'delete') {
                        _showDeleteConfirmation(context, document['id']);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'view',
                        child: Row(
                          children: [
                            Icon(Icons.visibility),
                            SizedBox(width: 8),
                            Text('View'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () {
                    // View document - will be implemented with API integration
                  },
                ),
              );
            },
          );
  }

  Widget _buildDocumentIcon(String fileType) {
    IconData iconData;
    Color iconColor;
    
    switch (fileType) {
      case 'PDF':
        iconData = Icons.picture_as_pdf;
        iconColor = Colors.red;
        break;
      case 'DOC':
      case 'DOCX':
        iconData = Icons.description;
        iconColor = Colors.blue;
        break;
      case 'XLS':
      case 'XLSX':
        iconData = Icons.table_chart;
        iconColor = Colors.green;
        break;
      case 'JPG':
      case 'PNG':
        iconData = Icons.image;
        iconColor = Colors.purple;
        break;
      default:
        iconData = Icons.insert_drive_file;
        iconColor = Colors.grey;
    }
    
    return CircleAvatar(
      backgroundColor: iconColor.withOpacity(0.2),
      child: Icon(iconData, color: iconColor),
    );
  }

  Widget _buildInfoChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
        ),
      ),
    );
  }

  void _showDocumentForm(BuildContext context, [Map<String, dynamic>? document]) {
    final isEditing = document != null;
    
    if (isEditing) {
      controller.titleController.text = document['title'];
      controller.descriptionController.text = document['description'];
      controller.categoryController.text = document['category'];
      controller.propertyController.text = document['property'];
      controller.unitController.text = document['unit'];
      controller.tenantController.text = document['tenant'];
      controller.expirationDateController.text = document['expirationDate'] != 'N/A' 
          ? document['expirationDate'] 
          : '';
    } else {
      controller.clearForm();
    }
    
    Get.dialog(
      Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width > 600 
              ? 500 
              : MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEditing ? 'Edit Document' : 'Upload Document',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    prefixIcon: Icon(Icons.title),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.description),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    prefixIcon: Icon(Icons.category),
                    hintText: 'e.g., Lease, Insurance, Maintenance, Legal',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.propertyController,
                        decoration: const InputDecoration(
                          labelText: 'Property',
                          prefixIcon: Icon(Icons.home_work),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.unitController,
                        decoration: const InputDecoration(
                          labelText: 'Unit',
                          prefixIcon: Icon(Icons.apartment),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.tenantController,
                  decoration: const InputDecoration(
                    labelText: 'Tenant',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.expirationDateController,
                  decoration: const InputDecoration(
                    labelText: 'Expiration Date (if applicable)',
                    prefixIcon: Icon(Icons.calendar_today),
                    hintText: 'YYYY-MM-DD',
                  ),
                  onTap: () async {
                    // Date picker would be implemented in a real app
                  },
                ),
                const SizedBox(height: 16),
                if (!isEditing)
                  ElevatedButton.icon(
                    onPressed: () {
                      // File picker would be implemented in a real app
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Select File'),
                  ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: isEditing
                          ? () => controller.editDocument(document['id'])
                          : controller.addDocument,
                      child: Text(isEditing ? 'Update' : 'Upload'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int id) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Document'),
        content: const Text(
          'Are you sure you want to delete this document? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => controller.deleteDocument(id),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
