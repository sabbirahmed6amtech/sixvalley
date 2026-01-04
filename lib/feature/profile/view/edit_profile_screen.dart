import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley/helper/responsive_helper.dart';
import 'package:sixvalley/utils/app_constants.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/gaps.dart';
import '../../../utils/styles.dart';
import '../../auth/widgets/custom_button.dart';
import '../../auth/widgets/custom_text_field.dart';
import '../controller/profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final profileController = Get.find<ProfileController>();
    _firstNameController.text = profileController.profileModel?.fName ?? '';
    _lastNameController.text = profileController.profileModel?.lName ?? '';
    _emailController.text = profileController.profileModel?.email ?? '';
    _phoneController.text = profileController.profileModel?.phone ?? '';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Edit Profile'), centerTitle: true),
      body: GetBuilder<ProfileController>(
        builder: (profileController) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update Your Information',
                      style: h4SemiBold.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),

                    Gaps.vGapLarge,

                    // Profile Picture Section
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: Dimensions.imageSizeLarge,
                                height: Dimensions.imageSizeLarge,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: Dimensions.radiusSmall,
                                  ),
                                  color: Colors.grey[300],
                                ),
                                child: ClipOval(
                                  child:
                                      profileController.selectedImageFile !=
                                          null
                                      ? ResponsiveHelper.isWeb()
                                            ? Image.network(
                                                profileController
                                                    .selectedImageFile!
                                                    .path,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(
                                                profileController
                                                    .selectedImageFile!,
                                                fit: BoxFit.cover,
                                              )
                                      : profileController.profileModel?.image !=
                                                null &&
                                            profileController
                                                .profileModel!
                                                .image!
                                                .isNotEmpty
                                      ? Image.network(
                                          profileController.profileModel!.image!
                                                  .startsWith('http')
                                              ? profileController
                                                    .profileModel!
                                                    .image!
                                              : '${AppConstants.customerImageUrl}/${profileController.profileModel!.image!}',
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Icon(
                                                  Icons.person,
                                                  size: Dimensions.iconSizeXLarge,
                                                  color: Colors.grey[600],
                                                );
                                              },
                                        )
                                      : Icon(
                                          Icons.person,
                                          size: Dimensions.iconSizeXLarge,
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
                                      size: Dimensions.iconSizeDefault,
                                    ),
                                    onPressed: () {
                                      profileController.pickImageForPreview();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (profileController.selectedImageFile != null) ...[
                            Gaps.vGapDefault,
                            Text(
                              'New Image Selected',
                              style: interRegular.copyWith(
                                color: Colors.green,
                                fontSize: Dimensions.fontSizeSmall,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    Gaps.vGapLarge,

                    CustomTextField(
                      labelText: 'First Name *',
                      controller: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),

                    Gaps.vGapLarge,

                    CustomTextField(
                      labelText: 'Last Name *',
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),

                    Gaps.vGapLarge,

                    CustomTextField(
                      labelText: 'Email *',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    Gaps.vGapLarge,
                    // Phone (Read-only)
                    CustomTextField(
                      labelText: 'Phone',
                      controller: _phoneController,
                      enabled: false,
                      suffixIcon: const Icon(Icons.lock_outline),
                    ),
                    Gaps.vGapSmall,
                    Text(
                      'Phone number cannot be changed',
                      style: interRegular.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeExtraMoreLarge,
                    ),
                    CustomButton(
                      text: 'Update Profile',
                      isLoading: profileController.isLoading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          profileController
                              .updateProfile(
                                firstName: _firstNameController.text.trim(),
                                lastName: _lastNameController.text.trim(),
                                email: _emailController.text.trim(),
                                updateImage:
                                    profileController.selectedImageFile != null,
                              )
                              .then((_) {
                                if (!profileController.isLoading) {
                                  Get.back();
                                }
                              });
                        }
                      },
                    ),
                    Gaps.vGapDefault,
                    CustomButton(
                      text: 'Cancel',
                      backgroundColor: Colors.grey,
                      onPressed: () {
                        profileController.clearSelectedImage();
                        Get.back();
                      },
                    ),

                    Gaps.vGapExtraLarge,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
