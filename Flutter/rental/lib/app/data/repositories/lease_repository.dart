import 'dart:convert';

import '../../core/models/lease_model.dart';
import '../http_client.dart';

class LeaseRepository {
  final HttpClient _client;

  LeaseRepository(this._client);

  Future<List<Lease>> getAll() async {
    final response = await _client.get('/leases');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => Lease.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load leases (${response.statusCode})');
  }

  Future<Lease?> getById(int id) async {
    final response = await _client.get('/leases/$id');
    if (response.statusCode == 200) {
      return Lease.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<bool> create(Lease lease) async {
    final response = await _client.post('/leases', lease.toJson());
    return response.statusCode == 201;
  }

  Future<bool> update(int id, Lease lease) async {
    final response = await _client.put('/leases/$id', lease.toJson());
    return response.statusCode == 200;
  }

  Future<bool> delete(int id) async {
    final response = await _client.delete('/leases/$id');
    return response.statusCode == 200;
  }
}
