import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley/helper/responsive_helper.dart';
import 'package:sixvalley/utils/app_constants.dart';
import 'package:sixvalley/utils/dimensions.dart';
import 'package:sixvalley/utils/images.dart';
import 'package:sixvalley/utils/styles.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/view/profile_screen.dart';

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
    return ResponsiveHelper.isDesktop(context)
        ? _WebHeader(
            selectedCategoryIndex: selectedCategoryIndex,
            categories: categories,
            onCategorySelected: onCategorySelected,
          )
        : _MobileHeader(
            selectedCategoryIndex: selectedCategoryIndex,
            categories: categories,
            onCategorySelected: onCategorySelected,
          );
  }
}

class _MobileHeader extends StatelessWidget {
  final int selectedCategoryIndex;
  final List<String> categories;
  final Function(int) onCategorySelected;

  const _MobileHeader({
    required this.selectedCategoryIndex,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Dimensions.paddingSizeDefault,
                Dimensions.paddingSizeSmall,
                Dimensions.paddingSizeDefault,
                Dimensions.paddingSizeDefault,
              ),
              child: GetBuilder<ProfileController>(
                builder: (profileController) {
                  final profile = profileController.profileModel;
                  final userName = profile?.fullName.isNotEmpty == true 
                      ? profile!.fullName 
                      : 'User';
                  
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Welcome 👋',
                            style: h5Regular.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary.withAlpha(230),
                              
                            ),
                          ),
                          const SizedBox(height: Dimensions.gapXSmall),
                          Text(
                            userName,
                            style: h4SemiBold.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ProfileScreen());
                        },
                        child: Container(
                          width: Dimensions.iconSizeMedium,
                          height: Dimensions.iconSizeMedium,
                          child: ClipOval(
                            child: profile?.image != null && profile!.image!.isNotEmpty
                                ? Image.network(
                                    profile.image!.startsWith('http')
                                        ? profile.image!
                                        : '${AppConstants.customerImageUrl}/${profile.image!}',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        Images.profile,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )
                                : Icon( 
                                    Icons.person,
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    size: Dimensions.iconSizeMedium,
                                  ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),


            SizedBox(
              height: Dimensions.buttonHeight * 0.65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => onCategorySelected(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: Dimensions.paddingSizeMedium),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            categories[index],
                            style:
                                (isSelected
                                        ? h5Bold
                                        : h5Regular)
                                    .copyWith(
                                      color: isSelected
                                          ? Theme.of(context).colorScheme.onPrimary
                                          : Theme.of(context).colorScheme.onPrimary.withAlpha(179),
                                    ),
                          ),
                          const SizedBox(height: Dimensions.gapSmall),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: Dimensions.radiusSmall,
                            width: isSelected ? Dimensions.imageSizeSmall : 0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/// Web Header Layout
class _WebHeader extends StatelessWidget {
  final int selectedCategoryIndex;
  final List<String> categories;
  final Function(int) onCategorySelected;

  const _WebHeader({
    required this.selectedCategoryIndex,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: Dimensions.webMaxWidth,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge,
                    vertical: Dimensions.paddingSizeDefault,
                  ),
                  child: Row(
                    children: [

                      Image.asset(
                        Images.logoWhite,
                        height: Dimensions.imageSizeSmall,
                        
                      ),
                      const SizedBox(width: Dimensions.paddingSizeExtraLarge),


                      Expanded(
                        child: Container(
                          height: Dimensions.textFieldHeight,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'What are you looking for?',
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).hintColor,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeDefault,
                                vertical: Dimensions.paddingSizeDefault,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimensions.paddingSizeLarge),


                      Container(
                        width: Dimensions.imageSizeSmall,
                        height: Dimensions.imageSizeSmall,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: Dimensions.radiusSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  height: Dimensions.textFieldHeight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge,
                  ),
                  child: Row(
                    children: List.generate(
                      categories.length,
                      (index) {
                        final isSelected = selectedCategoryIndex == index;
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: Dimensions.paddingSizeExtraLarge,
                          ),
                          child: InkWell(
                            onTap: () => onCategorySelected(index),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  categories[index],
                                  style: (isSelected ? h5Bold : h5Regular).copyWith(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.onPrimary
                                        : Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.7),
                                  ),
                                ),
                                const SizedBox(height: Dimensions.gapSmall),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  height: Dimensions.radiusSmall,
                                  width: isSelected ? Dimensions.imageSizeSmall : 0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeSmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
