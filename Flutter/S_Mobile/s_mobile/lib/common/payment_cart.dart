import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A single item in the payment cart.
class PaymentItem {
  final String label;
  final String? accountNo;
  final String? loanNo;
  final String type;
  double amount;

  PaymentItem({
    required this.label,
    this.accountNo,
    this.loanNo,
    required this.type,
    this.amount = 0,
  });

  Map<String, dynamic> toMap() => {
        'label': label,
        'accountNo': accountNo,
        'loanNo': loanNo,
        'type': type,
        'amount': amount,
      };

  String get key => '${type}_${loanNo ?? accountNo ?? label}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PaymentItem && key == other.key;

  @override
  int get hashCode => key.hashCode;
}

/// Manages the payment cart across the app.
class PaymentCartController extends GetxController {
  final items = <PaymentItem>[].obs;

  double get total => items.fold(0, (sum, item) => sum + item.amount);

  int get count => items.length;

  /// Add or update an item in the cart.
  void addItem(PaymentItem item) {
    final existing = items.firstWhereOrNull((i) => i.key == item.key);
    if (existing != null) {
      existing.amount += item.amount;
      items.refresh();
    } else {
      items.add(item);
    }
  }

  /// Remove an item from the cart.
  void removeItem(PaymentItem item) {
    items.removeWhere((i) => i.key == item.key);
  }

  /// Update an item's amount.
  void updateAmount(PaymentItem item, double amount) {
    final existing = items.firstWhereOrNull((i) => i.key == item.key);
    if (existing != null) {
      existing.amount = amount;
      items.refresh();
    }
  }

  /// Clear the cart.
  void clear() {
    items.clear();
  }
}

// ── Payment Templates ──────────────────────────────────────────

/// A saved payment template.
class PaymentTemplate {
  String name;
  List<PaymentItem> items;

  PaymentTemplate({required this.name, required this.items});

  Map<String, dynamic> toMap() => {
        'name': name,
        'items': items.map((i) => i.toMap()).toList(),
      };

  factory PaymentTemplate.fromMap(Map<String, dynamic> map) {
    return PaymentTemplate(
      name: map['name'] as String,
      items: (map['items'] as List)
          .map((e) => PaymentItem(
                label: e['label'] ?? '',
                accountNo: e['accountNo'],
                loanNo: e['loanNo'],
                type: e['type'] ?? 'savings',
                amount: (e['amount'] as num?)?.toDouble() ?? 0,
              ))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());
  factory PaymentTemplate.fromJson(String s) =>
      PaymentTemplate.fromMap(json.decode(s));
}

/// Manages payment templates with local persistence.
class PaymentTemplateController extends GetxController {
  final templates = <PaymentTemplate>[].obs;
  static const _prefsKey = 'payment_templates';

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_prefsKey);
    if (data != null) {
      final list = json.decode(data) as List;
      templates.value = list
          .map((e) => PaymentTemplate.fromMap(e as Map<String, dynamic>))
          .toList();
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final data = json.encode(templates.map((t) => t.toMap()).toList());
    await prefs.setString(_prefsKey, data);
  }

  void saveTemplate(String name, List<PaymentItem> items) {
    templates.removeWhere((t) => t.name == name);
    templates.add(PaymentTemplate(
        name: name,
        items: items
            .map((i) => PaymentItem(
                  label: i.label,
                  accountNo: i.accountNo,
                  loanNo: i.loanNo,
                  type: i.type,
                  amount: i.amount,
                ))
            .toList()));
    _save();
  }

  void deleteTemplate(PaymentTemplate template) {
    templates.remove(template);
    _save();
  }

  void loadIntoCart(PaymentTemplate template, PaymentCartController cart) {
    cart.clear();
    for (final item in template.items) {
      cart.addItem(PaymentItem(
        label: item.label,
        accountNo: item.accountNo,
        loanNo: item.loanNo,
        type: item.type,
        amount: item.amount,
      ));
    }
  }
}
