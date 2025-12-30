import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_typography.dart';
import 'package:sixvalley/common/widgets/product_card.dart';

import '../model/product_model.dart';

/// OneTimeDeal - Main Section Widget
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

    return Container(
      decoration: BoxDecoration(color: colorScheme.primaryContainer),
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
              remainingTime:
                  remainingTime ??
                  const Duration(hours: 6, minutes: 2, seconds: 4),
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
                    onFavoriteTap: () => onFavoriteTap?.call(product),
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

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return 'Ends in  $hours: $minutes: $seconds';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title + Badge
        Row(
          children: [
            Text(
              title,
              style: AppTypography.h7SemiBold.copyWith(
                color: colorScheme.primary,
              ),
            ),
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.primary, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _formatDuration(remainingTime),
            style: AppTypography.h2SemiBold.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
