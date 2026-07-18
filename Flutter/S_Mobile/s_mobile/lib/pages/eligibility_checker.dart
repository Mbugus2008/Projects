import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_mobile/Loans/Loan_Eligibility.dart';
import 'package:s_mobile/Loans/Loan_Type.dart';
import 'package:s_mobile/common/utilities.dart';

import '../members/controller.dart';

class EligibilityCheckerPage extends StatefulWidget {
  const EligibilityCheckerPage({super.key});

  @override
  State<EligibilityCheckerPage> createState() => _EligibilityCheckerPageState();
}

class _EligibilityCheckerPageState extends State<EligibilityCheckerPage> {
  Loan_Type? _selected;
  Loan_Eligibility? _result;
  bool _loading = false;
  String? _error;

  Future<void> _check() async {
    if (_selected == null) return;
    setState(() {
      _loading = true;
      _error = null;
      _result = null;
    });

    try {
      final member = Get.find<MemberController>().currentCustomer.value;
      final phone = Get.find<MemberController>().loginPhone ??
          member.Mobile_Phone_No ??
          '';
      final result = await Loan_Eligibility.checkEligibility(
        phone: phone,
        code: _selected!.Code ?? '',
        loanType: _selected!.Description ?? '',
      );
      if (mounted) setState(() => _result = result);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      appBar: AppBar(
        title: const Text('Loan Eligibility'),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Loan_Type>?>(
        future: Loan_Type.fetchLoanProducts(),
        builder: (context, snapshot) {
          final products = snapshot.data ?? [];
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Select a loan product to check your eligibility.',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 16),
                DropdownButtonFormField<Loan_Type>(
                  decoration: InputDecoration(
                    labelText: 'Loan Product',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selected,
                  items: products
                      .map((p) => DropdownMenuItem(
                            value: p,
                            child: Text(p.Description ?? p.Code ?? '',
                                style: const TextStyle(fontSize: 14)),
                          ))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      _selected = v;
                      _result = null;
                      _error = null;
                    });
                    _check();
                  },
                ),
                const SizedBox(height: 20),
                if (_loading) const Center(child: CircularProgressIndicator()),
                if (_error != null)
                  Card(
                    color: const Color(0xFFFFF3F0),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(_error!,
                          style: const TextStyle(color: Color(0xFFD32F2F))),
                    ),
                  ),
                if (_result != null) ...[
                  _infoCard(
                      'Status',
                      _statusLabel(_result!.Eligibility_Status),
                      _result!.Eligibility_Status == 1
                          ? const Color(0xFF2E7D32)
                          : const Color(0xFFFF9800)),
                  const SizedBox(height: 12),
                  _infoCard(
                      'Eligible Amount',
                      utilities.formatcurrency
                          .format(_result!.Eligible_Amount ?? 0),
                      const Color(0xFFE91E8C)),
                  const SizedBox(height: 12),
                  if ((_result!.Loan_Balance ?? 0) > 0) ...[
                    _infoCard(
                        'Top-Up Paid',
                        '${_result!.Topup_Paid}/${_result!.Topup_Installment ?? 0} installments',
                        const Color(0xFF2E7D32)),
                    const SizedBox(height: 12),
                  ],
                  if (_result!.Comments != null &&
                      _result!.Comments!.isNotEmpty)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(_result!.Comments!,
                            style: const TextStyle(fontSize: 13)),
                      ),
                    ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  String _statusLabel(int? status) {
    switch (status) {
      case 0:
        return 'Pending';
      case 1:
        return 'Approved';
      case 2:
        return 'Failed';
      default:
        return 'Unknown';
    }
  }

  Widget _infoCard(String label, String value, Color valueColor) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 15)),
            Text(value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: valueColor)),
          ],
        ),
      ),
    );
  }
}
