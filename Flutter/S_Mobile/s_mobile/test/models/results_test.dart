import 'package:flutter_test/flutter_test.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/members/member.dart';

class StubModel implements Tomaps {
  final String id;
  final int value;
  StubModel({required this.id, required this.value});
  @override
  Map<String, dynamic> toMap() => {'id': id, 'value': value};
  static StubModel fromMap(Map<String, dynamic> map) => StubModel(id: map['id'] as String, value: map['value'] as int);
}

void main() {
  group('Results', () {
    test('fromMap', () { expect(Results.fromMap({'Code': 0, 'Desc': 'Success'}).Code, 0); });
    test('fromMap nulls', () { expect(Results.fromMap({}).Desc, isNull); });
    test('fromMap error code', () { expect(Results.fromMap({'Code': 1}).Code, 1); });
    test('toMap', () { expect(Results(Code: 0, Desc: 'OK').toMap()['Code'], 0); });
    test('toMap nulls', () { expect(Results().toMap()['Code'], isNull); });
    test('toJson/fromJson round-trip', () {
      final o = Results(Code: 0, Desc: 'Test');
      expect(Results.fromJson(o.toJson()).Desc, 'Test');
    });
    test('toJson/fromJson null round-trip', () {
      expect(Results.fromJson(Results().toJson()).Code, isNull);
    });
    test('fromJson error', () {
      expect(Results.fromJson('{"Code": 500, "Desc": "Error"}').Code, 500);
    });
  });

  group('Results2<T>', () {
    test('fromMap with Contents', () {
      final r = Results2.fromMap({'Code': 0, 'Desc': 'OK', 'Contents': {'id': 'abc', 'value': 42}}, StubModel.fromMap);
      expect(r.Contents!.id, 'abc');
    });
    test('fromMap null Contents', () {
      expect(Results2.fromMap({'Code': 0}, StubModel.fromMap).Contents, isNull);
    });
    test('fromMap error code', () {
      expect(Results2.fromMap({'Code': 1}, StubModel.fromMap).Code, 1);
    });
    test('toMap with Contents', () {
      final m = Results2(Code: 0, Desc: 'OK', Contents: StubModel(id: 'test', value: 99)).toMap();
      expect(m['Contents']['id'], 'test');
    });
    test('toMap null Contents (null-safe)', () {
      final m = Results2(Code: 0, Desc: 'OK').toMap();
      expect(m['Code'], 0);
      expect(m['Contents'], isNull);
    });
    test('toJson/fromJson round-trip', () {
      final o = Results2(Code: 0, Contents: StubModel(id: 'r1', value: 100));
      expect(Results2.fromJson(o.toJson(), StubModel.fromMap).Contents!.id, 'r1');
    });
  });

  group('Results3<T>', () {
    test('fromMap with list', () {
      final r = Results3.fromMap({'Code': 0, 'Desc': 'OK', 'Contents': [{'id': 'a', 'value': 1}, {'id': 'b', 'value': 2}]}, StubModel.fromMap);
      expect(r.Contents!.length, 2);
    });
    test('fromMap null Contents', () {
      expect(Results3.fromMap({'Code': 0}, StubModel.fromMap).Contents, isNull);
    });
    test('fromMap empty list', () {
      expect(Results3.fromMap({'Code': 0, 'Contents': []}, StubModel.fromMap).Contents, isEmpty);
    });
    test('toMap with list', () {
      final m = Results3(Code: 0, Contents: [StubModel(id: 'x', value: 10), StubModel(id: 'y', value: 20)]).toMap();
      expect((m['Contents'] as List).length, 2);
    });
    test('toMap null Contents', () {
      expect(Results3(Code: 0).toMap()['Contents'], isNull);
    });
    test('toJson/fromJson round-trip', () {
      final o = Results3(Code: 0, Contents: [StubModel(id: '1', value: 100), StubModel(id: '2', value: 200)]);
      expect(Results3.fromJson(o.toJson(), StubModel.fromMap).Contents![1].value, 200);
    });
  });
}
