import 'package:flutter/material.dart';
import 'package:sixvalley/utils/dimensions.dart';
import 'package:sixvalley/utils/styles.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSearchTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String hintText;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onSearchTap,
    this.onChanged,
    this.onSubmitted,
    this.hintText = 'What are you looking for?',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      height: 70,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? colorScheme.surfaceContainerHighest
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                style: h5Regular.copyWith(
                  color: colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: h5Regular.copyWith(
                    color: colorScheme.outline.withValues(alpha: 0.6),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge,
                    vertical: Dimensions.paddingSizeDefault,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(Dimensions.gapXSmall),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              ),
              child: IconButton(
                onPressed: onSearchTap,
                icon: const Icon(Icons.search),
                color: colorScheme.surface,
                iconSize: Dimensions.iconSizeDefault,
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                constraints: const BoxConstraints(
                  minWidth: Dimensions.buttonHeight * 0.83,
                  minHeight: Dimensions.buttonHeight * 0.83,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 0; // Can shrink to 0 when tabs push it out
  @override
  double get maxExtent => 70;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double opacity = ((maxExtent - shrinkOffset) / maxExtent).clamp(0.0, 1.0);
    
    return Container(
      height: maxExtent,
      color: Theme.of(context).cardColor,
      child: Opacity(
        opacity: opacity,
        child: const HomeSearchBar(),
      ),
    );
  }

  @override
  bool shouldRebuild(_) => false;
}

// Floating search bar widget for easy usage
class FloatingSearchBar extends StatelessWidget {
  const FloatingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SearchBarDelegate(),
    );
  }
}
