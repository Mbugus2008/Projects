import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/Loans/Loan_Eligibility.dart';
import 'package:s_mobile/Loans/Loan_Type.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/common/widgets.dart';
import 'package:s_mobile/members/member.dart';
import 'package:s_mobile/transaction/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../members/controller.dart';

class NewLoanPage extends StatefulWidget {
  const NewLoanPage({Key? key, required this.member}) : super(key: key);
  final Member? member;

  @override
  State<NewLoanPage> createState() => _NewLoanPageState();
}

class _NewLoanPageState extends State<NewLoanPage> {
  Loan_Type? _selectedLoanType;
  List<Loan_Type> _loanTypes = [];
  bool _isLoadingTypes = false;
  Loan_Eligibility? _eligibility;
  bool _isCheckingEligibility = false;
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadLoanProducts();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _loadLoanProducts() async {
    setState(() => _isLoadingTypes = true);
    try {
      final products = await Loan_Type.fetchLoanProducts();
      if (products != null && products.isNotEmpty) {
        _loanTypes = products;
        return;
      }
    } catch (e) {
      print('⚠️ Failed to load loan products from API: $e');
    } finally {
      if (mounted) setState(() => _isLoadingTypes = false);
    }
    // Fallback to member LoanTypes
    _loanTypes = widget.member?.LoanTypes ?? [];
    if (mounted) setState(() => _isLoadingTypes = false);
  }

  /// Check eligibility with top-up rules when a loan type is selected.
  Future<void> _checkEligibility(Loan_Type loanType) async {
    final controller = Get.find<MemberController>();
    final member = controller.currentCustomer.value;
    // Use login phone first (most reliable), then member record, then prefs
    final prefs = await SharedPreferences.getInstance();
    final phone = controller.loginPhone ??
        (member.Mobile_Phone_No?.isNotEmpty == true
            ? member.Mobile_Phone_No
            : null) ??
        prefs.getString('user') ??
        member.No ??
        '';

    setState(() {
      _isCheckingEligibility = true;
      _eligibility = null;
    });

    try {
      final result = await Loan_Eligibility.checkEligibility(
        phone: phone,
        code: loanType.Code ?? '',
        loanType: loanType.Description ?? loanType.Code,
      );
      if (mounted) setState(() => _eligibility = result);
    } catch (e) {
      print('⚠️ Eligibility check failed: $e');
    } finally {
      if (mounted) setState(() => _isCheckingEligibility = false);
    }
  }

  Future<void> _submitLoanApplication() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedLoanType == null) {
      MotionToast.warning(
        description: const Text('Please select a loan type.'),
        title: const Text('Loan Application'),
      ).show(context);
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final amount = double.tryParse(_amountController.text.trim());
      if (amount == null || amount <= 0) {
        if (!mounted) return;
        MotionToast.warning(
          description: const Text('Please enter a valid loan amount.'),
          title: const Text('Loan Application'),
        ).show(context);
        setState(() => _isSubmitting = false);
        return;
      }

      final member = Get.find<MemberController>().currentCustomer.value;
      final docNo = 'LN-${DateTime.now().millisecondsSinceEpoch}';
      final request = Params(
        Application_No: member.No,
        Loan_Type: _selectedLoanType!.Code,
        Acc: amount.toString(),
        text: _selectedLoanType!.Description,
        Transaction_Type: transaction_Type.Loan_Application.index,
      );

      // Build proper transaction body with required fields
      final today = DateTime.now().toIso8601String().split('T').first;
      final body = json.encode({
        'Document_No': docNo,
        'Transaction_Date': today,
        'Transaction_Type': transaction_Type.Loan_Application.index,
        'Amount': amount,
        'Application_No': member.No,
        'Loan_Type': _selectedLoanType!.Code,
        'Loan_No': _selectedLoanType!.Code,
        'Account_No': member.No,
        'Mobile_No': Get.find<MemberController>().loginPhone ??
            member.Mobile_Phone_No ??
            '',
        'Source': 'Mbaraka',
        'Description': _selectedLoanType!.Description ??
            _selectedLoanType!.Code ??
            'Loan Application',
        'Phone': Get.find<MemberController>().loginPhone ??
            member.Mobile_Phone_No ??
            '',
      });

      final response = await ApiClient().postdata('transaction', body);

      if (!mounted) return;

      if (response.statusCode == 200) {
        final result = Results.fromJson(response.body);
        if (result.Code == 0) {
          MotionToast.success(
            description: Text(result.Desc ?? 'Loan application submitted.'),
            title: const Text('Loan Application'),
          ).show(context);
          _amountController.clear();
          setState(() => _selectedLoanType = null);
        } else {
          MotionToast.error(
            description: Text(result.Desc ?? 'Application failed.'),
            title: const Text('Loan Application'),
          ).show(context);
        }
      } else {
        MotionToast.error(
          description: Text('Request failed (${response.statusCode}).'),
          title: const Text('Loan Application'),
        ).show(context);
      }
    } catch (e) {
      if (mounted) {
        MotionToast.error(
          description: Text(e.toString()),
          title: const Text('Loan Application'),
        ).show(context);
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loanTypes = _loanTypes;

    return Container(
      decoration: widgets().backgroundimage(context),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'New Loan Application',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Loan Type Dropdown
                    if (_isLoadingTypes)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Loan_Type>(
                            isExpanded: true,
                            hint: const Text('Select Loan Type'),
                            value: _selectedLoanType,
                            onChanged: (Loan_Type? newValue) {
                              setState(() => _selectedLoanType = newValue);
                              if (newValue != null) {
                                _checkEligibility(newValue);
                              }
                            },
                            items: loanTypes.map<DropdownMenuItem<Loan_Type>>(
                                (Loan_Type value) {
                              return DropdownMenuItem<Loan_Type>(
                                value: value,
                                child:
                                    Text(value.Description ?? value.Code ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),

                    // Eligibility Info
                    if (_isCheckingEligibility)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    else if (_eligibility != null) ...[
                      _eligibilityCard(),
                      const SizedBox(height: 16),
                    ] else if (_selectedLoanType != null) ...[
                      // Fallback: show static eligible amount from loan type
                      Card(
                        color: const Color(0xFFE8F5E9),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline,
                                  color: Color(0xFF2E7D32)),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Eligible Amount',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                  Text(
                                    utilities.formatcurrency.format(
                                        _selectedLoanType!.Eligible_Amount ??
                                            0),
                                    style: const TextStyle(
                                      color: Color(0xFF2E7D32),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Amount Input
                    TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Loan Amount',
                        hintText: 'Enter amount to borrow',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.monetization_on_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter an amount';
                        }
                        final amount = double.tryParse(value.trim());
                        if (amount == null || amount <= 0) {
                          return 'Enter a valid amount';
                        }
                        if (_eligibility?.Eligible_Amount != null &&
                            amount > _eligibility!.Eligible_Amount!) {
                          return 'Amount exceeds eligible limit';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Submit Button
                    SizedBox(
                      height: 50,
                      child: MaterialButton(
                        color: const Color(0xFF2E7D32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed:
                            _isSubmitting ? null : _submitLoanApplication,
                        child: _isSubmitting
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Submit Application',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Eligibility result card ────────────────────────────────────
  Widget _eligibilityCard() {
    final e = _eligibility!;
    final statusName = _eligibilityStatusName(e.Eligibility_Status);
    final isApproved = e.Eligibility_Status == 1; // Approved
    final isPending = e.Eligibility_Status == 2;
    final isFailed = e.Eligibility_Status == 0 || e.Eligibility_Status == 3;

    final Color statusColor = isApproved
        ? const Color(0xFF2E7D32)
        : isPending
            ? const Color(0xFFF57C00)
            : const Color(0xFFD32F2F);

    return Card(
      color: isApproved
          ? const Color(0xFFE8F5E9)
          : isPending
              ? const Color(0xFFFFF3E0)
              : const Color(0xFFFFEBEE),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status header
            Row(
              children: [
                Icon(
                  isApproved
                      ? Icons.check_circle
                      : isPending
                          ? Icons.hourglass_empty
                          : Icons.error,
                  color: statusColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  statusName,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Eligible amount
            if (e.Eligible_Amount != null && e.Eligible_Amount! > 0) ...[
              _eligibilityRow(
                'Eligible Amount',
                utilities.formatcurrency.format(e.Eligible_Amount!),
                valueColor: const Color(0xFF2E7D32),
              ),
              const Divider(height: 16),
            ],

            // Loan balance (existing loan)
            if (e.Loan_Balance != null && e.Loan_Balance! > 0)
              _eligibilityRow(
                'Existing Loan Balance',
                utilities.formatcurrency.format(e.Loan_Balance!),
              ),

            // Top-up info
            if (e.Loan_Balance != null && e.Loan_Balance! > 0) ...[
              _eligibilityRow(
                'Top-up Paid',
                '${e.Topup_Paid?.toInt() ?? 0} of ${e.Topup_Installment?.toInt() ?? 0}',
              ),
            ],

            // Charges
            if (e.Total_charges != null && e.Total_charges!.isNotEmpty)
              _eligibilityRow('Charges', e.Total_charges!),

            // Comments
            if (e.Comments != null && e.Comments!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isApproved
                      ? const Color(0xFFC8E6C9)
                      : const Color(0xFFFFCDD2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 16, color: statusColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        e.Comments!,
                        style: TextStyle(color: statusColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _eligibilityRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: valueColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  String _eligibilityStatusName(int? status) {
    switch (status) {
      case 0:
        return 'Not Eligible';
      case 1:
        return 'Approved';
      case 2:
        return 'Pending';
      case 3:
        return 'Failed';
      default:
        return 'Unknown';
    }
  }
}
