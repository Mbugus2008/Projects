import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customers_controller.dart';
import '../../shared/widgets/base_scaffold.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Customers',
      body: const Center(
        child: Text('Customers Screen - Coming Soon'),
      ),
    );
  }
}
