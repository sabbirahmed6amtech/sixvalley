import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/gaps.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../controller/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _referralCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SafeArea(
            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeExtraLarge,
                    vertical: Dimensions.paddingSizeDefault,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).cardColor,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                      Image.asset(Images.logoWhite, height: Dimensions.imageSizeDefault, fit: BoxFit.contain),
                      Gaps.vGapSmall,
                      
                    ],
                  ),
                ),


                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radiusExtraLarge),
                        topRight: Radius.circular(Dimensions.radiusExtraLarge),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(
                        Dimensions.paddingSizeExtraLarge,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            CustomTextField(
                              labelText: 'First name *',
                              controller: _firstNameController,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).primaryColor,
                                size: Dimensions.iconSizeDefault,
                              ),
                            ),

                            Gaps.vGapLarge,


                            CustomTextField(
                              labelText: 'Last name *',
                              controller: _lastNameController,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).primaryColor,
                                size: Dimensions.iconSizeDefault,
                              ),
                            ),

                            Gaps.vGapLarge,


                            CustomTextField(
                              labelText: 'Enter your email *',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).primaryColor,
                                size: Dimensions.iconSizeDefault,
                              ),
                            ),

                            Gaps.vGapLarge,


                            TextFormField(
                              controller: _mobileController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.color,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Enter mobile number *',
                                labelStyle: TextStyle(
                                  fontSize: Dimensions.fontSizeDefault,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.color,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    left: Dimensions.paddingSizeMedium,
                                    right: Dimensions.paddingSizeSmall,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: Dimensions.iconSizeDefault,
                                      ),
                                      Gaps.hGapSmall,
                                      Text(
                                        '+880',
                                        style: TextStyle(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge?.color,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 24,
                                        margin: const EdgeInsets.only(
                                          left: Dimensions.paddingSizeSmall,
                                        ),
                                        color: Theme.of(
                                          context,
                                        ).dividerColor.withAlpha(40),
                                      ),
                                    ],
                                  ),
                                ),
                                filled: true,
                                fillColor: Theme.of(context).cardColor,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSizeMedium,
                                  vertical: Dimensions.paddingSizeMedium,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault,
                                  ),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).dividerColor.withAlpha(40),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault,
                                  ),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).dividerColor.withAlpha(40),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault,
                                  ),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),

                            Gaps.vGapLarge,


                            PasswordTextField(
                              labelText: 'Password *',
                              controller: _passwordController,
                            ),

                            Gaps.vGapLarge,


                            PasswordTextField(
                              labelText: 'Re-enter password *',
                              controller: _confirmPasswordController,
                            ),

                            Gaps.vGapLarge,


                            CustomTextField(
                              labelText: 'Referral Code (Optional)',
                              controller: _referralCodeController,
                              prefixIcon: Icon(
                                Icons.group_outlined,
                                color: Theme.of(context).primaryColor,
                                size: Dimensions.iconSizeDefault,
                              ),
                            ),

                            Gaps.vGapLarge,


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.sizeBoxHeight,
                                  width: Dimensions.sizeBoxHeight,
                                  child: Checkbox(
                                    value: _agreeToTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        _agreeToTerms = value ?? false;
                                      });
                                    },
                                    activeColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.radiusSmall,
                                      ),
                                    ),
                                  ),
                                ),
                                Gaps.hGapSmall,
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'I agree with the ',
                                      style: interRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.color,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Terms & Condition',
                                          style: interMedium.copyWith(
                                            fontSize:
                                                Dimensions.fontSizeDefault,
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: Dimensions.paddingSizeExtraMoreLarge,
                            ),

                            // Sign Up Button
                            CustomButton(
                              text: 'Sign Up',
                              isLoading: authController.isLoading,
                              onPressed: _agreeToTerms
                                  ? () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        if (_passwordController.text !=
                                            _confirmPasswordController.text) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Passwords do not match',
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        authController.register(
                                          firstName: _firstNameController.text
                                              .trim(),
                                          lastName: _lastNameController.text
                                              .trim(),
                                          phone:
                                              '+880${_mobileController.text.trim()}',
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text,
                                          referralCode:
                                              _referralCodeController.text
                                                  .trim()
                                                  .isEmpty
                                              ? null
                                              : _referralCodeController.text
                                                    .trim(),
                                        );
                                      }
                                    }
                                  : null,
                            ),

                            Gaps.vGapExtraLarge,


                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already Have an Account? ',
                                  style: interRegular.copyWith(
                                    fontSize: Dimensions.fontSizeDefault,
                                    color: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.color,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Sign In',
                                        style: interMedium.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: Dimensions.iconSizeDefault,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Gaps.vGapLarge,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
