import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_mobile/main.dart';

void main() {
  testWidgets('App renders login screen without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
