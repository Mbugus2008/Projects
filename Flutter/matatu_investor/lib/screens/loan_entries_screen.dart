import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/loans/loan.dart';
import 'package:matatu/utilities.dart';

class LoanEntriesScreen extends StatelessWidget {
  final String loanNo;
  final String loanName;
  final Loan? loan;

  const LoanEntriesScreen({
    Key? key,
    required this.loanNo,
    required this.loanName,
    this.loan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MemberController>();

    // Load loan entries when screen opens
    controller.getLoanEntries(loanNo);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loanName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              loanNo,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<MemberController>(
        builder: (controller) {
          if (controller.isLoadingLoanEntries.value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading loan entries...'),
                ],
              ),
            );
          }

          if (controller.loanEntries.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No records found',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Loan Details Card
              if (loan != null)
                Container(
                  margin: EdgeInsets.all(8),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Loan Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _buildInfoItem(
                                  'Start Date',
                                  loan!.Repayment_Start_Date != null
                                      ? DateFormat('dd-MMM-yy')
                                          .format(loan!.Repayment_Start_Date!)
                                      : loan!.Credit_Application_Date != null
                                          ? DateFormat('dd-MMM-yy').format(
                                              loan!.Credit_Application_Date!)
                                          : 'N/A',
                                  Icons.calendar_today,
                                  Colors.blue,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: _buildInfoItem(
                                  'End Date',
                                  loan!.Repayment_End_Date != null
                                      ? DateFormat('dd-MMM-yy')
                                          .format(loan!.Repayment_End_Date!)
                                      : 'N/A',
                                  Icons.event,
                                  Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _buildInfoItem(
                                  'Paid Today',
                                  utilities.formatcurrency
                                      .format(loan!.Amount_Paid_Today ?? 0),
                                  Icons.payment,
                                  Colors.green,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: _buildInfoItem(
                                  'Arrears',
                                  utilities.formatcurrency
                                      .format(loan!.Amount_In_Arreares ?? 0),
                                  Icons.warning_amber_rounded,
                                  Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              // Entries List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: controller.loanEntries.length,
                  itemBuilder: (context, index) {
                    final entry = controller.loanEntries[index];
                    final isDebit = (entry.Debit_Amount ?? 0) > 0;
                    final amount = isDebit
                        ? entry.Debit_Amount ?? 0
                        : entry.Credit_Amount ?? 0;

                    // Determine entry type icon and color
                    IconData icon;
                    Color color;
                    String type;

                    if (entry.Transaction_Type == 4) {
                      // Interest
                      icon = Icons.percent_rounded;
                      color = Colors.orange.shade700;
                      type = 'Interest';
                    } else if (isDebit) {
                      // Disbursement or charge
                      icon = Icons.account_balance_wallet_rounded;
                      color = Colors.blue.shade700;
                      type = 'Disbursement';
                    } else {
                      // Payment or credit
                      icon = Icons.payment_rounded;
                      color = Colors.green.shade700;
                      type = 'Payment';
                    }

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: color.withOpacity(0.1),
                          child: Icon(
                            icon,
                            color: color,
                          ),
                        ),
                        title: Text(
                          entry.Description ?? 'No description',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Text(
                              'Doc: ${entry.Document_No ?? 'N/A'}',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              entry.postingDate != null
                                  ? DateFormat('dd-MMM-yy')
                                      .format(entry.postingDate!)
                                  : 'N/A',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            if (entry.Month != null)
                              Text(
                                entry.Month!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              utilities.formatcurrency.format(amount),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: color,
                              ),
                            ),
                            Text(
                              type,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoItem(
      String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
