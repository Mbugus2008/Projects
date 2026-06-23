import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/Loans/Loan.dart';
import 'package:s_mobile/Loans/Loan_Type.dart';
import 'package:s_mobile/Loans/Schedule.dart';
import 'package:s_mobile/Loans/Loan_data.dart';

void main() {
  group('Loan', () {
    test('fromMap basic', () {
      final l = Loan.fromMap({'Key': 'lk1', 'Loan_No': 'L001', 'Outstanding_Balance': 50000.0, 'Posted': true});
      expect(l.Key, 'lk1');
      expect(l.Outstanding_Balance, 50000.0);
      expect(l.Posted, true);
    });
    test('fromMap dates from string', () {
      expect(Loan.fromMap({'Application_Date': '2024-01-15T00:00:00.000'}).Application_Date, DateTime(2024, 1, 15));
    });
    test('fromMap Status enum', () {
      expect(Loan.fromMap({'Status': 0}).Status, status.Open);
      expect(Loan.fromMap({'Status': 5}).Status, status.Posted);
    });
    test('fromMap Loans_Category_SASRA', () {
      expect(Loan.fromMap({'Loans_Category_SASRA': 0}).Loans_Category_SASRA, loans_Category_SASRA.Perfoming);
      expect(Loan.fromMap({'Loans_Category_SASRA': 5}).Loans_Category_SASRA, loans_Category_SASRA.Closed_Account);
    });
    test('toMap dates as ISO string', () {
      final d = DateTime(2024, 1, 15);
      expect(Loan(Application_Date: d).toMap()['Application_Date'], d.toIso8601String());
    });
    test('toMap enums as indices', () {
      final m = Loan(Status: status.Approved).toMap();
      expect(m['Status'], status.Approved.index);
    });
    test('toJson/fromJson round-trip', () {
      final o = Loan(Key: 'lk1', Loan_No: 'L001', Outstanding_Balance: 25000.0, Status: status.Open, Posted: true);
      final r = Loan.fromJson(o.toJson());
      expect(r.Key, o.Key);
      expect(r.Status, o.Status);
    });
    test('Application_Date IS round-tripped', () {
      final d = DateTime(2024, 3, 15);
      expect(Loan.fromJson(Loan(Application_Date: d).toJson()).Application_Date, d);
    });
  });

  group('Loan_Type', () {
    test('fromMap', () {
      final lt = Loan_Type.fromMap({'Code': 'PERS', 'Eligible_Amount': 200000.0});
      expect(lt.Code, 'PERS');
      expect(lt.Eligible_Amount, 200000.0);
    });
    test('fromMap nulls', () { expect(Loan_Type.fromMap({}).Code, isNull); });
    test('round-trip', () {
      final o = Loan_Type(Code: 'PERS', Description: 'Personal', Eligible_Amount: 200000.0);
      expect(Loan_Type.fromJson(o.toJson()).Eligible_Amount, o.Eligible_Amount);
    });
  });

  group('Schedule', () {
    test('fromMap basic', () {
      final s = Schedule.fromMap({'Key': 'sk1', 'Loan_Amount': 100000.0, 'Paid': false, 'Posted': true, 'Instalment_No': 5});
      expect(s.Key, 'sk1');
      expect(s.Loan_Amount, 100000.0);
      expect(s.Paid, false);
      expect(s.Posted, true);
    });
    test('fromMap dates from msSinceEpoch', () {
      final d = DateTime(2024, 6, 15);
      final s = Schedule.fromMap({'Closed_Date': d.millisecondsSinceEpoch});
      expect(s.Closed_Date, d);
    });
    test('fromMap Repayment_Date from string', () {
      expect(Schedule.fromMap({'Repayment_Date': '2024-05-01T00:00:00.000'}).Repayment_Date, DateTime(2024, 5, 1));
    });
    test('toMap Closed_Date as ms, Repayment_Date as ISO', () {
      final d = DateTime(2024, 6, 15);
      final m = Schedule(Closed_Date: d, Repayment_Date: d).toMap();
      expect(m['Closed_Date'], d.millisecondsSinceEpoch);
      expect(m['Repayment_Date'], d.toIso8601String());
    });
    test('Closed_Date IS round-tripped', () {
      final d = DateTime(2024, 6, 15);
      expect(Schedule.fromJson(Schedule(Closed_Date: d).toJson()).Closed_Date?.millisecondsSinceEpoch, d.millisecondsSinceEpoch);
    });
    test('Repayment_Date IS round-tripped', () {
      final d = DateTime(2024, 5, 1);
      expect(Schedule.fromJson(Schedule(Repayment_Date: d).toJson()).Repayment_Date, d);
    });
  });

  group('loan_Results', () {
    test('fromMap', () {
      expect(loan_Results.fromMap({'Code': 0, 'Contents': [{'Key': 'l1'}, {'Key': 'l2'}]}).Contents!.length, 2);
    });
    test('round-trip', () {
      expect(loan_Results.fromJson(loan_Results(Code: 0, Contents: [Loan(Key: 'l1')]).toJson()).Contents![0].Key, 'l1');
    });
  });
}
