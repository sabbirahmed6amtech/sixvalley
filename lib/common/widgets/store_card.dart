import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';
import 'package:sixvalley/core/constant/app_typography.dart';
import '../../feature/home_page/model/store_model.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;
  final VoidCallback? onTap;
  final double width;
  final double bannerHeight;

  const StoreCard({
    super.key,
    required this.store,
    this.onTap,
    this.width = 250,
    this.bannerHeight = 100,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(
            color: colorScheme.onSurface.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Banner Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                store.imageUrl,
                width: width,
                fit: BoxFit.cover,
              ),
            ),

            // Store Info Section
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  //store logo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      store.logoUrl!,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.primary,
                          child: Center(
                            child: Icon(
                              Icons.store,
                              color: AppColors.white,
                              size: 24,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //store info
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Store Name
                        Text(
                          store.name,
                          style: AppTypography.h5Bold.copyWith(
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        if (store.rating != null) ...[
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: AppColors.warning,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                store.rating.toString(),
                                style: AppTypography.h4SemiBold.copyWith(
                                  color: AppColors.warning,
                                ),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${store.stockLeft} Product',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    '${store.reviewCount} Review',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
