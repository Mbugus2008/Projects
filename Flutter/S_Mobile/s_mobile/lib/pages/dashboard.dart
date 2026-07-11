import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/Loans/Schedule.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/common/payment_cart.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member.dart';
import 'package:s_mobile/pages/ledgerEntries.dart';
import 'package:s_mobile/pages/loan_ledger.dart' show LoanLedgerEntries;
import 'package:s_mobile/pages/loan_list.dart';

import '../master_page.dart';
import '../members/controller.dart';

class dashboard extends StatefulWidget {
  const dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<dashboard> {
  @override
  void initState() {
    super.initState();
    _fetchAllSchedules();
  }

  /// Fetch repayment schedules for all loans in the background.
  Future<void> _fetchAllSchedules() async {
    final controller = Get.find<MemberController>();
    final loans = controller.currentCustomer.value.Loans ?? [];

    if (loans.isEmpty) return;

    // Skip loans that we already fetched
    final toFetch = loans
        .where((l) =>
            l.Loan_No != null &&
            l.Loan_No!.isNotEmpty &&
            !controller.loanSchedules.containsKey(l.Loan_No))
        .toList();

    if (toFetch.isEmpty) return;

    try {
      // Fire all requests concurrently
      final results = await Future.wait(
        toFetch.map((loan) async {
          final loanNo = loan.Loan_No!;
          final schedule = await Schedule.fetchForLoan(loanNo);
          return MapEntry(loanNo, schedule ?? []);
        }),
      );

      // Store all schedules in the controller
      final schedules = <String, List<Schedule>>{};
      for (final entry in results) {
        schedules[entry.key] = entry.value;
      }
      controller.loanSchedules.addAll(schedules);
    } catch (e) {
      print('⚠️ Error fetching schedules: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final member = Get.find<MemberController>().currentCustomer.value;
    //
    final accounts = (member.Accounts ?? [])
        .where((a) =>
            a.Product_Category == null) // null = savings, non-null = loan
        .toList();
    final loans = (member.Loans ?? [])
        .where((l) => (l.Outstanding_Balance ?? 0) > 0)
        .toList();

    // Summary counts
    final totalPortfolio =
        accounts.fold<double>(0, (sum, a) => sum + (a.Balance ?? 0));

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      resizeToAvoidBottomInset: false,
      body: Column(
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
                // Member name + drawer icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.menu, color: Colors.white, size: 28),
                      onPressed: () {
                        final outerScaffold =
                            context.findAncestorStateOfType<ScaffoldState>();
                        outerScaffold?.openDrawer();
                      },
                    ),
                  ],
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
                  child: _accountCard(context, acc, member),
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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: loans.length,
                itemBuilder: (context, index) {
                  return _loanListTile(context, loans[index]);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

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
  Widget _accountCard(BuildContext context, Account acc, Member member) {
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
              Flexible(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE91E8C).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    acc.Name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color(0xFFE91E8C),
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
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
            onTap: () => _onAccountTap(context, acc, member),
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

  // ── Helper: loan list tile ─────────────────────────────────────
  Widget _loanListTile(BuildContext context, loan) {
    final String loanName = (loan.Loan_Product_Type_Name ??
        loan.Loan_Name ??
        loan.Loan_Product_Type ??
        'Loan');
    final double outstanding = loan.Outstanding_Balance ?? 0;
    final double approved = loan.Approved_Amount ?? 0;
    final int installments = loan.Installments ?? 0;

    // Look up schedule from controller and calculate arrears
    final controller = Get.find<MemberController>();
    final schedules = controller.loanSchedules[loan.Loan_No];
    final double arrears = Schedule.calculateArrears(
      schedules,
      approvedAmount: approved,
      outstandingBalance: outstanding,
    );

    return Card(
      color: arrears > 0 ? const Color(0xFFFFF3F0) : null,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: arrears > 0
            ? const BorderSide(color: Color(0xFFFFCDD2), width: 1)
            : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          final member = controller.currentCustomer.value;
          _onLoanTap(context, loan, member);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      loanName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Pay button
                      GestureDetector(
                        onTap: () {
                          final cart = Get.find<PaymentCartController>();
                          cart.addItem(PaymentItem(
                            label: loanName,
                            loanNo: loan.Loan_No,
                            type: 'loan',
                            amount: 0,
                          ));
                          MotionToast.success(
                            description:
                                Text('$loanName added to payment cart'),
                            title: const Text('Payment'),
                          ).show(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add,
                                  size: 14, color: Color(0xFF2E7D32)),
                              SizedBox(width: 2),
                              Text('Pay',
                                  style: TextStyle(
                                      color: Color(0xFF2E7D32),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      ),
                      if (arrears > 0)
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Arrears: ${utilities.formatcurrency.format(arrears)}',
                            style: const TextStyle(
                                color: Color(0xFFD32F2F),
                                fontSize: 10,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          loan.Loan_No ?? '',
                          style: const TextStyle(
                              color: Color(0xFF2E7D32),
                              fontSize: 11,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  if (approved > 0)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Approved',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11)),
                          Text(
                            utilities.formatcurrency.format(approved),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  if (installments > 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Terms',
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        Text('$installments mo',
                            style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Navigate on loan tap ──────────────────────────────────────
  void _onLoanTap(BuildContext context, loan, Member member) async {
    final loanNo = loan.Loan_No ?? '';
    final loanName = (loan.Loan_Product_Type_Name ??
        loan.Loan_Name ??
        loan.Loan_Product_Type ??
        'Loan');
    final title = '$loanName [$loanNo]';

    // Show loading indicator
    Get.to(() => Master(
          member: member,
          widgets: const Center(child: CircularProgressIndicator()),
          title: title,
        ));

    // Fetch loan ledger entries with loan number and transaction type filter
    final body = json.encode({
      'Acc': member.No,
      'Loan_No': loanNo,
      'Transaction_Type': '2|3|5|6|9|23',
    });
    final r = await ApiClient().postdata('Statement', body);
    List<entries>? fetchedEntries;
    if (r.statusCode == 200) {
      final results = Results3<entries>.fromJson(r.body, entries.fromMap);
      if (results.Code == 0) {
        fetchedEntries = results.Contents;
      }
    }

    if (fetchedEntries != null) {
      final loanEntries =
          fetchedEntries.where((e) => e.Loan_No == loanNo).toList();
      final balanced = entries().calculateRunningBalance(loanEntries);
      Get.back(); // remove loading
      Get.to(() => Master(
            member: member,
            widgets: LoanLedgerEntries(items: balanced, loan: loan),
            title: title,
          ));
    } else {
      Get.back(); // remove loading
      if (context.mounted) {
        MotionToast.error(
          description: const Text('Failed to load loan transactions.'),
          title: const Text('Error'),
        ).show(context);
      }
    }
  }

  // ── Navigate on account tap ────────────────────────────────────
  void _onAccountTap(BuildContext context, Account acc, Member member) async {
    final title =
        '${acc.Name ?? acc.Product_Name ?? 'Account'} [Bal: ${utilities.formatcurrency.format(acc.Balance ?? 0)}]';
    final currentMember = Get.find<MemberController>().currentCustomer.value;

    if (acc.Name == 'Loans') {
      Get.to(() => Master(
            member: currentMember,
            widgets: loans_page(member: currentMember),
            title: title,
          ));
      return;
    }

    // Show loading indicator while fetching
    Get.to(() => Master(
          member: currentMember,
          widgets: const Center(child: CircularProgressIndicator()),
          title: title,
        ));

    // Fetch entries on demand with transaction type filter from API
    String accNo = member.No ?? '';
    final txType = acc.transaction_Type;
    print('🔍 Dashboard tap: accNo=$accNo, txType=$txType, name=${acc.Name}');
    final fetchedEntries =
        await entries().fetchEntries(account: accNo, transactionType: txType);

    if (fetchedEntries != null) {
      final balanced = entries().calculateRunningBalance(fetchedEntries);
      Get.back(); // remove loading page
      Get.to(() => Master(
            member: currentMember,
            widgets: Ledgerentries(Entries: balanced),
            title: title,
          ));
    } else {
      Get.back(); // remove loading page
      MotionToast.error(
        description: const Text('Failed to load transactions.'),
        title: const Text('Error'),
      ).show(context);
    }
  }
}
