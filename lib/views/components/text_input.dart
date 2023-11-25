import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/constants.dart';

import '../../controllers/auth_controller.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hinttext;
  final String validateMsg;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    this.isPassword = false,
    required this.hinttext,
    required this.validateMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextFormFieldController inputController =
        Get.put(TextFormFieldController());
    bool isValidate = true;
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        errorMaxLines: 1,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(28),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(28),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(28),
        ),
        filled: true,
        fillColor: const Color(0xffF2F2F2),
        hintText: hinttext,
        hintStyle: TextStyle(
          fontFamily: "Metropolis",
          color: textLightColor,
          fontSize: 14.sp,
        ),
        contentPadding: const EdgeInsets.only(top: 22, bottom: 22, left: 31),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          isValidate = false;
          return validateMsg;
        }
        return null;
      },
    );
  }
}
