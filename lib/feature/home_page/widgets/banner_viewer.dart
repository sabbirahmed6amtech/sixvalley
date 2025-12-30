import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../config/size_config.dart';

class BannerViewer extends StatelessWidget {
  final String imageSrc;

  const BannerViewer({
    super.key,
    required this.imageSrc,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: SizeConfig.width,
        height: ResponsiveHelper.isMobile(context) ? SizeConfig.width *0.3
            : SizeConfig.width /5,
        child: Image.asset(
          imageSrc,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
