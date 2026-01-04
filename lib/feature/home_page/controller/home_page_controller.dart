import 'package:get/get.dart';

class HomePageController extends GetxController {
  int _selectedCategoryIndex = 0;
  int _selectedTabIndex = 0;

  int get selectedCategoryIndex => _selectedCategoryIndex;
  int get selectedTabIndex => _selectedTabIndex;

  final List<String> categories = [
    'Explore',
    'Sports',
    "Women's",
    'Kids',
    'Wigs',
    'Electronics',
    'Fashion',
    'Home',
  ];

  final List<String> tabs = [
    'New Arrivals',
    'Discounted Products',
    'Top Products',
  ];

  void updateCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    update();
  }

  void updateTabIndex(int index) {
    _selectedTabIndex = index;
    update();
  }
}
