import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/properties/bindings/properties_binding.dart';
import '../modules/properties/views/properties_view.dart';
import '../modules/tenants/bindings/tenants_binding.dart';
import '../modules/tenants/views/tenants_view.dart';
import '../modules/leases/bindings/leases_binding.dart';
import '../modules/leases/views/leases_view.dart';
import '../modules/finances/bindings/finances_binding.dart';
import '../modules/finances/views/finances_view.dart';
import '../modules/maintenance/bindings/maintenance_binding.dart';
import '../modules/maintenance/views/maintenance_view.dart';
import '../modules/documents/bindings/documents_binding.dart';
import '../modules/documents/views/documents_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const DASHBOARD = '/dashboard';
  static const PROPERTIES = '/properties';
  static const TENANTS = '/tenants';
  static const LEASES = '/leases';
  static const FINANCES = '/finances';
  static const MAINTENANCE = '/maintenance';
  static const DOCUMENTS = '/documents';
  static const REPORTS = '/reports';
}

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.PROPERTIES,
      page: () => const PropertiesView(),
      binding: PropertiesBinding(),
    ),
    GetPage(
      name: Routes.TENANTS,
      page: () => const TenantsView(),
      binding: TenantsBinding(),
    ),
    GetPage(
      name: Routes.LEASES,
      page: () => const LeasesView(),
      binding: LeasesBinding(),
    ),
    GetPage(
      name: Routes.FINANCES,
      page: () => const FinancesView(),
      binding: FinancesBinding(),
    ),
    GetPage(
      name: Routes.MAINTENANCE,
      page: () => const MaintenanceView(),
      binding: MaintenanceBinding(),
    ),
    GetPage(
      name: Routes.DOCUMENTS,
      page: () => const DocumentsView(),
      binding: DocumentsBinding(),
    ),
    GetPage(
      name: Routes.REPORTS,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
    ),
  ];
}
