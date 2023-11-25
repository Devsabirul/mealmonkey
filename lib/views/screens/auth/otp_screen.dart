import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/controllers/auth_controller.dart';
import 'package:mealmonkey/views/components/text_input.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../../constants.dart';
import 'new_password_screen.dart';

class OptVerificationScreen extends StatelessWidget {
  const OptVerificationScreen({super.key});

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
                    "We have sent an OTP to",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: textDarkColor,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "your Mobile",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: textDarkColor,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    "Please check your mobile number 071*****12 \ncontinue to reset your password",
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
                  VerificationCode(
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.number,
                    underlineColor: Colors.grey,
                    length: 4,
                    margin: const EdgeInsets.all(10),
                    cursorColor: Colors.black,
                    onCompleted: (String value) {
                      print(value);
                    },
                    onEditing: (bool value) {},
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const NewPasswordScreen(),
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
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't Receive?",
                        style: TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: textDarkColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          " Click Here",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
