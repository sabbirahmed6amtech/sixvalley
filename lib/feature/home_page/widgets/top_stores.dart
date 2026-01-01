import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley/feature/home_page/controller/stores_controller.dart';
import 'package:sixvalley/utils/styles.dart';
import '../../../common/widgets/store_card.dart';
import '../model/product_model.dart';
import '../model/stores_model.dart';

/// Top Stores
class TopStores extends StatefulWidget {
  final String title;
  final List<StoresModel> store;
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
  State<TopStores> createState() => _TopStoresState();
}

class _TopStoresState extends State<TopStores> {
  final StoresController _storesController = Get.put(StoresController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Section
          _FeaturedHeader(
            title: widget.title,
            onViewAllTap: widget.onViewAllTap,
          ),
          const SizedBox(height: 12),
          // Products List
          FutureBuilder<List<StoresModel>>(
            future: _storesController.getStoreList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 180,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return SizedBox(
                  height: 180,
                  child: Center(
                    child: Text('Error loading stores: ${snapshot.error}'),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SizedBox(
                  height: 180,
                  child: Center(child: Text('No stores available')),
                );
              }

              final stores = snapshot.data!;

              return SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: stores.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final store = stores[index];
                    return StoreCard(store: store);
                  },
                ),
              );
            },
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
        Text(title, style: h7SemiBold.copyWith(color: colorScheme.onSurface)),
        GestureDetector(
          onTap: onViewAllTap,
          child: Text('View all', style: h7Light),
        ),
      ],
    );
  }
}
