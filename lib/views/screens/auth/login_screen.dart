import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/constants.dart';
import 'package:mealmonkey/controllers/auth_controller.dart';
import 'package:mealmonkey/views/screens/auth/reset_password.dart';
import 'package:mealmonkey/views/screens/auth/signup_screen.dart';

import '../../components/text_input.dart';
import '../main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    height: 40.h,
                  ),
                  Text(
                    "Login",
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
                    "Add your details to login",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textLightColor,
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Form(
                    key: inputController.formKey,
                    child: Column(
                      children: [
                        TextFormFieldWidget(
                          hinttext: "Your Email",
                          controller: inputController.emailFieldController,
                          validateMsg: 'Enter your Email!',
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        TextFormFieldWidget(
                          hinttext: "Password",
                          controller: inputController.passwordFieldController,
                          isPassword: true,
                          validateMsg: 'Enter you Password.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (inputController.formKey.currentState!.validate()) {
                        inputController.login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: Size(Get.width, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    child: Obx(
                      () => inputController.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const ResetPassword(),
                          transition: Transition.rightToLeft);
                    },
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: textLightColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  Text(
                    "or Login With",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: textLightColor,
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff367FC0),
                      fixedSize: Size(Get.width, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/facebook-letter-logo.png"),
                        SizedBox(
                          width: 27.w,
                        ),
                        Text(
                          "Login with Facebook",
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffDD4B39),
                      fixedSize: Size(Get.width, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google-plus-logo.png"),
                        SizedBox(
                          width: 27.w,
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 72.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have Account?",
                        style: TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: textDarkColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(const SignUpScreen(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
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
