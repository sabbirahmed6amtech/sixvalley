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
import '../widgets/social_login_button.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeExtraLarge,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.vGapExtraLarge,
                  

                  Image.asset(
                    Images.logo,
                    height: Dimensions.imageSizeMedium,
                    fit: BoxFit.contain,
                  ),
                  
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge * 2),
                  

                  CustomTextField(
                    labelText: 'Email/Phone *',
                    controller: _emailPhoneController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  
                  Gaps.vGapLarge,
                  

                  PasswordTextField(
                    labelText: 'Password *',
                    hintText: 'Enter 7+ Character',
                    controller: _passwordController,
                  ),
                  
                  Gaps.vGapLarge,
                  

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: Dimensions.sizeBoxHeight,
                            width: Dimensions.sizeBoxHeight,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                              activeColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                              ),
                            ),
                          ),
                          Gaps.hGapSmall,
                          Text(
                            'Remember Me?',
                            style: interRegular.copyWith(
                              fontSize: Dimensions.fontSizeDefault,
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
                  

                  GetBuilder<AuthController>(
                    builder: (authController) {
                      return CustomButton(
                        text: 'Sign In',
                        isLoading: authController.isLoading,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            authController.login(
                              emailOrPhone: _emailPhoneController.text.trim(),
                              password: _passwordController.text,
                              rememberMe: _rememberMe,
                            );
                          }
                        },
                      );
                    },
                  ),
                  
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
                  

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault,
                        ),
                        child: Text(
                          'Or Sign in with',
                          style: interRegular.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  
                  Gaps.vGapExtraLarge,
                  

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        icon: Icons.g_mobiledata,
                        onPressed: () {                     
                        },
                      ),
                      Gaps.hGapLarge,
                      SocialLoginButton(
                        icon: Icons.facebook,
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
                  

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ? ",
                        style: interRegular.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Sign Up',
                          style: interMedium.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  Gaps.vGapLarge,
                  

                  TextButton(
                    onPressed: () {
                      // TODO: Continue as guest
                    },
                    child: Text(
                      'Continue as Guest',
                      style: interMedium.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  
                  Gaps.vGapExtraLarge,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
