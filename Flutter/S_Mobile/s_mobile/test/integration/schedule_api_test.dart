import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:s_mobile/Loans/Schedule.dart';

/// Integration tests for the Schedule / RepaymentSchedule API.
///
/// These tests require the backend services to be running:
///   - Sacco.Core.Api at http://localhost:8088
///   - Client_Service at http://localhost/Aps
void main() {
  const coreApiBase = 'http://localhost:8088';
  const clientServiceBase = 'http://localhost/Aps';
  const clientId = 'BarakaYetu';
  const testLoanNo = 'BLN000003';

  final httpClient = http.Client();

  tearDownAll(() {
    httpClient.close();
  });

  // ── Helper ──────────────────────────────────────────────────────
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

  group('Schedule API — direct Client_Service', () {
    test('GETSCHEDULE returns 200 with schedule items', () async {
      final response = await _post(
          clientServiceBase, 'api/Getschedule', {'loanNo': testLoanNo});

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Desc'], 'Successful');
      expect(body['Contents'], isA<List>());

      final items = body['Contents'] as List;
      expect(items, isNotEmpty);
      expect(items.length, 12); // BLN000003 has 12 installments
    });

    test('GETSCHEDULE items deserialize to Schedule model', () async {
      final response = await _post(
          clientServiceBase, 'api/Getschedule', {'loanNo': testLoanNo});

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (body['Contents'] as List)
          .map((e) => Schedule.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();

      expect(items.length, 12);

      // First installment
      final first = items.first;
      expect(first.Loan_No, testLoanNo);
      expect(first.Member_No, '001643');
      expect(first.Loan_Amount, closeTo(37085.0, 0.01));
      expect(first.Instalment_No, 1);
      expect(first.Paid, false);
      expect(first.Principal_Repayment, closeTo(3090.42, 0.01));
      expect(first.Monthly_Interest, closeTo(494.47, 0.01));
      expect(first.Monthly_Repayment, closeTo(3584.88, 0.01));
      expect(first.Repayment_Date, DateTime(2016, 6, 1));

      // Last installment
      final last = items.last;
      expect(last.Instalment_No, 12);
      expect(last.Repayment_Date, DateTime(2017, 5, 1));
    });

    test('GETSCHEDULE handles unknown loan gracefully', () async {
      final response = await _post(
          clientServiceBase, 'api/Getschedule', {'loanNo': 'NONEXISTENT'});

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Contents'], isEmpty);
    });
  });

  group('Schedule API — via Sacco.Core.Api proxy', () {
    test('RepaymentSchedule returns 200 with schedule items', () async {
      final response = await _post(
          coreApiBase, 'api/RepaymentSchedule', {'Loan_No': testLoanNo});

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Contents'], isA<List>());

      final items = body['Contents'] as List;
      expect(items, isNotEmpty);
      expect(items.length, 12);
    });

    test('RepaymentSchedule items deserialize correctly', () async {
      final response = await _post(
          coreApiBase, 'api/RepaymentSchedule', {'Loan_No': testLoanNo});

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (body['Contents'] as List)
          .map((e) => Schedule.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();

      expect(items.length, 12);

      // Spot-check key fields on a few entries
      final months = items.map((s) => s.Monthly_Repayment).toList();
      for (final m in months) {
        expect(m, closeTo(3584.88, 0.01));
      }

      // Verify installment numbers are sequential
      for (var i = 0; i < items.length; i++) {
        expect(items[i].Instalment_No, i + 1);
      }
    });

    test('RepaymentSchedule requires client identifier header', () async {
      final uri = Uri.parse('$coreApiBase/api/RepaymentSchedule');
      final response = await httpClient.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'Loan_No': testLoanNo}),
      );

      expect(response.statusCode, 400);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      // Middleware returns camelCase: "desc"
      expect(body['desc'], contains('Missing required header'));
    });

    test('RepaymentSchedule requires loan number', () async {
      final response =
          await _post(coreApiBase, 'api/RepaymentSchedule', {'Loan_No': ''});

      expect(response.statusCode, 400);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      // API uses PascalCase: "Desc"
      expect(body['Desc'], contains('Loan number is required'));
    });
  });

  group('Schedule model round-trip with real data', () {
    test('toJson → fromJson preserves all fields', () async {
      final response = await _post(
          clientServiceBase, 'api/Getschedule', {'loanNo': testLoanNo});

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final original = (body['Contents'] as List)
          .map((e) => Schedule.fromMap(Map<String, dynamic>.from(e as Map)))
          .first;

      // Round-trip through JSON
      final jsonStr = original.toJson();
      final restored = Schedule.fromJson(jsonStr);

      expect(restored.Key, original.Key);
      expect(restored.Loan_No, original.Loan_No);
      expect(restored.Member_No, original.Member_No);
      expect(restored.Loan_Amount, original.Loan_Amount);
      expect(restored.Instalment_No, original.Instalment_No);
      expect(restored.Paid, original.Paid);
      expect(restored.Repayment_Date, original.Repayment_Date);
      expect(restored.Monthly_Repayment, original.Monthly_Repayment);
      expect(restored.Principal_Repayment, original.Principal_Repayment);
      expect(restored.Monthly_Interest, original.Monthly_Interest);
    });
  });
}
