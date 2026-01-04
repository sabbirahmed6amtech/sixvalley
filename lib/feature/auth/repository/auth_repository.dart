import 'package:http/http.dart' as http;
import '../../../api/remote/api_client.dart';
import '../../../utils/app_constants.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';
import '../model/verify_otp_model.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<http.Response> login(LoginRequest request) async {
    return await apiClient.post(
      AppConstants.loginUri,
      body: request.toJson(),
    );
  }

  Future<http.Response> register(RegisterRequest request) async {
    return await apiClient.post(
      AppConstants.registerUri,
      body: request.toJson(),
    );
  }

  Future<http.Response> verifyOtp(VerifyOtpRequest request) async {
    return await apiClient.post(
      AppConstants.verifyPhoneUri,
      body: request.toJson(),
    );
  }

  Future<http.Response> checkPhone(String phone) async {
    return await apiClient.post(
      AppConstants.checkPhoneUri,
      body: {'phone': phone},
    );
  }
}
