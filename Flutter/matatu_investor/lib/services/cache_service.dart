import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Cache service for storing and retrieving application data
/// Implements three cache duration strategies: short, medium, and long term
class CacheService {
  static CacheService? _instance;
  SharedPreferences? _prefs;

  // Cache duration constants
  static const Duration _shortCacheDuration = Duration(minutes: 5);
  static const Duration _mediumCacheDuration = Duration(minutes: 15);
  static const Duration _longCacheDuration = Duration(hours: 1);

  CacheService._();

  static Future<CacheService> getInstance() async {
    if (_instance == null) {
      _instance = CacheService._();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Generic cache setter with expiration
  Future<void> setCache(String key, dynamic data, {Duration? duration}) async {
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'duration': (duration ?? _mediumCacheDuration).inMilliseconds,
    };
    await _prefs?.setString(key, jsonEncode(cacheData));
  }

  /// Generic cache getter with expiration check
  T? getCache<T>(String key) {
    final cached = _prefs?.getString(key);
    if (cached == null) return null;

    try {
      final cacheData = jsonDecode(cached);
      final timestamp = cacheData['timestamp'] as int;
      final duration = cacheData['duration'] as int;
      final now = DateTime.now().millisecondsSinceEpoch;

      // Check if cache is expired
      if (now - timestamp > duration) {
        clearCache(key);
        return null;
      }

      return cacheData['data'] as T;
    } catch (e) {
      return null;
    }
  }

  /// Clear specific cache entry
  Future<void> clearCache(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all cache except user session data
  Future<void> clearAllCache() async {
    final keys = _prefs?.getKeys() ?? {};
    for (final key in keys) {
      if (!key.startsWith('user_') && !key.startsWith('flutter.')) {
        await _prefs?.remove(key);
      }
    }
  }

  // Specific cache keys
  static const String memberDataKey = 'member_data';
  static const String vehiclesKey = 'vehicles_data';
  static const String loansKey = 'loans_data';
  static const String statisticsKey = 'statistics_data';
  static const String accountsKey = 'accounts_data';
  static const String ledgerKey = 'ledger_data';

  // Helper methods for common cache operations
  Future<void> cacheMemberData(Map<String, dynamic> data) async {
    await setCache(memberDataKey, data, duration: _longCacheDuration);
  }

  Map<String, dynamic>? getCachedMemberData() {
    return getCache<Map<String, dynamic>>(memberDataKey);
  }

  Future<void> cacheVehicles(List<dynamic> vehicles) async {
    await setCache(vehiclesKey, vehicles, duration: _mediumCacheDuration);
  }

  List<dynamic>? getCachedVehicles() {
    return getCache<List<dynamic>>(vehiclesKey);
  }

  Future<void> cacheLoans(List<dynamic> loans) async {
    await setCache(loansKey, loans, duration: _mediumCacheDuration);
  }

  List<dynamic>? getCachedLoans() {
    return getCache<List<dynamic>>(loansKey);
  }

  Future<void> cacheStatistics(Map<String, dynamic> stats) async {
    await setCache(statisticsKey, stats, duration: _shortCacheDuration);
  }

  Map<String, dynamic>? getCachedStatistics() {
    return getCache<Map<String, dynamic>>(statisticsKey);
  }

  Future<void> cacheAccounts(List<dynamic> accounts) async {
    await setCache(accountsKey, accounts, duration: _mediumCacheDuration);
  }

  List<dynamic>? getCachedAccounts() {
    return getCache<List<dynamic>>(accountsKey);
  }

  Future<void> cacheLedger(List<dynamic> ledger) async {
    await setCache(ledgerKey, ledger, duration: _shortCacheDuration);
  }

  List<dynamic>? getCachedLedger() {
    return getCache<List<dynamic>>(ledgerKey);
  }
}
