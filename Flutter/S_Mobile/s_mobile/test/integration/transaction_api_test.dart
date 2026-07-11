import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

/// Integration tests for the Transaction API.
///
/// Requires Sacco.Core.Api running at http://localhost:8088.
void main() {
  const coreApiBase = 'http://localhost:8088';
  const clientServiceBase = 'http://localhost/Aps';
  const clientId = 'BarakaYetu';
  const testPhone = '0710563359';

  final httpClient = http.Client();

  tearDownAll(() {
    httpClient.close();
  });

  // ── Helpers ─────────────────────────────────────────────────────
  String _uniqueDocNo() => 'TEST-${DateTime.now().millisecondsSinceEpoch}';

  Future<http.Response> _post(
      String base, String path, Map<String, dynamic> body,
      {Map<String, String>? extraHeaders}) async {
    final uri = Uri.parse('$base/$path');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Client-Identifier': clientId,
      if (extraHeaders != null) ...extraHeaders,
    };
    return httpClient.post(uri, headers: headers, body: jsonEncode(body));
  }

  group('Transaction API — via Sacco.Core.Api proxy', () {
    test('POST api/transaction creates a new transaction', () async {
      final docNo = _uniqueDocNo();
      final response = await _post(coreApiBase, 'api/transaction', {
        'Phone': testPhone,
        'Acc': '5000',
        'Loan_Type': 'BOOSTER',
        'Document_No': docNo,
        'Transaction_Type': 5,
        'Amount': 5000,
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Desc'], 'Successful');
      expect(body['Contents'], isNotNull);

      final contents = body['Contents'] as Map<String, dynamic>;
      expect(contents['Document_No'], docNo);
      expect(contents['Amount'], 5000.0);
      expect(contents['Status'], 0); // Pending_Posting
    });

    test('Duplicate Document_No is idempotent (no crash)', () async {
      final docNo = _uniqueDocNo();

      // First call — create
      await _post(coreApiBase, 'api/transaction', {
        'Phone': testPhone,
        'Acc': '5000',
        'Loan_Type': 'BOOSTER',
        'Document_No': docNo,
        'Transaction_Type': 5,
        'Amount': 5000,
      });

      // Second call with same Document_No — should not crash
      final response2 = await _post(coreApiBase, 'api/transaction', {
        'Phone': testPhone,
        'Acc': '5000',
        'Loan_Type': 'BOOSTER',
        'Document_No': docNo,
        'Transaction_Type': 5,
        'Amount': 5000,
      });

      expect(response2.statusCode, 200);
      final body = jsonDecode(response2.body) as Map<String, dynamic>;
      // May be Code:0 (created first time) or Code:-1 (duplicate — but shouldn't 500)
      expect(body['Code'], isNotNull);
    });

    test('POST api/transaction fields are persisted correctly', () async {
      final docNo = _uniqueDocNo();
      final response = await _post(coreApiBase, 'api/transaction', {
        'Phone': testPhone,
        'Acc': '7500',
        'Loan_Type': 'M-BARAKA',
        'Document_No': docNo,
        'Transaction_Type': 5,
        'Amount': 7500,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;

      expect(contents['Document_No'], docNo);
      expect(contents['Amount'], 7500.0);
      expect(contents['Transaction_Type'], 5);
    });

    test('Direct Client_Service transaction also works', () async {
      final docNo = _uniqueDocNo();
      final response = await _post(clientServiceBase, 'api/transactions', {
        'body': {
          'Document_No': docNo,
          'Transaction_Type': 5,
          'Amount': 3000,
          'AmountSpecified': true,
          'Status': 0,
          'StatusSpecified': true,
          'Transaction_Date': '2026-07-10T00:00:00',
          'Transaction_DateSpecified': true,
          'Transaction_TypeSpecified': true,
          'Transaction_Time': '2026-07-10T00:00:00',
          'Transaction_TimeSpecified': true,
        },
      });

      expect(response.statusCode, 200);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], isNotNull);
    });

    test('Requires client identifier header', () async {
      final uri = Uri.parse('$coreApiBase/api/transaction');
      final response = await httpClient.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Document_No': _uniqueDocNo(),
          'Transaction_Type': 5,
          'Amount': 1000,
        }),
      );

      expect(response.statusCode, 400);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['desc'], contains('Missing required header'));
    });
  });
}
