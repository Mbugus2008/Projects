import 'dart:convert';

import '../../core/models/maintenance_model.dart';
import '../http_client.dart';

class MaintenanceRepository {
  final HttpClient _client;

  MaintenanceRepository(this._client);

  Future<List<MaintenanceRequest>> getAll() async {
    final response = await _client.get('/maintenance');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map(
            (item) => MaintenanceRequest.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    }
    throw Exception(
      'Failed to load maintenance requests (${response.statusCode})',
    );
  }

  Future<MaintenanceRequest?> getById(int id) async {
    final response = await _client.get('/maintenance/$id');
    if (response.statusCode == 200) {
      return MaintenanceRequest.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<bool> create(MaintenanceRequest request) async {
    final response = await _client.post('/maintenance', request.toJson());
    return response.statusCode == 201;
  }

  Future<bool> update(int id, MaintenanceRequest request) async {
    final response = await _client.put('/maintenance/$id', request.toJson());
    return response.statusCode == 200;
  }

  Future<bool> delete(int id) async {
    final response = await _client.delete('/maintenance/$id');
    return response.statusCode == 200;
  }
}
