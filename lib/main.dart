import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley/feature/splash/view/splash_screen.dart';
import 'package:sixvalley/helper/dependency_injection.dart' as di;
import 'package:sixvalley/theme/light_theme.dart';
import 'package:sixvalley/theme/dark_theam.dart';
import 'package:sixvalley/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
