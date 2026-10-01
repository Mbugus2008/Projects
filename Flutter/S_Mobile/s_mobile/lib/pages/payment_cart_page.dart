import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/payment_cart.dart';
import 'package:s_mobile/common/utilities.dart';

import '../members/controller.dart';
import '../transaction/enums.dart';
import 'create_template_page.dart';

class PaymentCartPage extends StatelessWidget {
  const PaymentCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<PaymentCartController>();

    return Obx(() {
      final items = cart.items;
      final tmplCtrl = Get.find<PaymentTemplateController>();

      final templateRow = Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
        child: Row(
          children: [
            Expanded(
              child: Obx(() {
                final tmpls = tmplCtrl.templates;
                return SizedBox(
                  height: 36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tmpls.length + 1, // +1 for "New"
                    itemBuilder: (_, i) {
                      if (i < tmpls.length) {
                        return _buildTemplateChip(tmpls[i], cart, context);
                      }
                      return _buildNewTemplateChip();
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      );

      if (items.isEmpty) {
        return Column(
          children: [
            templateRow,
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                        size: 64, color: Colors.grey.shade400),
                    const SizedBox(height: 16),
                    const Text('No items added for payment',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(
                      'Tap the cart icon on any account, or load a template',
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }

      return Column(
        children: [
          templateRow,
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (_, i) => _buildItemCard(items[i], cart),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            '${items.length} item${items.length > 1 ? 's' : ''}',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12)),
                        const SizedBox(height: 2),
                        Text(
                          utilities.formatcurrency.format(cart.total),
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () => _submitPayment(context, cart),
                      icon: const Icon(Icons.payment, size: 20),
                      label: const Text('Pay Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildItemCard(PaymentItem item, PaymentCartController cart) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: item.type == 'loan'
                    ? const Color(0xFFFFF3F0)
                    : const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                item.type == 'loan'
                    ? Icons.credit_card
                    : Icons.account_balance_wallet,
                color: item.type == 'loan'
                    ? const Color(0xFFD32F2F)
                    : const Color(0xFF2E7D32),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.label,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                  if (item.loanNo != null)
                    Text(item.loanNo!,
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade500)),
                  if (item.accountNo != null)
                    Text(item.accountNo!,
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade500)),
                ],
              ),
            ),
            _AmountField(
              key: ValueKey(item.key),
              item: item,
              onChanged: (amt) => cart.updateAmount(item, amt),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline,
                  color: Colors.red, size: 22),
              onPressed: () => cart.removeItem(item),
            ),
          ],
        ),
      ),
    );
  }

  // ── Template chip builders ─────────────────────────────────────

  Widget _buildTemplateChip(
      PaymentTemplate t, PaymentCartController cart, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: GestureDetector(
        onLongPress: () {
          Get.to(() => CreateTemplatePage(template: t));
        },
        child: ActionChip(
          avatar: const Icon(Icons.bookmark, size: 16),
          label: Text(t.name, style: const TextStyle(fontSize: 12)),
          onPressed: () {
            Get.find<PaymentTemplateController>().loadIntoCart(t, cart);
            MotionToast.success(
              description: Text('"${t.name}" loaded.'),
              title: const Text('Templates'),
            ).show(context);
          },
        ),
      ),
    );
  }

  Widget _buildNewTemplateChip() {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: ActionChip(
        avatar: const Icon(Icons.add, size: 16, color: Color(0xFF2E7D32)),
        label: const Text('New', style: TextStyle(fontSize: 12)),
        onPressed: () => Get.to(() => const CreateTemplatePage()),
      ),
    );
  }

  Future<void> _submitPayment(
      BuildContext context, PaymentCartController cart) async {
    final items = cart.items.where((i) => i.amount > 0).toList();
    if (items.isEmpty) {
      MotionToast.warning(
        description: const Text('Enter amounts for at least one item.'),
        title: const Text('Payment'),
      ).show(context);
      return;
    }

    final member = Get.find<MemberController>().currentCustomer.value;
    final phone =
        Get.find<MemberController>().loginPhone ?? member.Mobile_Phone_No ?? '';
    final digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length < 9) {
      MotionToast.error(
        description: const Text(
            'No valid phone number found. Please update your profile phone number first.'),
        title: const Text('Payment'),
      ).show(context);
      return;
    }

    final total = items.fold<double>(0, (sum, item) => sum + item.amount);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Payment'),
        content: Text(
            'Send ${items.length} M-Pesa payment request${items.length > 1 ? 's' : ''} '
            'totaling ${utilities.formatcurrency.format(total)} to $phone?\n\n'
            'You will receive an M-Pesa prompt on your phone. Enter your PIN to complete each payment.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
            ),
            child: const Text('Send Request'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final api = ApiClient();
    api.baseUrl = AppConfig.apsUrl;

    final sent = <PaymentItem>[];
    final failed = <String>[];
    String? firstError;

    for (final item in items) {
      final txType = item.type == 'loan'
          ? transaction_Type.Loan_Repayment.index
          : transaction_Type.Deposit.index;

      final payload = <String, dynamic>{
        // Mirror the USSD deposit flow: Account_No carries the member number;
        // the target account is identified by the description / loan number.
        'Account_No': member.No ?? item.accountNo ?? '',
        'Amount': item.amount,
        'Phone': phone,
        'Transaction_Type': txType,
        if (item.loanNo != null) 'Loan_No': item.loanNo,
        'Description': item.label,
      };

      try {
        final r = await api.postdata('stkpush', json.encode(payload));
        Map<String, dynamic> res = {};
        try {
          res = json.decode(r.body) as Map<String, dynamic>;
        } catch (_) {}
        if (r.statusCode == 200 && res['Code'] == 0) {
          sent.add(item);
        } else {
          failed.add(item.label);
          firstError ??= (res['Desc'] ?? 'HTTP ${r.statusCode}').toString();
        }
      } catch (e) {
        failed.add(item.label);
        firstError ??= e.toString();
      }
    }

    for (final item in sent) {
      cart.removeItem(item);
    }

    if (!context.mounted) return;

    if (failed.isEmpty) {
      MotionToast.success(
        description: Text(
            '${sent.length} M-Pesa request${sent.length > 1 ? 's' : ''} sent to $phone. '
            'Enter your PIN on the prompt to complete the payment.'),
        title: const Text('Payment'),
      ).show(context);
    } else if (sent.isEmpty) {
      MotionToast.error(
        description: Text(firstError ?? 'Could not send the payment request.'),
        title: const Text('Payment Failed'),
      ).show(context);
    } else {
      MotionToast.warning(
        description: Text(
            '${sent.length} of ${items.length} requests sent. Failed: ${failed.join(', ')}'),
        title: const Text('Payment'),
      ).show(context);
    }
  }
}

// ── Amount editor ──────────────────────────────────────────────
// Stateful so the TextField keeps its own controller (and the typed
// text / cursor position) across the cart's reactive rebuilds.
class _AmountField extends StatefulWidget {
  const _AmountField({
    super.key,
    required this.item,
    required this.onChanged,
  });

  final PaymentItem item;
  final ValueChanged<double> onChanged;

  @override
  State<_AmountField> createState() => _AmountFieldState();
}

class _AmountFieldState extends State<_AmountField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.item.amount > 0
          ? widget.item.amount.toStringAsFixed(0)
          : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Amount',
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: (val) {
          widget.onChanged(double.tryParse(val) ?? 0);
        },
      ),
    );
  }
}
