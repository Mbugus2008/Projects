import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/members/entries.dart';

void main() {
  group('entries', () {
    test('fromMap parses basic fields', () {
      final map = {'Key': 'ek1', 'Entry_No': 101, 'Amount': 5000.0, 'Transaction_Type': 8, 'Credit': 5000.0, 'Debit': 0.0};
      final e = entries.fromMap(map);
      expect(e.Key, 'ek1');
      expect(e.Transaction_Type, TransactionType.Deposit_Contribution);
    });
    test('fromMap parses Posting_Date from string', () {
      expect(entries.fromMap({'Posting_Date': '2024-06-15T10:30:00.000'}).Posting_Date, DateTime(2024, 6, 15, 10, 30));
    });
    test('fromMap Posting_Date with int 0 throws TypeError (tryParse expects String)', () {
      expect(() => entries.fromMap({'Posting_Date': 0}), throwsA(isA<TypeError>()));
    });
    test('fromMap handles all nulls', () {
      final e = entries.fromMap({});
      expect(e.Key, isNull);
      expect(e.Transaction_Type, isNull);
    });
    test('fromMap handles TransactionType indices', () {
      expect(entries.fromMap({'Transaction_Type': 0}).Transaction_Type, TransactionType.values[0]);
      expect(entries.fromMap({'Transaction_Type': 2}).Transaction_Type, TransactionType.Loan);
      expect(entries.fromMap({'Transaction_Type': 35}).Transaction_Type, TransactionType.Sms_Savings);
    });
    test('toMap serializes Posting_Date as ISO string', () {
      final d = DateTime(2024, 6, 15, 10, 30);
      expect(entries(Posting_Date: d).toMap()['Posting_Date'], d.toIso8601String());
    });
    test('toJson/fromJson round-trip non-date', () {
      final o = entries(Key: 'ek1', Entry_No: 5, Amount: 2500.0, Transaction_Type: TransactionType.Repayment, Credit: 2500.0, Debit: 0.0);
      final r = entries.fromJson(o.toJson());
      expect(r.Key, o.Key);
      expect(r.Transaction_Type, o.Transaction_Type);
    });
    test('Posting_Date IS round-tripped', () {
      final date = DateTime(2024, 1, 1);
      final restored = entries.fromJson(entries(Posting_Date: date).toJson());
      expect(restored.Posting_Date, date);
    });
  });

  group('calculateRunningBalance', () {
    DateTime d(int days) => DateTime(2024, 1, 1).add(Duration(days: days));
    test('null returns null', () { expect(entries().calculateRunningBalance(null), isNull); });
    test('credit-only', () {
      final r = entries().calculateRunningBalance([entries(Posting_Date: d(0), Credit: 1000.0, Debit: 0.0), entries(Posting_Date: d(1), Credit: 500.0, Debit: 0.0)]);
      expect(r![0].Balance, 1000.0);
      expect(r[1].Balance, 1500.0);
    });
    test('debit-only', () {
      final r = entries().calculateRunningBalance([entries(Posting_Date: d(0), Debit: 200.0), entries(Posting_Date: d(1), Debit: 300.0)]);
      expect(r![0].Balance, -200.0);
      expect(r[1].Balance, -500.0);
    });
    test('mixed', () {
      final r = entries().calculateRunningBalance([entries(Posting_Date: d(0), Credit: 5000.0), entries(Posting_Date: d(1), Debit: 1500.0), entries(Posting_Date: d(2), Credit: 2000.0)]);
      expect(r![2].Balance, 5500.0);
    });
    test('sorts by date', () {
      final list = [entries(Posting_Date: d(2), Credit: 300.0), entries(Posting_Date: d(0), Credit: 100.0), entries(Posting_Date: d(1), Credit: 200.0)];
      final r = entries().calculateRunningBalance(list)!;
      expect(r[0].Posting_Date, d(0));
      expect(r[2].Balance, 600.0);
    });
    test('null date sorted first', () {
      final list = [entries(Posting_Date: d(1), Credit: 500.0), entries(Posting_Date: null, Credit: 100.0)];
      expect(entries().calculateRunningBalance(list)![0].Posting_Date, isNull);
    });
    test('empty list', () { expect(entries().calculateRunningBalance([])!, isEmpty); });
    test('single entry', () {
      expect(entries().calculateRunningBalance([entries(Posting_Date: d(0), Credit: 500.0)])![0].Balance, 500.0);
    });
    test('null Credit/Debit = zero', () {
      final r = entries().calculateRunningBalance([entries(Posting_Date: d(0)), entries(Posting_Date: d(1), Credit: 100.0)])!;
      expect(r[0].Balance, 0.0);
    });
    test('modifies original Balance', () {
      final list = [entries(Posting_Date: d(0), Credit: 1000.0, Balance: null)];
      entries().calculateRunningBalance(list);
      expect(list[0].Balance, 1000.0);
    });
  });

  group('TransactionType extension', () {
    test('descriptions', () {
      expect(TransactionType.Deposit_Contribution.description, 'Deposit Contribution');
      expect(TransactionType.Loan.description, 'Loan');
      expect(TransactionType.values[0].description, '');
    });
  });

  group('entries_Results', () {
    test('fromMap parses list', () {
      final r = entries_Results.fromMap({'Code': 0, 'Contents': [{'Key': 'e1'}, {'Key': 'e2'}]});
      expect(r.Contents!.length, 2);
    });
    test('null Contents', () { expect(entries_Results.fromMap({'Code': 1}).Contents, isNull); });
    test('toJson/fromJson round-trip', () {
      expect(entries_Results.fromJson(entries_Results(Code: 0, Contents: [entries(Key: 'e1', Credit: 500.0, Debit: 0.0)]).toJson()).Contents![0].Key, 'e1');
    });
  });
}
