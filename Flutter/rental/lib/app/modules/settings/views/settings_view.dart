import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_ui.dart';
import '../controllers/settings_controller.dart';

/// Global settings: water price per unit and the monthly garbage fee,
/// used when creating tenant invoices.
class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Obx(() {
        if (controller.isLoading.value &&
            controller.waterRateController.text.isEmpty) {
          return const LoadingView(label: 'Loading settings…');
        }
        return _buildContent(context);
      }),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeader(title: 'Billing'),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Charges applied when creating tenant invoices. Rent is '
                'preset from each tenant\'s lease, so it is not set here.',
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.waterRateController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Water price per unit (KSh)',
                  prefixIcon: Icon(Icons.water_drop_outlined),
                  helperText: 'Invoices bill units consumed × this rate',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.garbageFeeController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Garbage fee per month (KSh)',
                  prefixIcon: Icon(Icons.delete_outline_rounded),
                  helperText: 'Added as a fixed line on invoices',
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => LoadingButton(
                  label: 'Save Settings',
                  icon: Icons.save_outlined,
                  isLoading: controller.isSaving.value,
                  onPressed: () async {
                    final success = await controller.save();
                    Get.snackbar(
                      success ? 'Settings saved' : 'Could not save settings',
                      success
                          ? 'New invoices will use these charges.'
                          : 'Check the values and try again.',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current charges',
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 12),
              ListenableBuilder(
                listenable: Listenable.merge([
                  controller.waterRateController,
                  controller.garbageFeeController,
                ]),
                builder: (context, _) => Column(
                  children: [
                    DetailRow(
                      icon: Icons.water_drop_outlined,
                      label: 'Water per unit',
                      value: formatMoney(
                        double.tryParse(
                              controller.waterRateController.text.trim(),
                            ) ??
                            0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DetailRow(
                      icon: Icons.delete_outline_rounded,
                      label: 'Garbage per month',
                      value: formatMoney(
                        double.tryParse(
                              controller.garbageFeeController.text.trim(),
                            ) ??
                            0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
