import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rental/app/data/api_service.dart';
import 'package:rental/app/data/auth_service.dart';
import 'package:rental/app/middleware/api_middleware.dart';
import 'package:rental/app/modules/auth/controllers/auth_controller.dart';
import 'package:rental/app/modules/auth/views/login_view.dart';
import 'package:rental/app/modules/leases/controllers/leases_controller.dart';
import 'package:rental/app/modules/leases/views/leases_view.dart';
import 'package:rental/app/routes/app_pages.dart';
import 'package:rental/app/theme/app_theme.dart';

import 'fakes.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('App theme', () {
    test('light theme is light and uses Material 3', () {
      final theme = AppTheme.lightTheme;
      expect(theme.brightness, Brightness.light);
      expect(theme.useMaterial3, isTrue);
    });

    test('dark theme is dark', () {
      expect(AppTheme.darkTheme.brightness, Brightness.dark);
    });

    test('brand colors are defined', () {
      expect(AppColors.primary, const Color(0xFF2563EB));
      expect(AppColors.danger, const Color(0xFFDC2626));
      expect(AppColors.success, const Color(0xFF16A34A));
    });
  });

  group('Routing table', () {
    setUp(() => Get.put<AuthService>(FakeAuthService()));

    test('all route names are unique and slash-prefixed', () {
      final names = AppPages.routes.map((page) => page.name).toList();
      for (final name in names) {
        expect(name, startsWith('/'), reason: 'route $name');
      }
      expect(names.toSet().length, names.length, reason: 'duplicate routes');
    });

    test('every page builder returns a widget', () {
      for (final page in AppPages.routes) {
        expect(page.page(), isA<Widget>(), reason: page.name);
      }
    });
  });

  group('ApiMiddleware', () {
    test('redirects protected routes to login when unauthenticated', () {
      Get.put<AuthService>(FakeAuthService());
      final middleware = ApiMiddleware();

      final redirect = middleware.redirect('/dashboard');
      expect(redirect?.name, '/login');
    });

    test('allows protected routes when authenticated', () {
      final auth = FakeAuthService();
      auth.isAuthenticated.value = true;
      Get.put<AuthService>(auth);
      final middleware = ApiMiddleware();

      expect(middleware.redirect('/dashboard'), isNull);
    });

    test('always allows public auth routes', () {
      Get.put<AuthService>(FakeAuthService());
      final middleware = ApiMiddleware();

      expect(middleware.redirect('/login'), isNull);
      expect(middleware.redirect('/register'), isNull);
      expect(middleware.redirect('/splash'), isNull);
    });
  });

  group('Login flow', () {
    testWidgets('signs in and navigates to the dashboard', (tester) async {
      final auth = FakeAuthService();
      Get.put<AuthService>(auth);
      Get.put(AuthController());

      await tester.pumpWidget(
        GetMaterialApp(
          getPages: [
            GetPage(name: '/login', page: () => const LoginView()),
            GetPage(
              name: '/dashboard',
              page: () =>
                  const Scaffold(body: Center(child: Text('DASHBOARD_OK'))),
            ),
          ],
          initialRoute: '/login',
        ),
      );

      expect(find.text('Welcome back'), findsOneWidget);

      await tester.enterText(
        find.byType(TextField).at(0),
        '  admin@rental.local  ',
      );
      await tester.enterText(find.byType(TextField).at(1), '  Admin123!  ');

      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Padded input must be trimmed before reaching the service.
      expect(auth.lastLoginEmail, 'admin@rental.local');
      expect(auth.lastLoginPassword, 'Admin123!');
      expect(find.text('DASHBOARD_OK'), findsOneWidget);
    });
  });

  group('Leases screen', () {
    testWidgets('shows calendar dates instead of raw API timestamps',
        (tester) async {
      final api = FakeApiService();
      api.store['leases']!.add({
        'id': 1,
        'tenant': 'Wanjiru Kamau',
        'startDate': '2026-08-10T00:00:00',
        'endDate': '2027-08-10T00:00:00',
        'monthlyRent': 75000.0,
        'securityDeposit': 75000.0,
        'status': 'Active',
      });
      Get.put<ApiService>(api);
      Get.put(LeasesController());

      await tester.pumpWidget(GetMaterialApp(home: const LeasesView()));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Regression: the card used to render the raw API value
      // `2026-08-10T00:00:00`, which then ellipsised mid-string.
      expect(find.text('10 Aug 2026'), findsOneWidget);
      expect(find.text('10 Aug 2027'), findsOneWidget);
      expect(find.textContaining('T00:00:00'), findsNothing);
    });
  });
}

