import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/constants.dart';
import 'package:flutter/services.dart';
import 'package:mealmonkey/views/screens/auth/login_screen.dart';

import 'auth/signup_screen.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  height: 382.h,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Image.asset(
                    "assets/images/wlcbg.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 493.h,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(150.r),
                    ),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.h,
            ),
            SizedBox(
              width: 271.w,
              child: Text(
                "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w600,
                  color: textLightColor,
                  fontSize: 13.sp,
                  height: 1.3.h,
                ),
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const LoginScreen(), transition: Transition.rightToLeft);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                fixedSize: const Size(307, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const SignUpScreen(),
                    transition: Transition.rightToLeft);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                fixedSize: const Size(307, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                side: const BorderSide(
                  color: primaryColor,
                ),
              ),
              child: Text(
                "Create an Account",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
