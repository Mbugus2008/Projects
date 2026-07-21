import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';

import '../members/controller.dart';
import '../members/member.dart';

class MemberEditPage extends StatefulWidget {
  final Member member;
  const MemberEditPage({super.key, required this.member});

  @override
  State<MemberEditPage> createState() => _MemberEditPageState();
}

class _MemberEditPageState extends State<MemberEditPage> {
  late final TextEditingController nameCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController dobCtrl;
  late final TextEditingController kraPinCtrl;
  late final TextEditingController maritalStatusCtrl;
  late final TextEditingController addressCtrl;
  String? _gender;
  String? _maritalStatus;
  bool _saving = false;
  String? _imageBase64;
  Uint8List? _imageBytes;
  bool _loadingPicture = false;

  @override
  void initState() {
    super.initState();
    final m = widget.member;
    nameCtrl = TextEditingController(text: m.Name ?? '');
    emailCtrl = TextEditingController(text: m.E_Mail ?? '');
    dobCtrl = TextEditingController(
        text: m.Date_of_Birth != null
            ? '${m.Date_of_Birth!.day}/${m.Date_of_Birth!.month}/${m.Date_of_Birth!.year}'
            : '');
    kraPinCtrl = TextEditingController(text: m.KRA_Pin ?? '');
    maritalStatusCtrl = TextEditingController(text: m.Marital_Status ?? '');
    addressCtrl = TextEditingController(text: m.Address ?? '');
    final g = m.Gender;
    _gender = g?.name ?? '';
    _maritalStatus = m.Marital_Status;
    _loadPicture();
  }

  Future<void> _loadPicture() async {
    setState(() => _loadingPicture = true);
    try {
      final r = await http.post(
        Uri.parse(
            'https://services.trimline.co.ke/Aps/api/getmemberpicture'),
        headers: {
          'Content-Type': 'application/json',
          'X-Client-Identifier': 'BarakaYetu',
        },
        body: json.encode({
          'body': json.encode({'No': widget.member.No}),
        }),
      );
      if (r.statusCode == 200) {
        final result = json.decode(r.body) as Map<String, dynamic>;
        if (result['Code'] == 0 && result['Contents'] != null) {
          final b64 = result['Contents'] as String;
          setState(() {
            _imageBase64 = b64;
            _imageBytes = base64Decode(b64);
            _loadingPicture = false;
          });
          return;
        }
      }
    } catch (_) {}
    if (mounted) setState(() => _loadingPicture = false);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      imageQuality: 80,
    );
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageBase64 = base64Encode(bytes);
      });
    }
  }

  Future<void> _uploadPicture() async {
    if (_imageBase64 == null) return;
    try {
      await http.post(
        Uri.parse(
            'https://services.trimline.co.ke/Aps/api/setmemberpicture'),
        headers: {
          'Content-Type': 'application/json',
          'X-Client-Identifier': 'BarakaYetu',
        },
        body: json.encode({
          'body': json.encode({
            'No': widget.member.No,
            'ImageBase64': _imageBase64,
          }),
        }),
      );
    } catch (_) {}
  }

  String _cleanPhone(String? phone) {
    if (phone == null || phone.isEmpty) return '';
    return phone.replaceFirst('+254', '0');
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    dobCtrl.dispose();
    kraPinCtrl.dispose();
    maritalStatusCtrl.dispose();
    addressCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);

    try {
      final updateBody = json.encode({
        'No': widget.member.No,
        'Name': nameCtrl.text.trim(),
        'E_Mail': emailCtrl.text.trim(),
        'Gender': _gender,
        if (dobCtrl.text.isNotEmpty) 'Date_of_Birth': dobCtrl.text.trim(),
        'Pin': kraPinCtrl.text.trim(),
        'Marital_Status': _maritalStatus,
        'Address': addressCtrl.text.trim(),
      });

      // Call Client_Service directly (wrap in body as expected by ClientRequest)
      const clientUrl = 'https://services.trimline.co.ke/Aps/api/updatemember';
      final r = await http.post(
        Uri.parse(clientUrl),
        headers: {
          'Content-Type': 'application/json',
          'X-Client-Identifier': 'BarakaYetu',
        },
        body: json.encode({'body': updateBody}),
      );

      if (!mounted) return;

      if (r.statusCode == 200) {
        final result = json.decode(r.body) as Map<String, dynamic>;
        final code = result['Code'] ?? result['code'] as int?;
        if (code == 0) {
          // Refresh member data
          final controller = Get.find<MemberController>();
          final phone = controller.loginPhone;
          if (phone != null && phone.isNotEmpty) {
            final refreshReq = Params(Phone: phone);
            final refreshR =
                await ApiClient().postdata('member', refreshReq.toJson());
            if (refreshR.statusCode == 200) {
              final results =
                  Results2<Member>.fromJson(refreshR.body, Member.fromMap);
              if (results.Code == 0 && results.Contents != null) {
                controller.currentCustomer.value = results.Contents!;
              }
            }
          }

          if (mounted) {
            _uploadPicture(); // Fire-and-forget picture upload
            MotionToast.success(
              description: const Text('Profile updated successfully.'),
              title: const Text('Profile'),
            ).show(context);
            Navigator.pop(context);
          }
          return;
        }
      }

      if (mounted) {
        MotionToast.error(
          description: const Text('Failed to update profile.'),
          title: const Text('Profile'),
        ).show(context);
      }
    } catch (e) {
      if (mounted) {
        MotionToast.error(
          description: Text(e.toString()),
          title: const Text('Profile'),
        ).show(context);
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.member;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Profile Picture
          Center(
            child: GestureDetector(
              onTap: _pickImage,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        const Color(0xFF2E7D32).withOpacity(0.1),
                    backgroundImage: _imageBytes != null
                        ? MemoryImage(_imageBytes!)
                        : null,
                    child: _imageBytes == null
                        ? Icon(Icons.person,
                            size: 50,
                            color: const Color(0xFF2E7D32)
                                .withOpacity(0.5))
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFF2E7D32),
                      child: const Icon(Icons.camera_alt,
                          size: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Member No (read-only)
          Card(
            child: ListTile(
              leading: const Icon(Icons.credit_card, color: Color(0xFF2E7D32)),
              title: const Text('Member No'),
              subtitle: Text(m.No ?? '', style: const TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 16),

          // Name
          _buildField('Full Name', Icons.person, nameCtrl),
          const SizedBox(height: 12),

          // Email
          _buildField('Email', Icons.email_outlined, emailCtrl,
              hint: 'email@example.com'),
          const SizedBox(height: 12),

          // KRA Pin
          _buildField('KRA Pin', Icons.article_outlined, kraPinCtrl,
              hint: 'e.g. A012345678Z'),
          const SizedBox(height: 12),

          // Marital Status
          DropdownButtonFormField<String>(
            value: _maritalStatus,
            decoration: InputDecoration(
              labelText: 'Marital Status',
              prefixIcon:
                  const Icon(Icons.favorite_outline, color: Color(0xFF2E7D32)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.white,
            ),
            items: const [
              DropdownMenuItem(value: '', child: Text('')),
              DropdownMenuItem(value: 'Single', child: Text('Single')),
              DropdownMenuItem(value: 'Married', child: Text('Married')),
              DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
              DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
            ],
            onChanged: (v) => setState(() => _maritalStatus = v),
          ),
          const SizedBox(height: 12),

          // Address
          _buildField('Address', Icons.home_outlined, addressCtrl,
              hint: 'e.g. 123 Main St, Nairobi'),
          const SizedBox(height: 12),

          // Date of Birth
          _buildField('Date of Birth', Icons.cake_outlined, dobCtrl,
              hint: 'DD/MM/YYYY', readOnly: true, onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime(1990),
              firstDate: DateTime(1940),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              dobCtrl.text = '${picked.day}/${picked.month}/${picked.year}';
            }
          }),
          const SizedBox(height: 12),

          // Gender
          DropdownButtonFormField<String>(
            value: _gender,
            decoration: InputDecoration(
              labelText: 'Gender',
              prefixIcon:
                  Icon(Icons.people_outline, color: const Color(0xFF2E7D32)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.white,
            ),
            items: const [
              DropdownMenuItem(value: '', child: Text('')),
              DropdownMenuItem(value: 'Male', child: Text('Male')),
              DropdownMenuItem(value: 'Female', child: Text('Female')),
            ],
            onChanged: (v) => setState(() => _gender = v),
          ),
          const SizedBox(height: 24),

          // Save button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
      {String? hint, bool readOnly = false, VoidCallback? onTap}) {
    return TextField(
      controller: ctrl,
      readOnly: readOnly,
      onTap: onTap,
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
