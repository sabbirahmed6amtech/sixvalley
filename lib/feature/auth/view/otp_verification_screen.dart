import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/gaps.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  int _resendTimer = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _canResend = false;
    _resendTimer = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String _getOtp() {
    return _otpControllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeExtraLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Gaps.vGapExtraLarge,
                          Image.asset(
                            Images.logo,
                            height: Dimensions.imageSizeMedium,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
                          Text(
                            'OTP Verification',
                            style: h2Bold.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Gaps.vGapMedium,
                          Text(
                            'We have sent a verification code to',
                            style: interRegular.copyWith(
                              color: Theme.of(context).hintColor,
                              fontSize: Dimensions.fontSizeDefault,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gaps.vGapSmall,
                          Text(
                            widget.phoneNumber,
                            style: interSemiBold.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Gaps.vGapLarge,
                          const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              6,
                              (index) => SizedBox(
                                width: 50,
                                child: TextField(
                                  controller: _otpControllers[index],
                                  focusNode: _focusNodes[index],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  style: interBold.copyWith(
                                    fontSize: Dimensions.fontSizeOverLarge,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).hintColor.withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index < 5) {
                                      _focusNodes[index + 1].requestFocus();
                                    } else if (value.isEmpty && index > 0) {
                                      _focusNodes[index - 1].requestFocus();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't receive code? ",
                                style: interRegular.copyWith(
                                  color: Theme.of(context).hintColor,
                                  fontSize: Dimensions.fontSizeDefault,
                                ),
                              ),
                              GestureDetector(
                                onTap: _canResend
                                    ? () {
                                        authController.resendOtp(widget.phoneNumber);
                                        _startTimer();
                                      }
                                    : null,
                                child: Text(
                                  _canResend ? 'Resend' : 'Resend in $_resendTimer s',
                                  style: interSemiBold.copyWith(
                                    color: _canResend
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).hintColor,
                                    fontSize: Dimensions.fontSizeDefault,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gaps.vGapLarge,
                  CustomButton(
                    text: 'Verify',
                    isLoading: authController.isLoading,
                    onPressed: () {
                      final otp = _getOtp();
                      if (otp.length != 6) {
                        Get.snackbar(
                          'Error',
                          'Please enter all 6 digits',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      authController.verifyOtp(
                        phone: widget.phoneNumber,
                        otp: otp,
                      );
                    },
                  ),
                  Gaps.vGapLarge,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
