import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

import '../members/next_of_kin.dart';

class NextOfKinEditPage extends StatefulWidget {
  final NextOfKin kin;
  final String memberNo;
  const NextOfKinEditPage(
      {super.key, required this.kin, required this.memberNo});

  @override
  State<NextOfKinEditPage> createState() => _NextOfKinEditPageState();
}

class _NextOfKinEditPageState extends State<NextOfKinEditPage> {
  late final TextEditingController nameCtrl;
  late final TextEditingController phoneCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController addressCtrl;
  late final TextEditingController idNoCtrl;
  late final TextEditingController allocationCtrl;
  String? _relationship;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final k = widget.kin;
    nameCtrl = TextEditingController(text: k.Name ?? '');
    phoneCtrl = TextEditingController(text: k.Telephone ?? '');
    emailCtrl = TextEditingController(text: k.Email ?? '');
    addressCtrl = TextEditingController(text: k.Address ?? '');
    idNoCtrl = TextEditingController(text: k.ID_No ?? '');
    allocationCtrl = TextEditingController(
        text: k.PercentAllocation?.toStringAsFixed(0) ?? '');
    _relationship = k.Relationship;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    addressCtrl.dispose();
    idNoCtrl.dispose();
    allocationCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);

    try {
      final body = json.encode({
        'No': widget.memberNo,
        'Key': widget.kin.Key,
        'Account_No': widget.kin.Account_No,
        'Name': nameCtrl.text.trim(),
        'Relationship': _relationship ?? widget.kin.Relationship,
        'Telephone': phoneCtrl.text.trim(),
        'Email': emailCtrl.text.trim(),
        'Address': addressCtrl.text.trim(),
        'ID_No': idNoCtrl.text.trim(),
        'PercentAllocation': double.tryParse(allocationCtrl.text.trim()) ??
            (widget.kin.PercentAllocation ?? 0),
      });

      final r = await http.post(
        Uri.parse('https://services.trimline.co.ke/Aps/api/updatenextofkin'),
        headers: {
          'Content-Type': 'application/json',
          'X-Client-Identifier': 'BarakaYetu',
        },
        body: json.encode({'body': body}),
      );

      if (!mounted) return;

      if (r.statusCode == 200) {
        final result = json.decode(r.body) as Map<String, dynamic>;
        final code = result['Code'] ?? result['code'] as int?;
        if (code == 0) {
          if (mounted) {
            MotionToast.success(
              description: const Text('Next of kin saved.'),
              title: const Text('Next of Kin'),
            ).show(context);
            Navigator.pop(context, true);
          }
          return;
        }
        if (mounted) {
          MotionToast.error(
            description: Text(result['Desc']?.toString() ?? 'Failed'),
            title: const Text('Next of Kin'),
          ).show(context);
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
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildField('Full Name', Icons.person, nameCtrl),
          const SizedBox(height: 12),
          _buildField('Phone', Icons.phone, phoneCtrl),
          const SizedBox(height: 12),
          _buildField('Email', Icons.email_outlined, emailCtrl),
          const SizedBox(height: 12),
          _buildField('Address', Icons.home_outlined, addressCtrl),
          const SizedBox(height: 12),
          _buildField('ID Number', Icons.badge, idNoCtrl),
          const SizedBox(height: 12),
          _buildField('Allocation %', Icons.pie_chart_outline, allocationCtrl,
              hint: 'e.g. 25'),
          const SizedBox(height: 12),

          // Relationship dropdown
          DropdownButtonFormField<String>(
            value: _relationship,
            decoration: InputDecoration(
              labelText: 'Relationship',
              prefixIcon:
                  const Icon(Icons.family_restroom, color: Color(0xFF2E7D32)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.white,
            ),
            items: const [
              DropdownMenuItem(value: 'SON', child: Text('Son')),
              DropdownMenuItem(value: 'DAUGHTER', child: Text('Daughter')),
              DropdownMenuItem(value: 'SPOUSE', child: Text('Spouse')),
              DropdownMenuItem(value: 'BROTHER', child: Text('Brother')),
              DropdownMenuItem(value: 'SISTER', child: Text('Sister')),
              DropdownMenuItem(value: 'MOTHER', child: Text('Mother')),
              DropdownMenuItem(value: 'FATHER', child: Text('Father')),
              DropdownMenuItem(value: 'GUARDIAN', child: Text('Guardian')),
              DropdownMenuItem(value: 'FRIEND', child: Text('Friend')),
              DropdownMenuItem(value: 'OTHER', child: Text('Other')),
            ],
            onChanged: (v) => setState(() => _relationship = v),
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white),
                  )
                : const Text('Save Changes',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, IconData icon, TextEditingController ctrl,
      {String? hint}) {
    return TextField(
      controller: ctrl,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF2E7D32)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
