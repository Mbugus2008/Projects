import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/api_service.dart';

class MaintenanceController extends GetxController {
  final RxList<Map<String, dynamic>> maintenanceRequests = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  
  // Form controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController propertyController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController assignedToController = TextEditingController();
  final TextEditingController estimatedCostController = TextEditingController();
  
  // Get the API service
  final ApiService _apiService = Get.find<ApiService>();
  
  @override
  void onInit() {
    super.onInit();
    loadMaintenanceRequests();
  }
  
  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    propertyController.dispose();
    unitController.dispose();
    priorityController.dispose();
    statusController.dispose();
    assignedToController.dispose();
    estimatedCostController.dispose();
    super.onClose();
  }
  
  void loadMaintenanceRequests() async {
    isLoading.value = true;
    
    try {
      final result = await _apiService.getMaintenanceRequests();
      maintenanceRequests.value = result;
    } catch (e) {
      print('Error loading maintenance requests: $e');
      Get.snackbar(
        'Error',
        'Failed to load maintenance requests',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void addMaintenanceRequest() async {
    isLoading.value = true;
    
    try {
      // Parse the property and unit IDs from the controller values
      final propertyId = int.tryParse(propertyController.text) ?? 0;
      final unitId = int.tryParse(unitController.text) ?? 0;
      
      final requestData = {
        'title': titleController.text,
        'description': descriptionController.text,
        'propertyId': propertyId,
        'unitId': unitId > 0 ? unitId : null,
        'priority': priorityController.text,
        'status': statusController.text.isEmpty ? 'Open' : statusController.text,
        'assignedTo': assignedToController.text,
        'estimatedCost': double.tryParse(estimatedCostController.text) ?? 0.0,
        'requestDate': DateTime.now().toIso8601String(),
      };
      
      final success = await _apiService.addMaintenanceRequest(requestData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Maintenance request added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadMaintenanceRequests(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to add maintenance request',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error adding maintenance request: $e');
      Get.snackbar(
        'Error',
        'Failed to add maintenance request: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void editMaintenanceRequest(int id) async {
    isLoading.value = true;
    
    try {
      // Parse the property and unit IDs from the controller values
      final propertyId = int.tryParse(propertyController.text) ?? 0;
      final unitId = int.tryParse(unitController.text) ?? 0;
      
      final requestData = {
        'title': titleController.text,
        'description': descriptionController.text,
        'propertyId': propertyId,
        'unitId': unitId > 0 ? unitId : null,
        'priority': priorityController.text,
        'status': statusController.text,
        'assignedTo': assignedToController.text,
        'estimatedCost': double.tryParse(estimatedCostController.text) ?? 0.0,
      };
      
      final success = await _apiService.updateMaintenanceRequest(id, requestData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Maintenance request updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadMaintenanceRequests(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to update maintenance request',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error updating maintenance request: $e');
      Get.snackbar(
        'Error',
        'Failed to update maintenance request: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void deleteMaintenanceRequest(int id) async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.deleteMaintenanceRequest(id);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Maintenance request deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadMaintenanceRequests(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete maintenance request',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error deleting maintenance request: $e');
      Get.snackbar(
        'Error',
        'Failed to delete maintenance request: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void clearForm() {
    titleController.clear();
    descriptionController.clear();
    propertyController.clear();
    unitController.clear();
    priorityController.clear();
    statusController.clear();
    assignedToController.clear();
    estimatedCostController.clear();
  }
}
