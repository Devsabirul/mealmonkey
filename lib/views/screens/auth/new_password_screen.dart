import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/constants.dart';
import 'package:mealmonkey/controllers/auth_controller.dart';
import 'package:mealmonkey/views/screens/auth/reset_password.dart';
import 'package:mealmonkey/views/screens/auth/signup_screen.dart';

import '../../components/text_input.dart';
import '../main_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextFormFieldController inputController =
        Get.put(TextFormFieldController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Align(
              child: Column(
                children: [
                  SizedBox(
                    height: 46.h,
                  ),
                  Text(
                    "New Password",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: textDarkColor,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    "Please enter your email to receive a \nlink to create a new password via email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textLightColor,
                      height: 1.5.h,
                    ),
                  ),
                  SizedBox(
                    height: 58.h,
                  ),
                  TextFormFieldWidget(
                    hinttext: "Password",
                    controller: inputController.passwordFieldController,
                    isPassword: true,
                    validateMsg: 'Enter strong password.',
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  TextFormFieldWidget(
                    hinttext: "Confirm Password",
                    controller: inputController.confirmPasswordFieldController,
                    isPassword: true,
                    validateMsg: 'Enter strong password.',
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.off(const MainScreen(),
                          transition: Transition.rightToLeft);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: Size(Get.width, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
