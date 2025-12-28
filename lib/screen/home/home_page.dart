import 'package:flutter/material.dart';
import 'package:sixvalley/screen/home/widgets/home_header.dart';
import 'package:sixvalley/screen/home/widgets/dummy_placeholder.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: Column(
        children: [
          // ===== FIXED HEADER SECTION =====
          HomeHeader(
            selectedCategoryIndex: _selectedCategoryIndex,
            categories: _categories,
            onCategorySelected: (index) {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          ),

          // ===== SCROLLABLE CONTENT =====
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const DummyPlaceholder(title: 'Banner Section', height: 180),
                  const SizedBox(height: 16),
                  const DummyPlaceholder(title: 'Categories Grid', height: 200),
                  const SizedBox(height: 16),
                  const DummyPlaceholder(
                    title: 'Featured Products',
                    height: 250,
                  ),
                  const SizedBox(height: 16),
                  const DummyPlaceholder(title: 'Flash Sale', height: 200),
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
