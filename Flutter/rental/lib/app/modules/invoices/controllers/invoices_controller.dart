import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api_service.dart';

/// Invoices module: create itemised invoices (rent, water, garbage, …),
/// send them to tenants, and record payments that produce receipts issued
/// against the invoice. Free of UI side effects so it stays unit-testable.
class InvoicesController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> invoices = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> tenants = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> properties = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> leases = <Map<String, dynamic>>[].obs;

  // Global billing settings (see Settings screen).
  final RxDouble waterRate = 150.0.obs;
  final RxDouble garbageFee = 500.0.obs;

  // Draft form state.
  final RxInt draftTenantId = 0.obs;
  final TextEditingController unitController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final RxList<TextEditingController> lineDescriptions =
      <TextEditingController>[].obs;
  final RxList<TextEditingController> lineAmounts =
      <TextEditingController>[].obs;

  /// Common Kenyan rental charges offered as one-tap quick-adds.
  static const List<String> amenityPresets = [
    'Rent',
    'Water',
    'Garbage',
    'Service Charge',
    'Security',
  ];

  @override
  void onInit() {
    super.onInit();
    load();
  }

  @override
  void onClose() {
    clearDraft();
    unitController.dispose();
    notesController.dispose();
    super.onClose();
  }

  Future<void> load() async {
    isLoading.value = true;
    try {
      invoices.value = await _apiService.getInvoices();
      tenants.value = await _apiService.getTenants();
      properties.value = await _apiService.getProperties();
      leases.value = await _apiService.getLeases();

      final settings = await _apiService.getSettings();
      final water = _toDouble(settings['waterRatePerUnit']);
      final garbage = _toDouble(settings['garbageFee']);
      if (water > 0) waterRate.value = water;
      if (garbage > 0) garbageFee.value = garbage;
    } catch (_) {
      invoices.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  String tenantName(int? tenantId) {
    for (final tenant in tenants) {
      if (tenant['id'] == tenantId) {
        return '${tenant['firstName'] ?? ''} ${tenant['lastName'] ?? ''}'
            .trim();
      }
    }
    return '';
  }

  String tenantPhone(int? tenantId) {
    for (final tenant in tenants) {
      if (tenant['id'] == tenantId) {
        return tenant['phoneNumber']?.toString() ?? '';
      }
    }
    return '';
  }

  String propertyName(int? propertyId) {
    for (final property in properties) {
      if (property['id'] == propertyId) {
        return property['name']?.toString() ?? '';
      }
    }
    return '';
  }

  // ---------------------------------------------------------------
  // Draft line management
  // ---------------------------------------------------------------

  void addLine([String description = '', String amount = '']) {
    lineDescriptions.add(TextEditingController(text: description));
    lineAmounts.add(TextEditingController(text: amount));
  }

  /// The tenant's active lease rent, used to preset the Rent line.
  double leaseRentFor(int tenantId) {
    for (final lease in leases) {
      if (lease['tenantId'] == tenantId &&
          lease['status']?.toString() == 'Active') {
        return _toDouble(lease['monthlyRent']);
      }
    }
    for (final lease in leases) {
      if (lease['tenantId'] == tenantId) {
        return _toDouble(lease['monthlyRent']);
      }
    }
    return 0;
  }

  /// Tenant picked: preset (or fill) the Rent line from their lease.
  void onTenantChanged(int tenantId) {
    draftTenantId.value = tenantId;
    final rent = leaseRentFor(tenantId);
    if (rent <= 0) return;
    for (var i = 0; i < lineDescriptions.length; i++) {
      if (lineDescriptions[i].text.trim().toLowerCase() == 'rent') {
        lineAmounts[i].text = _money(rent);
        lineAmounts.refresh();
        return;
      }
    }
    addLine('Rent', _money(rent));
  }

  /// Adds a Rent line preset from the selected tenant's lease.
  void addRentLine() {
    final rent = leaseRentFor(draftTenantId.value);
    addLine('Rent', rent > 0 ? _money(rent) : '');
  }

  /// Adds the monthly garbage fee from the global settings.
  void addGarbageLine() {
    addLine('Garbage', garbageFee.value > 0 ? _money(garbageFee.value) : '');
  }

  /// Adds a Water line billed as units × the global price per unit.
  void addWaterLine(double units) {
    final amount = units * waterRate.value;
    final label = units == units.roundToDouble()
        ? units.toStringAsFixed(0)
        : units.toString();
    addLine('Water ($label units)', _money(amount));
  }

  static String _money(double value) => value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(2);

  void removeLine(int index) {
    lineDescriptions.removeAt(index).dispose();
    lineAmounts.removeAt(index).dispose();
  }

  /// Sum of the current draft amounts (non-reactive; read inside an Obx that
  /// depends on [lineAmounts] for live totals).
  double get draftTotal {
    var total = 0.0;
    for (final amount in lineAmounts) {
      total += double.tryParse(amount.text.trim()) ?? 0.0;
    }
    return total;
  }

  void clearDraft() {
    draftTenantId.value = 0;
    unitController.clear();
    notesController.clear();
    for (final controller in lineDescriptions) {
      controller.dispose();
    }
    for (final controller in lineAmounts) {
      controller.dispose();
    }
    lineDescriptions.clear();
    lineAmounts.clear();
  }

  /// Builds the API payload from the draft form. Returns null when the form is
  /// incomplete (no tenant chosen, or no line items with a positive amount).
  Map<String, dynamic>? buildPayload() {
    final lines = <Map<String, dynamic>>[];
    for (var i = 0; i < lineDescriptions.length; i++) {
      final description = lineDescriptions[i].text.trim();
      final amount = double.tryParse(lineAmounts[i].text.trim()) ?? 0.0;
      if (description.isEmpty || amount <= 0) continue;
      lines.add({'description': description, 'amount': amount});
    }
    if (draftTenantId.value == 0 || lines.isEmpty) return null;

    return {
      'tenantId': draftTenantId.value,
      'unitId': int.tryParse(unitController.text.trim()),
      'invoiceDate': DateTime.now().toIso8601String(),
      'status': 'Sent',
      'notes': notesController.text.trim(),
      'lines': lines,
    };
  }

  /// Creates the invoice from the draft. Returns false when the form is
  /// incomplete or the API rejects the request.
  Future<bool> saveDraft() async {
    final payload = buildPayload();
    if (payload == null) return false;

    isLoading.value = true;
    try {
      final success = await _apiService.addInvoice(payload);
      if (success) {
        clearDraft();
        await load();
      }
      return success;
    } finally {
      isLoading.value = false;
    }
  }

  /// Records a payment against an invoice: updates the invoice
  /// (amountPaid + Paid/Partial status) and creates the matching income
  /// transaction so tenant balances stay in sync.
  Future<bool> recordPayment(
    Map<String, dynamic> invoice,
    double amount, {
    DateTime? date,
  }) async {
    final total = _toDouble(invoice['totalAmount']);
    final newPaid = _toDouble(invoice['amountPaid']) + amount;

    isLoading.value = true;
    try {
      final updated = await _apiService.updateInvoice(invoice['id'] as int, {
        'amountPaid': newPaid,
        'status': newPaid >= total ? 'Paid' : 'Partial',
      });
      if (!updated) return false;

      final created = await _apiService.addTransaction({
        'transactionDate': (date ?? DateTime.now()).toIso8601String(),
        'amount': amount,
        'category': 'Rent',
        'type': 'Income',
        'tenantId': invoice['tenantId'],
        'propertyId': invoice['propertyId'],
        'description': 'Payment for ${invoice['invoiceNumber']}',
      });

      await load();
      return created;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> removeInvoice(int id) async {
    isLoading.value = true;
    try {
      final success = await _apiService.deleteInvoice(id);
      if (success) {
        await load();
      }
      return success;
    } finally {
      isLoading.value = false;
    }
  }

  static double _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '') ?? 0.0;
  }
}
