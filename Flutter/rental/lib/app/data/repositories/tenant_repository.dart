import 'dart:convert';

import '../../core/models/tenant_model.dart';
import '../http_client.dart';

class TenantRepository {
  final HttpClient _client;

  TenantRepository(this._client);

  Future<List<Tenant>> getAll() async {
    final response = await _client.get('/tenants');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => Tenant.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load tenants (${response.statusCode})');
  }

  Future<Tenant?> getById(int id) async {
    final response = await _client.get('/tenants/$id');
    if (response.statusCode == 200) {
      return Tenant.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<bool> create(Tenant tenant) async {
    final response = await _client.post('/tenants', tenant.toJson());
    return response.statusCode == 201;
  }

  Future<bool> update(int id, Tenant tenant) async {
    final response = await _client.put('/tenants/$id', tenant.toJson());
    return response.statusCode == 200;
  }

  Future<bool> delete(int id) async {
    final response = await _client.delete('/tenants/$id');
    return response.statusCode == 200;
  }
}
