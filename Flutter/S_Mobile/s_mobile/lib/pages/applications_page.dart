import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/members/controller.dart';

/// Shows the member's latest loan application and its processing status
/// (Open / Pending / Approved / Rejected).
class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({super.key});

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  bool _loading = true;
  Map<String, dynamic>? _application;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final controller = Get.find<MemberController>();
      final phone = controller.loginPhone ??
          controller.currentCustomer.value.Mobile_Phone_No ??
          '';
      final api = ApiClient()..baseUrl = AppConfig.apsUrl;
      final r = await api.postdata(
          'applications', json.encode({'body': phone}));
      if (r.statusCode == 200) {
        final result = json.decode(r.body) as Map<String, dynamic>;
        final content = result['content'] ?? result['Contents'];
        if (mounted) {
          setState(() {
            _application =
                content is Map<String, dynamic> ? content : null;
          });
        }
      } else {
        if (mounted) {
          setState(() => _error = 'Request failed (${r.statusCode}).');
        }
      }
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  static const _statusNames = ['Open', 'Pending', 'Approved', 'Rejected'];

  Color _statusColor(int? status) {
    switch (status) {
      case 1:
        return const Color(0xFFEF6C00); // Pending
      case 2:
        return const Color(0xFF2E7D32); // Approved
      case 3:
        return const Color(0xFFC62828); // Rejected
      default:
        return const Color(0xFF1565C0); // Open
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(onPressed: _fetch, child: const Text('Retry')),
            ],
          ),
        ),
      );
    }
    final app = _application;
    if (app == null) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.folder_open_outlined, size: 56, color: Colors.grey),
            SizedBox(height: 12),
            Text('No loan application found.',
                style: TextStyle(color: Colors.grey, fontSize: 15)),
          ],
        ),
      );
    }

    final status = (app['Status'] ?? app['status']) as int?;
    final statusName =
        status != null && status >= 0 && status < _statusNames.length
            ? _statusNames[status]
            : 'Unknown';
    final color = _statusColor(status);
    final docDate = DateTime.tryParse(
        (app['Document_Date'] ?? app['document_Date'] ?? '').toString());

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        app['No']?.toString() ?? 'Application',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          statusName,
                          style: TextStyle(
                              color: color,
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _row('Applicant',
                      app['Customer_Name']?.toString() ?? '-'),
                  _row('ID No', app['Customer_ID_No']?.toString() ?? '-'),
                  _row('Mobile',
                      app['MPESA_Mobile_No']?.toString() ?? '-'),
                  _row(
                      'Date',
                      docDate != null
                          ? DateFormat('dd/MM/yyyy').format(docDate)
                          : '-'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Application processing is handled by the SACCO. Status updates appear here once the credit team reviews your application.',
            style: TextStyle(fontSize: 12.5, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            onPressed: _fetch,
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 90,
              child: Text(label,
                  style: TextStyle(
                      fontSize: 13, color: Colors.grey.shade600))),
          Expanded(
              child: Text(value,
                  style: const TextStyle(
                      fontSize: 13.5, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}
