import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/pages/ledgerEntries.dart';
import 'package:s_mobile/pages/loan_list.dart';

import '../common/widgets.dart';
import '../master_page.dart';
import '../members/controller.dart';
import '../members/member.dart';

class accounts extends StatefulWidget {
  const accounts({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Member? member;

  @override
  State<accounts> createState() => _accountsState();
}

class _accountsState extends State<accounts> {
  @override
  Widget build(BuildContext context) {
    final member = Get.find<MemberController>().currentCustomer.value;
    final allAccounts = member.Accounts ?? [];

    // Group: savings/deposit accounts vs loan accounts
    final savingsAccounts =
        allAccounts.where((a) => a.Product_Category == null).toList();
    final loanAccounts =
        allAccounts.where((a) => a.Product_Category != null).toList();

    return Container(
      decoration: widgets().backgroundimage(context),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Total Portfolio Summary ──────────────────────
            _buildPortfolioCard(allAccounts),
            const SizedBox(height: 20),

            // ── Savings / Deposit Accounts ───────────────────
            if (savingsAccounts.isNotEmpty) ...[
              _sectionHeader('Savings & Deposits', savingsAccounts.length),
              const SizedBox(height: 10),
              ...savingsAccounts
                  .map((acc) => _accountCard(context, acc, member)),
              const SizedBox(height: 20),
            ],

            // ── Loan Accounts ────────────────────────────────
            if (loanAccounts.isNotEmpty) ...[
              _sectionHeader('Loan Accounts', loanAccounts.length),
              const SizedBox(height: 10),
              ...loanAccounts.map((acc) => _accountCard(context, acc, member)),
            ],

            if (allAccounts.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.account_balance_wallet_outlined,
                          size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No accounts found',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ── Portfolio Summary Card ────────────────────────────────
  Widget _buildPortfolioCard(List<Account> accounts) {
    final totalBalance =
        accounts.fold<double>(0, (sum, a) => sum + (a.Balance ?? 0));
    final savingsBalance = accounts
        .where((a) => a.Product_Category == null)
        .fold<double>(0, (sum, a) => sum + (a.Balance ?? 0));
    final loanBalance = accounts
        .where((a) => a.Product_Category != null)
        .fold<double>(0, (sum, a) => sum + (a.Balance ?? 0));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Total Portfolio',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            utilities.formatcurrency.format(totalBalance),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _portfolioChip(
                  'Savings', utilities.formatcurrency.format(savingsBalance)),
              const SizedBox(width: 12),
              _portfolioChip(
                  'Loans', utilities.formatcurrency.format(loanBalance)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _portfolioChip(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.18),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(label,
                style: const TextStyle(color: Colors.white70, fontSize: 11)),
            const SizedBox(height: 2),
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // ── Section Header ────────────────────────────────────────
  Widget _sectionHeader(String title, int count) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF2E7D32),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$count',
            style: const TextStyle(
                color: Color(0xFF2E7D32),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // ── Account Card ──────────────────────────────────────────
  Widget _accountCard(BuildContext context, Account acc, Member member) {
    final isLoan = acc.Product_Category != null;
    final Color accentColor =
        isLoan ? const Color(0xFFE91E8C) : const Color(0xFF2E7D32);

    return GestureDetector(
      onTap: () => _onAccountTap(context, acc, member),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isLoan
                    ? Icons.receipt_long_outlined
                    : Icons.account_balance_wallet_outlined,
                color: accentColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            // Account info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    acc.Name ?? acc.Product_Name ?? 'Account',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    acc.No ?? '',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            // Balance
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  utilities.formatcurrency.format(acc.Balance ?? 0),
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Balance',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
                ),
              ],
            ),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }

  // ── Navigate on account tap ───────────────────────────────
  void _onAccountTap(BuildContext context, Account acc, Member member) async {
    final title =
        '${acc.Name ?? acc.Product_Name ?? 'Account'} [Bal: ${utilities.formatcurrency.format(acc.Balance ?? 0)}]';

    if (acc.Name == 'Loans') {
      Get.to(() => Master(
            member: member,
            widgets: loans_page(member: member),
            title: title,
          ));
      return;
    }

    // Show loading while fetching
    Get.to(() => Master(
          member: member,
          widgets: const Center(child: CircularProgressIndicator()),
          title: title,
        ));

    // Pass member number, not account name — NAV expects Customer_No
    final memberNo = member.No ?? '';
    final txType = acc.transaction_Type;
    final fetchedEntries = await entries()
        .fetchEntries(account: memberNo, transactionType: txType);

    if (fetchedEntries != null) {
      final balanced = entries().calculateRunningBalance(fetchedEntries);
      Get.back();
      Get.to(() => Master(
            member: member,
            widgets: Ledgerentries(Entries: balanced),
            title: title,
          ));
    } else {
      Get.back();
      MotionToast.error(
        description: const Text('Failed to load transactions.'),
        title: const Text('Error'),
      ).show(context);
    }
  }
}
