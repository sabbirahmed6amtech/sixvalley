import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley/utils/dimensions.dart';
import 'package:sixvalley/utils/styles.dart';
import '../../feature/home_page/model/product_model.dart';
import '../../utils/gaps.dart';
import '../../feature/home_page/controller/product_controller.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final double width;
  final double imageHeight;
  final bool showRating;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoriteTap,
    this.width = 140,
    this.imageHeight = 140,
    this.showRating = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ProductImage(
              productId: product.id,
              imageUrl: product.imageUrl,
              isFavorite: product.isFavorite,
              badge: product.badge,
              onFavoriteTap: onFavoriteTap,
              width: width,
              height: imageHeight,
            ),
            const SizedBox(height: 8),
            // Product Name
            Text(
              product.name,
              style: h7Light.copyWith(color: colorScheme.onSurface),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // Rating (optional)
            if (showRating && product.hasRating) ...[
              Gaps.vGapSmall,
              _RatingRow(
                rating: product.rating!,
                reviewCount: product.reviewCount!,
              ),
            ],
            Gaps.vGapSmall,
            Text(
              '\$${product.currentPrice.toStringAsFixed(2)}',
              style: h7SemiBold.copyWith(color: colorScheme.onSurface),
            ),

            // Discount Row (optional)
            if (product.hasDiscount) ...[
              Gaps.vGapSmall,
              _DiscountRow(
                originalPrice: product.originalPrice!,
                discountPercent: product.discountPercent,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final bool isFavorite;
  final String? badge;
  final VoidCallback? onFavoriteTap;
  final double width;
  final double height;

  const _ProductImage({
    required this.productId,
    required this.imageUrl,
    required this.isFavorite,
    this.badge,
    this.onFavoriteTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorScheme.surface,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: colorScheme.outline,
                    size: 40,
                  ),
                );
              },
            ),
          ),
        ),

        if (badge != null && badge!.isNotEmpty)
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getBadgeColor(badge!),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Text(
                badge!,
                style: h7Light.copyWith(color: colorScheme.surface),
              ),
            ),
          ),

        Positioned(
          right: 8,
          bottom: 8,
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) {
              final isFav = controller.isFavorite(productId);
              return GestureDetector(
                onTap: () {
                  controller.toggleFavorite(productId);
                  onFavoriteTap?.call();
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? colorScheme.error : colorScheme.outline,
                    size: Dimensions.iconSizeSmall,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getBadgeColor(String badge) {
    switch (badge.toLowerCase()) {
      case 'new':
        return const Color(0xFFFF5555);
      case 'best selling':
        return const Color(0xFFF58300);
      default:
        return const Color(0xFF1455AC);
    }
  }
}

/// Rating Row Widget
class _RatingRow extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const _RatingRow({required this.rating, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          Icons.star,
          color: Theme.of(context).secondaryHeaderColor.withValues(alpha: 0.8),
          size: Dimensions.iconSizeSmall,
        ),
        Gaps.vGapSmall,
        Text(
          rating.toString(),
          style: h7SemiBold.copyWith(color: colorScheme.onSurface),
        ),
        Gaps.vGapSmall,
        Text(
          '($reviewCount reviews)',
          style: h7Light.copyWith(color: colorScheme.outline.withAlpha(100)),
        ),
      ],
    );
  }
}

/// Price and Discount Row
class _DiscountRow extends StatelessWidget {
  final double originalPrice;
  final double discountPercent;

  const _DiscountRow({
    required this.originalPrice,
    required this.discountPercent,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        // Original Price (Strikethrough)
        Text(
          '\$${originalPrice.toStringAsFixed(0)}',
          style: h7Light.copyWith(
            color: colorScheme.outline.withAlpha(80),
            decoration: TextDecoration.lineThrough,
            decorationColor: colorScheme.outline.withAlpha(80),
          ),
        ),
        Gaps.hGapSmall,

        // Discount Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: colorScheme.error.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          ),
          child: Text(
            '-$discountPercent%',
            style: h7Light.copyWith(color: colorScheme.error),
          ),
        ),
      ],
    );
  }
}
