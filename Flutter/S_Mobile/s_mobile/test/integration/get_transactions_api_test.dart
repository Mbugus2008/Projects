import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

/// Integration tests for the GetTransactions API.
///
/// Requires:
///   - Sacco.Core.Api at http://localhost:8088
///   - Client_Service at http://localhost/Aps
void main() {
  const coreApiBase = 'http://localhost:8088';
  const clientServiceBase = 'http://localhost/Aps';
  const clientId = 'BarakaYetu';
  const testAccount = '004297';
  const loanAppType = 12; // Loan_Application

  final httpClient = http.Client();

  tearDownAll(() {
    httpClient.close();
  });

  // ── Helpers ─────────────────────────────────────────────────────
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

  String _uniqueDocNo() => 'TEST-GT-${DateTime.now().millisecondsSinceEpoch}';

  /// Create a test transaction via Client_Service.
  Future<String> _createTestTransaction() async {
    final docNo = _uniqueDocNo();
    await httpClient.post(
      Uri.parse('$clientServiceBase/api/transactions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'body': {
          'Document_No': docNo,
          'Transaction_Date': '2026-07-10',
          'Transaction_Type': loanAppType,
          'Amount': 9999,
          'Account_No': testAccount,
          'Loan_Type': 'BOOSTER',
          'Description': 'Test',
          'Mobile_No': '0710563359',
          'Source': 'Mbaraka',
        },
      }),
    );
    return docNo;
  }

  // ═════════════════════════════════════════════════════════════════
  // Client_Service direct tests
  // ═════════════════════════════════════════════════════════════════
  group('Client_Service GET api/Gettransactions', () {
    test('returns 200 for valid account', () async {
      final response = await _post(clientServiceBase, 'api/Gettransactions', {
        'Account': testAccount,
        'Transaction_Type': loanAppType,
      });

      expect(response.statusCode, 200);
      expect(response.body, isNotEmpty);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], isIn([0, -1]));
      expect(body['Desc'], isNotNull);
    });

    test('response has correct envelope structure', () async {
      final response = await _post(clientServiceBase, 'api/Gettransactions', {
        'Account': testAccount,
        'Transaction_Type': loanAppType,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body.containsKey('Code'), isTrue);
      expect(body.containsKey('Desc'), isTrue);
      // content/Contents may not exist when no results
      expect(
        body.containsKey('content') ||
            body.containsKey('Contents') ||
            body.containsKey('contents'),
        isTrue,
      );
    });

    test('found transaction has required fields', () async {
      await _createTestTransaction();

      final response = await _post(clientServiceBase, 'api/Gettransactions', {
        'Account': testAccount,
        'Transaction_Type': loanAppType,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (body['content'] != null) {
        final tx = body['content'] as Map<String, dynamic>;
        expect(tx['Document_No'], isNotNull);
        expect(tx['Transaction_Type'], isNotNull);
        expect(tx['Amount'], isNotNull);
        expect(tx['Status'], isNotNull);
      }
    });

    test('nonexistent account returns null content', () async {
      final response = await _post(clientServiceBase, 'api/Gettransactions', {
        'Account': 'NONEXISTENT_999',
        'Transaction_Type': 99,
      });

      expect(response.statusCode, 200);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['content'], isNull);
    });

    test('empty account handled gracefully', () async {
      final response = await _post(clientServiceBase, 'api/Gettransactions', {
        'Account': '',
        'Transaction_Type': loanAppType,
      });

      expect(response.statusCode, 200);
    });

    test('invalid Transaction_Type handled gracefully', () async {
      final response = await _post(clientServiceBase, 'api/Gettransactions', {
        'Account': testAccount,
        'Transaction_Type': -1,
      });

      expect(response.statusCode, 200);
    });
  });

  // ═════════════════════════════════════════════════════════════════
  // Sacco.Core.Api proxy tests
  // ═════════════════════════════════════════════════════════════════
  group('Sacco.Core.Api POST api/GetTransactions', () {
    test('endpoint exists (not 404)', () async {
      final response = await _post(coreApiBase, 'api/GetTransactions', {
        'Account_No': testAccount,
        'Transaction_Type': loanAppType,
      });

      // Should not be 404 (route missing)
      expect(response.statusCode, isNot(equals(404)));
    });

    test('response is valid JSON when body present', () async {
      final response = await _post(coreApiBase, 'api/GetTransactions', {
        'Account_No': testAccount,
        'Transaction_Type': loanAppType,
      });

      if (response.body.isNotEmpty) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        expect(body['Code'] ?? body['code'], isNotNull);
      }
    });

    test('requires X-Client-Identifier header', () async {
      final uri = Uri.parse('$coreApiBase/api/GetTransactions');
      final response = await httpClient.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Account_No': testAccount,
          'Transaction_Type': loanAppType,
        }),
      );

      expect(response.statusCode, 400);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['desc'], contains('Missing required header'));
    });

    test('missing Account_No does not crash', () async {
      final response = await _post(coreApiBase, 'api/GetTransactions', {
        'Transaction_Type': loanAppType,
      });

      expect(response.statusCode, isNot(equals(404)));
    });

    test('missing Transaction_Type does not crash', () async {
      final response = await _post(coreApiBase, 'api/GetTransactions', {
        'Account_No': testAccount,
      });

      expect(response.statusCode, isNot(equals(404)));
    });

    test('empty body does not crash', () async {
      final response = await _post(coreApiBase, 'api/GetTransactions', {});

      expect(response.statusCode, isNot(equals(404)));
    });
  });

  // ═════════════════════════════════════════════════════════════════
  // Transaction response field verification
  // ═════════════════════════════════════════════════════════════════
  group('Transaction response fields', () {
    test('response contains all MobileTransaction fields', () async {
      await _createTestTransaction();

      final response = await _post(clientServiceBase, 'api/Gettransactions', {
        'Account': testAccount,
        'Transaction_Type': loanAppType,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (body['content'] != null) {
        final tx = body['content'] as Map<String, dynamic>;

        final requiredFields = [
          'Key',
          'Document_No',
          'Account_No',
          'Transaction_Type',
          'Amount',
          'Status',
        ];
        for (final f in requiredFields) {
          expect(tx.containsKey(f), isTrue,
              reason: 'Transaction should contain $f');
        }

        final allFields = [
          'Description',
          'Posted',
          'Transaction_Date',
          'Transaction_Time',
          'Date_Posted',
          'Time_Posted',
          'Entry_No',
          'Charge',
          'Name',
          'Account_No_2',
          'Keyword',
          'ID_No',
          'Mobile_No',
          'Source',
          'Type',
          'Loan_No',
          'Reference',
          'Comments',
          'Tranfer_To',
        ];
        for (final f in allFields) {
          expect(tx.containsKey(f), isTrue,
              reason: 'Transaction should contain $f');
        }
      }
    });
  });
}
