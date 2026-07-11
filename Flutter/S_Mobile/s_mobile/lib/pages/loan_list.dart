import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:s_mobile/Loans/Loan.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/pages/ledgerEntries.dart';

import '../common/widgets.dart';
import '../members/entries.dart';
import '../members/member.dart';

class loans_page extends StatefulWidget {
  const loans_page({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Member? member;

  @override
  State<loans_page> createState() => _loans_pageState();
}

class _loans_pageState extends State<loans_page> {
  @override
  Widget build(BuildContext context) {
    final loans = widget.member?.Loans ?? [];

    if (loans.isEmpty) {
      return Scaffold(
        body: Container(
          decoration: widgets().backgroundimage(context),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.credit_card_off_outlined,
                    size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No loans found',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
          ),
        ),
      );
    }

    final totalOutstanding =
        loans.fold<double>(0, (s, l) => s + (l.Outstanding_Balance ?? 0));

    return Scaffold(
      body: Container(
        decoration: widgets().backgroundimage(context),
        child: Column(
          children: [
            // ── Summary bar ──────────────────────────────
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  _summaryChip(
                      'Outstanding', totalOutstanding, const Color(0xFFE91E8C)),
                  const Spacer(),
                  Text('${loans.length} loans',
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            // ── Loan list ───────────────────────────────
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                itemCount: loans.length,
                itemBuilder: (context, index) =>
                    _loanCard(context, loans[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryChip(String label, double amount, Color accentColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 10)),
          const SizedBox(height: 2),
          Text(utilities.formatcurrency.format(amount),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _loanCard(BuildContext context, Loan loan) {
    final loanName = (loan.Loan_Product_Type_Name ??
            loan.Loan_Name ??
            loan.Loan_Product_Type ??
            'Loan')
        .toUpperCase();
    final outstanding = loan.Outstanding_Balance ?? 0;
    final interest = loan.Outstanding_Interest ?? 0;
    final repayment = loan.Repayment ?? 0;
    final approved = loan.Approved_Amount ?? 0;
    final installments = loan.Installments ?? 0;
    final date = loan.Application_Date;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _onLoanTap(context, loan),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(loanName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(loan.Loan_No ?? '',
                        style: const TextStyle(
                            color: Color(0xFF2E7D32),
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Outstanding',
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        Text(
                          utilities.formatcurrency.format(outstanding),
                          style: const TextStyle(
                              color: Color(0xFFE91E8C),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  if (interest > 0)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Interest',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11)),
                          Text(
                            utilities.formatcurrency.format(interest),
                            style: const TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (approved > 0)
                    _detailChip(
                        'Approved', utilities.formatcurrency.format(approved)),
                  if (installments > 0) _detailChip('Term', '$installments mo'),
                  if (repayment > 0)
                    _detailChip('Repayment',
                        utilities.formatcurrency.format(repayment)),
                  if (date != null)
                    _detailChip(DateFormat('dd MMM yy').format(date), ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label.isNotEmpty)
            Text('$label: ',
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
          Text(value,
              style:
                  const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  void _onLoanTap(BuildContext context, Loan loan) async {
    final currentMember = widget.member;
    final memberNo = currentMember?.No ?? '';
    final loanNo = loan.Loan_No ?? '';

    print('🔍 Loan tap: memberNo=$memberNo, loanNo=$loanNo');

    // Show loading
    Get.to(() => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ));

    final fetchedEntries =
        await entries().fetchEntries(account: memberNo, transactionType: 2);

    print('📦 Fetched loan entries: ${fetchedEntries?.length ?? 0}');

    final filtered =
        fetchedEntries?.where((e) => e.Loan_No == loanNo).toList() ?? [];

    print('🎯 Filtered by $loanNo: ${filtered.length}');

    Get.back(); // remove loading

    Get.to(() =>
        Ledgerentries(Entries: entries().calculateRunningBalance(filtered)));
  }
}
