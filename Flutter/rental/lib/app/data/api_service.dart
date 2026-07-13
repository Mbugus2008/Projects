import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/config/app_config.dart';

class ApiService extends GetxService {
  final String authToken;
  
  ApiService({required this.authToken});
  
  // Headers for API requests
  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $authToken',
  };
  
  // Properties API
  Future<List<Map<String, dynamic>>> getProperties() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/properties'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load properties');
      }
    } catch (e) {
      print('Error fetching properties: $e');
      return [];
    }
  }
  
  Future<bool> addProperty(Map<String, dynamic> propertyData) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/properties'),
        headers: headers,
        body: jsonEncode(propertyData),
      );
      print(response.statusCode);
      print(response.body);
      return response.statusCode == 201;
    } catch (e) {
      print('Error adding property: $e');
      return false;
    }
  }
  
  Future<bool> updateProperty(int id, Map<String, dynamic> propertyData) async {
    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/properties/$id'),
        headers: headers,
        body: jsonEncode(propertyData),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating property: $e');
      return false;
    }
  }
  
  Future<bool> deleteProperty(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/properties/$id'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting property: $e');
      return false;
    }
  }
  
  // Tenants API
  Future<List<Map<String, dynamic>>> getTenants() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/tenants'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load tenants');
      }
    } catch (e) {
      print('Error fetching tenants: $e');
      return [];
    }
  }
  
  Future<bool> addTenant(Map<String, dynamic> tenantData) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/tenants'),
        headers: headers,
        body: jsonEncode(tenantData),
      );
      
      return response.statusCode == 201;
    } catch (e) {
      print('Error adding tenant: $e');
      return false;
    }
  }
  
  Future<bool> updateTenant(int id, Map<String, dynamic> tenantData) async {
    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/tenants/$id'),
        headers: headers,
        body: jsonEncode(tenantData),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating tenant: $e');
      return false;
    }
  }
  
  Future<bool> deleteTenant(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/tenants/$id'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting tenant: $e');
      return false;
    }
  }
  
  // Leases API
  Future<List<Map<String, dynamic>>> getLeases() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/leases'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load leases');
      }
    } catch (e) {
      print('Error fetching leases: $e');
      return [];
    }
  }
  
  Future<bool> addLease(Map<String, dynamic> leaseData) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/leases'),
        headers: headers,
        body: jsonEncode(leaseData),
      );
      
      return response.statusCode == 201;
    } catch (e) {
      print('Error adding lease: $e');
      return false;
    }
  }
  
  Future<bool> updateLease(int id, Map<String, dynamic> leaseData) async {
    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/leases/$id'),
        headers: headers,
        body: jsonEncode(leaseData),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating lease: $e');
      return false;
    }
  }
  
  Future<bool> deleteLease(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/leases/$id'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting lease: $e');
      return false;
    }
  }
  
  // Transactions API
  Future<List<Map<String, dynamic>>> getTransactions() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/transactions'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      print('Error fetching transactions: $e');
      return [];
    }
  }
  
  Future<bool> addTransaction(Map<String, dynamic> transactionData) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/transactions'),
        headers: headers,
        body: jsonEncode(transactionData),
      );
      
      return response.statusCode == 201;
    } catch (e) {
      print('Error adding transaction: $e');
      return false;
    }
  }
  
  Future<bool> updateTransaction(int id, Map<String, dynamic> transactionData) async {
    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/transactions/$id'),
        headers: headers,
        body: jsonEncode(transactionData),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating transaction: $e');
      return false;
    }
  }
  
  Future<bool> deleteTransaction(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/transactions/$id'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting transaction: $e');
      return false;
    }
  }
  
  // Maintenance API
  Future<List<Map<String, dynamic>>> getMaintenanceRequests() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/maintenance'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load maintenance requests');
      }
    } catch (e) {
      print('Error fetching maintenance requests: $e');
      return [];
    }
  }
  
  Future<bool> addMaintenanceRequest(Map<String, dynamic> requestData) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/maintenance'),
        headers: headers,
        body: jsonEncode(requestData),
      );
      
      return response.statusCode == 201;
    } catch (e) {
      print('Error adding maintenance request: $e');
      return false;
    }
  }
  
  Future<bool> updateMaintenanceRequest(int id, Map<String, dynamic> requestData) async {
    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/maintenance/$id'),
        headers: headers,
        body: jsonEncode(requestData),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating maintenance request: $e');
      return false;
    }
  }
  
  Future<bool> deleteMaintenanceRequest(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/maintenance/$id'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting maintenance request: $e');
      return false;
    }
  }
  
  // Documents API
  Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/documents'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load documents');
      }
    } catch (e) {
      print('Error fetching documents: $e');
      return [];
    }
  }
  
  Future<bool> addDocument(Map<String, dynamic> documentData) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/documents'),
        headers: headers,
        body: jsonEncode(documentData),
      );
      
      return response.statusCode == 201;
    } catch (e) {
      print('Error adding document: $e');
      return false;
    }
  }
  
  Future<bool> updateDocument(int id, Map<String, dynamic> documentData) async {
    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/documents/$id'),
        headers: headers,
        body: jsonEncode(documentData),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error updating document: $e');
      return false;
    }
  }
  
  Future<bool> deleteDocument(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/documents/$id'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting document: $e');
      return false;
    }
  }
  
  // Reports API
  Future<Map<String, dynamic>> getReportSummary() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/summary'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load report summary');
      }
    } catch (e) {
      print('Error fetching report summary: $e');
      return {
        'totalRevenue': 0.0,
        'totalExpenses': 0.0,
        'netIncome': 0.0,
        'occupancyRate': 0.0,
      };
    }
  }
  
  Future<bool> generateIncomeReport() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/income'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error generating income report: $e');
      return false;
    }
  }
  
  Future<bool> generateExpenseReport() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/expenses'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error generating expense report: $e');
      return false;
    }
  }
  
  Future<bool> generateOccupancyReport() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/occupancy'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error generating occupancy report: $e');
      return false;
    }
  }
  
  Future<bool> generateLeaseExpirationReport() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/lease-expirations'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error generating lease expiration report: $e');
      return false;
    }
  }
  
  Future<bool> generateMaintenanceReport() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/maintenance'),
        headers: headers,
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error generating maintenance report: $e');
      return false;
    }
  }
  
  Future<bool> exportReportToPdf(String reportType) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/reports/export'),
        headers: headers,
        body: jsonEncode({'reportType': reportType}),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      print('Error exporting report to PDF: $e');
      return false;
    }
  }
}

