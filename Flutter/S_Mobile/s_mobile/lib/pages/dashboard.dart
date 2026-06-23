import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/pages/ledgerEntries.dart';
import 'package:s_mobile/pages/loan_list.dart';

import '../master_page.dart';
import '../members/controller.dart';

class dashboard extends StatelessWidget {
  const dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final member = Get.find<MemberController>().currentCustomer.value;
    final accounts = member.Accounts ?? [];
    final loans = (member.Loans ?? [])
        .where((l) => (l.Outstanding_Balance ?? 0) > 0)
        .toList();

    // Summary counts
    final totalPortfolio =
        accounts.fold<double>(0, (sum, a) => sum + (a.Balance ?? 0));

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header gradient card ──────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Member name
                  Text(
                    (member.Name ?? '').toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Member No: ${member.No ?? ''}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  // Summary chips
                  Row(
                    children: [
                      _summaryChip(
                        icon: Icons.account_balance_wallet_outlined,
                        label: 'Accounts',
                        value: '${accounts.length}',
                      ),
                      const SizedBox(width: 10),
                      _summaryChip(
                        icon: Icons.trending_up,
                        label: 'Portfolio',
                        value: utilities.formatcurrency.format(totalPortfolio),
                      ),
                      const SizedBox(width: 10),
                      _summaryChip(
                        icon: Icons.credit_card_outlined,
                        label: 'Loans',
                        value: '${loans.length}',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── My Account Balances ───────────────────────────────
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'My Account Balances',
                style: TextStyle(
                  color: Color(0xFF2E7D32),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final acc = accounts[index];
                  return GestureDetector(
                    onTap: () => _onAccountTap(context, acc, member),
                    child: _accountCard(context, acc),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // ── My Loans ──────────────────────────────────────────
            if (loans.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'My Loans',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: loans.length,
                  itemBuilder: (context, index) {
                    return _loanCard(context, loans[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }

  // ── Helper: summary chip in header ─────────────────────────────
  Widget _summaryChip({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.18),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 4),
            Text(label,
                style: const TextStyle(color: Colors.white70, fontSize: 11)),
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // ── Helper: account balance card ───────────────────────────────
  Widget _accountCard(BuildContext context, Account acc) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE91E8C).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  acc.Name ?? '',
                  style: const TextStyle(
                      color: Color(0xFFE91E8C),
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.account_balance_wallet_outlined,
                  color: Color(0xFF2E7D32), size: 20),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Available Balance',
              style: TextStyle(color: Colors.grey, fontSize: 11)),
          const SizedBox(height: 4),
          Text(
            utilities.formatcurrency.format(acc.Balance ?? 0),
            style: const TextStyle(
              color: Color(0xFF2E7D32),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            acc.Product_Name ?? acc.Name ?? '',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () => _onAccountTap(context, acc,
                Get.find<MemberController>().currentCustomer.value),
            child: Row(
              children: const [
                Text('View activity',
                    style: TextStyle(color: Color(0xFFE91E8C), fontSize: 12)),
                Icon(Icons.arrow_forward, color: Color(0xFFE91E8C), size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Helper: loan card ──────────────────────────────────────────
  Widget _loanCard(BuildContext context, loan) {
    final String loanName =
        (loan.Loan_Product_Type_Name ?? loan.Loan_Name ?? '').toUpperCase();
    final double outstanding = loan.Outstanding_Balance ?? 0;
    final double repayment = loan.Repayment ?? 0;

    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E7D32).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    loanName.length > 12
                        ? '${loanName.substring(0, 12)}...'
                        : loanName,
                    style: const TextStyle(
                        color: Color(0xFF2E7D32),
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Icon(Icons.receipt_long_outlined,
                  color: Color(0xFF2E7D32), size: 20),
            ],
          ),
          const SizedBox(height: 12),
          const Text('Outstanding Balance',
              style: TextStyle(color: Colors.grey, fontSize: 11)),
          const SizedBox(height: 4),
          Text(
            utilities.formatcurrency.format(outstanding),
            style: const TextStyle(
              color: Color(0xFFE91E8C),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Repayment ${utilities.formatcurrency.format(repayment)}',
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // ── Navigate on account tap ────────────────────────────────────
  void _onAccountTap(BuildContext context, Account acc, member) {
    final ttypes = acc.transTypes;
    final entriess = Get.find<MemberController>()
        .currentCustomer
        .value
        .Entries
        ?.where((ent) =>
            ent.Transaction_Type != null &&
            ttypes.contains(ent.Transaction_Type))
        .toList();

    if (acc.Name == 'Loans') {
      Get.to(() => Master(
            member: Get.find<MemberController>().currentCustomer.value,
            widgets: loans_page(
                member: Get.find<MemberController>().currentCustomer.value),
            title:
                '${acc.Name} [Bal: ${utilities.formatcurrency.format(acc.Balance ?? 0)}]',
          ));
    } else {
      Get.to(() => Master(
            member: Get.find<MemberController>().currentCustomer.value,
            widgets: Ledgerentries(
                Entries: entries().calculateRunningBalance(entriess)),
            title:
                '${acc.Name} [Bal: ${utilities.formatcurrency.format(acc.Balance ?? 0)}]',
          ));
    }
  }
}
