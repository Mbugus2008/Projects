import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:s_mobile/Loans/Loan_Eligibility.dart';

/// Integration tests for the Eligibility with Top-up API.
///
/// Requires Sacco.Core.Api running at http://localhost:8088.
void main() {
  const coreApiBase = 'http://localhost:8088';
  const clientServiceBase = 'http://localhost/Aps';
  const clientId = 'BarakaYetu';
  const testPhone = '0710563359';
  const testCode = 'BOOSTER';

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

  group('EligibilityWithTopup API — direct Client_Service', () {
    test('POST api/eligibilitywithtopup returns 200 with eligibility',
        () async {
      final response =
          await _post(clientServiceBase, 'api/eligibilitywithtopup', {
        'body': {
          'phone': testPhone,
          'Code': testCode,
          'loantype': testCode,
        },
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Contents'], isNotNull);
    });

    test('Eligibility deserializes correctly', () async {
      final response =
          await _post(clientServiceBase, 'api/eligibilitywithtopup', {
        'body': {
          'phone': testPhone,
          'Code': testCode,
          'loantype': testCode,
        },
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;
      final eligibility =
          Loan_Eligibility.fromMap(Map<String, dynamic>.from(contents));

      expect(eligibility.Code, testCode);
      expect(eligibility.Member, isNotNull);
      expect(eligibility.Phone, contains('254'));
      expect(eligibility.Eligibility_Status, isNotNull);
    });

    test('Eligibility round-trip preserves fields', () async {
      final response =
          await _post(clientServiceBase, 'api/eligibilitywithtopup', {
        'body': {
          'phone': testPhone,
          'Code': testCode,
          'loantype': testCode,
        },
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;
      final original =
          Loan_Eligibility.fromMap(Map<String, dynamic>.from(contents));

      final restored = Loan_Eligibility.fromJson(original.toJson());

      expect(restored.Code, original.Code);
      expect(restored.Member, original.Member);
      expect(restored.Phone, original.Phone);
      expect(restored.Eligibility_Status, original.Eligibility_Status);
      expect(restored.Loan_Balance, original.Loan_Balance);
      expect(restored.Topup_Paid, original.Topup_Paid);
      expect(restored.Topup_Installment, original.Topup_Installment);
    });
  });

  group('EligibilityWithTopup API — via Sacco.Core.Api proxy', () {
    test('POST api/EligibilityWithTopup returns 200', () async {
      final response = await _post(coreApiBase, 'api/EligibilityWithTopup', {
        'Phone': testPhone,
        'Code': testCode,
        'Loan_Type': testCode,
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Contents'], isNotNull);
    });

    test('Proxy response deserializes correctly', () async {
      final response = await _post(coreApiBase, 'api/EligibilityWithTopup', {
        'Phone': testPhone,
        'Code': testCode,
        'Loan_Type': testCode,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;
      final eligibility =
          Loan_Eligibility.fromMap(Map<String, dynamic>.from(contents));

      expect(eligibility.Code, testCode);
      expect(eligibility.Member, isNotEmpty);
      expect(eligibility.Phone, isNotEmpty);
      expect(eligibility.Eligibility_Status, isNotNull);
    });

    test('Requires client identifier header', () async {
      final uri = Uri.parse('$coreApiBase/api/EligibilityWithTopup');
      final response = await httpClient.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Phone': testPhone,
          'Code': testCode,
          'Loan_Type': testCode,
        }),
      );

      expect(response.statusCode, 400);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['desc'], contains('Missing required header'));
    });

    test('Requires phone and code', () async {
      final response =
          await _post(coreApiBase, 'api/EligibilityWithTopup', {'Phone': ''});

      expect(response.statusCode, 400);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Desc'], contains('Phone and Code are required'));
    });
  });
}
