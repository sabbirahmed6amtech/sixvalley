import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sixvalley/screen/main_screen.dart';
import 'package:sixvalley/utils/app_constants.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';
import '../model/verify_otp_model.dart';
import '../repository/auth_repository.dart';
import '../view/otp_verification_screen.dart';
import '../view/sign_in_screen.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<void> login({
    required String emailOrPhone,
    required String password,
    bool rememberMe = false,
  }) async {
    _isLoading.value = true;
    update();

    try {
      String type = _isPhone(emailOrPhone) ? 'phone' : 'email';

      LoginRequest request = LoginRequest(
        emailOrPhone: emailOrPhone,
        password: password,
        type: type,
      );

      final response = await authRepository.login(request);

      _isLoading.value = false;
      update();

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if(rememberMe){
          await authRepository.apiClient.rememberMe('set');
          print("================== Remember me set True ==========================");
        }
        if (data['token'] != null) {
          await authRepository.apiClient.updateHeader(data['token']);
        }

        _showToast(data['message'] ?? 'Login successful', isError: false);

        Get.offAll(() => MainScreen());
      } else {
        final data = jsonDecode(response.body);
        _showToast(data['message'] ?? 'Login failed', isError: true);
      }
    } catch (e) {
      _isLoading.value = false;
      update();
      _showToast('Error: ${e.toString()}', isError: true);
    }
  }

  bool _isPhone(String input) {
    return input.startsWith('+') || RegExp(r'^[0-9]+$').hasMatch(input);
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    _isLoading.value = true;
    update();

    try {
      RegisterRequest request = RegisterRequest(
        fName: firstName,
        lName: lastName,
        phone: phone,
        email: email,
        password: password,
        referralCode: referralCode,
      );

      final response = await authRepository.register(request);

      _isLoading.value = false;
      update();

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['temp_token'] != null) {
          await authRepository.apiClient.sharedPreferences
              .setString(AppConstants.tempToken, data['temp_token']);
        }
        await authRepository.apiClient.sharedPreferences
            .setString(AppConstants.pendingVerificationPhone, phone);

        try {
          await authRepository.checkPhone(phone);
        } catch (e) {}

        _showToast(
          data['message'] ?? 'Registration successful',
          isError: false,
        );

        Get.to(() => OtpVerificationScreen(phoneNumber: phone));
      } else {
        final data = jsonDecode(response.body);
        _showToast(data['message'] ?? 'Registration failed', isError: true);
      }
    } catch (e) {
      _isLoading.value = false;
      update();
      _showToast('Error: ${e.toString()}', isError: true);
    }
  }

  Future<void> verifyOtp({required String phone, required String otp}) async {
    _isLoading.value = true;
    update();

    try {
      VerifyOtpRequest request = VerifyOtpRequest(phone: phone, token: otp);

      final response = await authRepository.verifyOtp(request);

      _isLoading.value = false;
      update();

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['token'] != null) {
          await authRepository.apiClient.updateHeader(data['token']);
        }

        await authRepository.apiClient.sharedPreferences.remove(AppConstants.tempToken);
        await authRepository.apiClient.sharedPreferences.remove(AppConstants.pendingVerificationPhone);

        _showToast(
          data['message'] ?? 'Verification successful',
          isError: false,
        );

        Get.offAll(() => MainScreen());
      } else {
        final data = jsonDecode(response.body);
        _showToast(data['message'] ?? 'Verification failed', isError: true);
      }
    } catch (e) {
      _isLoading.value = false;
      update();
      _showToast('Error: ${e.toString()}', isError: true);
    }
  }

  Future<void> resendOtp(String phone) async {
    _isLoading.value = true;
    update();

    try {
      final response = await authRepository.checkPhone(phone);

      _isLoading.value = false;
      update();

      if (response.statusCode == 200) {
        _showToast('OTP sent successfully', isError: false);
      } else {
        final data = jsonDecode(response.body);
        _showToast(data['message'] ?? 'Failed to send OTP', isError: true);
      }
    } catch (e) {
      _isLoading.value = false;
      update();
      _showToast('Error: ${e.toString()}', isError: true);
    }
  }

  Future<void> logout() async {
    try {
      await authRepository.apiClient.updateHeader('');
      await authRepository.apiClient.rememberMe('');
      print("===================== Remember me Cleared ==============");

      _showToast('Logged out successfully', isError: false);

      Get.offAll(() => const SignInScreen());
    } catch (e) {
      _showToast('Error: ${e.toString()}', isError: true);
    }
  }

  void _showToast(String message, {required bool isError}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
