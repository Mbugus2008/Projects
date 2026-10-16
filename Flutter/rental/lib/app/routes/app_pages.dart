import 'package:get/get.dart';

import '../middleware/api_middleware.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/balances/bindings/balances_binding.dart';
import '../modules/balances/views/balances_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/documents/bindings/documents_binding.dart';
import '../modules/documents/views/documents_view.dart';
import '../modules/finances/bindings/finances_binding.dart';
import '../modules/finances/views/finances_view.dart';
import '../modules/invoices/bindings/invoices_binding.dart';
import '../modules/invoices/views/invoices_view.dart';
import '../modules/leases/bindings/leases_binding.dart';
import '../modules/leases/views/leases_view.dart';
import '../modules/maintenance/bindings/maintenance_binding.dart';
import '../modules/maintenance/views/maintenance_view.dart';
import '../modules/properties/bindings/properties_binding.dart';
import '../modules/properties/views/properties_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tenants/bindings/tenants_binding.dart';
import '../modules/tenants/views/tenants_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    // Public routes (no middleware)
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),

    // Protected routes (with auth middleware)
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.properties,
      page: () => const PropertiesView(),
      binding: PropertiesBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.tenants,
      page: () => const TenantsView(),
      binding: TenantsBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.leases,
      page: () => const LeasesView(),
      binding: LeasesBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.finances,
      page: () => const FinancesView(),
      binding: FinancesBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.maintenance,
      page: () => const MaintenanceView(),
      binding: MaintenanceBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.documents,
      page: () => const DocumentsView(),
      binding: DocumentsBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.reports,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.balances,
      page: () => const BalancesView(),
      binding: BalancesBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.invoices,
      page: () => const InvoicesView(),
      binding: InvoicesBinding(),
      middlewares: [ApiMiddleware()],
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
      middlewares: [ApiMiddleware()],
    ),
  ];
}
