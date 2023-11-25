import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/constants.dart';
import 'package:mealmonkey/controllers/auth_controller.dart';

import '../../components/text_input.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    "Sign Up",
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
                    "Add your details to signup",
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
                          hinttext: "Name",
                          controller: inputController.nameFieldController,
                          validateMsg: 'Enter Your Name.',
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        TextFormFieldWidget(
                          hinttext: "Email",
                          controller: inputController.emailFieldController,
                          validateMsg: 'Enter Email.',
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        TextFormFieldWidget(
                          hinttext: "Mobile Number",
                          controller:
                              inputController.mobileNumberFieldController,
                          validateMsg: 'Enter mobile number.',
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        TextFormFieldWidget(
                          hinttext: "Address",
                          controller: inputController.addressFieldController,
                          validateMsg: 'Enter address.',
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        TextFormFieldWidget(
                          hinttext: "Password",
                          controller: inputController.passwordFieldController,
                          isPassword: true,
                          validateMsg: 'Enter strong password.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Get.to(const SignUpScreen(),
                      //     transition: Transition.rightToLeft);
                      if (inputController.formKey.currentState!.validate()) {
                        inputController.signup();
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
                              "Sign Up",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: textDarkColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(const LoginScreen(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text(
                          " Log In",
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
                    height: 36.h,
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
