import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/helpers/error_handler.dart';
import 'package:matatu/helpers/form_validators.dart';
import 'package:matatu/home.dart';
import 'package:matatu/services/auth_service.dart';
import 'package:matatu/widgets/widgets.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;
  final RxBool rememberMe = true.obs;
  final RxString errorMessage = ''.obs;
  final Rx<AuthState> authState = AuthState.initial.obs;

  AuthService get _authService => AuthService.to;

  @override
  void onInit() {
    super.onInit();
    _loadLastUser();
    _loadRememberMePreference();
    // Listen to auth state changes
    ever(authState, (AuthState state) {
      if (state == AuthState.authenticated) {
        Get.offAll(() => MyHomePage());
      }
    });
    // Update local state when auth service state changes
    authState.value = _authService.authState;
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.onClose();
  }

  Future<void> _loadLastUser() async {
    final lastUser = await _authService.getLastUser();
    if (lastUser.isNotEmpty) {
      phoneController.text = lastUser;
    }
  }

  Future<void> _loadRememberMePreference() async {
    final prefs = await _authService.getPreferences();
    rememberMe.value = prefs.getBool('remember_me') ?? true;
  }

  Future<void> _saveRememberMePreference(bool value) async {
    final prefs = await _authService.getPreferences();
    await prefs.setBool('remember_me', value);
    rememberMe.value = value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    errorMessage.value = '';
    isLoading.value = true;

    try {
      final result = await _authService.login(phoneController.text);

      if (result.success) {
        // Save user identifier if remember me is checked
        if (rememberMe.value) {
          await _authService.saveLastUser(phoneController.text);
        } else {
          await _authService.clearLastUser();
        }
        // User authenticated successfully - go directly to home
        Get.offAll(() => MyHomePage());
      } else {
        errorMessage.value = result.message ?? 'Login failed';
      }
    } catch (e) {
      ErrorHandler.handleError(e, customMessage: 'Login failed');
      errorMessage.value = 'Login failed. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyPassword() async {
    if (passwordController.text.isEmpty) {
      errorMessage.value = 'Password is required';
      return;
    }

    errorMessage.value = '';
    isLoading.value = true;

    try {
      final result = await _authService.verifyPassword(passwordController.text);

      if (result.success) {
        Get.offAll(() => MyHomePage());
      } else {
        errorMessage.value = result.message ?? 'Password verification failed';
      }
    } catch (e) {
      ErrorHandler.handleError(e,
          customMessage: 'Password verification failed');
      errorMessage.value = 'Password verification failed. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOTP() async {
    if (otpController.text.isEmpty || otpController.text.length != 6) {
      errorMessage.value = 'Please enter a valid 6-digit OTP';
      return;
    }

    errorMessage.value = '';
    isLoading.value = true;

    try {
      final result = await _authService.verifyOTP(otpController.text);

      if (result.success) {
        Get.offAll(() => MyHomePage());
      } else {
        errorMessage.value = result.message ?? 'OTP verification failed';
      }
    } catch (e) {
      ErrorHandler.handleError(e, customMessage: 'OTP verification failed');
      errorMessage.value = 'OTP verification failed. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  void clearError() {
    errorMessage.value = '';
  }

  void resetToPhoneEntry() {
    authState.value = AuthState.initial;
    passwordController.clear();
    otpController.clear();
    errorMessage.value = '';
  }
}

class ModernLogin extends StatelessWidget {
  const ModernLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        decoration: widgets().backgroundimage(context),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.directions_bus,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Title
                      Text(
                        'Matatu Investor',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        'Manage your matatu investments',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                      ),
                      const SizedBox(height: 32),

                      // Login form
                      _buildPhoneForm(context, controller),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneForm(BuildContext context, LoginController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          ValidatedTextFormField(
            label: 'Account Identifier',
            hint: 'Enter Member No, Vehicle No, or Phone Number',
            controller: controller.phoneController,
            keyboardType: TextInputType.text,
            prefixIcon: const Icon(Icons.account_circle),
            validator: FormValidators.validateLoginIdentifier,
            textCapitalization: TextCapitalization.none,
          ),
          const SizedBox(height: 16),
          Obx(() => CheckboxListTile(
                value: controller.rememberMe.value,
                onChanged: (value) {
                  if (value != null) {
                    controller._saveRememberMePreference(value);
                  }
                },
                title: Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
              )),
          const SizedBox(height: 8),
          Obx(() => controller.errorMessage.isNotEmpty
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline,
                          color: Colors.red.shade700, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          controller.errorMessage.value,
                          style: TextStyle(
                              color: Colors.red.shade700, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox()),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: Obx(() => ElevatedButton(
                  onPressed:
                      controller.isLoading.value ? null : controller.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('Continue', style: TextStyle(fontSize: 16)),
                )),
          ),
        ],
      ),
    );
  }
}
