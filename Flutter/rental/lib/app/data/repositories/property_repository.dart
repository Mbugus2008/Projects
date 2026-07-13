import 'dart:convert';

import '../../core/models/property_model.dart';
import '../http_client.dart';

class PropertyRepository {
  final HttpClient _client;

  PropertyRepository(this._client);

  Future<List<Property>> getAll() async {
    final response = await _client.get('/properties');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => Property.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load properties (${response.statusCode})');
  }

  Future<Property?> getById(int id) async {
    final response = await _client.get('/properties/$id');
    if (response.statusCode == 200) {
      return Property.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<bool> create(Property property) async {
    final response = await _client.post('/properties', property.toJson());
    return response.statusCode == 201;
  }

  Future<bool> update(int id, Property property) async {
    final response = await _client.put('/properties/$id', property.toJson());
    return response.statusCode == 200;
  }

  Future<bool> delete(int id) async {
    final response = await _client.delete('/properties/$id');
    return response.statusCode == 200;
  }
}
