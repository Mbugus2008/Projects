import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/members/targetAccount.dart';

void main() {
  group('targetAccount', () {
    test('fromMap parses all fields', () {
      final ta = targetAccount.fromMap({'AccountNo': 'TA001', 'Description': 'Target savings', 'PrincipleAmount': '100000', 'AccountPeriod': '12', 'TargetAccount': 'SAV001', 'LockAccount': 'No', 'ApplicationDate': '2024-01-15', 'Status': 'Active', 'Interest': '5.5', 'Balance': '50000'});
      expect(ta.AccountNo, 'TA001');
      expect(ta.Description, 'Target savings');
      expect(ta.PrincipleAmount, '100000');
      expect(ta.AccountPeriod, '12');
      expect(ta.TargetAccount, 'SAV001');
      expect(ta.LockAccount, 'No');
      expect(ta.ApplicationDate, '2024-01-15');
      expect(ta.Status, 'Active');
      expect(ta.Interest, '5.5');
      expect(ta.Balance, '50000');
    });
    test('fromMap handles all nulls', () {
      final ta = targetAccount.fromMap({});
      expect(ta.AccountNo, isNull);
      expect(ta.Description, isNull);
      expect(ta.PrincipleAmount, isNull);
    });
    test('toMap serializes all fields', () {
      final ta = targetAccount(AccountNo: 'TA001', Description: 'Test', PrincipleAmount: '50000', AccountPeriod: '6', TargetAccount: 'SAV001', LockAccount: 'Yes', ApplicationDate: '2024-06-01', Status: 'Active', Interest: '3.0', Balance: '25000');
      final m = ta.toMap();
      expect(m['AccountNo'], 'TA001');
      expect(m['Description'], 'Test');
      expect(m['Balance'], '25000');
    });
    test('toMap handles null fields', () {
      final m = targetAccount().toMap();
      expect(m['AccountNo'], isNull);
    });
    test('toJson and fromJson round-trip', () {
      final o = targetAccount(AccountNo: 'TA001', Description: 'Test', PrincipleAmount: '100000', AccountPeriod: '12', TargetAccount: 'SAV001', LockAccount: 'No', ApplicationDate: '2024-01-01', Status: 'Pending', Interest: '4.5', Balance: '0');
      final r = targetAccount.fromJson(o.toJson());
      expect(r.AccountNo, o.AccountNo);
      expect(r.Description, o.Description);
      expect(r.PrincipleAmount, o.PrincipleAmount);
      expect(r.Balance, o.Balance);
    });
    test('round-trip with empty strings', () {
      final o = targetAccount(AccountNo: '', Description: '', Balance: '0');
      final r = targetAccount.fromJson(o.toJson());
      expect(r.AccountNo, '');
      expect(r.Balance, '0');
    });
  });
}
