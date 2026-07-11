import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/payment_cart.dart';
import 'package:s_mobile/members/controller.dart';

class CreateTemplatePage extends StatefulWidget {
  const CreateTemplatePage({super.key, this.template});

  final PaymentTemplate? template; // null = create, non-null = edit

  @override
  State<CreateTemplatePage> createState() => _CreateTemplatePageState();
}

class _CreateTemplatePageState extends State<CreateTemplatePage> {
  final _nameController = TextEditingController();
  final _items = <PaymentItem>[].obs;
  final _amountControllers = <String, TextEditingController>{};

  @override
  void initState() {
    super.initState();
    final tmpl = widget.template;
    if (tmpl != null) {
      _nameController.text = tmpl.name;
      for (final item in tmpl.items) {
        _items.add(item);
        final ctrl = TextEditingController(
            text: item.amount > 0 ? item.amount.toStringAsFixed(0) : '');
        _amountControllers[item.key] = ctrl;
      }
    }
  }

  // For the "Add Item" row
  PaymentItem? _selectedAddItem;
  final _addAmountController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addAmountController.dispose();
    for (final c in _amountControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _doAddFromDropdown() {
    if (_selectedAddItem == null) return;
    // Check item still valid
    if (_items.any((i) => i.key == _selectedAddItem!.key)) {
      _selectedAddItem = null;
      setState(() {});
      return;
    }
    final amt = double.tryParse(_addAmountController.text.trim()) ?? 0;
    if (amt <= 0) return;
    _addItem(_selectedAddItem!);
    _amountControllers[_selectedAddItem!.key]?.text = amt.toStringAsFixed(0);
    _selectedAddItem = null;
    _addAmountController.clear();
    setState(() {});
  }

  // Build dropdown options (not yet added items)
  List<DropdownMenuItem<PaymentItem>> _buildDropdownItems() {
    final member = Get.find<MemberController>().currentCustomer.value;
    final items = <DropdownMenuItem<PaymentItem>>[];
    for (final a
        in (member.Accounts ?? []).where((a) => a.Product_Category == null)) {
      final item = PaymentItem(
          label: a.Name ?? 'Savings', accountNo: a.No, type: 'savings');
      if (!_items.any((i) => i.key == item.key)) {
        items.add(DropdownMenuItem(
            value: item,
            child: Text('${a.Name} (Savings)',
                style: const TextStyle(fontSize: 13))));
      }
    }
    for (final l in member.Loans ?? []) {
      final item = PaymentItem(
          label: l.Loan_Product_Type_Name ?? l.Loan_No ?? 'Loan',
          loanNo: l.Loan_No,
          type: 'loan');
      if (!_items.any((i) => i.key == item.key)) {
        items.add(DropdownMenuItem(
            value: item,
            child: Text('${l.Loan_Product_Type_Name ?? l.Loan_No} (Loan)',
                style: const TextStyle(fontSize: 13))));
      }
    }
    return items;
  }

  void _addItem(PaymentItem item) {
    final key = item.key;
    if (_items.any((i) => i.key == key)) return;
    _items.add(item);
    if (!_amountControllers.containsKey(key)) {
      _amountControllers[key] = TextEditingController();
    }
  }

  void _removeItem(PaymentItem item) {
    _items.removeWhere((i) => i.key == item.key);
    _amountControllers[item.key]?.dispose();
    _amountControllers.remove(item.key);
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      MotionToast.warning(
        description: const Text('Please enter a template name.'),
        title: const Text('Templates'),
      ).show(context);
      return;
    }

    final itemsWithAmounts = <PaymentItem>[];
    for (final item in _items) {
      final raw = _amountControllers[item.key]?.text.trim() ?? '';
      final amt = double.tryParse(raw) ?? 0;
      if (amt > 0) {
        itemsWithAmounts.add(PaymentItem(
          label: item.label,
          accountNo: item.accountNo,
          loanNo: item.loanNo,
          type: item.type,
          amount: amt,
        ));
      }
    }

    if (itemsWithAmounts.isEmpty) {
      MotionToast.warning(
        description: const Text('Add at least one item with an amount.'),
        title: const Text('Templates'),
      ).show(context);
      return;
    }

    final tmplCtrl = Get.find<PaymentTemplateController>();
    // If editing, remove old template first
    if (widget.template != null) {
      tmplCtrl.deleteTemplate(widget.template!);
    }
    tmplCtrl.saveTemplate(name, itemsWithAmounts);
    Get.back();
    MotionToast.success(
      description: Text(widget.template != null
          ? 'Template "$name" updated.'
          : 'Template "$name" saved.'),
      title: const Text('Templates'),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Template Name',
                hintText: 'e.g. My Monthly Dues',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.bookmark),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                // Existing items
                Obx(() {
                  if (_items.isEmpty) return const SizedBox.shrink();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Template Items',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 8),
                      ..._items.map((item) => _buildExistingItem(item)),
                      const SizedBox(height: 16),
                    ],
                  );
                }),
                // Add item row
                _buildAddItemRow(),
              ],
            ),
          ),
          // Save button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2)),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.save, size: 20),
                  label: const Text('Save Template'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Existing item (already added) ──────────────────────────────
  Widget _buildExistingItem(PaymentItem item) {
    final ctrl = _amountControllers[item.key];
    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      color: const Color(0xFFF5F5F0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Text(item.label,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              width: 100,
              child: TextField(
                controller: ctrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 18, color: Colors.red),
              onPressed: () => _removeItem(item),
            ),
          ],
        ),
      ),
    );
  }

  // ── Add item row with dropdown ─────────────────────────────────
  Widget _buildAddItemRow() {
    final dropdownItems = _buildDropdownItems();
    if (dropdownItems.isEmpty) {
      return const Card(
        color: Color(0xFFE8F5E9),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text('All items already added.',
              style: TextStyle(color: Colors.grey, fontSize: 13)),
        ),
      );
    }
    return Card(
      color: const Color(0xFFE8F5E9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<PaymentItem>(
                value: _selectedAddItem,
                hint: const Text('Add item...', style: TextStyle(fontSize: 13)),
                isExpanded: true,
                underline: const SizedBox(),
                items: dropdownItems,
                onChanged: (v) => setState(() => _selectedAddItem = v),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 90,
              child: TextField(
                controller: _addAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const SizedBox(width: 4),
            IconButton(
              icon: const Icon(Icons.add_circle, color: Color(0xFF2E7D32)),
              onPressed: _doAddFromDropdown,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required PaymentItem item,
  }) {
    return Obx(() {
      final added = _items.any((i) => i.key == item.key);
      final ctrl = _amountControllers[item.key];
      return Card(
        margin: const EdgeInsets.only(bottom: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(icon, color: added ? Colors.grey : color, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: added ? Colors.grey : null)),
                        Text(subtitle,
                            style: TextStyle(
                                fontSize: 11,
                                color: added
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade600)),
                      ],
                    ),
                  ),
                  if (added)
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: ctrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Amount',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: Icon(added ? Icons.remove_circle : Icons.add_circle,
                        color: added ? Colors.red : color.withOpacity(0.7)),
                    onPressed: () => added ? _removeItem(item) : _addItem(item),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
