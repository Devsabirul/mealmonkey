import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/controllers/auth_controller.dart';
import 'package:mealmonkey/views/components/text_input.dart';

import '../../../constants.dart';
import 'otp_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
                    "Reset Password",
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
                    height: 64.h,
                  ),
                  TextFormFieldWidget(
                    controller: inputController.emailFieldController,
                    hinttext: "Email",
                    validateMsg: 'Enter strong password.',
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const OptVerificationScreen(),
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
                      "Send",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
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
