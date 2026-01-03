import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../feature/auth/controller/auth_controller.dart';
import '../feature/auth/repository/auth_repository.dart';
import '../feature/profile/controller/profile_controller.dart';
import '../feature/profile/repository/profile_repository.dart';
import '../feature/splash/controller/splash_controller.dart';
import '../helper/api_client.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(sharedPreferences: Get.find()));

  Get.lazyPut(() => AuthRepository(apiClient: Get.find()));
  Get.lazyPut(() => ProfileRepository(apiClient: Get.find()));

  Get.put(AuthController(authRepository: Get.find()), permanent: true);
  Get.put(ProfileController(profileRepository: Get.find()), permanent: true);
  Get.put(SplashController());
}
