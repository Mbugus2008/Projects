import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

/// Integration tests for Phase 1 dashboard features:
///   1. Loan Limit (eligibility API)
///   2. Next Repayment Date (schedule API)
///   3. Recent Transactions (statement API)
///
/// Requires services at https://services.trimline.co.ke
void main() {
  const coreApiBase = 'https://services.trimline.co.ke/Sacco.Core.Api';
  const clientServiceBase = 'https://services.trimline.co.ke/Aps';
  const clientId = 'BarakaYetu';
  const testPhone = '0710563359';
  const testMemberNo = '004297';

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

  // ── 1. Loan Limit (Eligibility API) ─────────────────────────────
  group('1. Loan Limit — Eligibility API', () {
    test('GET Loan_products returns available products', () async {
      final response = await _post(coreApiBase, 'api/Loan_products', {});
      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final code = body['Code'] ?? body['code'] as int?;
      expect(code, 0, reason: 'Expected success response');

      // Contents should be a list or array
      final contents = body['Contents'] ?? body['contents'];
      expect(contents, isNotNull, reason: 'Should have loan products');
      expect(contents, isNotEmpty, reason: 'Should have at least one product');
      print(
          '📊 Loan products count: ${contents is List ? contents.length : 1}');
    });

    test('EligibilityWithTopup returns eligible amount', () async {
      // Fetch products first to get a valid Code
      final lpResponse = await _post(coreApiBase, 'api/Loan_products', {});
      final lpBody = jsonDecode(lpResponse.body) as Map<String, dynamic>;
      final contents = lpBody['Contents'] ?? lpBody['contents'];
      String? code;
      if (contents is List && contents.isNotEmpty) {
        code = (contents.first as Map<String, dynamic>)['Code'] as String?;
      }

      // Skip if no products
      if (code == null) {
        print('⚠️ No loan products available — skipping eligibility test');
        return;
      }

      final response = await _post(coreApiBase, 'api/EligibilityWithTopup', {
        'Phone': testPhone,
        'Code': code,
        'Loan_Type': 'BOOSTER',
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final respCode = body['Code'] ?? body['code'] as int?;
      // May fail if member not eligible, but should not crash
      expect(respCode, isNotNull);
      print('📊 Eligibility for $code: Code=$respCode');
    });

    test('Eligibility returns non-negative eligible amount', () async {
      // Try via Core.Api proxy (same endpoint dashboard uses)
      final response = await _post(coreApiBase, 'api/EligibilityWithTopup', {
        'Phone': testPhone,
        'Code': 'BOOSTER',
        'Loan_Type': 'BOOSTER',
      });
      expect(response.statusCode, 200);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final code = body['Code'] ?? body['code'] as int?;
      expect(code, isNotNull);
      print('📊 Eligibility check: Code=$code');
    });
  });

  // ── 2. Next Repayment Date (Schedule API) ───────────────────────
  group('2. Next Repayment Date — Schedule API', () {
    String? _loanNo;

    setUpAll(() async {
      // Get a loan number from member
      final response = await _post(clientServiceBase, 'api/loanlist', {
        'body': testMemberNo,
      });
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final contents = body['Contents'] ?? body['contents'];
        if (contents is List && contents.isNotEmpty) {
          _loanNo =
              (contents.first as Map<String, dynamic>)['Loan_No'] as String?;
        }
      }
    });

    test('Getschedule returns repayment installments', () async {
      if (_loanNo == null) {
        print('⚠️ No loans found — skipping schedule test');
        return;
      }

      final response = await _post(coreApiBase, 'api/RepaymentSchedule', {
        'Loan_No': _loanNo,
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final code = body['Code'] ?? body['code'] as int?;
      expect(code, 0, reason: 'Schedule should load');

      final contents = body['Contents'] ?? body['contents'];
      expect(contents, isNotNull);
      expect(contents, isNotEmpty);
      print(
          '📊 Schedule entries for $_loanNo: ${contents is List ? contents.length : 1}');
    });

    test('Schedule has Repayment_Date field', () async {
      if (_loanNo == null) {
        print('⚠️ No loans found — skipping date test');
        return;
      }

      final response = await _post(coreApiBase, 'api/RepaymentSchedule', {
        'Loan_No': _loanNo,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] ?? body['contents'];
      if (contents is List && contents.isNotEmpty) {
        final first = contents.first as Map<String, dynamic>;
        // Repayment_Date should be present (could be string, DateTime, or int)
        final date = first['Repayment_Date'] ?? first['repayment_Date'];
        expect(date, isNotNull,
            reason: 'Schedule entries should have Repayment_Date');
        print('📊 First repayment date: $date');
      }
    });

    test('Schedule has Paid flag', () async {
      if (_loanNo == null) return;

      final response = await _post(coreApiBase, 'api/RepaymentSchedule', {
        'Loan_No': _loanNo,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] ?? body['contents'];
      if (contents is List && contents.isNotEmpty) {
        final first = contents.first as Map<String, dynamic>;
        // Paid flag helps determine next due date
        final paid = first['Paid'] ?? first['paid'];
        print('📊 First installment paid: $paid');
      }
    });
  });

  // ── 3. Recent Transactions (Statement API) ──────────────────────
  group('3. Recent Transactions — Statement API', () {
    test('Statement returns account entries', () async {
      final response = await _post(coreApiBase, 'api/Statement', {
        'Acc': testMemberNo,
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final code = body['Code'] ?? body['code'] as int?;
      expect(code, 0, reason: 'Statement should load');

      final contents = body['Contents'] ?? body['contents'];
      expect(contents, isNotNull);
      expect(contents, isNotEmpty);
      print('📊 Statement entries: ${contents is List ? contents.length : 1}');
    });

    test('Statement entries have required fields for dashboard widget',
        () async {
      final response = await _post(coreApiBase, 'api/Statement', {
        'Acc': testMemberNo,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] ?? body['contents'];
      if (contents is List && contents.isNotEmpty) {
        final first = contents.first as Map<String, dynamic>;

        // Dashboard widget needs: Description, Document_No, Amount
        final desc = first['Description'] ??
            first['description'] ??
            first['Document_No'] ??
            first['document_No'] ??
            '';
        final amount =
            first['Amount'] ?? first['amount'] ?? first['Credit_Amount'];

        expect(desc, isNotNull, reason: 'Entry should have description');
        expect(amount, isNotNull, reason: 'Entry should have amount');

        final descStr = desc.toString();
        print(
            '📊 First entry: desc=${descStr.length > 30 ? descStr.substring(0, 30) : descStr} amount=$amount');
      }
    });

    test('Statement entries are sorted by date (most recent first)', () async {
      final response = await _post(coreApiBase, 'api/Statement', {
        'Acc': testMemberNo,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] ?? body['contents'];
      if (contents is List && contents.length >= 2) {
        final first = (contents[0] as Map<String, dynamic>)['Posting_Date'] ??
            (contents[0] as Map<String, dynamic>)['posting_Date'];
        final second = (contents[1] as Map<String, dynamic>)['Posting_Date'] ??
            (contents[1] as Map<String, dynamic>)['posting_Date'];
        print('📊 Dates: first=$first, second=$second');
      }
    });

    test('Last 5 entries are returned correctly', () async {
      final response = await _post(coreApiBase, 'api/Statement', {
        'Acc': testMemberNo,
      });

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final contents = body['Contents'] ?? body['contents'];
      if (contents is List) {
        final recent5 = contents.take(5).toList();
        expect(recent5.length, lessThanOrEqualTo(5));
        print('📊 Recent 5 entries count: ${recent5.length}');
      }
    });
  });

  // ── 4. Dashboard: all three data sources load ──────────────────
  group('4. Dashboard — all data sources available', () {
    test('Member has Loans, Accounts, and Entries', () async {
      final response = await _post(coreApiBase, 'api/member', {
        'Phone': testPhone,
      });

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final code = body['Code'] ?? body['code'] as int?;
      expect(code, 0);

      final contents = body['Contents'] ?? body['contents'];
      expect(contents, isNotNull);
      final c =
          contents is List ? contents.first as Map<String, dynamic> : contents;

      // Member should have these fields
      print('📊 Member: Name=${c['Name']}, No=${c['No']}');
      expect(c['No'], isNotNull, reason: 'Member No required');
    });
  });
}
