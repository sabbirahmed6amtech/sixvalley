import 'package:flutter/material.dart';
import 'package:sixvalley/helper/responsive_helper.dart';

class BannerViewer extends StatelessWidget {
  final String imageSrc;

  const BannerViewer({
    super.key,
    required this.imageSrc,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: screenWidth,
        height: ResponsiveHelper.isMobile(context) ? screenWidth * 0.3
            : screenWidth / 5,
        child: Image.asset(
          imageSrc,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
