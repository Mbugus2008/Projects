import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rental/app/data/auth_service.dart';
import 'package:rental/app/middleware/api_middleware.dart';
import 'package:rental/app/modules/auth/controllers/auth_controller.dart';
import 'package:rental/app/modules/auth/views/login_view.dart';
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
        'admin@rental.local',
      );
      await tester.enterText(find.byType(TextField).at(1), 'Admin123!');

      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      expect(auth.lastLoginEmail, 'admin@rental.local');
      expect(find.text('DASHBOARD_OK'), findsOneWidget);
    });
  });
}

