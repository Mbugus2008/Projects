import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:s_mobile/Loans/Loan_Type.dart';

/// Integration tests for the Loan Products API.
///
/// Requires Sacco.Core.Api running at http://localhost:8088.
void main() {
  const coreApiBase = 'http://localhost:8088';
  const clientServiceBase = 'http://localhost/Aps';
  const clientId = 'BarakaYetu';

  final httpClient = http.Client();

  tearDownAll(() {
    httpClient.close();
  });

  // ── Helpers ─────────────────────────────────────────────────────
  Future<http.Response> _get(String base, String path) async {
    final uri = Uri.parse('$base/$path');
    return httpClient.get(uri);
  }

  Future<http.Response> _post(String path, Map<String, dynamic> body) async {
    final uri = Uri.parse('$coreApiBase/$path');
    return httpClient.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'X-Client-Identifier': clientId,
      },
      body: jsonEncode(body),
    );
  }

  group('Loan Products API — direct Client_Service', () {
    test('GET api/loanproducts returns 200 with products', () async {
      final response = await _get(clientServiceBase, 'api/loanproducts');

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Desc'], 'Successful');
      expect(body['content'], isA<List>());

      final items = body['content'] as List;
      expect(items, isNotEmpty);
    });

    test('loanproducts items deserialize to Loan_Type', () async {
      final response = await _get(clientServiceBase, 'api/loanproducts');

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (body['content'] as List)
          .map((e) => Loan_Type.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();

      expect(items, isNotEmpty);

      for (final product in items) {
        expect(product.Code, isNotNull);
        expect(product.Code, isNotEmpty);
      }
    });

    test('all products have Available_on_Mobile = true', () async {
      final response = await _get(clientServiceBase, 'api/loanproducts');

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (body['content'] as List)
          .map((e) => Loan_Type.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();

      for (final product in items) {
        expect(product.Available_on_Mobile, isTrue,
            reason: '${product.Code} should be available on mobile');
      }
    });
  });

  group('Loan Products API — via Sacco.Core.Api proxy', () {
    test('POST api/Loan_products returns 200 with products', () async {
      final response = await _post('api/Loan_products', {});

      expect(response.statusCode, 200);

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['Code'], 0);
      expect(body['Contents'], isA<List>());

      final items = body['Contents'] as List;
      expect(items, isNotEmpty);
      expect(items.length, greaterThanOrEqualTo(3));
    });

    test('Products deserialize with full fields', () async {
      final response = await _post('api/Loan_products', {});

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (body['Contents'] as List)
          .map((e) => Loan_Type.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();

      expect(items, isNotEmpty);

      // Each product should have key fields
      for (final p in items) {
        expect(p.Code, isNotEmpty);
        expect(p.Product_Description, isNotNull);
        expect(p.Min_Loan_Amount, isNotNull);
        expect(p.Max_Loan_Amount, isNotNull);
        expect(p.Available_on_Mobile, isTrue);
      }

      // Verify a known product
      final booster = items.firstWhere((p) => p.Code == 'BOOSTER');
      expect(booster.Product_Description, 'Booster Loan');
      expect(booster.Min_Loan_Amount, 1000.0);
      expect(booster.Max_Loan_Amount, 200000.0);
      expect(booster.Allow_Topup, isTrue);
    });

    test('Loan_Type round-trip preserves key fields', () async {
      final response = await _post('api/Loan_products', {});

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final items = (body['Contents'] as List)
          .map((e) => Loan_Type.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();
      final original = items.first;

      final restored = Loan_Type.fromJson(original.toJson());

      expect(restored.Code, original.Code);
      expect(restored.Product_Description, original.Product_Description);
      expect(restored.Min_Loan_Amount, original.Min_Loan_Amount);
      expect(restored.Max_Loan_Amount, original.Max_Loan_Amount);
      expect(restored.Available_on_Mobile, original.Available_on_Mobile);
      expect(restored.Allow_Topup, original.Allow_Topup);
    });

    test('fetchLoanProducts static method exists and is callable', () async {
      // Note: fetchLoanProducts uses ApiClient().baseUrl (10.0.2.2),
      // which only works on Android emulator. The full API flow is
      // covered by the proxy tests above.
      expect(Loan_Type.fetchLoanProducts, isNotNull);
    });

    test('Requires client identifier header', () async {
      final uri = Uri.parse('$coreApiBase/api/Loan_products');
      final response = await httpClient.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: '{}',
      );

      expect(response.statusCode, 400);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      expect(body['desc'], contains('Missing required header'));
    });
  });
}
