import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'payments_controller.dart';
import '../../shared/widgets/base_scaffold.dart';

class PaymentsView extends GetView<PaymentsController> {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Payments',
      body: const Center(child: Text('Payments Screen - Coming Soon')),
    );
  }
}
