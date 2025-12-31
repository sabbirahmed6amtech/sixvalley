import 'package:flutter/material.dart';
import 'package:sixvalley/theme/light_theme.dart';
import 'package:sixvalley/theme/dark_theam.dart';
import 'package:sixvalley/screen/main_screen.dart';
import 'package:sixvalley/utils/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.light,
      home: const MainScreen(),
    );
  }
}

