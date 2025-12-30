import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';
import 'package:sixvalley/core/constant/app_typography.dart';
import '../../feature/home_page/model/product_model.dart';
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
              style: AppTypography.h4Regular.copyWith(
                color: colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // Rating (optional)
            if (showRating && product.hasRating) ...[
              const SizedBox(height: 4),
              _RatingRow(
                rating: product.rating!,
                reviewCount: product.reviewCount!,
              ),
            ],
            const SizedBox(height: 4),
            Text(
              '\$${product.currentPrice.toStringAsFixed(2)}',
              style: AppTypography.h5Bold.copyWith(
                color: colorScheme.onSurface,
              ),
            ),

            // Discount Row (optional)
            if (product.hasDiscount) ...[
              const SizedBox(height: 4),
              _DiscountRow(
                originalPrice: product.originalPrice!,
                discountPercent: product.discountPercent!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;
  final String? badge;
  final VoidCallback? onFavoriteTap;
  final double width;
  final double height;

  const _ProductImage({
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
                style: AppTypography.h2SemiBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),

        Positioned(
          right: 8,
          bottom: 8,
          child: GestureDetector(
            onTap: onFavoriteTap,
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
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? AppColors.error : colorScheme.outline,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getBadgeColor(String badge) {
    switch (badge.toLowerCase()) {
      case 'new':
        return AppColors.error;
      case 'best selling':
        return AppColors.secondary;
      default:
        return AppColors.primary;
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
        const Icon(Icons.star, color: AppColors.warning, size: 14),
        const SizedBox(width: 4),
        Text(
          rating.toString(),
          style: AppTypography.h3SemiBold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewCount reviews)',
          style: AppTypography.h3Regular.copyWith(color: colorScheme.outline),
        ),
      ],
    );
  }
}

/// Price and Discount Row
class _DiscountRow extends StatelessWidget {
  final double originalPrice;
  final int discountPercent;

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
          style: AppTypography.h3Regular.copyWith(
            color: colorScheme.outline,
            decoration: TextDecoration.lineThrough,
            decorationColor: colorScheme.outline,
          ),
        ),
        const SizedBox(width: 8),

        // Discount Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: colorScheme.error.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '-$discountPercent%',
            style: AppTypography.h1Bold.copyWith(color: colorScheme.error),
          ),
        ),
      ],
    );
  }
}
