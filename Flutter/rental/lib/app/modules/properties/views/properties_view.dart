import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/properties_controller.dart';

class PropertiesView extends GetView<PropertiesController> {
  const PropertiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildPropertyList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPropertyForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPropertyList(BuildContext context) {
    return controller.properties.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.home_work_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  'No properties found',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to add your first property',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.properties.length,
            itemBuilder: (context, index) {
              final property = controller.properties[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        property['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${property['address']}, ${property['city']}, ${property['state']} ${property['zipCode']}',
                      ),
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showPropertyForm(context, property);
                          } else if (value == 'delete') {
                            _showDeleteConfirmation(context, property['id']);
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
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildPropertyStat(
                            'Units',
                            '${property['totalUnits']}',
                            Icons.apartment,
                          ),
                          _buildPropertyStat(
                            'Occupied',
                            '${property['occupiedUnits']}',
                            Icons.person,
                          ),
                          _buildPropertyStat(
                            'Vacant',
                            '${property['vacantUnits']}',
                            Icons.no_accounts,
                          ),
                          _buildPropertyStat(
                            'Rent',
                            '\$${property['totalRent']}',
                            Icons.attach_money,
                          ),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // Navigate to units
                            Get.toNamed('/properties/${property['id']}/units');
                          },
                          icon: const Icon(Icons.apartment),
                          label: const Text('Units'),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Navigate to tenants
                            Get.toNamed('/properties/${property['id']}/tenants');
                          },
                          icon: const Icon(Icons.people),
                          label: const Text('Tenants'),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Navigate to maintenance
                            Get.toNamed('/properties/${property['id']}/maintenance');
                          },
                          icon: const Icon(Icons.build),
                          label: const Text('Maintenance'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
  }

  Widget _buildPropertyStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  void _showPropertyForm(BuildContext context, [Map<String, dynamic>? property]) {
    final isEditing = property != null;
    
    if (isEditing) {
      controller.nameController.text = property['name'];
      controller.addressController.text = property['address'];
      controller.cityController.text = property['city'];
      controller.stateController.text = property['state'];
      controller.zipCodeController.text = property['zipCode'];
      controller.propertyTypeController.text = property['propertyType'];
      controller.totalUnitsController.text = property['totalUnits'].toString();
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
                  isEditing ? 'Edit Property' : 'Add Property',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    labelText: 'Property Name',
                    prefixIcon: Icon(Icons.home_work),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: controller.cityController,
                        decoration: const InputDecoration(
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.stateController,
                        decoration: const InputDecoration(
                          labelText: 'State',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.zipCodeController,
                        decoration: const InputDecoration(
                          labelText: 'Zip Code',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.propertyTypeController,
                  decoration: const InputDecoration(
                    labelText: 'Property Type',
                    prefixIcon: Icon(Icons.category),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.totalUnitsController,
                  decoration: const InputDecoration(
                    labelText: 'Total Units',
                    prefixIcon: Icon(Icons.apartment),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.purchasePriceController,
                        decoration: const InputDecoration(
                          labelText: 'Purchase Price',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.currentValueController,
                        decoration: const InputDecoration(
                          labelText: 'Current Value',
                          prefixIcon: Icon(Icons.trending_up),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    prefixIcon: Icon(Icons.note),
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
                          ? () => controller.editProperty(property['id'])
                          : controller.addProperty,
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

  void _showDeleteConfirmation(BuildContext context, int id) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Property'),
        content: const Text(
          'Are you sure you want to delete this property? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => controller.deleteProperty(id),
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
