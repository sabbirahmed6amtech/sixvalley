import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';
import 'package:sixvalley/core/constant/app_typography.dart';

class HomeHeader extends StatelessWidget {
  final int selectedCategoryIndex;
  final List<String> categories;
  final Function(int) onCategorySelected;

  const HomeHeader({
    super.key,
    required this.selectedCategoryIndex,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Welcome & Profile Row
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Welcome 👋',
                        style: AppTypography.h4Regular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Albert Stevano',
                        style: AppTypography.h7SemiBold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2),
                      image: const DecorationImage(
                        image: NetworkImage('https://i.pravatar.cc/150?img=8'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Category Tabs
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => onCategorySelected(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            categories[index],
                            style:
                                (isSelected
                                        ? AppTypography.h5Bold
                                        : AppTypography.h5Regular)
                                    .copyWith(
                                      color: isSelected
                                          ? AppColors.white
                                          : AppColors.white.withOpacity(0.7),
                                    ),
                          ),
                          const SizedBox(height: 6),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 3,
                            width: isSelected ? 40 : 0,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),
            Container(
              height: 80,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.black
                  : AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
