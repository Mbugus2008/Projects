import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/common/enums.dart';
import 'package:s_mobile/members/accounts_data.dart';
import 'package:s_mobile/members/member.dart' hide blocked, status;

void main() {
  group('Account', () {
    test('fromMap basic', () {
      final a = Account.fromMap({'Key': 'ak1', 'No': 'DEPOSITS', 'Balance': 15000.5});
      expect(a.Key, 'ak1');
      expect(a.No, 'DEPOSITS');
      expect(a.Balance, 15000.5);
    });
    test('fromMap enums', () {
      expect(Account.fromMap({'Blocked': 0}).Blocked, blocked.values[0]);
      expect(Account.fromMap({'Blocked': 1}).Blocked, blocked.Credit);
      expect(Account.fromMap({'Status': 1}).Status, status.New);
      expect(Account.fromMap({'Status': 2}).Status, status.Active);
      expect(Account.fromMap({'Product_Category': 1}).Product_Category, product_Category.Share_Capital);
    });
    test('fromMap nulls', () {
      final a = Account.fromMap({});
      expect(a.Key, isNull);
      expect(a.Blocked, isNull);
    });
    test('toMap enums as indices', () {
      final m = Account(Blocked: blocked.All, Status: status.Active).toMap();
      expect(m['Blocked'], blocked.All.index);
      expect(m['Status'], status.Active.index);
    });
    test('toJson/fromJson round-trip', () {
      final o = Account(Key: 'ak1', No: 'DEPOSITS', Balance: 10000.0, Blocked: blocked.Credit, Status: status.Active, Product_Category: product_Category.Savings);
      final r = Account.fromJson(o.toJson());
      expect(r.Key, o.Key);
      expect(r.Blocked, o.Blocked);
      expect(r.Status, o.Status);
    });
    test('Balance zero and negative', () {
      expect(Account.fromMap({'Balance': 0.0}).Balance, 0.0);
      expect(Account.fromMap({'Balance': -5000.0}).Balance, -5000.0);
    });
  });

  group('Account.transTypes', () {
    test('DEPOSITS', () { expect(Account(No: 'DEPOSITS').transTypes, [TransactionType.Deposit_Contribution]); });
    test('SHARES', () { expect(Account(No: 'SHARES').transTypes, [TransactionType.Shares_Capital]); });
    test('LOANS', () { expect(Account(No: 'LOANS').transTypes, [TransactionType.Loan, TransactionType.Repayment, TransactionType.Interest_Due, TransactionType.Interest_Paid]); });
    test('unknown', () { expect(Account(No: 'UNKNOWN').transTypes, isEmpty); });
    test('null No', () { expect(Account(No: null).transTypes, isEmpty); });
  });

  group('account_Results', () {
    test('fromMap', () {
      expect(account_Results.fromMap({'Code': 0, 'Contents': [{'Key': 'a1'}, {'Key': 'a2'}]}).Contents!.length, 2);
    });
    test('round-trip', () {
      expect(account_Results.fromJson(account_Results(Code: 0, Contents: [Account(Key: 'a1', No: 'DEPOSITS')]).toJson()).Contents![0].Key, 'a1');
    });
  });

  group('member_Results', () {
    test('fromMap', () {
      final r = member_Results.fromMap({'Code': 0, 'Contents': {'Key': 'mk1', 'No': 'M001', 'Name': 'John', 'Status': 2}});
      expect(r.Contents!.Key, 'mk1');
    });
    test('round-trip', () {
      expect(member_Results.fromJson(member_Results(Code: 0, Contents: Member(Key: 'm1')).toJson()).Contents!.Key, 'm1');
    });
  });
}
