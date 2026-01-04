import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_constants.dart';

class ApiClient {
  final SharedPreferences sharedPreferences;

  ApiClient({required this.sharedPreferences});

  Future<http.Response> get(String uri, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse(AppConstants.baseUrl + AppConstants.apiVersion + uri),
        headers: await _getHeaders(headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post(
    String uri, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstants.baseUrl + AppConstants.apiVersion + uri),
        body: jsonEncode(body),
        headers: await _getHeaders(headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> put(
    String uri, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(AppConstants.baseUrl + AppConstants.apiVersion + uri),
        body: jsonEncode(body),
        headers: await _getHeaders(headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.StreamedResponse> postMultipart(
    String uri,
    Map<String, String> fields, {
    File? file,
    String? fileFieldName,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppConstants.baseUrl + AppConstants.apiVersion + uri),
      );

      String? token = sharedPreferences.getString(AppConstants.token);
      if (token != null && token.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      request.fields.addAll(fields);
      if (file != null && fileFieldName != null) {
        request.files.add(
          await http.MultipartFile.fromPath(fileFieldName, file.path),
        );
      }

      return await request.send();
    } catch (e) {
      rethrow;
    }
  }

  // Future<http.StreamedResponse> putMultipart(
  //   String uri,
  //   Map<String, String> fields, {
  //   File? file,
  //   String? fileFieldName,
  // }) async {
  //   try {
  //     var request = http.MultipartRequest(
  //       'PUT',
  //       Uri.parse(AppConstants.baseUrl + AppConstants.apiVersion + uri),
  //     );
  //
  //     String? token = sharedPreferences.getString(AppConstants.token);
  //     if (token != null && token.isNotEmpty) {
  //       request.headers['Authorization'] = 'Bearer $token';
  //     }
  //
  //     request.fields.addAll(fields);
  //     if (file != null && fileFieldName != null) {
  //       request.files.add(
  //         await http.MultipartFile.fromPath(fileFieldName, file.path),
  //       );
  //     }
  //
  //     return await request.send();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Map<String, String>> _getHeaders(Map<String, String>? customHeaders) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    String? token = sharedPreferences.getString(AppConstants.token);
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }

  Future<void> updateHeader(String token) async {
    await sharedPreferences.setString(AppConstants.token, token);
  }
  Future<void> rememberMe(String pref) async{
    await sharedPreferences.setString(AppConstants.rememberMe, pref);
  }
}
