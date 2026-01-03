import 'package:flutter/material.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final IconData? icon;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.fontSize,
    this.icon,
    this.borderRadius = Dimensions.radiusDefault,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Dimensions.buttonHeight,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          disabledBackgroundColor: Theme.of(context).disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Theme.of(context).cardColor,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      color: textColor ?? Theme.of(context).cardColor,
                      size: Dimensions.iconSizeDefault,
                    ),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                  ],
                  Text(
                    text,
                    style: interSemiBold.copyWith(
                      color: textColor ?? Theme.of(context).cardColor,
                      fontSize: fontSize ?? Dimensions.fontSizeLarge,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
