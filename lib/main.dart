import 'package:flutter/material.dart';
import 'package:task/core/constants/sharedprefrence.dart';
import 'package:task/features/first_page.dart';
import 'package:task/features/home/second_page.dart';
import 'package:task/features/onboarding/screens/onboarding.dart';
import 'package:task/features/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // OnBoarding(),
      SplashAnimated(),
      );
  }
}
