import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:matatu/common/Apis.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/config/app_config.dart';
import 'package:matatu/helpers/security_helper.dart';
import 'package:matatu/member/member.dart';
import 'package:matatu/member/member_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
  otpRequired,
}

class AuthResult {
  final bool success;
  final String? message;
  final member? user;
  final AuthState state;

  AuthResult({
    required this.success,
    this.message,
    this.user,
    required this.state,
  });

  factory AuthResult.success(member user) {
    return AuthResult(
      success: true,
      user: user,
      state: AuthState.authenticated,
    );
  }

  factory AuthResult.error(String message) {
    return AuthResult(
      success: false,
      message: message,
      state: AuthState.error,
    );
  }

  factory AuthResult.otpRequired(member user) {
    return AuthResult(
      success: false,
      user: user,
      state: AuthState.otpRequired,
    );
  }
}

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final ApiClient _apiClient = ApiClient();
  final Rx<AuthState> _authState = AuthState.initial.obs;
  final Rx<member?> _currentUser = Rx<member?>(null);

  // Getters
  AuthState get authState => _authState.value;
  member? get currentUser => _currentUser.value;
  bool get isAuthenticated => _authState.value == AuthState.authenticated;
  bool get isLoading => _authState.value == AuthState.loading;

  @override
  void onInit() {
    super.onInit();
    _checkStoredAuth();
  }

  /// Check if user is already logged in
  Future<void> _checkStoredAuth() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedUser = prefs.getString('user');

      if (storedUser != null && storedUser.isNotEmpty) {
        // User was previously logged in, but we need to verify session
        _authState.value = AuthState.unauthenticated;
      }
    } catch (e) {
      _authState.value = AuthState.unauthenticated;
    }
  }

  /// Get last logged in user
  Future<String> getLastUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user') ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Save last user identifier
  Future<void> saveLastUser(String identifier) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', SecurityHelper.sanitizeInput(identifier));
    } catch (e) {
      // Silently fail
    }
  }

  /// Clear last user identifier
  Future<void> clearLastUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
    } catch (e) {
      // Silently fail
    }
  }

  /// Get SharedPreferences instance
  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  /// Format login identifier for different types (phone, member, vehicle)
  String _formatLoginIdentifier(String identifier) {
    String cleaned = identifier.trim().replaceAll(' ', '');

    // Check if it's a phone number (starts with + or numbers, 10-15 digits)
    if (SecurityHelper.isValidKenyanPhone(cleaned)) {
      return SecurityHelper.formatKenyanPhone(cleaned);
    }

    // Check if it's a vehicle number (contains letters and numbers, typically 3-8 chars)
    if (RegExp(r'^[A-Za-z0-9]{3,8}$').hasMatch(cleaned)) {
      return cleaned.toUpperCase(); // Vehicle numbers are typically uppercase
    }

    // Otherwise treat as member number or account number
    return cleaned;
  }

  /// Login with account identifier (phone number, member number, or vehicle number)
  Future<AuthResult> login(String identifier) async {
    if (identifier.isEmpty) {
      return AuthResult.error('Account identifier is required');
    }

    // Format the identifier using the same logic as MemberController
    final formattedIdentifier = _formatLoginIdentifier(identifier);

    _authState.value = AuthState.loading;

    try {
      // Use the formatted identifier

      // Create request with new API structure
      final request = Request(
        header: Header(),
        No: formattedIdentifier,
      );

      // Make API call - using legacy method for now
      final response = await _apiClient.postdataLegacy(
          "Members/GetMember", request.toJson());

      if (response.statusCode == 200) {
        final results = Member_Results.fromJson(response.body);

        switch (results.Code) {
          case 0:
            final user = results.Contents;

            if (user == null) {
              _authState.value = AuthState.error;
              return AuthResult.error('Account/Vehicle not found');
            }

            _currentUser.value = user;

            // Bypass password check - go directly to authentication
            await _completeAuthentication();
            return AuthResult.success(user);

          default:
            _authState.value = AuthState.error;
            return AuthResult.error('Unable to authenticate');
        }
      } else {
        _authState.value = AuthState.error;
        return AuthResult.error('Network error occurred');
      }
    } catch (e) {
      _authState.value = AuthState.error;
      return AuthResult.error('Login failed: ${e.toString()}');
    }
  }

  /// Verify password for returning users
  Future<AuthResult> verifyPassword(String password) async {
    if (_currentUser.value == null) {
      return AuthResult.error('No user session found');
    }

    // TODO: Re-enable password validation
    // Temporarily bypassing password validation
    /*
    if (password.isEmpty) {
      return AuthResult.error('Password is required');
    }

    if (!SecurityHelper.isStrongPassword(password)) {
      return AuthResult.error(
          'Password must be at least 8 characters with uppercase, lowercase, numbers, and special characters');
    }
    */

    _authState.value = AuthState.loading;

    try {
      // Bypass password check for now
      // TODO: Re-enable password verification
      // if (_currentUser.value?.Password == password) {
      await _completeAuthentication();
      return AuthResult.success(_currentUser.value!);
      // } else {
      //   _authState.value = AuthState.error;
      //   return AuthResult.error('Invalid password');
      // }
    } catch (e) {
      _authState.value = AuthState.error;
      return AuthResult.error('Password verification failed');
    }
  }

  /// Initiate OTP verification for new users
  Future<AuthResult> _initiateOTPVerification(member user) async {
    try {
      // Generate secure OTP
      final otp = SecurityHelper.generateOTP(AppConfig.otpLength);

      // Use member's own phone number for OTP
      final recipientPhone = user.Phone_No ?? '';
      if (recipientPhone.isEmpty) {
        return AuthResult.error('Phone number not found');
      }

      // Send OTP request
      final otpRequest = Request(
        header: Header(),
        phone: user.Phone_No,
        body: recipientPhone,
        Otp: otp,
        Otp_message:
            "Your registration OTP is $otp. Valid for ${AppConfig.otpValidityMinutes} minutes.",
      );

      await _apiClient.postdataLegacy("Otp", otpRequest.toJson());

      _authState.value = AuthState.otpRequired;

      // Store OTP temporarily for verification (in production, this should be server-side)
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('temp_otp', otp);
      await prefs.setInt(
          'otp_timestamp', DateTime.now().millisecondsSinceEpoch);

      return AuthResult.otpRequired(user);
    } catch (e) {
      _authState.value = AuthState.error;
      return AuthResult.error('Failed to send OTP');
    }
  }

  /// Verify OTP code
  Future<AuthResult> verifyOTP(String otpCode) async {
    if (_currentUser.value == null) {
      return AuthResult.error('No user session found');
    }

    if (otpCode.isEmpty || otpCode.length != AppConfig.otpLength) {
      return AuthResult.error(
          'Please enter a valid ${AppConfig.otpLength}-digit OTP');
    }

    _authState.value = AuthState.loading;

    try {
      // Verify OTP (in production, this should be server-side)
      final prefs = await SharedPreferences.getInstance();
      final storedOtp = prefs.getString('temp_otp');
      final otpTimestamp = prefs.getInt('otp_timestamp');

      if (storedOtp == null || otpTimestamp == null) {
        return AuthResult.error('OTP session expired. Please try again.');
      }

      // Check OTP expiry
      final otpAge = DateTime.now().millisecondsSinceEpoch - otpTimestamp;
      final maxAge =
          AppConfig.otpValidityMinutes * 60 * 1000; // Convert to milliseconds

      if (otpAge > maxAge) {
        await prefs.remove('temp_otp');
        await prefs.remove('otp_timestamp');
        return AuthResult.error('OTP expired. Please request a new one.');
      }

      // Verify OTP code
      if (storedOtp == otpCode) {
        // Update user status
        final updatedUser = _currentUser.value!;
        updatedUser.Logged_In = true;

        // Update user on server
        final updateResponse = await _apiClient.postdataLegacy(
            "memberupdate", updatedUser.toJson());

        if (updateResponse.statusCode == 200) {
          final results = Member_Results.fromJson(updateResponse.body);
          if (results.Code == 0) {
            // Clean up temporary OTP data
            await prefs.remove('temp_otp');
            await prefs.remove('otp_timestamp');

            await _completeAuthentication();
            return AuthResult.success(_currentUser.value!);
          } else {
            return AuthResult.error(
                'Failed to update account. Please try again.');
          }
        } else {
          return AuthResult.error('Server error occurred');
        }
      } else {
        return AuthResult.error('Invalid OTP code');
      }
    } catch (e) {
      _authState.value = AuthState.error;
      return AuthResult.error('OTP verification failed');
    }
  }

  /// Complete authentication process
  Future<void> _completeAuthentication() async {
    try {
      _authState.value = AuthState.authenticated;

      // Store user session
      final prefs = await SharedPreferences.getInstance();
      if (_currentUser.value?.Phone_No != null) {
        await prefs.setString('user',
            SecurityHelper.sanitizeInput(_currentUser.value!.Phone_No!));
      }

      // Fire background requests to load user data
      if (_currentUser.value?.No != null) {
        final controller = Get.find<MemberController>();
        controller.getvehicles(_currentUser.value!.No!);
        controller.getloans(_currentUser.value!.No!);
        controller.getmemberaccounts(_currentUser.value!.No!);
      }
    } catch (e) {
      // Handle error but don't fail authentication
      debugPrint('Failed to store user session: $e');
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      await prefs.remove('temp_otp');
      await prefs.remove('otp_timestamp');

      _currentUser.value = null;
      _authState.value = AuthState.unauthenticated;
    } catch (e) {
      debugPrint('Logout error: $e');
    }
  }

  /// Reset password (placeholder for future implementation)
  Future<AuthResult> resetPassword(String phoneNumber) async {
    // TODO: Implement password reset functionality
    return AuthResult.error('Password reset feature is not yet implemented');
  }
}
