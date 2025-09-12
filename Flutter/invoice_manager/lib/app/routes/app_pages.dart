import 'package:get/get.dart';
import 'app_routes.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/customers/customers_binding.dart';
import '../modules/customers/customers_view.dart';
import '../modules/customers/customer_details_view.dart';
import '../modules/customers/add_customer_view.dart';
import '../modules/customers/edit_customer_view.dart';
import '../modules/invoices/invoices_binding.dart';
import '../modules/invoices/invoices_view.dart';
import '../modules/invoices/invoice_details_view.dart';
import '../modules/invoices/create_invoice_view.dart';
import '../modules/invoices/edit_invoice_view.dart';
import '../modules/payments/payments_binding.dart';
import '../modules/payments/payments_view.dart';
import '../modules/payments/payment_details_view.dart';
import '../modules/payments/record_payment_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';

class AppPages {
  static const String initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.customers,
      page: () => const CustomersView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: AppRoutes.customerDetails,
      page: () => const CustomerDetailsView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: AppRoutes.addCustomer,
      page: () => const AddCustomerView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: AppRoutes.editCustomer,
      page: () => const EditCustomerView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: AppRoutes.invoices,
      page: () => const InvoicesView(),
      binding: InvoicesBinding(),
    ),
    GetPage(
      name: AppRoutes.invoiceDetails,
      page: () => const InvoiceDetailsView(),
      binding: InvoicesBinding(),
    ),
    GetPage(
      name: AppRoutes.createInvoice,
      page: () => const CreateInvoiceView(),
      binding: InvoicesBinding(),
    ),
    GetPage(
      name: AppRoutes.editInvoice,
      page: () => const EditInvoiceView(),
      binding: InvoicesBinding(),
    ),
    GetPage(
      name: AppRoutes.payments,
      page: () => const PaymentsView(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: AppRoutes.paymentDetails,
      page: () => const PaymentDetailsView(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: AppRoutes.recordPayment,
      page: () => const RecordPaymentView(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}

