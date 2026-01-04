import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sixvalley/feature/splash/view/splash_screen.dart';
import 'package:sixvalley/helper/dependency_injection.dart' as di;
import 'package:sixvalley/theme/light_theme.dart';
import 'package:sixvalley/theme/dark_theam.dart';
import 'package:sixvalley/utils/app_constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.requestPermission();
  final fcmToken = await FirebaseMessaging.instance.getToken();

  print('FCM Token: $fcmToken');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Foreground message received');
    print(message.notification?.title);
    print(message.notification?.body);
  });

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
