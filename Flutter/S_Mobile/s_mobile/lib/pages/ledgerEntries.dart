import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/entries.dart';

import '../common/widgets.dart';

class Ledgerentries extends StatefulWidget {
  const Ledgerentries({
    Key? key,
    required this.Entries,
  }) : super(key: key);

  final List<entries>? Entries;

  @override
  State<Ledgerentries> createState() => _ledgerentries();
}

class _ledgerentries extends State<Ledgerentries> {
  @override
  Widget build(BuildContext context) {
    final items = widget.Entries ?? [];

    if (items.isEmpty) {
      return Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          decoration: widgets().backgroundimage(context),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.receipt_long_outlined, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No transactions found',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
          ),
        ),
      );
    }

    final totalCredit = items.fold<double>(0, (s, e) => s + (e.Credit ?? 0));
    final totalDebit = items.fold<double>(0, (s, e) => s + (e.Debit ?? 0));

    return Scaffold(
      //appBar: _buildAppBar(context),
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
                  _summaryChip('Debit', totalDebit, Colors.red.shade100),
                  const SizedBox(width: 12),
                  _summaryChip('Credit', totalCredit, Colors.green.shade100),
                  const Spacer(),
                  Text('${items.length} entries',
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            // ── Entry list ───────────────────────────────
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                itemCount: items.length,
                itemBuilder: (context, index) => _entryCard(items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryChip(String label, double amount, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.2),
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
                  fontSize: 15,
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
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Date
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
            // Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.Description ??
                        entry.Transaction_Type?.description ??
                        '',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (entry.Document_No != null)
                    Text(entry.Document_No!,
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.shade500)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Amounts
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
                Text(utilities.formatcurrency.format(entry.Balance ?? 0),
                    style:
                        TextStyle(fontSize: 10, color: Colors.grey.shade500)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      leading: IconButton(
        icon:
            const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text('Transactions',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
