import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../model/language_model.dart';

class LanguageController extends GetxController {
  int _selectIndex = 0;
  int get selectIndex => _selectIndex;
  void setSelectIndex(int index) {
    _selectIndex = index;
    update();
  }
  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;

  void initializeAllLanguages(BuildContext context) {
    if (_languages.isEmpty) {
      _languages.clear();
      _languages = AppConstants.languages;
    }
  }
}