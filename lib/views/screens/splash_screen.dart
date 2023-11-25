import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/controllers/auth_controller.dart';
import 'package:mealmonkey/views/screens/main_screen.dart';
import 'package:mealmonkey/views/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextFormFieldController authController = Get.put(TextFormFieldController());

  @override
  void initState() {
    authController.getIsLoggedIn();
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (authController.isLoggedIn.value) {
        Get.offAll(const MainScreen(), transition: Transition.rightToLeft);
      } else {
        Get.offAll(const OnBoardingScreen(),
            transition: Transition.rightToLeft);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              "assets/images/splashbg.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white.withOpacity(0.35),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 218.w,
              height: 185.h,
            ),
          ),
        ],
      ),
    );
  }
}
