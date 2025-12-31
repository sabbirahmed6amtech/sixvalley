import 'package:flutter/material.dart';
import 'package:sixvalley/utils/dimensions.dart';
import 'package:sixvalley/utils/styles.dart';
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
                          color: Theme.of(context).primaryColor,
                          child: Center(
                            child: Icon(
                              Icons.store,
                              color: Theme.of(context).colorScheme.surface,
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
                          style: h7SemiBold.copyWith(
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        if (store.rating != null) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Theme.of(context).secondaryHeaderColor.withValues(alpha: 0.8),
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                store.rating.toString(),
                                style: h7SemiBold.copyWith(
                                  color: Theme.of(context).secondaryHeaderColor.withValues(alpha: 0.8),
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
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${store.stockLeft} Product',
                    style: h7SemiBold.copyWith(
                            color: colorScheme.onSurface,
                          ),
                  ),
                  Text(
                    '${store.reviewCount} Review',
                    style: TextStyle(fontSize: Dimensions.fontSizeSmall, color: colorScheme.outline),
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
