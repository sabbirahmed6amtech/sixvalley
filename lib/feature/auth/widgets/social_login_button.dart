import 'package:flutter/material.dart';
import '../../../utils/dimensions.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor ?? Theme.of(context).primaryColor,
          size: Dimensions.iconSizeMedium,
        ),
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      ),
    );
  }
}
