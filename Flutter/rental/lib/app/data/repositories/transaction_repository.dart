import 'dart:convert';

import '../../core/models/transaction_model.dart';
import '../http_client.dart';

class TransactionRepository {
  final HttpClient _client;

  TransactionRepository(this._client);

  Future<List<Transaction>> getAll() async {
    final response = await _client.get('/transactions');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => Transaction.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load transactions (${response.statusCode})');
  }

  Future<Transaction?> getById(int id) async {
    final response = await _client.get('/transactions/$id');
    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<bool> create(Transaction transaction) async {
    final response = await _client.post('/transactions', transaction.toJson());
    return response.statusCode == 201;
  }

  Future<bool> update(int id, Transaction transaction) async {
    final response = await _client.put(
      '/transactions/$id',
      transaction.toJson(),
    );
    return response.statusCode == 200;
  }

  Future<bool> delete(int id) async {
    final response = await _client.delete('/transactions/$id');
    return response.statusCode == 200;
  }
}
