import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/maintenance_controller.dart';

class MaintenanceView extends GetView<MaintenanceController> {
  const MaintenanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildMaintenanceList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMaintenanceForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMaintenanceList(BuildContext context) {
    return controller.maintenanceRequests.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.build_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  'No maintenance requests found',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to add your first request',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.maintenanceRequests.length,
            itemBuilder: (context, index) {
              final request = controller.maintenanceRequests[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      leading: _buildPriorityIcon(request['priority']),
                      title: Text(
                        request['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${request['property']} - Unit ${request['unit']}',
                      ),
                      trailing: _buildStatusChip(request['status']),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              request['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Created: ${request['createdDate']}'),
                          Text('Est. Cost: \$${request['estimatedCost']}'),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            _showMaintenanceForm(context, request);
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Update status
                            _showStatusUpdateDialog(context, request);
                          },
                          icon: const Icon(Icons.update),
                          label: const Text('Update Status'),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            _showDeleteConfirmation(context, request['id']);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                          label: const Text('Delete', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
  }

  Widget _buildPriorityIcon(String priority) {
    IconData iconData;
    Color iconColor;
    
    switch (priority) {
      case 'High':
        iconData = Icons.priority_high;
        iconColor = Colors.red;
        break;
      case 'Medium':
        iconData = Icons.remove_circle;
        iconColor = Colors.orange;
        break;
      case 'Low':
        iconData = Icons.arrow_downward;
        iconColor = Colors.green;
        break;
      default:
        iconData = Icons.help;
        iconColor = Colors.grey;
    }
    
    return CircleAvatar(
      backgroundColor: iconColor.withOpacity(0.2),
      child: Icon(iconData, color: iconColor),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    
    switch (status) {
      case 'Open':
        chipColor = Colors.red;
        break;
      case 'In Progress':
        chipColor = Colors.orange;
        break;
      case 'Scheduled':
        chipColor = Colors.blue;
        break;
      case 'Completed':
        chipColor = Colors.green;
        break;
      default:
        chipColor = Colors.grey;
    }
    
    return Chip(
      label: Text(status),
      backgroundColor: chipColor.withOpacity(0.2),
      labelStyle: TextStyle(color: chipColor, fontWeight: FontWeight.bold),
    );
  }

  void _showMaintenanceForm(BuildContext context, [Map<String, dynamic>? request]) {
    final isEditing = request != null;
    
    if (isEditing) {
      controller.titleController.text = request['title'];
      controller.descriptionController.text = request['description'];
      controller.propertyController.text = request['property'];
      controller.unitController.text = request['unit'];
      controller.priorityController.text = request['priority'];
      controller.statusController.text = request['status'];
      controller.assignedToController.text = request['assignedTo'];
      controller.estimatedCostController.text = request['estimatedCost'].toString();
    } else {
      controller.clearForm();
      controller.priorityController.text = 'Medium';
      controller.statusController.text = 'Open';
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
                  isEditing ? 'Edit Maintenance Request' : 'Add Maintenance Request',
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
                  maxLines: 3,
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
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.priorityController,
                        decoration: const InputDecoration(
                          labelText: 'Priority',
                          prefixIcon: Icon(Icons.flag),
                        ),
                        readOnly: true,
                        onTap: () {
                          _showPrioritySelectionDialog(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.statusController,
                        decoration: const InputDecoration(
                          labelText: 'Status',
                          prefixIcon: Icon(Icons.pending_actions),
                        ),
                        readOnly: true,
                        onTap: () {
                          _showStatusSelectionDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.assignedToController,
                  decoration: const InputDecoration(
                    labelText: 'Assigned To',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.estimatedCostController,
                  decoration: const InputDecoration(
                    labelText: 'Estimated Cost',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
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
                          ? () => controller.editMaintenanceRequest(request['id'])
                          : controller.addMaintenanceRequest,
                      child: Text(isEditing ? 'Update' : 'Add'),
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

  void _showPrioritySelectionDialog(BuildContext context) {
    Get.dialog(
      SimpleDialog(
        title: const Text('Select Priority'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              controller.priorityController.text = 'High';
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.priority_high, color: Colors.red),
                SizedBox(width: 16),
                Text('High'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              controller.priorityController.text = 'Medium';
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.remove_circle, color: Colors.orange),
                SizedBox(width: 16),
                Text('Medium'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              controller.priorityController.text = 'Low';
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_downward, color: Colors.green),
                SizedBox(width: 16),
                Text('Low'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showStatusSelectionDialog(BuildContext context) {
    Get.dialog(
      SimpleDialog(
        title: const Text('Select Status'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              controller.statusController.text = 'Open';
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.fiber_new, color: Colors.red),
                SizedBox(width: 16),
                Text('Open'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              controller.statusController.text = 'In Progress';
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.pending, color: Colors.orange),
                SizedBox(width: 16),
                Text('In Progress'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              controller.statusController.text = 'Scheduled';
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.event, color: Colors.blue),
                SizedBox(width: 16),
                Text('Scheduled'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              controller.statusController.text = 'Completed';
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 16),
                Text('Completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showStatusUpdateDialog(BuildContext context, Map<String, dynamic> request) {
    controller.statusController.text = request['status'];
    
    Get.dialog(
      Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width > 600 
              ? 400 
              : MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update Status',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                request['title'],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${request['property']} - Unit ${request['unit']}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.statusController,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  prefixIcon: Icon(Icons.pending_actions),
                ),
                readOnly: true,
                onTap: () {
                  _showStatusSelectionDialog(context);
                },
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
                    onPressed: () => controller.editMaintenanceRequest(request['id']),
                    child: const Text('Update'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int id) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Maintenance Request'),
        content: const Text(
          'Are you sure you want to delete this maintenance request? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => controller.deleteMaintenanceRequest(id),
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
