import 'package:flutter/material.dart';
import 'package:sixvalley/utils/dimensions.dart';
import 'package:sixvalley/utils/styles.dart';
import '../../../helper/responsive_helper.dart';
import '../../../utils/images.dart';
import '../model/product_model.dart';

class TodaysDealWeb extends StatelessWidget {
  final ProductModel? product;
  final VoidCallback? onProductTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCartTap;

  const TodaysDealWeb({
    super.key,
    this.product,
    this.onProductTap,
    this.onFavoriteTap,
    this.onAddToCartTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final displayProduct = product ?? ProductModel.todaysDealProduct;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 500,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(Images.largeImage, fit: BoxFit.cover,),
            ),
          ),
          Container(
            width: 500,
            decoration: BoxDecoration(
              color: colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Side - Banner
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ResponsiveHelper.isMobile(context) ? _TodaysDealBanner() : SizedBox.shrink(),
                ),

                // Right Side - Product Details
                Expanded(
                  child: _TodaysDealProductCard(
                    product: displayProduct,
                    onTap: onProductTap,
                    onFavoriteTap: onFavoriteTap,
                    onAddToCartTap: onAddToCartTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Left Banner
class _TodaysDealBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(Images.todaysDealBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TodaysDealProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCartTap;

  const _TodaysDealProductCard({
    required this.product,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCartTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ProductImageWithFavorite(
              imageUrl: product.imageUrl,
              isFavorite: product.isFavorite,
              onFavoriteTap: onFavoriteTap,
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (product.hasRating)
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).secondaryHeaderColor.withValues(alpha: 0.8),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating}',
                        style: h7SemiBold.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        ' (${product.reviewCount} reviews)',
                        style: h7Light.copyWith(color: colorScheme.outline.withAlpha(150)
                        ),
                      ),
                    ],
                  ),

                // Stock Left
                if (product.stockLeft != null)
                  Row(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 14,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product.stockLeft} item left',
                        style: h7Light.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 8),

            // Product Name
            Text(
              product.name,
              style: h7Light.copyWith(
                color: colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),

            // Price & Add to Cart Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Price Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$10,0,965.00',
                      style: h5Bold.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (product.hasDiscount)
                      Row(
                        children: [
                          Text(
                            '\$${product.originalPrice!.toStringAsFixed(0)}',
                            style: h7Light.copyWith(
                              color: colorScheme.outline.withAlpha(150),
                              decoration: TextDecoration.lineThrough,
                              decorationColor: colorScheme.outline.withAlpha(150),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.error.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '-${product.discountPercent}%',
                              style: h7Light.copyWith(
                                color: colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),

                // Add to Cart Button
                GestureDetector(
                  onTap: onAddToCartTap,
                  child: Container(
                    width: Dimensions.iconSizeDefault,
                    height: Dimensions.iconSizeDefault,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.surface,
                      size: Dimensions.iconSizeDefault,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _ProductImageWithFavorite extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const _ProductImageWithFavorite({
    required this.imageUrl,
    required this.isFavorite,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final imageSize = 350.0;

    return Stack(
      children: [
        // Product Image
        Container(
          width: imageSize+100,
          height: imageSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorScheme.surfaceContainerHighest,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported_outlined,
                  color: colorScheme.outline,
                  size: 40,
                );
              },
            ),
          ),
        ),

        // Favorite Button
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
                color: isFavorite ? colorScheme.error : colorScheme.outline,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
