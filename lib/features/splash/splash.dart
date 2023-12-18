import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task/core/constants/image_asset.dart';
import 'package:task/features/onboarding/screens/onboarding.dart';
import 'package:task/features/home/screen/second_page.dart';
import 'package:task/features/services.dart';

import '../../core/constants/sharedprefrence.dart';

class SplashAnimated extends StatefulWidget {
  const SplashAnimated({super.key});

  @override
  State<SplashAnimated> createState() => _SplashAnimatedState();
}

class _SplashAnimatedState extends State<SplashAnimated> {
//   // String? isLogined;
  @override
//   // void initState() {
//   //   Prefrence.getValue().then((value) => isLogined = value);

//   //   super.initState();
//   // }

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 247, 247, 247),
        child: Image.asset("assets/images/logo.jfif")
        );
//     return AnimatedSplashScreen(
//         splashIconSize: 400,
//         backgroundColor: Colors.white,
//         pageTransitionType: PageTransitionType.topToBottom,
//         splashTransition: SplashTransition.rotationTransition,
//         splash: const CircleAvatar(
//           radius: 400,
//           backgroundImage: AssetImage(
//             AppImageAsset.SplashLogo,
//           ),
//         ),
//         // nextScreen: isLogined == null ? OnBoarding() : SecondPage(),
//         nextScreen: Shared.pref.getString("email") != null ? SecondPage() : OnBoarding(),
//         duration: 1000,
//         animationDuration: const Duration(seconds: 1));
  }
}
