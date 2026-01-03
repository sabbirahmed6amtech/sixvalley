import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../helper/api_client.dart';
import '../../../utils/app_constants.dart';

class ProfileRepository {
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<http.Response> getProfile() async {
    return await apiClient.get(AppConstants.customerInfoUri);
  }

  Future<http.Response> updateProfile(Map<String, String> body) async {
    return await apiClient.put(
      AppConstants.updateProfileUri,
      body: body,
    );
  }

  Future<http.StreamedResponse> updateProfileWithImage(
    Map<String, String> body,
    File imageFile,
  ) async {
    return await apiClient.postMultipart(
      AppConstants.updateProfileUri,
      body,
      file: imageFile,
      fileFieldName: 'image',
    );
  }
}
