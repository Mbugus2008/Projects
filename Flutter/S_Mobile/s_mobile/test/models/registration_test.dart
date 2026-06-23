import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/registration/registration.dart';
import 'package:s_mobile/registration/next_of_kin.dart';

void main() {
  group('registration', () {
    test('fromMap basic', () {
      final r = registration.fromMap({'Key': 'rk1', 'No': 'R001', 'Name': 'John', 'First_Name': 'John', 'E_Mail': 'j@e.com', 'City': 'Nairobi'});
      expect(r.Key, 'rk1');
      expect(r.Name, 'John');
      expect(r.E_Mail, 'j@e.com');
    });
    test('fromMap Status enum', () {
      expect(registration.fromMap({'Status': 0}).Status, status.Open);
      expect(registration.fromMap({'Status': 4}).Status, status.Created);
    });
    test('fromMap Gender enum', () {
      expect(registration.fromMap({'Gender': 0}).Gender, gender.values[0]);
      expect(registration.fromMap({'Gender': 1}).Gender, gender.Male);
    });
    test('fromMap Marital_Status', () {
      expect(registration.fromMap({'Marital_Status': 0}).Marital_Status, marital_Status.values[0]);
      expect(registration.fromMap({'Marital_Status': 5}).Marital_Status, marital_Status.Widow);
    });
    test('fromMap Recruited_by_Type', () {
      expect(registration.fromMap({'Recruited_by_Type': 0}).Recruited_by_Type, recruited_by_Type.Marketer);
      expect(registration.fromMap({'Recruited_by_Type': 4}).Recruited_by_Type, recruited_by_Type.Member);
    });
    test('fromMap Terms_of_Employment', () {
      expect(registration.fromMap({'Terms_of_Employment': 0}).Terms_of_Employment, terms_of_Employment.values[0]);
      expect(registration.fromMap({'Terms_of_Employment': 3}).Terms_of_Employment, terms_of_Employment.Casual);
    });
    test('fromMap Date_of_Birth from string', () {
      expect(registration.fromMap({'Date_of_Birth': '1990-05-15T00:00:00.000'}).Date_of_Birth, DateTime(1990, 5, 15));
    });
    test('fromMap nulls', () {
      final r = registration.fromMap({});
      expect(r.Key, isNull);
      expect(r.Status, isNull);
    });
    test('toMap enums as indices', () {
      final m = registration(Status: status.Approved, Gender: gender.Male).toMap();
      expect(m['Status'], status.Approved.index);
      expect(m['Gender'], gender.Male.index);
    });
    test('toMap Date_of_Birth as ISO string', () {
      final d = DateTime(1990, 5, 15);
      expect(registration(Date_of_Birth: d).toMap()['Date_of_Birth'], d.toIso8601String());
    });
    test('toMap uses E_Mail key', () {
      expect(registration(E_Mail: 'test@example.com').toMap()['E_Mail'], 'test@example.com');
    });
    test('toJson/fromJson round-trip', () {
      final o = registration(Key: 'rk1', No: 'R001', Name: 'Test', First_Name: 'T', E_Mail: 't@t.com', Status: status.Created, Gender: gender.Female, City: 'Nairobi');
      final r = registration.fromJson(o.toJson());
      expect(r.Key, o.Key);
      expect(r.Status, o.Status);
    });
    test('Date_of_Birth IS round-tripped', () {
      final date = DateTime(1990, 1, 1);
      expect(registration.fromJson(registration(Date_of_Birth: date).toJson()).Date_of_Birth, date);
    });
  });

  group('NextOfKin', () {
    test('toMap fields', () {
      final d = DateTime(1990, 5, 15);
      final m = NextOfKin(Key: 'nk1', Name: 'Jane', Type: NextOfKinType.Next_of_Kin, Beneficiary: true, Date_of_Birth: d, PercentAllocation: 100).toMap();
      expect(m['Key'], 'nk1');
      expect(m['Type'], NextOfKinType.Next_of_Kin.index);
      expect(m['Date_of_Birth'], d.toIso8601String());
    });
    test('toMap nulls', () {
      expect(NextOfKin().toMap()['Key'], isNull);
    });
    test('fromMap/fromJson round-trip', () {
      final d = DateTime(1990, 5, 15);
      final o = NextOfKin(Key: 'nk1', Account_No: 'M001', Type: NextOfKinType.Spouse, Name: 'Jane', Beneficiary: true, Date_of_Birth: d, PercentAllocation: 50);
      final r = NextOfKin.fromJson(o.toJson());
      expect(r.Key, o.Key);
      expect(r.Type, o.Type);
      expect(r.Date_of_Birth, o.Date_of_Birth);
      expect(r.PercentAllocation, o.PercentAllocation);
    });
  });

  group('NextOfKinType', () {
    test('values', () { expect(NextOfKinType.Spouse.index, 1); });
  });

  group('Registration enums', () {
    test('marital_Status', () { expect(marital_Status.Single.index, 1); });
    test('recruited_by_Type', () { expect(recruited_by_Type.Staff.index, 2); });
  });
}
