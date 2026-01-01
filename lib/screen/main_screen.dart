import 'package:flutter/material.dart';
import 'package:sixvalley/feature/home_page/widgets/custom_bottom_nav_bar.dart';
import 'package:sixvalley/utils/dimensions.dart';

import '../helper/responsive_helper.dart';
import '../feature/home_page/view/home_page.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const _PlaceholderPage(title: 'Categories'),
    const _PlaceholderPage(title: 'Cart'),
    const _PlaceholderPage(title: 'Stores'),
    const _PlaceholderPage(title: 'Menu'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SizedBox(
        width: ResponsiveHelper.isDesktop(context)?Dimensions.webMaxWidth:null,
        child: IndexedStack(index: _currentIndex, children: _pages))),
      bottomNavigationBar: ResponsiveHelper.isMobile(context)? CustomBottomNavBar(
        currentIndex: _currentIndex,
        cartItemCount: 6,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ) :null,
    );
  }
}

// Temporary placeholder for other pages
class _PlaceholderPage extends StatelessWidget {
  final String title;

  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title, style: Theme.of(context).textTheme.displaySmall),
      ),
    );
  }
}
