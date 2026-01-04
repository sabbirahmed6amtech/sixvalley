import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley/feature/auth/widgets/custom_button.dart';
import 'package:sixvalley/utils/app_constants.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/gaps.dart';
import '../../../utils/styles.dart';
import '../../auth/controller/auth_controller.dart';
import '../controller/profile_controller.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
      body: GetBuilder<ProfileController>(
        builder: (profileController) {
          if (profileController.isLoading &&
              profileController.profileModel == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final profile = profileController.profileModel;

          if (profile == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load profile'),
                  Gaps.vGapDefault,
                  ElevatedButton(
                    onPressed: () => profileController.getProfile(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(
                    Dimensions.paddingSizeExtraLarge,
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 3,
                              ),
                              color: Colors.grey[300],
                            ),
                            child: ClipOval(
                              child: profileController.selectedImageFile != null
                                  ? Image.file(
                                      profileController.selectedImageFile!,
                                      fit: BoxFit.cover,
                                    )
                                  : profile.image != null &&
                                        profile.image!.isNotEmpty
                                  ? Image.network(
                                      profile.image!.startsWith('http')
                                          ? profile.image!
                                          : '${AppConstants.customerImageUrl}/${profile.image!}',
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Icon(
                                              Icons.person,
                                              size: 60,
                                              color: Colors.grey[600],
                                            );
                                          },
                                    )
                                  :
                                  Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Colors.grey[600],
                                    ),
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  profileController.pickImageForPreview();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      profileController.selectedImageFile != null? Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
                        child: SizedBox(
                          height: Dimensions.imageSizeExtraLarge,
                          width: Dimensions.imageSizeExtraLarge,

                          child: profileController.selectedImageFile != null? Image.file(
                            profileController.selectedImageFile!,
                            fit: BoxFit.cover,
                          )
                              : profile.image != null &&
                              profile.image!.isNotEmpty
                              ? Image.network(
                            profile.image!.startsWith('http')
                                ? profile.image!
                                : '${AppConstants.customerImageUrl}/${profile.image!}',
                            fit: BoxFit.cover,
                            loadingBuilder:
                                (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                  loadingProgress
                                      .expectedTotalBytes !=
                                      null
                                      ? loadingProgress
                                      .cumulativeBytesLoaded /
                                      loadingProgress
                                          .expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            errorBuilder:
                                (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.grey[600],
                              );
                            },
                          )
                              : null
                        ),
                      ):SizedBox(),

                      // Show update/cancel buttons when image is selected
                      if (profileController.selectedImageFile != null) ...[
                        Gaps.vGapDefault,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: profileController.isLoading
                                  ? null
                                  : () => profileController.updateProfile(
                                      updateImage: true,
                                    ),
                              icon: profileController.isLoading
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    )
                                  : const Icon(Icons.check, size: 18),
                              label: Text(
                                profileController.isLoading
                                    ? 'Uploading...'
                                    : 'Update Image',
                                style: const TextStyle(fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton.icon(
                              onPressed: profileController.isLoading
                                  ? null
                                  : () =>
                                        profileController.clearSelectedImage(),
                              icon: const Icon(Icons.close, size: 18),
                              label: const Text(
                                'Cancel',
                                style: TextStyle(fontSize: 12),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],

                      Gaps.vGapDefault,
                      Text(
                        profile.fullName.isNotEmpty ? profile.fullName : 'User',
                        style: h3SemiBold.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),

                      Gaps.vGapSmall,

                      if (profile.email != null)
                        Text(
                          profile.email!,
                          style: interRegular.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                    ],
                  ),
                ),

                Gaps.vGapLarge,

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeExtraLarge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Information',
                        style: h4SemiBold.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),

                      Gaps.vGapDefault,

                      _buildInfoTile(
                        context,
                        icon: Icons.person_outline,
                        label: 'First Name',
                        value: profile.fName ?? 'N/A',
                      ),

                      const Divider(),

                      _buildInfoTile(
                        context,
                        icon: Icons.person_outline,
                        label: 'Last Name',
                        value: profile.lName ?? 'N/A',
                      ),

                      const Divider(),

                      _buildInfoTile(
                        context,
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: profile.email ?? 'N/A',
                      ),

                      const Divider(),

                      _buildInfoTile(
                        context,
                        icon: Icons.phone_outlined,
                        label: 'Phone',
                        value: profile.phone ?? 'N/A',
                      ),

                      const Divider(),

                      if (profile.createdAt != null)
                        _buildInfoTile(
                          context,
                          icon: Icons.calendar_today_outlined,
                          label: 'Member Since',
                          value: _formatDate(profile.createdAt!),
                        ),

                      Gaps.vGapExtraLarge,

                      CustomButton(
                        text: 'Edit Profile',
                        onPressed: () {
                          Get.to(() => const EditProfileScreen());
                        },
                      ),

                      Gaps.vGapDefault,

                      CustomButton(
                        text: 'Logout',
                        backgroundColor: Colors.red,
                        onPressed: () {
                          final authController = Get.find<AuthController>();
                          authController.logout();
                        },
                      ),

                      Gaps.vGapExtraLarge,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeSmall,
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 24),
          Gaps.hGapDefault,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: interRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: interMedium.copyWith(
                    fontSize: Dimensions.fontSizeDefault,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
