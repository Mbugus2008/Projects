import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/api_service.dart';

class PropertiesController extends GetxController {
  final RxList<Map<String, dynamic>> properties = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  
  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController propertyTypeController = TextEditingController();
  final TextEditingController totalUnitsController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController currentValueController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  
  // Get the API service
  final ApiService _apiService = Get.find<ApiService>();
  
  @override
  void onInit() {
    super.onInit();
    loadProperties();
  }
  
  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    countryController.dispose();
    propertyTypeController.dispose();
    totalUnitsController.dispose();
    purchasePriceController.dispose();
    currentValueController.dispose();
    notesController.dispose();
    super.onClose();
  }
  
  void loadProperties() async {
    isLoading.value = true;
    
    try {
      final result = await _apiService.getProperties();
      properties.value = result;
    } catch (e) {
      print('Error loading properties: $e');
      Get.snackbar(
        'Error',
        'Failed to load properties',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void addProperty() async {
    isLoading.value = true;
    
    try {
      final propertyData = {
        'name': nameController.text,
        'address': addressController.text,
        'city': cityController.text,
        'state': stateController.text,
        'zipCode': zipCodeController.text,
        'propertyType': propertyTypeController.text,
        'totalUnits': int.tryParse(totalUnitsController.text) ?? 0,
        'purchasePrice': double.tryParse(purchasePriceController.text) ?? 0.0,
        'marketValue': double.tryParse(currentValueController.text) ?? 0.0,
        'description': notesController.text,
      };
      
      final success = await _apiService.addProperty(propertyData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Property added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadProperties(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to add property',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error adding property: $e');
      Get.snackbar(
        'Error',
        'Failed to add property: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void editProperty(int id) async {
    isLoading.value = true;
    
    try {
      final propertyData = {
        'name': nameController.text,
        'address': addressController.text,
        'city': cityController.text,
        'state': stateController.text,
        'zipCode': zipCodeController.text,
        'propertyType': propertyTypeController.text,
        'totalUnits': int.tryParse(totalUnitsController.text) ?? 0,
        'purchasePrice': double.tryParse(purchasePriceController.text) ?? 0.0,
        'marketValue': double.tryParse(currentValueController.text) ?? 0.0,
        'description': notesController.text,
      };
      
      final success = await _apiService.updateProperty(id, propertyData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Property updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadProperties(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to update property',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error updating property: $e');
      Get.snackbar(
        'Error',
        'Failed to update property: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void deleteProperty(int id) async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.deleteProperty(id);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Property deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadProperties(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete property',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error deleting property: $e');
      Get.snackbar(
        'Error',
        'Failed to delete property: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void clearForm() {
    nameController.clear();
    addressController.clear();
    cityController.clear();
    stateController.clear();
    zipCodeController.clear();
    countryController.clear();
    propertyTypeController.clear();
    totalUnitsController.clear();
    purchasePriceController.clear();
    currentValueController.clear();
    notesController.clear();
  }
}
