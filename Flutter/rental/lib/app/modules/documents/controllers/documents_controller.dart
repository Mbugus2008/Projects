import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/api_service.dart';

class DocumentsController extends GetxController {
  final RxList<Map<String, dynamic>> documents = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  
  // Form controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController propertyController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController tenantController = TextEditingController();
  final TextEditingController expirationDateController = TextEditingController();
  
  // Get the API service
  final ApiService _apiService = Get.find<ApiService>();
  
  @override
  void onInit() {
    super.onInit();
    loadDocuments();
  }
  
  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    propertyController.dispose();
    unitController.dispose();
    tenantController.dispose();
    expirationDateController.dispose();
    super.onClose();
  }
  
  void loadDocuments() async {
    isLoading.value = true;
    
    try {
      final result = await _apiService.getDocuments();
      documents.value = result;
    } catch (e) {
      print('Error loading documents: $e');
      Get.snackbar(
        'Error',
        'Failed to load documents',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void addDocument() async {
    isLoading.value = true;
    
    try {
      // Parse the property, unit, and tenant IDs from the controller values
      final propertyId = int.tryParse(propertyController.text) ?? 0;
      final unitId = int.tryParse(unitController.text) ?? 0;
      final tenantId = int.tryParse(tenantController.text) ?? 0;
      
      final documentData = {
        'title': titleController.text,
        'description': descriptionController.text,
        'category': categoryController.text,
        'propertyId': propertyId > 0 ? propertyId : null,
        'unitId': unitId > 0 ? unitId : null,
        'tenantId': tenantId > 0 ? tenantId : null,
        'expirationDate': expirationDateController.text.isNotEmpty ? expirationDateController.text : null,
        'uploadDate': DateTime.now().toIso8601String(),
        'fileType': 'PDF', // Default file type
        'fileSize': 0, // Will be updated when actual file is uploaded
        'filePath': '', // Will be updated when actual file is uploaded
      };
      
      final success = await _apiService.addDocument(documentData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Document added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadDocuments(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to add document',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error adding document: $e');
      Get.snackbar(
        'Error',
        'Failed to add document: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void editDocument(int id) async {
    isLoading.value = true;
    
    try {
      // Parse the property, unit, and tenant IDs from the controller values
      final propertyId = int.tryParse(propertyController.text) ?? 0;
      final unitId = int.tryParse(unitController.text) ?? 0;
      final tenantId = int.tryParse(tenantController.text) ?? 0;
      
      final documentData = {
        'title': titleController.text,
        'description': descriptionController.text,
        'category': categoryController.text,
        'propertyId': propertyId > 0 ? propertyId : null,
        'unitId': unitId > 0 ? unitId : null,
        'tenantId': tenantId > 0 ? tenantId : null,
        'expirationDate': expirationDateController.text.isNotEmpty ? expirationDateController.text : null,
      };
      
      final success = await _apiService.updateDocument(id, documentData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Document updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadDocuments(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to update document',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error updating document: $e');
      Get.snackbar(
        'Error',
        'Failed to update document: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void deleteDocument(int id) async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.deleteDocument(id);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Document deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadDocuments(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete document',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error deleting document: $e');
      Get.snackbar(
        'Error',
        'Failed to delete document: $e',
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
    categoryController.clear();
    propertyController.clear();
    unitController.clear();
    tenantController.clear();
    expirationDateController.clear();
  }
}
