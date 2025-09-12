import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/d365_service_initializer.dart';
import '../../../routes/app_routes.dart';

class D365ConfigController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final organizationUrlController = TextEditingController();
  final clientIdController = TextEditingController();
  final tenantIdController = TextEditingController();
  final redirectUriController = TextEditingController();
  
  final RxBool isLoading = false.obs;
  final RxBool showAdvanced = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Set default redirect URI
    redirectUriController.text = 'com.invoiceapp.invoicemanager://auth';
  }

  @override
  void onClose() {
    organizationUrlController.dispose();
    clientIdController.dispose();
    tenantIdController.dispose();
    redirectUriController.dispose();
    super.onClose();
  }

  void toggleAdvanced() {
    showAdvanced.value = !showAdvanced.value;
  }

  void saveConfiguration() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      // Configure D365 services
      D365ServiceInitializer.configure(
        organizationUrl: organizationUrlController.text.trim(),
        clientId: clientIdController.text.trim(),
        tenantId: tenantIdController.text.trim(),
        redirectUri: redirectUriController.text.trim(),
      );

      Get.snackbar(
        'Success',
        'Dynamics 365 configuration saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to onboarding for authentication
      Get.offAllNamed(AppRoutes.onboarding);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save configuration: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void useTestConfiguration() {
    // Pre-fill with common test values
    organizationUrlController.text = 'https://yourorg.crm.dynamics.com';
    clientIdController.text = 'your-client-id-here';
    tenantIdController.text = 'your-tenant-id-here';
  }

  String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Organization URL is required';
    }
    if (!value.startsWith('https://') || !value.contains('.crm.dynamics.com')) {
      return 'Please enter a valid Dynamics 365 URL (e.g., https://yourorg.crm.dynamics.com)';
    }
    return null;
  }

  String? validateGuid(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    // Basic GUID validation
    final guidRegex = RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$');
    if (!guidRegex.hasMatch(value)) {
      return 'Please enter a valid $fieldName (GUID format)';
    }
    return null;
  }
}

class D365ConfigView extends GetView<D365ConfigController> {
  const D365ConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamics 365 Configuration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Icon(
                Icons.settings,
                size: 64,
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              Text(
                'Configure Dynamics 365',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your Dynamics 365 environment details to connect the app.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),

              // Organization URL
              TextFormField(
                controller: controller.organizationUrlController,
                decoration: const InputDecoration(
                  labelText: 'Organization URL *',
                  hintText: 'https://yourorg.crm.dynamics.com',
                  prefixIcon: Icon(Icons.link),
                ),
                validator: controller.validateUrl,
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 16),

              // Client ID
              TextFormField(
                controller: controller.clientIdController,
                decoration: const InputDecoration(
                  labelText: 'Client ID *',
                  hintText: 'Azure AD Application Client ID',
                  prefixIcon: Icon(Icons.key),
                ),
                validator: (value) => controller.validateGuid(value, 'Client ID'),
              ),
              const SizedBox(height: 16),

              // Tenant ID
              TextFormField(
                controller: controller.tenantIdController,
                decoration: const InputDecoration(
                  labelText: 'Tenant ID *',
                  hintText: 'Azure AD Tenant ID',
                  prefixIcon: Icon(Icons.business),
                ),
                validator: (value) => controller.validateGuid(value, 'Tenant ID'),
              ),
              const SizedBox(height: 24),

              // Advanced Settings Toggle
              Obx(
                () => ExpansionTile(
                  title: const Text('Advanced Settings'),
                  leading: const Icon(Icons.tune),
                  initiallyExpanded: controller.showAdvanced.value,
                  onExpansionChanged: (expanded) => controller.showAdvanced.value = expanded,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: controller.redirectUriController,
                        decoration: const InputDecoration(
                          labelText: 'Redirect URI',
                          hintText: 'com.invoiceapp.invoicemanager://auth',
                          prefixIcon: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Test Configuration Button
              OutlinedButton.icon(
                onPressed: controller.useTestConfiguration,
                icon: const Icon(Icons.science),
                label: const Text('Use Test Configuration'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),

              const SizedBox(height: 16),

              // Save Button
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value ? null : controller.saveConfiguration,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: controller.isLoading.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('Save Configuration'),
                ),
              ),

              const SizedBox(height: 32),

              // Help Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.help_outline, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(
                            'Need Help?',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '1. Get your Organization URL from your Dynamics 365 environment\n'
                        '2. Register an app in Azure AD and get the Client ID\n'
                        '3. Find your Tenant ID in Azure AD properties\n'
                        '4. Configure the redirect URI in your Azure AD app registration',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

