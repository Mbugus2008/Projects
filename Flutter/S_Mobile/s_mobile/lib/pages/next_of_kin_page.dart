import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

import '../members/controller.dart';
import '../members/next_of_kin.dart';
import 'next_of_kin_edit.dart';

class NextOfKinPage extends StatefulWidget {
  const NextOfKinPage({super.key});

  @override
  State<NextOfKinPage> createState() => _NextOfKinPageState();
}

class _NextOfKinPageState extends State<NextOfKinPage> {
  List<NextOfKin> _kins = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _loading = true);
    try {
      final memberNo =
          Get.find<MemberController>().currentCustomer.value.No ?? '';
      final r = await http.post(
        Uri.parse('https://services.trimline.co.ke/Aps/api/getnextofkin'),
        headers: {
          'Content-Type': 'application/json',
          'X-Client-Identifier': 'BarakaYetu',
        },
        body: json.encode({
          'body': json.encode({'No': memberNo}),
        }),
      );

      if (r.statusCode == 200) {
        final result = json.decode(r.body) as Map<String, dynamic>;
        final code = result['Code'] ?? result['code'] as int?;
        if (code == 0) {
          setState(() => _kins = NextOfKin.parseList(result['Contents'] ?? []));
        } else {
          setState(() => _kins = []);
        }
      }
    } catch (e) {
      if (mounted) {
        MotionToast.error(
          description: Text(e.toString()),
          title: const Text('Next of Kin'),
        ).show(context);
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_kins.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No next of kin found.',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _kins.length,
      itemBuilder: (_, i) {
        final k = _kins[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    backgroundColor: const Color(0xFFF5F5F0),
                    appBar: AppBar(
                      title: const Text('Edit Next of Kin'),
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                    ),
                    body: NextOfKinEditPage(
                      kin: k,
                      memberNo: Get.find<MemberController>()
                              .currentCustomer
                              .value
                              .No ??
                          '',
                    ),
                  ),
                ),
              );
              if (result == true) _fetch();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFF2E7D32),
                        child: Text(
                          (k.Name ?? '?').substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(k.Name ?? '',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Text(k.Relationship ?? '',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                      ),
                      if (k.PercentAllocation != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${k.PercentAllocation!.toStringAsFixed(0)}%',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E7D32)),
                          ),
                        ),
                    ],
                  ),
                  if (k.Telephone != null ||
                      k.Email != null ||
                      k.Address != null)
                    const Divider(height: 24),
                  if (k.Telephone != null) _infoRow(Icons.phone, k.Telephone!),
                  if (k.Email != null) _infoRow(Icons.email_outlined, k.Email!),
                  if (k.Address != null)
                    _infoRow(Icons.home_outlined, k.Address!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF2E7D32)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
