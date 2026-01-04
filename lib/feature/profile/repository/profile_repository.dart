import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../api/remote/api_client.dart';
import '../../../utils/app_constants.dart';

class ProfileRepository {
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<http.Response> getProfile() async {
    return await apiClient.get(AppConstants.customerInfoUri);
  }

  Future<dynamic> updateProfile(
    Map<String, String> body, {
    File? imageFile,
  }) async {
    if (imageFile != null) {
      return await apiClient.postMultipart(
        AppConstants.updateProfileUri,
        body,
        file: imageFile,
        fileFieldName: 'image',
      );
    } else {
      return await apiClient.put(AppConstants.updateProfileUri, body: body);
    }
  }
}
