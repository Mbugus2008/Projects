import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/api_service.dart';

class TenantsController extends GetxController {
  final RxList<Map<String, dynamic>> tenants = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  
  // Form controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emergencyContactController = TextEditingController();
  final TextEditingController emergencyPhoneController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  
  // Get the API service
  final ApiService _apiService = Get.find<ApiService>();
  
  @override
  void onInit() {
    super.onInit();
    loadTenants();
  }
  
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    emergencyContactController.dispose();
    emergencyPhoneController.dispose();
    notesController.dispose();
    super.onClose();
  }
  
  void loadTenants() async {
    isLoading.value = true;
    
    try {
      final result = await _apiService.getTenants();
      tenants.value = result;
    } catch (e) {
      print('Error loading tenants: $e');
      Get.snackbar(
        'Error',
        'Failed to load tenants',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void addTenant() async {
    isLoading.value = true;
    
    try {
      final tenantData = {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'phoneNumber': phoneController.text,
        'emergencyContactName': emergencyContactController.text,
        'emergencyContactPhone': emergencyPhoneController.text,
        'notes': notesController.text,
      };
      
      final success = await _apiService.addTenant(tenantData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Tenant added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadTenants(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to add tenant',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error adding tenant: $e');
      Get.snackbar(
        'Error',
        'Failed to add tenant: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void editTenant(int id) async {
    isLoading.value = true;
    
    try {
      final tenantData = {
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'phoneNumber': phoneController.text,
        'emergencyContactName': emergencyContactController.text,
        'emergencyContactPhone': emergencyPhoneController.text,
        'notes': notesController.text,
      };
      
      final success = await _apiService.updateTenant(id, tenantData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Tenant updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadTenants(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to update tenant',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error updating tenant: $e');
      Get.snackbar(
        'Error',
        'Failed to update tenant: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void deleteTenant(int id) async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.deleteTenant(id);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Tenant deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadTenants(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete tenant',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error deleting tenant: $e');
      Get.snackbar(
        'Error',
        'Failed to delete tenant: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    emergencyContactController.clear();
    emergencyPhoneController.clear();
    notesController.clear();
  }
}
