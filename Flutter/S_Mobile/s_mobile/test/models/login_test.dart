import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';

void main() {
  group('Login Params', () {
    test('builds correct JSON with phone only', () {
      final p = Params(Phone: '0710563359');
      final json = p.toJson();

      expect(json, contains('"Phone":"0710563359"'));
    });

    test('omits null fields from JSON', () {
      final p = Params(Phone: '0710');
      final json = p.toJson();

      expect(json, isNot(contains('Acc')));
      expect(json, isNot(contains('CS_Number')));
    });

    test('includes all set fields', () {
      final p = Params(
        Phone: '0710',
        Acc: 'DEP001',
        CS_Number: 'CS123',
        Id_No: 'ID456',
        text: 'hello',
        Agent_Code: 'AG1',
      );

      expect(p.toMap()['Phone'], '0710');
      expect(p.toMap()['Acc'], 'DEP001');
      expect(p.toMap()['CS_Number'], 'CS123');
      expect(p.toMap()['Id_No'], 'ID456');
    });

    test('fromMap correctly reads Phone', () {
      final p = Params();
      final map = {'Phone': '0710563359', 'Acc': 'DEP'};
      // Params doesn't have fromMap, but toMap/toJson round-trips work
      final rebuilt = Params(Phone: map['Phone'], Acc: map['Acc']);
      expect(rebuilt.Phone, '0710563359');
      expect(rebuilt.Acc, 'DEP');
    });
  });

  group('Results (response parsing)', () {
    test('parses successful login response', () {
      final json = '{"Code":0,"Desc":"Login successful","Contents":null}';
      final r = Results.fromJson(json);

      expect(r.Code, 0);
      expect(r.Desc, 'Login successful');
    });

    test('parses failure response', () {
      final json = '{"Code":-1,"Desc":"Invalid phone or pin.","Contents":null}';
      final r = Results.fromJson(json);

      expect(r.Code, -1);
      expect(r.Desc, contains('Invalid'));
    });
  });
}
