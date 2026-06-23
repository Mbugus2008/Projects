import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/Loans/Loan_Type.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/common/widgets.dart';
import 'package:s_mobile/members/member.dart';

import '../members/controller.dart';

class NewLoanPage extends StatefulWidget {
  const NewLoanPage({Key? key, required this.member}) : super(key: key);
  final Member? member;

  @override
  State<NewLoanPage> createState() => _NewLoanPageState();
}

class _NewLoanPageState extends State<NewLoanPage> {
  Loan_Type? _selectedLoanType;
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
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
      final request = Params(
        Application_No: member.No,
        Loan_Type: _selectedLoanType!.Code,
        Acc: amount.toString(),
        text: _selectedLoanType!.Description,
      );

      final response = await ApiClient().postdata('transaction', request.toJson());

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
    final loanTypes = widget.member?.LoanTypes ?? [];

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
                          },
                          items: loanTypes
                              .map<DropdownMenuItem<Loan_Type>>(
                                  (Loan_Type value) {
                            return DropdownMenuItem<Loan_Type>(
                              value: value,
                              child: Text(value.Description ?? value.Code ?? ''),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Eligible Amount
                    if (_selectedLoanType != null) ...[
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
                                    utilities.formatcurrency
                                        .format(_selectedLoanType!
                                                .Eligible_Amount ??
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
                        if (_selectedLoanType?.Eligible_Amount != null &&
                            amount > _selectedLoanType!.Eligible_Amount!) {
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
                        onPressed: _isSubmitting ? null : _submitLoanApplication,
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
}
