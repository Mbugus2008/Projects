import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/api_service.dart';

class ReportsController extends GetxController {
  final RxList<Map<String, dynamic>> reports = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  
  // Summary metrics
  final RxDouble totalRevenue = 0.0.obs;
  final RxDouble totalExpenses = 0.0.obs;
  final RxDouble netIncome = 0.0.obs;
  final RxDouble occupancyRate = 0.0.obs;
  
  // Get the API service
  final ApiService _apiService = Get.find<ApiService>();
  
  @override
  void onInit() {
    super.onInit();
    loadReports();
  }
  
  void loadReports() async {
    isLoading.value = true;
    
    try {
      final result = await _apiService.getReportSummary();
      
      // Update summary metrics from API response
      totalRevenue.value = result['totalRevenue'] is double ? 
          result['totalRevenue'] : double.parse(result['totalRevenue'].toString());
      totalExpenses.value = result['totalExpenses'] is double ? 
          result['totalExpenses'] : double.parse(result['totalExpenses'].toString());
      netIncome.value = result['netIncome'] is double ? 
          result['netIncome'] : double.parse(result['netIncome'].toString());
      occupancyRate.value = result['occupancyRate'] is double ? 
          result['occupancyRate'] : double.parse(result['occupancyRate'].toString());
      
    } catch (e) {
      print('Error loading report summary: $e');
      Get.snackbar(
        'Error',
        'Failed to load report summary',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  // Methods to generate different types of reports
  Future<void> generateIncomeReport() async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.generateIncomeReport();
      
      if (success) {
        Get.snackbar(
          'Success',
          'Income report generated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to generate income report',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error generating income report: $e');
      Get.snackbar(
        'Error',
        'Failed to generate income report: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> generateExpenseReport() async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.generateExpenseReport();
      
      if (success) {
        Get.snackbar(
          'Success',
          'Expense report generated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to generate expense report',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error generating expense report: $e');
      Get.snackbar(
        'Error',
        'Failed to generate expense report: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> generateOccupancyReport() async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.generateOccupancyReport();
      
      if (success) {
        Get.snackbar(
          'Success',
          'Occupancy report generated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to generate occupancy report',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error generating occupancy report: $e');
      Get.snackbar(
        'Error',
        'Failed to generate occupancy report: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> generateLeaseExpirationReport() async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.generateLeaseExpirationReport();
      
      if (success) {
        Get.snackbar(
          'Success',
          'Lease expiration report generated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to generate lease expiration report',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error generating lease expiration report: $e');
      Get.snackbar(
        'Error',
        'Failed to generate lease expiration report: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> generateMaintenanceReport() async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.generateMaintenanceReport();
      
      if (success) {
        Get.snackbar(
          'Success',
          'Maintenance report generated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to generate maintenance report',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error generating maintenance report: $e');
      Get.snackbar(
        'Error',
        'Failed to generate maintenance report: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> exportReportToPdf(String reportType) async {
    isLoading.value = true;
    
    try {
      final success = await _apiService.exportReportToPdf(reportType);
      
      if (success) {
        Get.snackbar(
          'Success',
          'Report exported to PDF successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to export report to PDF',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error exporting report to PDF: $e');
      Get.snackbar(
        'Error',
        'Failed to export report to PDF: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
