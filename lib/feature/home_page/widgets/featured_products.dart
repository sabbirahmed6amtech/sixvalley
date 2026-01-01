import 'package:flutter/material.dart';
import 'package:sixvalley/feature/home_page/controller/product_controller.dart';
import 'package:sixvalley/utils/styles.dart';
import 'package:sixvalley/common/widgets/product_card.dart';

import '../model/product_model.dart';

/// FeaturedProducts
class FeaturedProducts extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  final VoidCallback? onViewAllTap;
  final Function(ProductModel)? onProductTap;
  final Function(ProductModel)? onFavoriteTap;

  const FeaturedProducts({
    super.key,
    this.title = 'Featured Products',
    this.products = const [],
    this.onViewAllTap,
    this.onProductTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayProducts = products.isNotEmpty
        ? products
        : ProductController().getFeaturedProducts();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Section
          _FeaturedHeader(title: title, onViewAllTap: onViewAllTap),
          const SizedBox(height: 12),
          // Products List
          SizedBox(
            height: 270,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: displayProducts.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final product = displayProducts[index];
                return ProductCard(
                  product: product,
                  width: 155,
                  imageHeight: 155,
                  showRating: true,
                  onTap: () => onProductTap?.call(product),
                  onFavoriteTap: () => onFavoriteTap?.call(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

///Title + View All
class _FeaturedHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;

  const _FeaturedHeader({required this.title, this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: h5Bold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        GestureDetector(
          onTap: onViewAllTap,
          child: Text(
            'View all',
            style: h7Light,
          ),
        ),
      ],
    );
  }
}
