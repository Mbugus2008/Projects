import 'dart:convert';

import '../../core/models/document_model.dart';
import '../http_client.dart';

class DocumentRepository {
  final HttpClient _client;

  DocumentRepository(this._client);

  Future<List<AppDocument>> getAll() async {
    final response = await _client.get('/documents');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => AppDocument.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load documents (${response.statusCode})');
  }

  Future<AppDocument?> getById(int id) async {
    final response = await _client.get('/documents/$id');
    if (response.statusCode == 200) {
      return AppDocument.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<bool> create(AppDocument document) async {
    final response = await _client.post('/documents', document.toJson());
    return response.statusCode == 201;
  }

  Future<bool> update(int id, AppDocument document) async {
    final response = await _client.put('/documents/$id', document.toJson());
    return response.statusCode == 200;
  }

  Future<bool> delete(int id) async {
    final response = await _client.delete('/documents/$id');
    return response.statusCode == 200;
  }
}
