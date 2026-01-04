import 'package:flutter/material.dart';
import 'package:sixvalley/utils/dimensions.dart';
import 'package:sixvalley/utils/gaps.dart';
import '../../../utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.logo,
              width: Dimensions.imageSizeExtraLarge,
              height: Dimensions.imageSizeExtraLarge,
            ),
            Gaps.vGapExtraXLarge,
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
