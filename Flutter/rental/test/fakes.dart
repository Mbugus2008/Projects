import 'package:rental/app/data/api_service.dart';
import 'package:rental/app/data/auth_service.dart';

/// In-memory stand-in for [ApiService] used by controller tests.
class FakeApiService extends ApiService {
  FakeApiService() : super(authToken: 'test-token');

  final Map<String, List<Map<String, dynamic>>> store = {
    'properties': [],
    'tenants': [],
    'leases': [],
    'transactions': [],
    'maintenance': [],
    'documents': [],
    'invoices': [],
  };

  bool addResult = true;
  bool updateResult = true;
  bool deleteResult = true;

  int addCalls = 0;
  int updateCalls = 0;
  int deleteCalls = 0;
  int? lastId;
  Map<String, dynamic>? lastPayload;
  Map<String, dynamic>? lastUpdatePayload;

  int _nextId(String key) => store[key]!.length + 1;

  Map<String, dynamic> settingsData = {
    'waterRatePerUnit': 150.0,
    'garbageFee': 500.0,
  };

  @override
  Future<List<Map<String, dynamic>>> getProperties() async =>
      List.of(store['properties']!);

  @override
  Future<bool> addProperty(Map<String, dynamic> data) async {
    addCalls++;
    lastPayload = data;
    if (addResult) {
      store['properties']!.add({...data, 'id': _nextId('properties')});
    }
    return addResult;
  }

  @override
  Future<bool> updateProperty(int id, Map<String, dynamic> data) async {
    updateCalls++;
    lastId = id;
    lastPayload = data;
    return updateResult;
  }

  @override
  Future<bool> deleteProperty(int id) async {
    deleteCalls++;
    lastId = id;
    if (deleteResult) store['properties']!.removeWhere((p) => p['id'] == id);
    return deleteResult;
  }

  @override
  Future<List<Map<String, dynamic>>> getTenants() async =>
      List.of(store['tenants']!);

  @override
  Future<bool> addTenant(Map<String, dynamic> data) async {
    addCalls++;
    lastPayload = data;
    if (addResult) store['tenants']!.add({...data, 'id': _nextId('tenants')});
    return addResult;
  }

  @override
  Future<bool> updateTenant(int id, Map<String, dynamic> data) async {
    updateCalls++;
    lastId = id;
    lastPayload = data;
    return updateResult;
  }

  @override
  Future<bool> deleteTenant(int id) async {
    deleteCalls++;
    lastId = id;
    return deleteResult;
  }

  @override
  Future<List<Map<String, dynamic>>> getLeases() async =>
      List.of(store['leases']!);

  @override
  Future<bool> addLease(Map<String, dynamic> data) async {
    addCalls++;
    lastPayload = data;
    return addResult;
  }

  @override
  Future<bool> updateLease(int id, Map<String, dynamic> data) async {
    updateCalls++;
    lastId = id;
    lastPayload = data;
    return updateResult;
  }

  @override
  Future<bool> deleteLease(int id) async {
    deleteCalls++;
    lastId = id;
    return deleteResult;
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactions() async =>
      List.of(store['transactions']!);

  @override
  Future<bool> addTransaction(Map<String, dynamic> data) async {
    addCalls++;
    lastPayload = data;
    return addResult;
  }

  @override
  Future<bool> updateTransaction(int id, Map<String, dynamic> data) async {
    updateCalls++;
    lastId = id;
    lastPayload = data;
    return updateResult;
  }

  @override
  Future<bool> deleteTransaction(int id) async {
    deleteCalls++;
    lastId = id;
    return deleteResult;
  }

  @override
  Future<List<Map<String, dynamic>>> getMaintenanceRequests() async =>
      List.of(store['maintenance']!);

  @override
  Future<List<Map<String, dynamic>>> getDocuments() async =>
      List.of(store['documents']!);

  @override
  Future<List<Map<String, dynamic>>> getInvoices() async =>
      List.of(store['invoices']!);

  @override
  Future<bool> addInvoice(Map<String, dynamic> data) async {
    addCalls++;
    lastPayload = data;
    if (addResult) {
      store['invoices']!.add({
        ...data,
        'id': _nextId('invoices'),
        'invoiceNumber': 'INV-TEST-${_nextId('invoices')}',
        'amountPaid': 0.0,
      });
    }
    return addResult;
  }

  @override
  Future<bool> updateInvoice(int id, Map<String, dynamic> data) async {
    updateCalls++;
    lastId = id;
    lastPayload = data;
    lastUpdatePayload = data;
    return updateResult;
  }

  @override
  Future<bool> deleteInvoice(int id) async {
    deleteCalls++;
    lastId = id;
    if (deleteResult) {
      store['invoices']!.removeWhere((invoice) => invoice['id'] == id);
    }
    return deleteResult;
  }

  @override
  Future<Map<String, dynamic>> getSettings() async => Map.of(settingsData);

  @override
  Future<bool> updateSettings(Map<String, dynamic> data) async {
    updateCalls++;
    lastPayload = data;
    lastUpdatePayload = data;
    if (updateResult) settingsData = {...settingsData, ...data};
    return updateResult;
  }
}

/// Configurable stand-in for [AuthService].
class FakeAuthService extends AuthService {
  bool validateResult = false;
  bool loginResult = true;
  bool registerResult = true;
  String? lastLoginEmail;
  String? lastLoginPassword;
  Map<String, dynamic>? lastRegisterPayload;
  int logoutCalls = 0;

  @override
  Future<bool> validateToken() async => validateResult;

  @override
  Future<bool> loginWithJWT(String email, String password) async {
    lastLoginEmail = email;
    lastLoginPassword = password;
    if (loginResult) {
      token.value = 'fake-token';
      isAuthenticated.value = true;
    }
    return loginResult;
  }

  @override
  Future<bool> register(Map<String, dynamic> userData) async {
    lastRegisterPayload = userData;
    return registerResult;
  }

  @override
  Future<void> logout() async {
    logoutCalls++;
    token.value = '';
    isAuthenticated.value = false;
    currentUser.clear();
  }
}
