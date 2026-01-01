import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sixvalley/helper/responsive_helper.dart';
import 'package:sixvalley/utils/dimensions.dart';
import 'package:sixvalley/utils/images.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _currentCarouselIndex = 0;

  final List<String> carouselImages = [
    Images.bigSale,
    Images.banner1,
    Images.banner2,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bannerHeight = ResponsiveHelper.isDesktop(context)? screenWidth * 0.15: screenWidth*0.3;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: bannerHeight,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: false,
            viewportFraction: 0.92,
            padEnds: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
          ),
          items: carouselImages.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: screenWidth,
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.gapXSmall),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: Theme.of(context).colorScheme.outline,
                              size: Dimensions.iconSizeLarge,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: Dimensions.gapMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselImages.asMap().entries.map((entry) {
            final bool isActive = _currentCarouselIndex == entry.key;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isActive ? 24.0 : 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: Dimensions.gapXSmall),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
