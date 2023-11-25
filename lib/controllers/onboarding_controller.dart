import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/views/screens/wellcome_screen.dart';

import '../views/screens/main_screen.dart';

class Onboardingcontroller extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  // ignore: non_constant_identifier_names
  goto_next_page() {
    pageController.animateToPage(currentIndex.value + 1,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  // getstarted() {
  //   Get.off(const MainScreen(), transition: Transition.rightToLeft);
  // }
  getstarted() {
    Get.off(const WellcomeScreen(), transition: Transition.rightToLeft);
  }
}
