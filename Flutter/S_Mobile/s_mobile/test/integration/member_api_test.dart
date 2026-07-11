import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:s_mobile/members/member.dart';

/// Integration tests for the Member API.
///
/// Requires Sacco.Core.Api running at http://localhost:8088.
void main() {
  const coreApiBase = 'http://localhost:8088';
  const clientId = 'BarakaYetu';
  const testPhone = '0710563359';

  final httpClient = http.Client();

  tearDownAll(() {
    httpClient.close();
  });

  // ── Helper ──────────────────────────────────────────────────────
  Future<http.Response> _post(String path, Map<String, dynamic> body,
      {Map<String, String>? extraHeaders}) async {
    final uri = Uri.parse('$coreApiBase/$path');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Client-Identifier': clientId,
      if (extraHeaders != null) ...extraHeaders,
    };
    return httpClient.post(uri, headers: headers, body: jsonEncode(body));
  }

  group('Member API', () {
    test('POST api/member returns 200 with member data', () async {
      final response = await _post('api/member', {
        'Phone': testPhone,
        'Acc': null,
        'CS_Number': null,
        'Id_No': null,
        'text': null,
        'Agent_Code': null,
        'Application_No': null,
        'Loan_Type': null,
        'Image': null,
        'Loan_No': null,
        'Transaction_Type': null,
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Desc'], 'Successful');
      expect(body['Contents'], isNotNull);
    });

    test('Member response deserializes to Member model', () async {
      final response = await _post('api/member', {
        'Phone': testPhone,
      });

      expect(response.statusCode, 200);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;

      final member = Member.fromMap(contents);

      // Core identity fields should be present
      expect(member.No, isNotNull);
      expect(member.No, isNotEmpty);
      expect(member.Name, isNotNull);
      expect(member.Name, isNotEmpty);
    });

    test('Member response includes accounts', () async {
      final response = await _post('api/member', {
        'Phone': testPhone,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;
      final member = Member.fromMap(contents);

      expect(member.Accounts, isNotNull);
      expect(member.Accounts, isNotEmpty);

      // Each account should have basic fields
      for (final acc in member.Accounts!) {
        expect(acc.No, isNotNull);
        expect(acc.Name, isNotNull);
      }
    });

    test('Member response includes loans', () async {
      final response = await _post('api/member', {
        'Phone': testPhone,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;
      final member = Member.fromMap(contents);

      expect(member.Loans, isNotNull);

      if (member.Loans!.isNotEmpty) {
        for (final loan in member.Loans!) {
          expect(loan.Loan_No, isNotNull);
          expect(loan.Loan_No, isNotEmpty);
        }
      }
    });

    test('Member round-trip: toJson → fromJson preserves key fields', () async {
      final response = await _post('api/member', {
        'Phone': testPhone,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] as Map<String, dynamic>;
      final original = Member.fromMap(contents);

      // Round-trip through JSON
      final jsonStr = original.toJson();
      final restored = Member.fromJson(jsonStr);

      expect(restored.No, original.No);
      expect(restored.Name, original.Name);
      expect(restored.Mobile_Phone_No, original.Mobile_Phone_No);
      expect(restored.ID_No, original.ID_No);
    });

    test('Missing phone returns 400', () async {
      final response = await _post('api/member', {
        'Phone': '',
      });

      expect(response.statusCode, 400);
    });
  });
}
