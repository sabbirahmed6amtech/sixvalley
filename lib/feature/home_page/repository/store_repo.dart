import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/stores_model.dart';

class StoreRepo {
  static const String _url = 'https://mocki.io/v1/7b04cbc7-68ab-456e-9146-3b4bb1892b90';
  static Future<List<StoresModel>> fetchStores() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Store list status Code ${response.statusCode}");
      }
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((json) => StoresModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load stores');
    }
  }
}