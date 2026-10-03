import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_mobile/common/utilities.dart';

/// Reducing-balance loan installment calculator.
/// Purely client-side — no backend calls.
class LoanCalculatorPage extends StatefulWidget {
  const LoanCalculatorPage({super.key});

  @override
  State<LoanCalculatorPage> createState() => _LoanCalculatorPageState();
}

class _LoanCalculatorPageState extends State<LoanCalculatorPage> {
  final _amountCtrl = TextEditingController(text: '100000');
  final _rateCtrl = TextEditingController(text: '1');
  final _termCtrl = TextEditingController(text: '12');

  double? _monthly;
  double? _totalInterest;
  double? _totalPayable;

  @override
  void initState() {
    super.initState();
    _amountCtrl.addListener(_recalc);
    _rateCtrl.addListener(_recalc);
    _termCtrl.addListener(_recalc);
    _recalc();
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _rateCtrl.dispose();
    _termCtrl.dispose();
    super.dispose();
  }

  void _recalc() {
    final p = double.tryParse(_amountCtrl.text.replaceAll(',', '').trim());
    final r = double.tryParse(_rateCtrl.text.trim());
    final n = int.tryParse(_termCtrl.text.trim());
    if (p == null || p <= 0 || r == null || r < 0 || n == null || n <= 0) {
      setState(() {
        _monthly = null;
        _totalInterest = null;
        _totalPayable = null;
      });
      return;
    }
    final rm = r / 100.0;
    double monthly;
    if (rm == 0) {
      monthly = p / n;
    } else {
      final factor = pow(1 + rm, n).toDouble();
      monthly = p * rm * factor / (factor - 1);
    }
    setState(() {
      _monthly = monthly;
      _totalPayable = monthly * n;
      _totalInterest = _totalPayable! - p;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fmt = utilities.formatcurrency;
    final amount =
        double.tryParse(_amountCtrl.text.replaceAll(',', '').trim()) ?? 0;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
              'Estimate your monthly repayment before you apply. Uses the reducing-balance method with a monthly interest rate.',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 16),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _amountCtrl,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Loan Amount (KES)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F0),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _rateCtrl,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Interest % / month',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: const Color(0xFFF5F5F0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: _termCtrl,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            labelText: 'Term (months)',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: const Color(0xFFF5F5F0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    children: [6, 12, 24, 36, 48].map((m) {
                      return ChoiceChip(
                        label: Text('$m mo'),
                        selected: _termCtrl.text.trim() == '$m',
                        onSelected: (_) {
                          _termCtrl.text = '$m';
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (_monthly == null)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text('Enter an amount, rate and term to calculate.',
                    style: TextStyle(color: Colors.grey)),
              ),
            )
          else ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Monthly Repayment',
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 6),
                  Text('KES ${fmt.format(_monthly)}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  _row('Loan Amount', fmt.format(amount)),
                  const Divider(height: 1),
                  _row('Total Interest', fmt.format(_totalInterest ?? 0),
                      valueColor: const Color(0xFFFF9800)),
                  const Divider(height: 1),
                  _row('Total Payable', fmt.format(_totalPayable ?? 0),
                      valueColor: const Color(0xFF2E7D32)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
                'This is an estimate. Final terms (rate, fees, insurance) are set by the SACCO.',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ],
      ),
    );
  }

  Widget _row(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 15)),
          Text(value,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? Colors.black87)),
        ],
      ),
    );
  }
}
