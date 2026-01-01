import 'package:flutter/material.dart';
import 'package:sixvalley/utils/styles.dart';
import '../../../common/widgets/store_card.dart';
import '../model/product_model.dart';
import '../model/store_model.dart';

/// Top Stores
class TopStores extends StatelessWidget {
  final String title;
  final List<StoreModel> store;
  final VoidCallback? onViewAllTap;
  final Function(ProductModel)? onProductTap;
  final Function(ProductModel)? onFavoriteTap;

  const TopStores({
    super.key,
    this.title = 'Top Stores',
    this.store = const [],
    this.onViewAllTap,
    this.onProductTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayStore = store.isNotEmpty
        ? store
        : StoreModel.storeData;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Section
          _FeaturedHeader(title: title, onViewAllTap: onViewAllTap),
          const SizedBox(height: 12),
          // Products List
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: displayStore.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final store = displayStore[index];
                return StoreCard(store: store);
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
          style: h7SemiBold.copyWith(
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
