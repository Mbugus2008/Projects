import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leases_controller.dart';

class LeasesView extends GetView<LeasesController> {
  const LeasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leases'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildLeaseList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showLeaseForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildLeaseList(BuildContext context) {
    return controller.leases.isEmpty
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
                  'No leases found',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to add your first lease',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.leases.length,
            itemBuilder: (context, index) {
              final lease = controller.leases[index];
              
              // Calculate days remaining
              final endDate = DateTime.parse(lease['endDate']);
              final daysRemaining = endDate.difference(DateTime.now()).inDays;
              
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '${lease['property']} - Unit ${lease['unit']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Tenant: ${lease['tenant']}'),
                      trailing: _buildStatusChip(lease['status'], daysRemaining),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLeaseDetail('Start', lease['startDate']),
                          _buildLeaseDetail('End', lease['endDate']),
                          _buildLeaseDetail('Rent', '\$${lease['monthlyRent']}'),
                          _buildLeaseDetail('Deposit', '\$${lease['securityDeposit']}'),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // Navigate to payments
                            Get.toNamed('/leases/${lease['id']}/payments');
                          },
                          icon: const Icon(Icons.payment),
                          label: const Text('Payments'),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Navigate to documents
                            Get.toNamed('/leases/${lease['id']}/documents');
                          },
                          icon: const Icon(Icons.description),
                          label: const Text('Documents'),
                        ),
                        PopupMenuButton(
                          onSelected: (value) {
                            if (value == 'edit') {
                              _showLeaseForm(context, lease);
                            } else if (value == 'renew') {
                              _showRenewalForm(context, lease);
                            } else if (value == 'delete') {
                              _showDeleteConfirmation(context, lease['id']);
                            }
                          },
                          itemBuilder: (context) => [
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
                              value: 'renew',
                              child: Row(
                                children: [
                                  Icon(Icons.refresh),
                                  SizedBox(width: 8),
                                  Text('Renew'),
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
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
  }

  Widget _buildStatusChip(String status, int daysRemaining) {
    Color chipColor;
    String displayText = status;
    
    if (status == 'Active') {
      if (daysRemaining < 30) {
        chipColor = Colors.orange;
        displayText = 'Expiring Soon';
      } else {
        chipColor = Colors.green;
      }
    } else {
      chipColor = Colors.grey;
    }
    
    return Chip(
      label: Text(displayText),
      backgroundColor: chipColor.withOpacity(0.2),
      labelStyle: TextStyle(color: chipColor, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildLeaseDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _showLeaseForm(BuildContext context, [Map<String, dynamic>? lease]) {
    final isEditing = lease != null;
    
    if (isEditing) {
      controller.unitController.text = lease['unit'];
      controller.tenantController.text = lease['tenant'];
      controller.startDateController.text = lease['startDate'];
      controller.endDateController.text = lease['endDate'];
      controller.monthlyRentController.text = lease['monthlyRent'].toString();
      controller.securityDepositController.text = lease['securityDeposit'].toString();
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
                  isEditing ? 'Edit Lease' : 'Add Lease',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                // Property and Unit selection would be dropdowns in a real app
                TextField(
                  controller: controller.unitController,
                  decoration: const InputDecoration(
                    labelText: 'Unit',
                    prefixIcon: Icon(Icons.apartment),
                  ),
                ),
                const SizedBox(height: 16),
                // Tenant selection would be a dropdown in a real app
                TextField(
                  controller: controller.tenantController,
                  decoration: const InputDecoration(
                    labelText: 'Tenant',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.startDateController,
                        decoration: const InputDecoration(
                          labelText: 'Start Date',
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: 'YYYY-MM-DD',
                        ),
                        onTap: () async {
                          // Date picker would be implemented in a real app
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.endDateController,
                        decoration: const InputDecoration(
                          labelText: 'End Date',
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: 'YYYY-MM-DD',
                        ),
                        onTap: () async {
                          // Date picker would be implemented in a real app
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.monthlyRentController,
                        decoration: const InputDecoration(
                          labelText: 'Monthly Rent',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.securityDepositController,
                        decoration: const InputDecoration(
                          labelText: 'Security Deposit',
                          prefixIcon: Icon(Icons.security),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.leaseTermsController,
                  decoration: const InputDecoration(
                    labelText: 'Lease Terms',
                    prefixIcon: Icon(Icons.description),
                  ),
                  maxLines: 3,
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
                          ? () => controller.editLease(lease['id'])
                          : controller.addLease,
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

  void _showRenewalForm(BuildContext context, Map<String, dynamic> lease) {
    // Pre-fill with existing lease data but with new dates
    final currentEndDate = DateTime.parse(lease['endDate']);
    final newStartDate = currentEndDate.add(const Duration(days: 1));
    final newEndDate = DateTime(newStartDate.year + 1, newStartDate.month, newStartDate.day);
    
    controller.startDateController.text = newStartDate.toString().split(' ')[0];
    controller.endDateController.text = newEndDate.toString().split(' ')[0];
    controller.monthlyRentController.text = lease['monthlyRent'].toString();
    controller.securityDepositController.text = lease['securityDeposit'].toString();
    
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
                  'Renew Lease',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  'Property: ${lease['property']} - Unit ${lease['unit']}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Tenant: ${lease['tenant']}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.startDateController,
                        decoration: const InputDecoration(
                          labelText: 'New Start Date',
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: 'YYYY-MM-DD',
                        ),
                        onTap: () async {
                          // Date picker would be implemented in a real app
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.endDateController,
                        decoration: const InputDecoration(
                          labelText: 'New End Date',
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: 'YYYY-MM-DD',
                        ),
                        onTap: () async {
                          // Date picker would be implemented in a real app
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.monthlyRentController,
                        decoration: const InputDecoration(
                          labelText: 'New Monthly Rent',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.securityDepositController,
                        decoration: const InputDecoration(
                          labelText: 'New Security Deposit',
                          prefixIcon: Icon(Icons.security),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
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
                      onPressed: () => controller.renewLease(lease['id']),
                      child: const Text('Renew Lease'),
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
        title: const Text('Delete Lease'),
        content: const Text(
          'Are you sure you want to delete this lease? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => controller.deleteLease(id),
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
