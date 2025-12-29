import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sixvalley/screen/home/widgets/custom_slider.dart';
import 'package:sixvalley/screen/home/widgets/featured_products.dart';
import 'package:sixvalley/screen/home/widgets/home_header.dart';
import 'package:sixvalley/screen/home/widgets/dummy_placeholder.dart';
import 'package:sixvalley/screen/home/widgets/one_time_deal.dart';
import 'package:sixvalley/screen/home/widgets/todays_deal.dart';

import '../../core/constant/app_colors.dart';
import '../../core/theme/app_theme.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? AppColors.black
        : AppColors.white,
      body: Column(
        children: [
          // FIXED HEADER SECTION
          HomeHeader(
            selectedCategoryIndex: _selectedCategoryIndex,
            categories: _categories,
            onCategorySelected: (index) {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          ),

          //SCROLLABLE CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //One time deal
                  const OneTimeDeal(),
                  const SizedBox(height: 16),
                  //Slider
                  // Padding(padding: const EdgeInsets.all(8.0), child: Image.asset("assets/images/bigsale.png"),),
                  CustomSlider(),
                  const SizedBox(height: 16),
                  //Feature Product
                  const FeaturedProducts(),
                  //Todays Deal
                  const TodaysDeal(),
                  Padding(padding: const EdgeInsets.all(12.0), child: Image.asset("assets/images/banner1.png"),),
                  const DummyPlaceholder(title: 'New User Excusive', height: 250,),
                  const SizedBox(height: 16),
                  Padding(padding: const EdgeInsets.all(12.0), child: Image.asset("assets/images/banner2.png"),),
                  const SizedBox(height: 16),
                  const DummyPlaceholder(title: 'New Arrivals', height: 250),
                  const SizedBox(height: 16),
                  const DummyPlaceholder(
                    title: 'Popular Products',
                    height: 300,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}


