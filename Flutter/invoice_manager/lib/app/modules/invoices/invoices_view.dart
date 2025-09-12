import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'invoices_controller.dart';
import '../../shared/widgets/base_scaffold.dart';

class InvoicesView extends GetView<InvoicesController> {
  const InvoicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Invoices',
      body: const Center(
        child: Text('Invoices Screen - Coming Soon'),
      ),
    );
  }
}
