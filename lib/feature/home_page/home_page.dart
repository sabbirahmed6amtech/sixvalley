import 'package:flutter/material.dart';
import 'package:sixvalley/feature/home_page/widgets/custom_slider.dart';
import 'package:sixvalley/feature/home_page/widgets/dummy_placeholder.dart';
import 'package:sixvalley/feature/home_page/widgets/featured_products.dart';
import 'package:sixvalley/feature/home_page/widgets/home_header.dart';
import 'package:sixvalley/feature/home_page/widgets/home_search_bar.dart';
import 'package:sixvalley/feature/home_page/widgets/new_user_exclusive.dart';
import 'package:sixvalley/feature/home_page/widgets/one_time_deal.dart';
import 'package:sixvalley/feature/home_page/widgets/todays_deal.dart';
import 'package:sixvalley/feature/home_page/widgets/top_stores.dart';

import '../../utils/images.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
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

            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBarDelegate(),
            ),

            SliverToBoxAdapter(child: const OneTimeDeal()),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            SliverToBoxAdapter(child: CustomSlider()),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            SliverToBoxAdapter(child: const FeaturedProducts()),
            SliverToBoxAdapter(child: const TodaysDeal()),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(Images.banner1),
              ),
            ),

            SliverToBoxAdapter(child: NewUserExclusive()),
            SliverPersistentHeader(
              pinned: true,
              delegate: _Example(),
            ),
            SliverToBoxAdapter(child: TopStores()),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(Images.banner2),
              ),
            ),

            SliverToBoxAdapter(
              child: const DummyPlaceholder(
                title: 'New Arrivals',
                height: 250,
              ),
            ),

            SliverToBoxAdapter(
              child: const DummyPlaceholder(
                title: 'Popular Products',
                height: 300,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 70;
  @override
  double get maxExtent => 70;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).cardColor,
      child: const HomeSearchBar(),
    );
  }
  @override
  bool shouldRebuild(_) => false;

}

class _Example extends SliverPersistentHeaderDelegate{
  @override
  double get minExtent => 70;
  @override
  double get maxExtent => 70;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Container(
        width: double.infinity,
        height: 100,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
  @override
  bool shouldRebuild(_) => false;
}