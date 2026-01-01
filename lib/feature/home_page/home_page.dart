import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sixvalley/common/widgets/product_card.dart';
import 'package:sixvalley/feature/home_page/model/product_model.dart';
import 'package:sixvalley/feature/home_page/widgets/category_tabs.dart';
import 'package:sixvalley/feature/home_page/widgets/custom_slider.dart';
import 'package:sixvalley/feature/home_page/widgets/featured_products.dart';
import 'package:sixvalley/feature/home_page/widgets/home_header.dart';
import 'package:sixvalley/feature/home_page/widgets/home_search_bar.dart';
import 'package:sixvalley/feature/home_page/widgets/new_user_exclusive.dart';
import 'package:sixvalley/feature/home_page/widgets/one_time_deal.dart';
import 'package:sixvalley/feature/home_page/widgets/todays_deal.dart';
import 'package:sixvalley/feature/home_page/widgets/todays_deal_web.dart';
import 'package:sixvalley/feature/home_page/widgets/top_stores.dart';
import 'package:sixvalley/helper/responsive_helper.dart';
import '../../utils/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _selectedTabIndex = 0;

  final List<String> _categories = [
    'Explore',
    'Sports',
    "Women's",
    'Kids',
    'Wigs',
    'Electronics',
    'Fashion',
    'Home',
  ];

  final List<String> _tabs = [
    'New Arrivals',
    'Discounted Products',
    'Top Products',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeHeader(
                selectedCategoryIndex: _selectedCategoryIndex,
                categories: _categories,
                onCategorySelected: (index) {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
              ),
            ),
            const FloatingSearchBar(),
            SliverToBoxAdapter(child: const OneTimeDeal()),

            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            SliverToBoxAdapter(child: CustomSlider()),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            SliverToBoxAdapter(child: const FeaturedProducts()),
            SliverToBoxAdapter(child:  ResponsiveHelper.isDesktop(context)? TodaysDealWeb(): TodaysDeal()),

            if (ResponsiveHelper.isMobile(context)) SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(Images.banner1),
              ),
            ),
            SliverToBoxAdapter(child: NewUserExclusive()),
            SliverToBoxAdapter(child: TopStores()),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(Images.banner2),
              ),
            ),

            CategoryTabs(
              tabs: _tabs,
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: ResponsiveHelper.isMobile(context)? 2:3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childCount: ProductModel.getProductsByCategory(_tabs[_selectedTabIndex]).length,
                itemBuilder: (context, index) {
                  final products = ProductModel.getProductsByCategory(_tabs[_selectedTabIndex]);
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    width: double.infinity,
                    imageHeight: 160,
                    showRating: product.hasRating,
                    onTap: () {},
                    onFavoriteTap: () {},
                  );
                },
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
