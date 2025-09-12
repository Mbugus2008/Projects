import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';
import '../../shared/widgets/base_scaffold.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Settings',
      body: const Center(child: Text('Settings Screen - Coming Soon')),
    );
  }
}
