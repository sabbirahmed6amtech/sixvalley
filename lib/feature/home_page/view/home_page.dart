import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sixvalley/common/widgets/product_card.dart';
import 'package:sixvalley/feature/home_page/controller/home_page_controller.dart';
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
import '../../../utils/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GetBuilder<HomePageController>(
                builder: (controller) => HomeHeader(
                  selectedCategoryIndex: controller.selectedCategoryIndex,
                  categories: controller.categories,
                  onCategorySelected: (index) {
                    controller.updateCategoryIndex(index);
                  },
                ),
              ),
            ),
            const FloatingSearchBar(),
            SliverToBoxAdapter(child: const OneTimeDeal()),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            SliverToBoxAdapter(child: CustomSlider()),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            SliverToBoxAdapter(child: const FeaturedProducts()),
            SliverToBoxAdapter(
              child: ResponsiveHelper.isDesktop(context)
                  ? TodaysDealWeb()
                  : TodaysDeal(),
            ),
            if (ResponsiveHelper.isMobile(context))
              SliverToBoxAdapter(
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
            GetBuilder<HomePageController>(
              builder: (controller) => CategoryTabs(
                tabs: controller.tabs,
                selectedIndex: controller.selectedTabIndex,
                onTabSelected: (index) {
                  controller.updateTabIndex(index);
                },
              ),
            ),
            GetBuilder<HomePageController>(
              builder: (controller) => SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: ResponsiveHelper.isMobile(context) ? 2 : 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childCount: ProductModel.getProductsByCategory(
                    controller.tabs[controller.selectedTabIndex],
                  ).length,
                  itemBuilder: (context, index) {
                    final products = ProductModel.getProductsByCategory(
                      controller.tabs[controller.selectedTabIndex],
                    );
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
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
