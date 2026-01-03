import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../utils/app_constants.dart';
import '../model/stores_model.dart';

class StoreRepo {
  static Future<List<StoresModel>> fetchStores() async {
    final response = await http.get(Uri.parse(AppConstants.storeApi));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((json) => StoresModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load stores');
    }
  }
}
