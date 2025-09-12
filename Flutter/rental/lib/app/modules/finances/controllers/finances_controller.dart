import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/api_service.dart';

class FinancesController extends GetxController {
  final RxList<Map<String, dynamic>> transactions = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  
  // Summary metrics
  final RxDouble totalIncome = 0.0.obs;
  final RxDouble totalExpenses = 0.0.obs;
  final RxDouble netIncome = 0.0.obs;
  
  // Form controllers
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController propertyController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController tenantController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
  // Get the API service
  final ApiService _apiService = Get.find<ApiService>();
  
  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }
  
  @override
  void onClose() {
    dateController.dispose();
    amountController.dispose();
    categoryController.dispose();
    propertyController.dispose();
    unitController.dispose();
    tenantController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
  
  void loadTransactions() async {
    isLoading.value = true;
    
    try {
      final result = await _apiService.getTransactions();
      transactions.value = result;
      _calculateSummaryMetrics();
    } catch (e) {
      print('Error loading transactions: $e');
      Get.snackbar(
        'Error',
        'Failed to load transactions',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void _calculateSummaryMetrics() {
    double income = 0.0;
    double expenses = 0.0;
    
    for (var transaction in transactions) {
      if (transaction['type'] == 'Income') {
        income += transaction['amount'] is double ? transaction['amount'] : double.parse(transaction['amount'].toString());
      } else {
        expenses += transaction['amount'] is double ? transaction['amount'] : double.parse(transaction['amount'].toString());
      }
    }
    
    totalIncome.value = income;
    totalExpenses.value = expenses;
    netIncome.value = income - expenses;
  }
  
  void addTransaction() async {
    isLoading.value = true;
    
    try {
      // Parse the property, unit, and tenant IDs from the controller values
      final propertyId = int.tryParse(propertyController.text) ?? 0;
      final unitId = int.tryParse(unitController.text) ?? 0;
      final tenantId = int.tryParse(tenantController.text) ?? 0;
      
      final transactionData = {
        'transactionDate': dateController.text,
        'amount': double.tryParse(amountController.text) ?? 0.0,
        'category': categoryController.text,
        'propertyId': propertyId > 0 ? propertyId : null,
        'unitId': unitId > 0 ? unitId : null,
        'tenantId': tenantId > 0 ? tenantId : null,
        'description': descriptionController.text,
        'type': categoryController.text.toLowerCase().contains('rent') ? 'Income' : 'Expense',
      };
      
      final success = await _apiService.addTransaction(transactionData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Transaction added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadTransactions(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to add transaction',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error adding transaction: $e');
      Get.snackbar(
        'Error',
        'Failed to add transaction: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void editTransaction(int id) async {
    isLoading.value = true;
    
    try {
      // Parse the property, unit, and tenant IDs from the controller values
      final propertyId = int.tryParse(propertyController.text) ?? 0;
      final unitId = int.tryParse(unitController.text) ?? 0;
      final tenantId = int.tryParse(tenantController.text) ?? 0;
      
      final transactionData = {
        'transactionDate': dateController.text,
        'amount': double.tryParse(amountController.text) ?? 0.0,
        'category': categoryController.text,
        'propertyId': propertyId > 0 ? propertyId : null,
        'unitId': unitId > 0 ? unitId : null,
        'tenantId': tenantId > 0 ? tenantId : null,
        'description': descriptionController.text,
        'type': categoryController.text.toLowerCase().contains('rent') ? 'Income' : 'Expense',
      };
      
      final success = await _apiService.updateTransaction(id, transactionData);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Transaction updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadTransactions(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to update transaction',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error updating transaction: $e');
      Get.snackbar(
        'Error',
        'Failed to update transaction: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void deleteTransaction(int id) async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.deleteTransaction(id);
      
      if (success) {
        Get.back();
        Get.snackbar(
          'Success',
          'Transaction deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        loadTransactions(); // Refresh the list
      } else {
        Get.snackbar(
          'Error',
          'Failed to delete transaction',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error deleting transaction: $e');
      Get.snackbar(
        'Error',
        'Failed to delete transaction: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void clearForm() {
    dateController.clear();
    amountController.clear();
    categoryController.clear();
    propertyController.clear();
    unitController.clear();
    tenantController.clear();
    descriptionController.clear();
  }
}
