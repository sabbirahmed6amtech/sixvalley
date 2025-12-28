import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_typography.dart';

class DummyPlaceholder extends StatelessWidget {
  final String title;
  final double height;

  const DummyPlaceholder({
    super.key,
    required this.title,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTypography.h5Regular.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
