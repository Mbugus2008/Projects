import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/transaction/transaction.dart';
import 'package:s_mobile/transaction/enums.dart';

void main() {
  group('Transaction', () {
    test('fromMap basic', () {
      final tx = Transaction.fromMap({'Key': 'tk1', 'Account_No': 'SAV001', 'Amount': 5000.0, 'Posted': true, 'Code': 0});
      expect(tx.Key, 'tk1');
      expect(tx.Amount, 5000.0);
      expect(tx.Code, 0);
    });
    test('fromMap dates from string', () {
      final tx = Transaction.fromMap({'Document_Date': '2024-06-15T10:30:00.000'});
      expect(tx.Document_Date, DateTime(2024, 6, 15, 10, 30));
    });
    test('fromMap enums', () {
      final tx = Transaction.fromMap({'Transaction_Type': 2, 'Status': 2, 'Source': 0, 'Destination': 1, 'Channel': 2, 'Product_Category': 1, 'Transfer_type': 0, 'Bank_Transfer_type': 1});
      expect(tx.Transaction_Type, transaction_Type.Deposit);
      expect(tx.Status, status.Completed);
      expect(tx.Source, source.Fosa);
      expect(tx.Channel, channel.App);
      expect(tx.Product_Category, product_Category.Share_Capital);
      expect(tx.Transfer_type, transfer_type.Self);
      expect(tx.Bank_Transfer_type, bank_Transfer_type.Internal);
    });
    test('fromMap nulls', () {
      final tx = Transaction.fromMap({});
      expect(tx.Key, isNull);
      expect(tx.Transaction_Type, isNull);
    });
    test('toMap dates as ISO string', () {
      final d = DateTime(2024, 6, 15, 10, 30);
      final m = Transaction(Document_Date: d, Transaction_Time: d).toMap();
      expect(m['Document_Date'], d.toIso8601String());
      expect(m['Transaction_Time'], d.toIso8601String());
    });
    test('toMap enums as indices', () {
      final m = Transaction(Transaction_Type: transaction_Type.Deposit, Status: status.Completed, Channel: channel.App).toMap();
      expect(m['Transaction_Type'], transaction_Type.Deposit.index);
      expect(m['Status'], status.Completed.index);
    });
    test('toJson/fromJson round-trip', () {
      final o = Transaction(Key: 'tk1', Account_No: 'SAV001', Amount: 10000.0, Posted: true, Transaction_Type: transaction_Type.Deposit, Status: status.Completed, Channel: channel.App, Dont_Charge: false, Code: 0);
      final r = Transaction.fromJson(o.toJson());
      expect(r.Key, o.Key);
      expect(r.Transaction_Type, o.Transaction_Type);
      expect(r.Status, o.Status);
    });
    test('Document_Date IS round-tripped', () {
      final d = DateTime(2024, 6, 15);
      expect(Transaction.fromJson(Transaction(Document_Date: d).toJson()).Document_Date, d);
    });
  });

  group('Transaction enums', () {
    test('channel', () { expect(channel.App.index, 2); });
    test('transfer_type', () { expect(transfer_type.Other_Member.index, 1); });
    test('bank_Transfer_type', () { expect(bank_Transfer_type.Pesalink.index, 4); });
  });
}
