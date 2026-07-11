import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/common/widgets.dart';

import 'registration.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key, required this.phoneNo}) : super(key: key);
  final String phoneNo;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  bool _isSubmitting = false;

  // Controllers
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _idNoController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _employerController = TextEditingController();
  final _designationController = TextEditingController();
  final _payrollController = TextEditingController();
  final _pinController = TextEditingController();

  DateTime _dob = DateTime(1990, 1, 1);
  gender _gender = gender.Male;
  marital_Status _maritalStatus = marital_Status.Single;

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.phoneNo;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _lastNameController.dispose();
    _idNoController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _employerController.dispose();
    _designationController.dispose();
    _payrollController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
    );
    if (picked != null) {
      setState(() => _dob = picked);
    }
  }

  Future<void> _submitRegistration() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final reg = registration(
        First_Name: _firstNameController.text.trim(),
        Second_Name: _secondNameController.text.trim(),
        Last_Name: _lastNameController.text.trim(),
        Name:
            '${_firstNameController.text.trim()} ${_secondNameController.text.trim()} ${_lastNameController.text.trim()}',
        ID_No: _idNoController.text.trim(),
        Mobile_Phone_No: _phoneController.text.trim(),
        E_Mail: _emailController.text.trim(),
        Date_of_Birth: _dob,
        Gender: _gender,
        Marital_Status: _maritalStatus,
        Current_Address: _addressController.text.trim(),
        City: _cityController.text.trim(),
        Employer_Name: _employerController.text.trim(),
        Designation: _designationController.text.trim(),
        Payroll_No: _payrollController.text.trim(),
        P_I_N_Number: _pinController.text.trim(),
        Phone_No: _phoneController.text.trim(),
      );

      final response = await ApiClient().postdata('register', reg.toJson());

      if (!mounted) return;

      if (response.statusCode == 200) {
        final result = Results.fromJson(response.body);
        if (result.Code == 0) {
          MotionToast.success(
            description: Text(result.Desc ?? 'Registration successful!'),
            title: const Text('Registration'),
          ).show(context);
          Navigator.of(context).pop(true);
        } else {
          MotionToast.error(
            description: Text(result.Desc ?? 'Registration failed.'),
            title: const Text('Registration'),
          ).show(context);
        }
      } else {
        MotionToast.error(
          description: Text('Request failed (${response.statusCode}).'),
          title: const Text('Registration'),
        ).show(context);
      }
    } catch (e) {
      if (mounted) {
        MotionToast.error(
          description: Text(e.toString()),
          title: const Text('Registration'),
        ).show(context);
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widgets().backgroundimage(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Member Registration'),
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < 2) {
                setState(() => _currentStep++);
              } else {
                _submitRegistration();
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() => _currentStep--);
              } else {
                Navigator.of(context).pop();
              }
            },
            onStepTapped: (step) => setState(() => _currentStep = step),
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    if (_currentStep < 2)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        onPressed: details.onStepContinue,
                        child: const Text('Continue'),
                      ),
                    if (_currentStep == 2)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E7D32),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        onPressed:
                            _isSubmitting ? null : details.onStepContinue,
                        child: _isSubmitting
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 2),
                              )
                            : const Text('Submit Registration'),
                      ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: Text(
                        _currentStep == 0 ? 'Cancel' : 'Back',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              );
            },
            steps: [
              // ── Step 1: Personal Information ──────────────
              Step(
                title: const Text('Personal Info'),
                isActive: _currentStep >= 0,
                state:
                    _currentStep > 0 ? StepState.complete : StepState.indexed,
                content: Column(
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'First name is required'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _secondNameController,
                      decoration: const InputDecoration(
                        labelText: 'Middle Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Last name is required'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _idNoController,
                      decoration: const InputDecoration(
                        labelText: 'National ID No *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.badge_outlined),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'ID number is required'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    // Date of Birth
                    InkWell(
                      onTap: _pickDob,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Date of Birth *',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today_outlined),
                        ),
                        child: Text(
                          utilities.formatter.format(_dob),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Gender
                    DropdownButtonFormField<gender>(
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.people_outline),
                      ),
                      initialValue: _gender,
                      items: <DropdownMenuItem<gender>>[
                        DropdownMenuItem(
                          value: gender.Male,
                          child: const Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: gender.Female,
                          child: const Text('Female'),
                        ),
                      ],
                      onChanged: (v) =>
                          setState(() => _gender = v ?? gender.Male),
                    ),
                    const SizedBox(height: 14),
                    DropdownButtonFormField<marital_Status>(
                      decoration: const InputDecoration(
                        labelText: 'Marital Status',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.favorite_outline),
                      ),
                      initialValue: _maritalStatus,
                      items: <DropdownMenuItem<marital_Status>>[
                        DropdownMenuItem(
                          value: marital_Status.Single,
                          child: const Text('Single'),
                        ),
                        DropdownMenuItem(
                          value: marital_Status.Married,
                          child: const Text('Married'),
                        ),
                      ],
                      onChanged: (v) => setState(
                          () => _maritalStatus = v ?? marital_Status.Single),
                    ),
                  ],
                ),
              ),

              // ── Step 2: Contact & Employment ───────────────
              Step(
                title: const Text('Contact & Work'),
                isActive: _currentStep >= 1,
                state:
                    _currentStep > 1 ? StepState.complete : StepState.indexed,
                content: Column(
                  children: [
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'Phone number is required'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home_outlined),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_city_outlined),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _employerController,
                      decoration: const InputDecoration(
                        labelText: 'Employer',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.business_outlined),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _designationController,
                      decoration: const InputDecoration(
                        labelText: 'Designation',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.work_outline),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _payrollController,
                      decoration: const InputDecoration(
                        labelText: 'Payroll No',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.payments_outlined),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _pinController,
                      decoration: const InputDecoration(
                        labelText: 'KRA PIN',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.numbers_outlined),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Step 3: Review & Submit ────────────────────
              Step(
                title: const Text('Review'),
                isActive: _currentStep >= 2,
                state: StepState.indexed,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _reviewCard(
                      'Personal Information',
                      [
                        _reviewRow('Name',
                            '${_firstNameController.text} ${_secondNameController.text} ${_lastNameController.text}'),
                        _reviewRow('ID No', _idNoController.text),
                        _reviewRow('DOB', utilities.formatter.format(_dob)),
                        _reviewRow('Gender', _gender.name),
                        _reviewRow('Marital Status',
                            _maritalStatus.name.replaceAll('_', ' ')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _reviewCard(
                      'Contact & Work',
                      [
                        _reviewRow('Phone', _phoneController.text),
                        _reviewRow(
                            'Email', _emailController.text.ifEmpty('N/A')),
                        _reviewRow(
                            'Address', _addressController.text.ifEmpty('N/A')),
                        _reviewRow('City', _cityController.text.ifEmpty('N/A')),
                        _reviewRow('Employer',
                            _employerController.text.ifEmpty('N/A')),
                        _reviewRow('Designation',
                            _designationController.text.ifEmpty('N/A')),
                        _reviewRow('Payroll No',
                            _payrollController.text.ifEmpty('N/A')),
                        _reviewRow(
                            'KRA PIN', _pinController.text.ifEmpty('N/A')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xFF2E7D32).withOpacity(0.3)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline,
                              color: Color(0xFF2E7D32), size: 18),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Please review your details before submitting. '
                              'You can go back to make changes.',
                              style: TextStyle(
                                  color: Color(0xFF2E7D32), fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reviewCard(String title, List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _reviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

extension StringX on String {
  String ifEmpty(String fallback) => trim().isEmpty ? fallback : this;
}
