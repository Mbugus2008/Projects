import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:s_mobile/Loans/Loan.dart';
import 'package:s_mobile/Loans/Schedule.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/controller.dart' show MemberController;
import 'package:s_mobile/members/entries.dart' show entries;

class LoanLedgerEntries extends StatefulWidget {
  const LoanLedgerEntries({
    super.key,
    required this.items,
    required this.loan,
  });

  final List<entries>? items;
  final Loan loan;

  @override
  State<LoanLedgerEntries> createState() => _LoanLedgerEntriesState();
}

class _LoanLedgerEntriesState extends State<LoanLedgerEntries>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  List<Schedule>? _schedule;
  bool _loadingSchedule = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadSchedule();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadSchedule() async {
    final loanNo = widget.loan.Loan_No;
    if (loanNo == null || loanNo.isEmpty) return;

    final cached = Get.find<MemberController>().loanSchedules[loanNo];
    if (cached != null) {
      if (mounted) setState(() => _schedule = cached);
      return;
    }

    setState(() => _loadingSchedule = true);
    final fetched = await Schedule.fetchForLoan(loanNo);
    if (mounted) {
      setState(() {
        _schedule = fetched;
        _loadingSchedule = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = widget.items ?? [];
    final totalCredit = list.fold<double>(0, (s, e) => s + (e.Credit ?? 0));
    final totalDebit = list.fold<double>(0, (s, e) => s + (e.Debit ?? 0));
    final outstanding = widget.loan.Outstanding_Balance ?? 0;
    final approved = widget.loan.Approved_Amount ?? 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.loan.Loan_Product_Type_Name ?? 'Loan',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(widget.loan.Loan_No ?? '',
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _chip(
                        'Outstanding',
                        utilities.formatcurrency.format(outstanding),
                        Colors.red.shade100),
                    const SizedBox(width: 10),
                    _chip('Approved', utilities.formatcurrency.format(approved),
                        Colors.green.shade100),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade700,
              labelStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: 'Entries'),
                Tab(text: 'Schedule'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildEntriesTab(list, totalCredit, totalDebit),
                _buildScheduleTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEntriesTab(
      List<entries> list, double totalCredit, double totalDebit) {
    if (list.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 12),
            Text('No transactions found',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text('Cr: ${utilities.formatcurrency.format(totalCredit)}',
                  style: const TextStyle(
                      color: Color(0xFF2E7D32),
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              const SizedBox(width: 16),
              Text('Dr: ${utilities.formatcurrency.format(totalDebit)}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              const Spacer(),
              Text('${list.length} entries',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: list.length,
            itemBuilder: (_, i) => _entryCard(list[i]),
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleTab() {
    if (_loadingSchedule) {
      return const Center(child: CircularProgressIndicator());
    }
    final schedule = _schedule;
    if (schedule == null || schedule.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.schedule, size: 48, color: Colors.grey),
            SizedBox(height: 12),
            Text('No schedule data',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
          ],
        ),
      );
    }

    final now = DateTime.now();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      itemCount: schedule.length,
      itemBuilder: (_, i) => _scheduleCard(schedule[i], now),
    );
  }

  Widget _scheduleCard(Schedule s, DateTime now) {
    final isPaid = s.Paid == true;
    final isPastDue =
        !isPaid && s.Repayment_Date != null && s.Repayment_Date!.isBefore(now);

    final Color statusColor = isPaid
        ? const Color(0xFF2E7D32)
        : isPastDue
            ? const Color(0xFFD32F2F)
            : Colors.grey;
    final String status = isPaid
        ? 'PAID'
        : isPastDue
            ? 'OVERDUE'
            : 'DUE';

    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      color: isPastDue ? const Color(0xFFFFF3F0) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
            color: isPastDue ? const Color(0xFFFFCDD2) : Colors.transparent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isPaid
                    ? const Color(0xFFE8F5E9)
                    : isPastDue
                        ? const Color(0xFFFFEBEE)
                        : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text('${s.Instalment_No ?? '?'}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: statusColor)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.Repayment_Date != null
                        ? DateFormat('dd MMM yyyy').format(s.Repayment_Date!)
                        : 'No date',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Pr: ${utilities.formatcurrency.format(s.Principal_Repayment ?? 0)}  Int: ${utilities.formatcurrency.format(s.Monthly_Interest ?? 0)}',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  utilities.formatcurrency.format(s.Monthly_Repayment ?? 0),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isPastDue ? const Color(0xFFD32F2F) : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: isPaid
                        ? const Color(0xFFE8F5E9)
                        : isPastDue
                            ? const Color(0xFFFFEBEE)
                            : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(status,
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: statusColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, String value, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 9)),
          const SizedBox(height: 1),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _entryCard(entries entry) {
    final isCredit = (entry.Credit ?? 0) > 0;
    final isDebit = (entry.Debit ?? 0) > 0;
    final amount = entry.Amount ?? 0;
    final Color accentColor = isCredit
        ? const Color(0xFF2E7D32)
        : isDebit
            ? Colors.red
            : Colors.grey;

    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: 62,
              child: Column(
                children: [
                  Text(
                    DateFormat('dd')
                        .format(entry.Posting_Date ?? DateTime.now()),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32)),
                  ),
                  Text(
                    DateFormat('MMM yy')
                        .format(entry.Posting_Date ?? DateTime.now()),
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.Description ?? '',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                  if (entry.Document_No != null)
                    Text(entry.Document_No!,
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.shade500)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isCredit)
                  Text('+${utilities.formatcurrency.format(entry.Credit ?? 0)}',
                      style: const TextStyle(
                          color: Color(0xFF2E7D32),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                if (isDebit)
                  Text('-${utilities.formatcurrency.format(entry.Debit ?? 0)}',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                if (!isCredit && !isDebit)
                  Text(utilities.formatcurrency.format(amount),
                      style: TextStyle(
                          color: accentColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                if (entry.Balance != null)
                  Text(
                      'Bal: ${utilities.formatcurrency.format(entry.Balance ?? 0)}',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
