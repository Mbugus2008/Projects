import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:s_mobile/members/next_of_kin.dart';

/// Integration tests for the NextOfKin API.
///
/// Requires the live API at https://services.trimline.co.ke.
void main() {
  const clientUrl = 'https://services.trimline.co.ke/Aps/api/getnextofkin';
  const clientId = 'BarakaYetu';
  const memberNo = '004297';

  final httpClient = http.Client();

  tearDownAll(() {
    httpClient.close();
  });

  Future<http.Response> _post() async {
    return httpClient.post(
      Uri.parse(clientUrl),
      headers: {
        'Content-Type': 'application/json',
        'X-Client-Identifier': clientId,
      },
      body: json.encode({
        'body': json.encode({'No': memberNo}),
      }),
    );
  }

  test('returns 200 with next of kin data', () async {
    final response = await _post();
    expect(response.statusCode, 200);

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    expect(body['Code'], 0);
    expect(body['Contents'], isNotNull);
    expect(body['Contents'], isA<List>());
  });

  test('next of kin entries have required fields', () async {
    final response = await _post();
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final contents = body['Contents'] as List;

    expect(contents, isNotEmpty);

    for (final item in contents) {
      final k = item as Map<String, dynamic>;
      expect(k['Name'], isNotNull);
      expect(k['Relationship'], isNotNull);
      expect(k['Account_No'], isNotNull);
    }
  });

  test('next of kin parses to model', () async {
    final response = await _post();
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final contents = body['Contents'] as List;

    final kins = NextOfKin.parseList(contents);
    expect(kins, isNotEmpty);

    for (final k in kins) {
      expect(k.Name, isNotNull);
      expect(k.Relationship, isNotNull);
      expect(k.Account_No, isNotNull);
    }
  });

  test('member 004297 has at least 2 next of kin', () async {
    final response = await _post();
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final contents = body['Contents'] as List;

    expect(contents.length, greaterThanOrEqualTo(2));
  });

  test('PercentAllocation is a number', () async {
    final response = await _post();
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final contents = body['Contents'] as List;

    for (final item in contents) {
      final k = item as Map<String, dynamic>;
      if (k['PercentAllocation'] != null) {
        expect(k['PercentAllocation'], isA<num>());
      }
    }
  });

  test('empty member number returns error', () async {
    final response = await httpClient.post(
      Uri.parse(clientUrl),
      headers: {
        'Content-Type': 'application/json',
        'X-Client-Identifier': clientId,
      },
      body: json.encode({
        'body': json.encode({'No': ''}),
      }),
    );
    expect(response.statusCode, 200);
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    expect(body['Code'], -1);
  });
}
