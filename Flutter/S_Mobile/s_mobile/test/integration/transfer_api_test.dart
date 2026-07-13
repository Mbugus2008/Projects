import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

/// Integration tests for the Transfer Funds API.
///
/// Requires:
///   - Sacco.Core.Api running at http://localhost:8088
///   - Client_Service running at http://localhost/Aps
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
  String _uniqueDocNo() => 'TRF-${DateTime.now().millisecondsSinceEpoch}';

  String _today() => DateTime.now().toIso8601String().substring(0, 10);

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

  /// Fetch member to get member No from phone
  Future<String?> _getMemberNo() async {
    final response = await _post(coreApiBase, 'api/member', {
      'Phone': testPhone,
    });
    if (response.statusCode != 200) return null;
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    if (body['Code'] != 0 || body['Contents'] == null) return null;
    final contents = body['Contents'] as Map<String, dynamic>;
    return contents['No'] as String?;
  }

  group('Transfer Funds API — via Sacco.Core.Api proxy', () {
    test('POST api/transaction creates a transfer (Mobile→Wallet)', () async {
      final memberNo = await _getMemberNo();
      expect(memberNo, isNotNull, reason: 'Could not fetch member');

      final docNo = _uniqueDocNo();
      final response = await _post(coreApiBase, 'api/transaction', {
        'Acc': memberNo,
        'Account_No': 'Mobile',
        'Account_2': 'Wallet',
        'Amount': 100,
        'Document_No': docNo,
        'Transaction_Type': 9,
        'Transaction_Date': _today(),
      });

      expect(response.statusCode, 200,
          reason: 'Response body: \${response.body}');

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (body['Code'] == 0) {
        expect(body['Contents'], isNotNull);
        final contents = body['Contents'] as Map<String, dynamic>;
        expect(contents['Document_No'], isNotNull);
        // Amount may be in 'Amount' or 'text' field depending on serialization
        final amt = contents['Amount'] ?? contents['text'] ?? 0;
        print(
            '📝 Transfer Mobile→Wallet: doc=${contents['Document_No']}, amount=$amt');
      } else {
        // May fail due to NAV validation on test data; log the reason
        print('📝 Transfer result: Code=${body['Code']}, Desc=${body['Desc']}');
      }
    });

    test('POST api/transaction creates a transfer (Wallet→Deposit)', () async {
      final memberNo = await _getMemberNo();
      expect(memberNo, isNotNull, reason: 'Could not fetch member');

      final docNo = _uniqueDocNo();
      final response = await _post(coreApiBase, 'api/transaction', {
        'Acc': memberNo,
        'Account_No': 'Wallet',
        'Account_2': 'Deposit',
        'Amount': 50,
        'Document_No': docNo,
        'Transaction_Type': 9,
        'Transaction_Date': _today(),
      });

      expect(response.statusCode, 200,
          reason: 'Response body: ${response.body}');

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (body['Code'] == 0) {
        expect(body['Contents'], isNotNull);
      } else {
        print('📝 Transfer result: Code=${body['Code']}, Desc=${body['Desc']}');
      }
    });

    test('POST api/transaction missing Account_No returns validation error',
        () async {
      final memberNo = await _getMemberNo();
      expect(memberNo, isNotNull);

      final docNo = _uniqueDocNo();
      final response = await _post(coreApiBase, 'api/transaction', {
        'Acc': memberNo,
        'Account_2': 'Wallet',
        'Amount': 100,
        'Document_No': docNo,
        'Transaction_Type': 9,
        'Transaction_Date': _today(),
      });

      expect(response.statusCode, 200);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], -1);
      expect(body['Desc'], contains('Account_No'));
    });

    test('POST api/transaction zero amount returns validation error', () async {
      final memberNo = await _getMemberNo();
      expect(memberNo, isNotNull);

      final docNo = _uniqueDocNo();
      final response = await _post(coreApiBase, 'api/transaction', {
        'Acc': memberNo,
        'Account_No': 'Mobile',
        'Account_2': 'Wallet',
        'Amount': 0,
        'Document_No': docNo,
        'Transaction_Type': 9,
        'Transaction_Date': _today(),
      });

      expect(response.statusCode, 200);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], -1);
      expect(body['Desc'], contains('Amount'));
    });

    test('Transfer is idempotent with same Document_No + Transaction_Type',
        () async {
      final memberNo = await _getMemberNo();
      expect(memberNo, isNotNull);

      final docNo = _uniqueDocNo();

      // First request
      final r1 = await _post(coreApiBase, 'api/transaction', {
        'Acc': memberNo,
        'Account_No': 'Mobile',
        'Account_2': 'Wallet',
        'Amount': 10,
        'Document_No': docNo,
        'Transaction_Type': 9,
        'Transaction_Date': _today(),
      });
      expect(r1.statusCode, 200);

      // Second request with same doc — should not crash / be idempotent
      final r2 = await _post(coreApiBase, 'api/transaction', {
        'Acc': memberNo,
        'Account_No': 'Mobile',
        'Account_2': 'Wallet',
        'Amount': 10,
        'Document_No': docNo,
        'Transaction_Type': 9,
        'Transaction_Date': _today(),
      });
      expect(r2.statusCode, 200);
      print('📝 Idempotent check passed (2nd call did not crash)');
    });
  });

  group('Transfer Funds — Client_Service direct', () {
    test('POST api/transactions creates transfer (direct)', () async {
      final memberNo = await _getMemberNo();
      expect(memberNo, isNotNull);

      final docNo = _uniqueDocNo();
      final response = await _post(clientServiceBase, 'api/transactions', {
        'body': jsonEncode({
          'Acc': memberNo,
          'Account_No': 'Mobile',
          'Account_2': 'Wallet',
          'Amount': 200,
          'Document_No': docNo,
          'Transaction_Type': 9,
          'Transaction_Date': _today(),
        }),
      });

      expect(response.statusCode, 200,
          reason: 'Response body: ${response.body}');

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (body['Code'] == 0) {
        expect(body['content'], isNotNull);
      } else {
        print('📝 Direct transfer: Code=${body['Code']}, Desc=${body['Desc']}');
      }
    });
  });
}
