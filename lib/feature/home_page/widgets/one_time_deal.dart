import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley/utils/styles.dart';
import 'package:sixvalley/common/widgets/product_card.dart';
import '../model/product_model.dart';
import '../controller/one_time_deal_controller.dart';
import '../controller/product_controller.dart';

/// OneTimeDeal
class OneTimeDeal extends StatelessWidget {
  final String title;
  final String? badgeImagePath;
  final Duration? remainingTime;
  final List<ProductModel> products;
  final Function(ProductModel)? onProductTap;
  final Function(ProductModel)? onFavoriteTap;

  const OneTimeDeal({
    super.key,
    this.title = 'One Time Deal',
    this.badgeImagePath = 'assets/images/upto20.png',
    this.remainingTime,
    this.products = const [],
    this.onProductTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final displayProducts = products.isNotEmpty
        ? products
        : ProductModel.dealProducts;

    // Initialize ProductController with favorite states
    final productController = Get.put(ProductController());
    productController.initializeFavorites(displayProducts);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withAlpha(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Section
            _OneTimeDealHeader(
              title: title,
              badgeImagePath: badgeImagePath,
              remainingTime: remainingTime ?? const Duration(days: 7),
            ),
            const SizedBox(height: 12),

            // Products List
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: displayProducts.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final product = displayProducts[index];
                  return ProductCard(
                    product: product,
                    width: 120,
                    imageHeight: 120,
                    showRating: false,
                    onTap: () => onProductTap?.call(product),
                    onFavoriteTap: () {
                      print("One Time Deal Product");
                      Get.snackbar(
                        "One Time Deal",
                        "Add To Favourite",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OneTimeDealHeader extends StatelessWidget {
  final String title;
  final String? badgeImagePath;
  final Duration remainingTime;

  const _OneTimeDealHeader({
    required this.title,
    this.badgeImagePath,
    required this.remainingTime,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = Get.put(OneTimeDealController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title + Badge
        Row(
          children: [
            Text(title, style: h5Bold.copyWith(color: colorScheme.primary)),
            if (badgeImagePath != null) ...[
              const SizedBox(width: 8),
              Image.asset(
                badgeImagePath!,
                height: 24,
                width: 72,
                fit: BoxFit.contain,
              ),
            ],
          ],
        ),

        // Countdown Timer
        GetBuilder<OneTimeDealController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.primary, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              controller.getFormattedTime(),
              style: h7SemiBold.copyWith(color: colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
