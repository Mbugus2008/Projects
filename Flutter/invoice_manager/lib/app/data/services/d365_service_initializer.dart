import 'package:get/get.dart';
import 'd365_auth_service.dart';
import 'd365_api_service.dart';
import 'd365_customer_service.dart';

class D365ServiceInitializer {
  static bool _initialized = false;

  /// Initialize all Dynamics 365 services
  static Future<void> initialize() async {
    if (_initialized) return;

    // Register services in dependency injection
    Get.put<D365AuthService>(D365AuthService(), permanent: true);
    Get.put<D365ApiService>(D365ApiService(), permanent: true);
    Get.put<D365CustomerService>(D365CustomerService(), permanent: true);

    _initialized = true;
  }

  /// Configure Dynamics 365 connection
  static void configure({
    required String organizationUrl,
    required String clientId,
    required String tenantId,
    String? redirectUri,
  }) {
    final authService = D365AuthService.to;
    
    authService.configure(
      organizationUrl: organizationUrl,
      clientId: clientId,
      tenantId: tenantId,
      redirectUri: redirectUri ?? 'com.invoiceapp.invoicemanager://auth',
    );
  }

  /// Quick setup for common configurations
  static void configureForTesting({
    required String organizationUrl,
    required String clientId,
    required String tenantId,
  }) {
    configure(
      organizationUrl: organizationUrl,
      clientId: clientId,
      tenantId: tenantId,
      redirectUri: 'com.invoiceapp.invoicemanager://auth',
    );
  }

  /// Check if services are initialized and configured
  static bool get isReady {
    if (!_initialized) return false;
    
    try {
      final authService = D365AuthService.to;
      return authService.isConfigured;
    } catch (e) {
      return false;
    }
  }

  /// Get current configuration status
  static Map<String, dynamic> getStatus() {
    return {
      'initialized': _initialized,
      'configured': isReady,
      'authenticated': _initialized ? D365AuthService.to.isAuthenticated.value : false,
      'organizationUrl': _initialized ? D365AuthService.to.organizationUrl : null,
    };
  }
}

/// Extension to easily access D365 services
extension D365Services on GetInterface {
  D365AuthService get d365Auth => Get.find<D365AuthService>();
  D365ApiService get d365Api => Get.find<D365ApiService>();
  D365CustomerService get d365Customer => Get.find<D365CustomerService>();
}

