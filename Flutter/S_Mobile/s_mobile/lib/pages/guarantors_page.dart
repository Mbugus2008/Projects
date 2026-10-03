import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/members/controller.dart';

const _green = Color(0xFF3AA852);
const _pink = Color(0xFFC62A90);

String _money(num? v) {
  final d = (v ?? 0).toDouble();
  final s = d.abs().toStringAsFixed(2);
  final parts = s.split('.');
  final intPart = parts[0];
  final buf = StringBuffer();
  for (int i = 0; i < intPart.length; i++) {
    if (i > 0 && (intPart.length - i) % 3 == 0) buf.write(',');
    buf.write(intPart[i]);
  }
  final sign = d < 0 ? '-' : '';
  return '$sign${buf.toString()}.${parts[1]}';
}

/// Guarantors & Guaranteed Loans.
///
/// Tab 1 – loans/members this member has guaranteed.
/// Tab 2 – guarantors backing this member's own loans.
class GuarantorsPage extends StatefulWidget {
  const GuarantorsPage({super.key});

  @override
  State<GuarantorsPage> createState() => _GuarantorsPageState();
}

class _GuarantorsPageState extends State<GuarantorsPage> {
  bool _loading = true;
  String? _error;
  String? _bufferNote;
  int _tab = 0;

  List<Map<String, dynamic>> _guaranteed = [];
  List<Map<String, dynamic>> _myGuarantors = [];
  List<Map<String, dynamic>> _securities = [];
  List<Map<String, dynamic>> _memberSecurities = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final member = Get.find<MemberController>().currentCustomer.value;
      final memberNo = member.No ?? '';
      if (memberNo.isEmpty) {
        throw Exception('Member number is not available.');
      }
      final api = ApiClient()..baseUrl = AppConfig.apsUrl;
      final r =
          await api.postdata('guarantors', json.encode({'Account': memberNo}));
      final body = json.decode(r.body) as Map<String, dynamic>;
      final code = body['Code'] ?? -1;
      if (code != 0) {
        throw Exception(body['Desc'] ?? 'Unable to load guarantors.');
      }
      final c = (body['Contents'] ?? <String, dynamic>{})
          as Map<String, dynamic>;
      _guaranteed = _toList(c['guaranteed']);
      _myGuarantors = _toList(c['myGuarantors']);
      _securities = _toList(c['securities']);
      _memberSecurities = _toList(c['memberSecurities']);
      final be = c['bufferError']?.toString();
      _bufferNote = (be != null && be.isNotEmpty)
          ? 'Live guarantor requests are temporarily unavailable. Showing registered records only.'
          : null;
    } catch (e) {
      _error = e.toString().replaceFirst('Exception: ', '');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  List<Map<String, dynamic>> _toList(dynamic v) => (v is List)
      ? v
          .whereType<Map>()
          .map((e) => e.cast<String, dynamic>())
          .toList()
      : [];

  num _heldOf(Map<String, dynamic> s) {
    final g = (s['amountGuaranteed'] as num?)?.toDouble() ?? 0;
    final r = (s['amountReleased'] as num?)?.toDouble() ?? 0;
    final h = g - r;
    return h > 0 ? h : 0;
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: CircularProgressIndicator(color: _green),
        ),
      );
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 44, color: Colors.red),
              const SizedBox(height: 12),
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: _green),
                onPressed: _load,
                child:
                    const Text('Retry', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      );
    }

    final totalGuaranteed = _securities.fold<num>(
        0, (t, s) => t + ((s['amountGuaranteed'] as num?) ?? 0));
    final totalReleased = _securities.fold<num>(
        0, (t, s) => t + ((s['amountReleased'] as num?) ?? 0));
    final totalHeld = _securities.fold<num>(0, (t, s) => t + _heldOf(s));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Your guarantees and the guarantors backing your loans.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _summaryCard(totalGuaranteed, totalReleased, totalHeld),
          if (_bufferNote != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF0D9A0)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline,
                      size: 18, color: Color(0xFFB8860B)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _bufferNote!,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF8A6D1A)),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 14),
          _toggleRow(),
          const SizedBox(height: 14),
          if (_tab == 0) ..._guaranteedTab() else ..._myGuarantorsTab(),
        ],
      ),
    );
  }

  Widget _summaryCard(num guaranteed, num released, num held) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [_green, _pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Guarantee Exposure',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5)),
          const SizedBox(height: 10),
          Row(
            children: [
              _stat('Guaranteed', guaranteed),
              _stat('Released', released),
              _stat('Held', held),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, num value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white70, fontSize: 10, letterSpacing: 0.8)),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text('KES ${_money(value)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _toggleRow() {
    Widget item(int i, String label, IconData icon) {
      final active = _tab == i;
      return Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _tab = i),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: active ? _green : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: active ? _green : const Color(0xFFDDDDDD)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,
                    size: 16,
                    color: active ? Colors.white : Colors.black54),
                const SizedBox(width: 6),
                Text(label,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: active ? Colors.white : Colors.black54)),
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        item(0, 'I Guaranteed', Icons.verified_user_outlined),
        const SizedBox(width: 10),
        item(1, 'My Guarantors', Icons.support_agent_outlined),
      ],
    );
  }

  // ── Tab 1: loans this member guaranteed ─────────────────────────
  List<Widget> _guaranteedTab() {
    final widgets = <Widget>[];
    if (_guaranteed.isNotEmpty) {
      widgets.add(_sectionLabel('Pending requests'));
      widgets.addAll(_guaranteed.map((g) => _bufferCard(g, asGuarantor: true)));
      widgets.add(const SizedBox(height: 8));
    }
    if (_securities.isNotEmpty) {
      widgets.add(_sectionLabel('Registered guarantees'));
      widgets.addAll(_securities.map(_securityCard));
    }
    if (widgets.isEmpty) {
      widgets.add(_emptyState(
          'You have not guaranteed any loans yet.', Icons.verified_user_outlined));
    }
    return widgets;
  }

  // ── Tab 2: guarantors backing this member's loans ───────────────
  List<Widget> _myGuarantorsTab() {
    final widgets = <Widget>[];
    if (_myGuarantors.isNotEmpty) {
      widgets.add(_sectionLabel('My loan guarantors'));
      widgets.addAll(
          _myGuarantors.map((g) => _bufferCard(g, asGuarantor: false)));
      widgets.add(const SizedBox(height: 8));
    }
    if (_memberSecurities.isNotEmpty) {
      widgets.add(_sectionLabel('Registered on my loans'));
      widgets.addAll(_memberSecurities.map(_securityCard));
    }
    if (widgets.isEmpty) {
      widgets.add(_emptyState('No guarantors have been recorded on your loans.',
          Icons.support_agent_outlined));
    }
    return widgets;
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 2),
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
              letterSpacing: 0.8)),
    );
  }

  Widget _emptyState(String message, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.black26),
          const SizedBox(height: 10),
          Text(message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _bufferCard(Map<String, dynamic> g, {required bool asGuarantor}) {
    final name = (g['guarantorName'] ?? g['guarantorMemberNo'] ?? '')
        .toString()
        .trim();
    final amount = (g['amount'] as num?)?.toDouble() ?? 0;
    final status = g['status']?.toString();
    final createdOn = g['createdOn']?.toString();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Loan ${g['loanNo'] ?? '-'}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              _statusChip(status),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            asGuarantor
                ? 'Guarantor: ${name.isEmpty ? (g['guarantorMemberNo'] ?? '-') : name}'
                : 'Loan account: ${g['loaneeAccountNo'] ?? '-'}',
            style: const TextStyle(fontSize: 12.5, color: Colors.black87),
          ),
          if (!asGuarantor)
            Text('Guarantor no: ${g['guarantorMemberNo'] ?? '-'}',
                style: const TextStyle(fontSize: 12.5, color: Colors.black54)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('KES ${_money(amount)}',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _green)),
              const Spacer(),
              if (createdOn != null && !createdOn.startsWith('0001'))
                Text(createdOn,
                    style:
                        const TextStyle(fontSize: 11, color: Colors.black38)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _securityCard(Map<String, dynamic> s) {
    final guaranteed = (s['amountGuaranteed'] as num?)?.toDouble() ?? 0;
    final released = (s['amountReleased'] as num?)?.toDouble() ?? 0;
    final held = _heldOf(s);
    final loans = s['noOfLoansGuaranteed'];
    final date = s['date']?.toString();
    final title = (s['name']?.toString().trim().isNotEmpty ?? false)
        ? s['name'].toString()
        : (s['securityNo'] ?? '-').toString();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: held > 0
                      ? const Color(0x1A3AA852)
                      : const Color(0x1AC62A90),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  held > 0 ? 'Held KES ${_money(held)}' : 'Fully released',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: held > 0 ? _green : _pink),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text('Security No: ${s['securityNo'] ?? '-'}',
              style: const TextStyle(fontSize: 12.5, color: Colors.black54)),
          if ((s['memberGuaranteed']?.toString().trim().isNotEmpty ?? false))
            Text('Member guaranteed: ${s['memberGuaranteed']}',
                style: const TextStyle(fontSize: 12.5, color: Colors.black54)),
          const SizedBox(height: 8),
          Row(
            children: [
              _miniStat('Guaranteed', guaranteed),
              _miniStat('Released', released),
              if (loans != null) _countStat('Loans', loans.toString()),
            ],
          ),
          if (date != null && !date.startsWith('0001')) ...[
            const SizedBox(height: 6),
            Text(date,
                style: const TextStyle(fontSize: 11, color: Colors.black38)),
          ],
        ],
      ),
    );
  }

  Widget _miniStat(String label, num value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(),
              style: const TextStyle(
                  fontSize: 9.5, color: Colors.black45, letterSpacing: 0.6)),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text('KES ${_money(value)}',
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _countStat(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(),
              style: const TextStyle(
                  fontSize: 9.5, color: Colors.black45, letterSpacing: 0.6)),
          const SizedBox(height: 2),
          Text(value,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _statusChip(String? status) {
    final s = (status ?? '').trim();
    Color color;
    switch (s.toLowerCase()) {
      case 'approved':
        color = _green;
        break;
      case 'rejected':
        color = Colors.red;
        break;
      case 'open':
      case '':
        color = Colors.orange;
        break;
      default:
        color = Colors.blueGrey;
    }
    final label = s.isEmpty ? 'Pending' : s;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600, color: color)),
    );
  }
}
