import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/controller.dart';

class BillerOption {
  final String code;
  final String name;
  const BillerOption(this.code, this.name);
}

const _billers = <BillerOption>[
  BillerOption('KPLC_PREPAID', 'KPLC Prepaid (Token)'),
  BillerOption('KPLC_POSTPAID', 'KPLC Postpaid'),
  BillerOption('NBI_WATER', 'Nairobi Water'),
  BillerOption('DSTV', 'DSTV'),
  BillerOption('GOTV', 'GOtv'),
  BillerOption('ZUKU', 'Zuku'),
  BillerOption('STARTIMES', 'Startimes'),
  BillerOption('NHIF', 'NHIF'),
  BillerOption('SAFARICOM_POSTPAID', 'Safaricom Postpaid'),
  BillerOption('TELKOM', 'Telkom'),
  BillerOption('OTHER_PAYBILL', 'Other Paybill'),
];

/// Pay bills (power, water, TV, etc.) using funds from the member's wallet.
/// The payment is recorded and disbursed through the SACCO channel.
class BillPaymentsPage extends StatefulWidget {
  const BillPaymentsPage({super.key});

  @override
  State<BillPaymentsPage> createState() => _BillPaymentsPageState();
}

class _BillPaymentsPageState extends State<BillPaymentsPage> {
  BillerOption? _biller;
  String? _sourceNo;
  final _billAccountCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _billAccountCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final member = Get.find<MemberController>().currentCustomer.value;
    final savings = (member.Accounts ?? [])
        .where((a) => a.Product_Category == null)
        .toList();
    if (_sourceNo == null && savings.isNotEmpty) {
      final wallet = savings.where((a) => a.Name == 'Wallet');
      _sourceNo = wallet.isNotEmpty ? wallet.first.No : savings.first.No;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
              'Pay your bills directly from your wallet. The SACCO processes the payment to the biller.',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 16),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DropdownButtonFormField<BillerOption>(
                    decoration: InputDecoration(
                      labelText: 'Biller',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F0),
                    ),
                    value: _biller,
                    items: _billers
                        .map((b) => DropdownMenuItem(
                              value: b,
                              child: Text(b.name,
                                  style: const TextStyle(fontSize: 14)),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _biller = v),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _billAccountCtrl,
                    decoration: InputDecoration(
                      labelText: 'Account / Meter / Reference No',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F0),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _amountCtrl,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Amount (KES)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F0),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Pay from (wallet)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F0),
                    ),
                    value: _sourceNo,
                    items: savings
                        .map((a) => DropdownMenuItem(
                              value: a.No,
                              child: Text(
                                  '${a.Name ?? 'Account'} (${utilities.formatcurrency.format(a.Balance ?? 0)})',
                                  style: const TextStyle(fontSize: 13)),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _sourceNo = v),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          FilledButton(
            onPressed: _submitting ? null : _submit,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: _submitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2))
                : const Text('Pay Bill',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          const Text(
              'Funds are debited from your wallet; the bill is paid through the SACCO payment channel.',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final member = Get.find<MemberController>().currentCustomer.value;
    if (_biller == null) {
      MotionToast.warning(
        description: const Text('Please select a biller.'),
        title: const Text('Bill Payment'),
      ).show(context);
      return;
    }
    if (_billAccountCtrl.text.trim().isEmpty) {
      MotionToast.warning(
        description: const Text('Enter the bill account / reference.'),
        title: const Text('Bill Payment'),
      ).show(context);
      return;
    }
    final amount = double.tryParse(_amountCtrl.text.trim());
    if (amount == null || amount <= 0) {
      MotionToast.warning(
        description: const Text('Enter a valid amount.'),
        title: const Text('Bill Payment'),
      ).show(context);
      return;
    }
    if (_sourceNo == null) {
      MotionToast.warning(
        description: const Text('No wallet account available.'),
        title: const Text('Bill Payment'),
      ).show(context);
      return;
    }

    setState(() => _submitting = true);
    try {
      final controller = Get.find<MemberController>();
      final payload = {
        'Member_No': member.No,
        'Account_No': _sourceNo,
        'Biller_Code': _biller!.code,
        'Biller_Name': _biller!.name,
        'Bill_Account': _billAccountCtrl.text.trim(),
        'Amount': amount,
        'Phone': controller.loginPhone ?? member.Mobile_Phone_No ?? '',
        'Transaction_Type': 11, // Utility_Payment
      };
      final api = ApiClient()..baseUrl = AppConfig.apsUrl;
      final r = await api.postdata('billpay', json.encode(payload));
      if (!mounted) return;
      if (r.statusCode == 200) {
        final result = Results.fromJson(r.body);
        if (result.Code == 0) {
          MotionToast.success(
            description: Text(result.Desc ??
                'Bill payment request received. It will be processed shortly.'),
            title: const Text('Bill Payment'),
          ).show(context);
          _amountCtrl.clear();
          _billAccountCtrl.clear();
        } else {
          MotionToast.error(
            description: Text(result.Desc ?? 'Bill payment failed.'),
            title: const Text('Bill Payment'),
          ).show(context);
        }
      } else {
        MotionToast.error(
          description: Text('Request failed (${r.statusCode}).'),
          title: const Text('Bill Payment'),
        ).show(context);
      }
    } catch (e) {
      if (mounted) {
        MotionToast.error(
          description: Text(e.toString()),
          title: const Text('Bill Payment'),
        ).show(context);
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}
