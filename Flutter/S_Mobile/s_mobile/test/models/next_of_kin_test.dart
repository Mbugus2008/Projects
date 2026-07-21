import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/members/next_of_kin.dart';

void main() {
  group('NextOfKin', () {
    test('fromMap parses all fields', () {
      final m = NextOfKin.fromMap({
        'Key': 'k1',
        'Account_No': '004297',
        'Type': 0,
        'Name': 'FRANCIS ONG\'ANG\'A',
        'ID_No': '12345678',
        'Address': 'Nairobi',
        'Relationship': 'SON',
        'PercentAllocation': 25.0,
        'Beneficiary': false,
        'Date_of_Birth': '1990-01-01T00:00:00',
        'Telephone': '0710563359',
        'Fax': null,
        'Email': 'francis@example.com',
      });

      expect(m.Key, 'k1');
      expect(m.Account_No, '004297');
      expect(m.Type, 'Next_of_Kin');
      expect(m.Name, 'FRANCIS ONG\'ANG\'A');
      expect(m.ID_No, '12345678');
      expect(m.Address, 'Nairobi');
      expect(m.Relationship, 'SON');
      expect(m.PercentAllocation, 25.0);
      expect(m.Beneficiary, false);
      expect(m.Date_of_Birth, DateTime(1990, 1, 1));
      expect(m.Telephone, '0710563359');
      expect(m.Fax, isNull);
      expect(m.Email, 'francis@example.com');
    });

    test('fromMap parses Type enum indices', () {
      expect(NextOfKin.fromMap({'Type': 0}).Type, 'Next_of_Kin');
      expect(NextOfKin.fromMap({'Type': 1}).Type, 'Spouse');
      expect(NextOfKin.fromMap({'Type': 2}).Type, 'Benevolent_Beneficiary');
    });

    test('fromMap handles string Type', () {
      expect(NextOfKin.fromMap({'Type': 'Spouse'}).Type, 'Spouse');
    });

    test('fromMap handles nulls', () {
      final m = NextOfKin.fromMap({});
      expect(m.Key, isNull);
      expect(m.Name, isNull);
      expect(m.Type, isNull);
      expect(m.PercentAllocation, isNull);
      expect(m.Beneficiary, isNull);
    });

    test('fromMap handles invalid Type index', () {
      expect(NextOfKin.fromMap({'Type': 99}).Type, isNull);
    });

    test('fromMap handles null Date_of_Birth', () {
      expect(NextOfKin.fromMap({'Date_of_Birth': null}).Date_of_Birth, isNull);
    });

    test('parseList parses list of NextOfKin', () {
      final list = NextOfKin.parseList([
        {'Name': 'A', 'Relationship': 'SON'},
        {'Name': 'B', 'Relationship': 'DAUGHTER'},
      ]);
      expect(list, hasLength(2));
      expect(list[0].Name, 'A');
      expect(list[1].Name, 'B');
    });

    test('parseList handles empty/null', () {
      expect(NextOfKin.parseList(null), isEmpty);
      expect(NextOfKin.parseList([]), isEmpty);
      expect(NextOfKin.parseList({}), isEmpty);
    });

    test('parseList skips invalid entries', () {
      final list = NextOfKin.parseList([
        {'Name': 'A'},
        'invalid',
        {'Name': 'B'},
      ]);
      expect(list, hasLength(2));
    });
  });
}
