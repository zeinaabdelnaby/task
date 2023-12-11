import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task/core/constants/image_asset.dart';
import 'package:task/features/onboarding/screens/onboarding.dart';
import 'package:task/features/home/second_page.dart';

import '../../core/constants/sharedprefrence.dart';

class SplashAnimated extends StatefulWidget {
  const SplashAnimated({super.key});

  @override
  State<SplashAnimated> createState() => _SplashAnimatedState();
}

class _SplashAnimatedState extends State<SplashAnimated> {
  String? isLogined;
  @override
  void initState() {
    Prefrence.getValue().then((value) => isLogined = value);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 400,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.topToBottom,
        splashTransition: SplashTransition.rotationTransition,
        splash: 
          AssetImage(
            AppImageAsset.SplashLogo,
          ),
        
        nextScreen: isLogined == null ? OnBoarding() : SecondPage(),
        duration: 1000,
        animationDuration: const Duration(seconds: 1));
  }
}
