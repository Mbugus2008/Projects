// Basic widget test for the Matatu Investor app.
//
// This test verifies that the main app can be built and displayed correctly.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:matatu/main.dart';
import 'package:matatu/services/auth_service.dart';

void main() {
  testWidgets('App builds without errors', (WidgetTester tester) async {
    // Initialize GetX dependencies before building the app
    Get.testMode = true;
    Get.put(AuthService());

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app loads successfully by checking for login UI elements
    expect(find.text('Matatu Investor'), findsWidgets);

    // Clean up after test
    Get.reset();
  });
}
