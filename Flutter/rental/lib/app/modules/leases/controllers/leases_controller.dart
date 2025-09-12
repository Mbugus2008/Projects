import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/api_service.dart';

class LeasesController extends GetxController {
  final RxList<Map<String, dynamic>> leases = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  
  // Form controllers
  final TextEditingController unitController = TextEditingController();
  final TextEditingController tenantController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController monthlyRentController = TextEditingController();
  final TextEditingController securityDepositController = TextEditingController();
  final TextEditingController leaseTermsController = TextEditingController();
  
  // Get the API service
  final ApiService _apiService = Get.find<ApiService>();
  
  @override
  void onInit() {
    super.onInit();
    loadLeases();
  }
  
  @override
  void onClose() {
    unitController.dispose();
    tenantController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    monthlyRentController.dispose();
    securityDepositController.dispose();
    leaseTermsController.dispose();
    super.onClose();
  }
  
  void loadLeases() async {
    isLoading.value = true;
    
    try {
      final result = await _apiService.getLeases();
      leases.value = result;
    } catch (e) {
      print('Error loading leases: $e');
      Get.snackbar(
        'Error',
        'Failed to load leases',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void addLease() async {
    isLoading.value = true;
    
    try {
      // Parse the unit and tenant IDs from the controller values
      final unitId = int.tryParse(unitController.text) ?? 0;
      final tenantId = int.tryParse(tenantController.text) ?? 0;
      
      final leaseData = {
        'unitId': unitId,
        'tenantId': tenantId,
        'startDate': startDateController.text,
        'endDate': endDateController.text,
        'monthlyRent': double.tryParse(monthlyRentController.text) ?? 0.0,
        'securityDeposit': double.tryParse(securityDepositController.text) ?? 0.0,
        'leaseTerms': leaseTermsController.text,
        'status': 'Active', // Default status for new leases
      };
      
      final success = await _apiService.addLease(leaseData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Lease added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadLeases(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to add lease',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error adding lease: $e');
      Get.snackbar(
        'Error',
        'Failed to add lease: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void editLease(int id) async {
    isLoading.value = true;
    
    try {
      // Parse the unit and tenant IDs from the controller values
      final unitId = int.tryParse(unitController.text) ?? 0;
      final tenantId = int.tryParse(tenantController.text) ?? 0;
      
      final leaseData = {
        'unitId': unitId,
        'tenantId': tenantId,
        'startDate': startDateController.text,
        'endDate': endDateController.text,
        'monthlyRent': double.tryParse(monthlyRentController.text) ?? 0.0,
        'securityDeposit': double.tryParse(securityDepositController.text) ?? 0.0,
        'leaseTerms': leaseTermsController.text,
      };
      
      final success = await _apiService.updateLease(id, leaseData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Lease updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadLeases(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to update lease',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error updating lease: $e');
      Get.snackbar(
        'Error',
        'Failed to update lease: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void deleteLease(int id) async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.deleteLease(id);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Lease deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadLeases(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete lease',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error deleting lease: $e');
      Get.snackbar(
        'Error',
        'Failed to delete lease: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void renewLease(int id) async {
    isLoading.value = true;
    
    try {
      // For lease renewal, we'll update the end date to extend the lease
      // This would typically involve more complex logic in a real app
      final leaseData = {
        'endDate': endDateController.text,
      };
      
      final success = await _apiService.updateLease(id, leaseData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Lease renewal initiated',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadLeases(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to renew lease',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error renewing lease: $e');
      Get.snackbar(
        'Error',
        'Failed to renew lease: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void clearForm() {
    unitController.clear();
    tenantController.clear();
    startDateController.clear();
    endDateController.clear();
    monthlyRentController.clear();
    securityDepositController.clear();
    leaseTermsController.clear();
  }
}
