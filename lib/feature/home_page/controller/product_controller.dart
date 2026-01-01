import 'package:get/get.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  final Map<String, bool> _favoriteStatus = {};

  bool isFavorite(String productId) {
    return _favoriteStatus[productId] ?? false;
  }

  void toggleFavorite(String productId) {
    _favoriteStatus[productId] = !(_favoriteStatus[productId] ?? false);
    update();
  }

  void initializeFavorites(List<ProductModel> products) {
    for (var product in products) {
      _favoriteStatus[product.id] = product.isFavorite;
    }
  }
}
