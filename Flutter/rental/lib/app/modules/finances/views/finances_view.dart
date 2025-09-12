import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/finances_controller.dart';

class FinancesView extends GetView<FinancesController> {
  const FinancesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finances'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildFinancesContent(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTransactionForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFinancesContent(BuildContext context) {
    return Column(
      children: [
        _buildSummaryCards(context),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {
                  // Navigate to transaction history
                },
                child: const Text('View All'),
              ),
            ],
          ),
        ),
        Expanded(
          child: _buildTransactionList(context),
        ),
      ],
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () => GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildSummaryCard(
              context,
              'Income',
              '\$${controller.totalIncome.value.toStringAsFixed(2)}',
              Icons.arrow_upward,
              Colors.green,
            ),
            _buildSummaryCard(
              context,
              'Expenses',
              '\$${controller.totalExpenses.value.toStringAsFixed(2)}',
              Icons.arrow_downward,
              Colors.red,
            ),
            _buildSummaryCard(
              context,
              'Net Income',
              '\$${controller.netIncome.value.toStringAsFixed(2)}',
              Icons.account_balance,
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    return controller.transactions.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.receipt_long_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  'No transactions found',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to add your first transaction',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: controller.transactions.length,
            itemBuilder: (context, index) {
              final transaction = controller.transactions[index];
              final isIncome = transaction['type'] == 'Income';
              
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isIncome ? Colors.green : Colors.red,
                    child: Icon(
                      isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    transaction['description'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${transaction['category']} - ${transaction['property']} ${transaction['unit'] != 'N/A' ? '(Unit ${transaction['unit']})' : ''}',
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${transaction['amount'].toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isIncome ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        transaction['date'],
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  onTap: () {
                    _showTransactionForm(context, transaction);
                  },
                ),
              );
            },
          );
  }

  void _showTransactionForm(BuildContext context, [Map<String, dynamic>? transaction]) {
    final isEditing = transaction != null;
    final isIncome = isEditing ? transaction['type'] == 'Income' : true;
    final RxBool rxIsIncome = isIncome.obs;
    
    if (isEditing) {
      controller.dateController.text = transaction['date'];
      controller.amountController.text = transaction['amount'].toString();
      controller.categoryController.text = transaction['category'];
      controller.propertyController.text = transaction['property'];
      controller.unitController.text = transaction['unit'];
      controller.tenantController.text = transaction['tenant'];
      controller.descriptionController.text = transaction['description'];
    } else {
      controller.clearForm();
      controller.dateController.text = DateTime.now().toString().split(' ')[0];
    }
    
    Get.dialog(
      Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width > 600 
              ? 500 
              : MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEditing ? 'Edit Transaction' : 'Add Transaction',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment<bool>(
                        value: true,
                        label: Text('Income'),
                        icon: Icon(Icons.arrow_upward),
                      ),
                      ButtonSegment<bool>(
                        value: false,
                        label: Text('Expense'),
                        icon: Icon(Icons.arrow_downward),
                      ),
                    ],
                    selected: {rxIsIncome.value},
                    onSelectionChanged: (Set<bool> selection) {
                      rxIsIncome.value = selection.first;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    prefixIcon: Icon(Icons.calendar_today),
                    hintText: 'YYYY-MM-DD',
                  ),
                  onTap: () async {
                    // Date picker would be implemented in a real app
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
               Obx(() => TextField(
  controller: controller.categoryController,
  decoration: InputDecoration(
    labelText: 'Category',
    prefixIcon: const Icon(Icons.category),
    hintText: rxIsIncome.value 
        ? 'e.g., Rent, Deposit' 
        : 'e.g., Maintenance, Utilities',
  ),
)),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.propertyController,
                  decoration: const InputDecoration(
                    labelText: 'Property',
                    prefixIcon: Icon(Icons.home_work),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.unitController,
                        decoration: const InputDecoration(
                          labelText: 'Unit',
                          prefixIcon: Icon(Icons.apartment),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: controller.tenantController,
                        decoration: const InputDecoration(
                          labelText: 'Tenant',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.description),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: isEditing
                          ? () => controller.editTransaction(transaction['id'])
                          : controller.addTransaction,
                      child: Text(isEditing ? 'Update' : 'Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
