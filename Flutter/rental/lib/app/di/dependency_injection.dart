import 'package:get/get.dart';

import '../data/api_service.dart';
import '../data/auth_service.dart';
import '../data/http_client.dart';
import '../data/repositories/document_repository.dart';
import '../data/repositories/lease_repository.dart';
import '../data/repositories/maintenance_repository.dart';
import '../data/repositories/property_repository.dart';
import '../data/repositories/report_repository.dart';
import '../data/repositories/tenant_repository.dart';
import '../data/repositories/transaction_repository.dart';

class DependencyInjection {
  static Future<void> init() async {
    // Initialize auth service first
    final authService = await Get.putAsync(() => AuthService().init());

    // Backward-compatible ApiService (used by existing module code)
    Get.put<ApiService>(ApiService(authToken: authService.token.value), permanent: true);

    // Initialize HTTP client with auth token
    final httpClient = HttpClient(authToken: authService.token.value);
    Get.put<HttpClient>(httpClient, permanent: true);

    // Register repositories
    Get.put<PropertyRepository>(
      PropertyRepository(httpClient),
      permanent: true,
    );
    Get.put<TenantRepository>(TenantRepository(httpClient), permanent: true);
    Get.put<LeaseRepository>(LeaseRepository(httpClient), permanent: true);
    Get.put<TransactionRepository>(
      TransactionRepository(httpClient),
      permanent: true,
    );
    Get.put<MaintenanceRepository>(
      MaintenanceRepository(httpClient),
      permanent: true,
    );
    Get.put<DocumentRepository>(
      DocumentRepository(httpClient),
      permanent: true,
    );
    Get.put<ReportRepository>(ReportRepository(httpClient), permanent: true);
  }
}
