import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:s_mobile/Loans/Schedule.dart';
import 'package:s_mobile/common/notifications.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/controller.dart';

/// In-app alerts feed built from the member's current data — overdue loans,
/// upcoming repayments and recent account credits. Can also raise a device
/// notification.
class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertItem {
  final IconData icon;
  final Color color;
  final String title;
  final String body;

  _AlertItem(this.icon, this.color, this.title, this.body);
}

class _AlertsPageState extends State<AlertsPage> {
  List<_AlertItem> _build() {
    final controller = Get.find<MemberController>();
    final member = controller.currentCustomer.value;
    final alerts = <_AlertItem>[];
    final now = DateTime.now();

    // Loans — overdue and upcoming repayments
    for (final loan in member.Loans ?? []) {
      if ((loan.Outstanding_Balance ?? 0) <= 0) continue;
      final schedule =
          controller.loanSchedules[loan.Loan_No] ?? const <Schedule>[];
      final unpaid = schedule.where((s) => s.Paid != true).toList()
        ..sort((a, b) => (a.Repayment_Date ?? DateTime(2100))
            .compareTo(b.Repayment_Date ?? DateTime(2100)));
      final overdue = unpaid
          .where((s) => (s.Repayment_Date ?? DateTime(2100)).isBefore(now))
          .toList();
      if (overdue.isNotEmpty) {
        final amt =
            overdue.fold<double>(0, (s, e) => s + (e.Monthly_Repayment ?? 0));
        alerts.add(_AlertItem(
          Icons.warning_amber_rounded,
          const Color(0xFFC62828),
          'Loan ${loan.Loan_No ?? ''} is overdue',
          '${overdue.length} instalment(s) overdue — ${utilities.formatcurrency.format(amt)}. Please repay to avoid penalties.',
        ));
      }
      if (unpaid.isNotEmpty) {
        final next = unpaid.first;
        if (!(next.Repayment_Date ?? now).isBefore(now)) {
          alerts.add(_AlertItem(
            Icons.event_available_outlined,
            const Color(0xFFEF6C00),
            'Upcoming repayment — ${loan.Loan_No ?? ''}',
            'Next instalment of ${utilities.formatcurrency.format(next.Monthly_Repayment ?? 0)} due on ${next.Repayment_Date != null ? DateFormat('dd/MM/yyyy').format(next.Repayment_Date!) : '-'}.',
          ));
        }
      }
    }

    // Recent credits
    final recentCredits =
        (member.Entries ?? []).where((e) => (e.Credit ?? 0) > 0).take(3);
    for (final e in recentCredits) {
      alerts.add(_AlertItem(
        Icons.arrow_downward_rounded,
        const Color(0xFF2E7D32),
        'Money received',
        '${utilities.formatcurrency.format(e.Credit ?? 0)} credited on ${e.Posting_Date != null ? DateFormat('dd/MM/yyyy').format(e.Posting_Date!) : ''} — ${e.Description ?? ''}',
      ));
    }

    return alerts;
  }

  @override
  Widget build(BuildContext context) {
    final alerts = _build();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
              'Alerts are generated from your loans and recent account activity.',
              style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 14),
          if (alerts.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Icon(Icons.notifications_off_outlined,
                      size: 56, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('No alerts right now.',
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                ],
              ),
            )
          else
            ...alerts.map((a) => Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: a.color.withOpacity(0.12),
                      child: Icon(a.icon, color: a.color, size: 20),
                    ),
                    title: Text(a.title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child:
                          Text(a.body, style: const TextStyle(fontSize: 12.5)),
                    ),
                  ),
                )),
          if (alerts.isNotEmpty) ...[
            const SizedBox(height: 8),
            FilledButton.icon(
              onPressed: () async {
                await NotificationService.show(
                  'Baraka Yetu — ${alerts.length} alert(s)',
                  alerts.first.title,
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Notification posted to your device.')),
                  );
                }
              },
              icon: const Icon(Icons.notifications_active_outlined),
              label: const Text('Notify me now'),
            ),
          ],
        ],
      ),
    );
  }
}
