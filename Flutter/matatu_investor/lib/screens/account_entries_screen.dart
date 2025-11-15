import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/utilities.dart';

class AccountEntriesScreen extends StatelessWidget {
  final String accountNo;
  final String accountName;

  const AccountEntriesScreen({
    Key? key,
    required this.accountNo,
    required this.accountName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MemberController>();

    // Load account entries when screen opens
    controller.getAccountEntries(accountNo);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              accountName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              accountNo,
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
          if (controller.isLoadingAccountEntries.value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading account entries...'),
                ],
              ),
            );
          }

          if (controller.accountEntries.isEmpty) {
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

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: controller.accountEntries.length,
            itemBuilder: (context, index) {
              final entry = controller.accountEntries[index];
              final isDebit = (entry.Debit_Amount ?? 0) > 0;
              final amount =
                  isDebit ? entry.Debit_Amount ?? 0 : entry.Credit_Amount ?? 0;

              return Card(
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        isDebit ? Colors.red.shade100 : Colors.green.shade100,
                    child: Icon(
                      isDebit
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color:
                          isDebit ? Colors.red.shade700 : Colors.green.shade700,
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
                        DateFormat('dd-MMM-yy').format(
                          entry.Posting_Date ?? DateTime.now(),
                        ),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
                          color: isDebit
                              ? Colors.red.shade700
                              : Colors.green.shade700,
                        ),
                      ),
                      Text(
                        isDebit ? 'Debit' : 'Credit',
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
          );
        },
      ),
    );
  }
}
