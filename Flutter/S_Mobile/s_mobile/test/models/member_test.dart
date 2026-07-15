import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/members/member.dart';
import 'package:s_mobile/members/member_info.dart';
import 'package:s_mobile/Loans/Loan.dart' hide status;
import 'package:s_mobile/Loans/Loan_Type.dart';
import 'package:s_mobile/Loans/Loan.dart' as loan show status;

void main() {
  group('Member', () {
    test('fromMap parses basic fields', () {
      final m = Member.fromMap({'Key': 'k1', 'No': 'M001', 'Name': 'John', 'E_Mail': 'j@e.com', 'ID_No': '123'});
      expect(m.Key, 'k1');
      expect(m.No, 'M001');
      expect(m.Name, 'John');
    });
    test('fromMap parses enums', () {
      final m = Member.fromMap({'Gender': 1, 'Blocked': 0, 'Status': 2});
      expect(m.Gender, gender.Female);
      expect(m.Blocked, blocked.values[0]);
      expect(m.Status, status.Active);
    });
    test('fromMap Date_of_Birth from string', () {
      expect(Member.fromMap({'Date_of_Birth': '1990-05-15T00:00:00.000'}).Date_of_Birth, DateTime(1990, 5, 15));
    });
    test('fromMap Group_Account bool', () {
      expect(Member.fromMap({'Group_Account': true}).Group_Account, true);
    });
    test('fromMap nested Member_info', () {
      final mi = Member.fromMap({'Member_info': {'Key': 'ik1', 'Logged_In': true, 'First_Pin': '1234'}}).Member_info!;
      expect(mi.Key, 'ik1');
      expect(mi.Logged_In, true);
    });
    test('fromMap nested Loans', () {
      final loans = Member.fromMap({'Loans': [{'Key': 'lk1', 'Loan_No': 'L001', 'Status': 0}, {'Key': 'lk2'}]}).Loans!;
      expect(loans, hasLength(2));
      expect(loans[0].Status, loan.status.Open);
    });
    test('fromMap nested Accounts', () {
      final accs = Member.fromMap({'Accounts': [{'Key': 'ak1', 'No': 'SAV001'}, {'Key': 'ak2', 'No': 'LOANS'}]}).Accounts!;
      expect(accs, hasLength(2));
      expect(accs[1].No, 'LOANS');
    });
    test('fromMap all nulls', () {
      final m = Member.fromMap({});
      expect(m.Key, isNull);
      expect(m.Gender, isNull);
      expect(m.Loans, isNull);
    });
    test('toMap basic fields', () {
      final m = Member(Key: 'k1', No: 'M001', Name: 'Jane', Group_Account: false).toMap();
      expect(m['Key'], 'k1');
      expect(m['Name'], 'Jane');
      expect(m['Group_Account'], false);
    });
    test('toMap enums as indices', () {
      final m = Member(Gender: gender.Female, Blocked: blocked.Credit, Status: status.Dormant).toMap();
      expect(m['Gender'], gender.Female.index);
      expect(m['Blocked'], blocked.Credit.index);
    });
    test('toMap Date_of_Birth as ISO string', () {
      final d = DateTime(1995, 3, 20);
      expect(Member(Date_of_Birth: d).toMap()['Date_of_Birth'], d.toIso8601String());
    });
    test('toMap handles nulls', () {
      final m = Member().toMap();
      expect(m['Gender'], isNull);
      expect(m['Loans'], isNull);
    });
    test('toJson/fromJson round-trip', () {
      final o = Member(Key: 'k99', No: 'M099', Name: 'Test', Group_Account: true, Gender: gender.Male, Status: status.Active);
      final r = Member.fromJson(o.toJson());
      expect(r.Key, o.Key);
      expect(r.Gender, o.Gender);
      expect(r.Status, o.Status);
    });
    test('Date_of_Birth IS round-tripped', () {
      final date = DateTime(1990, 1, 1);
      expect(Member.fromJson(Member(Date_of_Birth: date).toJson()).Date_of_Birth, date);
    });
  });

  group('member_info', () {
    test('fromMap', () { expect(member_info.fromMap({'Key': 'k1', 'Logged_In': true, 'First_Pin': '5678'}).First_Pin, '5678'); });
    test('default First_Pin', () { expect(member_info.fromMap({}).First_Pin, ''); });
    test('round-trip', () {
      final o = member_info(Key: 'k1', Logged_In: true, Pin_Changed: false, First_Pin: '0000');
      expect(member_info.fromJson(o.toJson()).First_Pin, '0000');
    });
  });

  group('Member enums', () {
    test('gender', () { expect(gender.Male.index, 0); });
    test('blocked', () { expect(blocked.Credit.index, 1); expect(blocked.All.index, 3); });
    test('status', () { expect(status.Active.index, 2); expect(status.Closed.index, 9); });
    test('loan status', () { expect(loan.status.Open.index, 0); });
  });
}
