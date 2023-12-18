import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task/core/constants/sharedprefrence.dart';
import 'package:task/features/first_page.dart';
import 'package:task/features/home/screen/second_page.dart';
import 'package:task/features/onboarding/screens/onboarding.dart';
import 'package:task/features/services.dart';
import 'package:task/features/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // AnimatedSplashScreen(
      //       duration: 3000,
      //       splash: Image.asset("assets/images/logo.jfif"),
      //       nextScreen: Shared.pref.getString("email") != null ? SecondPage() : OnBoarding(),
      //       splashTransition: SplashTransition.fadeTransition,
      //       pageTransitionType: PageTransitionType.scale,
      //       backgroundColor: Color.fromARGB(255, 247, 247, 247),
      //       )
          // OnBoarding(),
          // SplashAnimated(),
          FirstPage(),
    );
  }
}
