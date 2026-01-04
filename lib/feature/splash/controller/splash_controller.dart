import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../screen/main_screen.dart';
import '../../../utils/app_constants.dart';
import '../../auth/view/otp_verification_screen.dart';
import '../../auth/view/sign_in_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    final sharedPreferences = Get.find<SharedPreferences>();
    final rememberMe = sharedPreferences.getString(AppConstants.rememberMe.toString());
    final pendingPhone = sharedPreferences.getString(AppConstants.pendingVerificationPhone);

    if (rememberMe != null && rememberMe.isNotEmpty) {
      Get.offAll(() => MainScreen());
    } else if (pendingPhone != null && pendingPhone.isNotEmpty) {
      Get.offAll(() => OtpVerificationScreen(phoneNumber: pendingPhone));
    } else {
      Get.offAll(() => const SignInScreen());
    }
  }
}
