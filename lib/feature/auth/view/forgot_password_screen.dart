import 'package:flutter/material.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/gaps.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Forgot Password',
          style: interSemiBold.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
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
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge * 2),
   
                  Image.asset(
                    Images.logo,
                    height: Dimensions.imageSizeDefault,
                    fit: BoxFit.contain,
                  ),
                  
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge * 2),

                  Text(
                    'Forgot Password',
                    style: interBold.copyWith(
                      fontSize: Dimensions.fontSizeOverLarge,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),

                  Gaps.vGapDefault,

                  Text(
                    'Enter phone number for password reset',
                    style: interRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color: Theme.of(context).hintColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge * 2),
                  CustomTextField(
                    labelText: 'Phone',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),                  
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge * 2),               
                  CustomButton(
                    text: 'Send',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                      }
                    },
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
