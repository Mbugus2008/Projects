import 'dart:convert';

import '../http_client.dart';

class ReportRepository {
  final HttpClient _client;

  ReportRepository(this._client);

  Future<Map<String, dynamic>> getSummary() async {
    final response = await _client.get('/reports/summary');
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Exception('Failed to load report summary (${response.statusCode})');
  }

  Future<bool> generateIncomeReport() async {
    final response = await _client.post('/reports/income', {});
    return response.statusCode == 200;
  }

  Future<bool> generateExpenseReport() async {
    final response = await _client.post('/reports/expenses', {});
    return response.statusCode == 200;
  }

  Future<bool> generateOccupancyReport() async {
    final response = await _client.post('/reports/occupancy', {});
    return response.statusCode == 200;
  }
}
