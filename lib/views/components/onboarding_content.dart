import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealmonkey/constants.dart';
import '../../models/onboarding_model.dart';
import '../../controllers/onboarding_controller.dart';

class Onboardingcontent extends StatefulWidget {
  const Onboardingcontent({super.key});

  @override
  State<Onboardingcontent> createState() => _OnboardingcontentState();
}

class _OnboardingcontentState extends State<Onboardingcontent> {
  Onboardingcontroller onboardcontroller = Get.put(Onboardingcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 600.h,
              child: PageView.builder(
                controller: onboardcontroller.pageController,
                onPageChanged: onboardcontroller.currentIndex,
                itemCount: onboardingcontent.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 226.w,
                      height: 295.h,
                      child: Image.asset(
                        onboardingcontent[index].image!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 34, vertical: 34),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 34.h,
                          ),
                          Text(
                            onboardingcontent[index].title!,
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.bold,
                              color: textDarkColor,
                              fontSize: 28.sp,
                            ),
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          SizedBox(
                            width: 271.w,
                            child: Text(
                              onboardingcontent[index].description!,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingcontent.length,
                      (index) => Obx(
                        () => Container(
                          height: 8.h,
                          width: onboardcontroller.currentIndex.value == index
                              ? 8.h
                              : 8.h,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: onboardcontroller.currentIndex.value == index
                                ? primaryColor
                                : const Color(0xffD6D6D6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (onboardcontroller.currentIndex <
                          onboardingcontent.length - 1) {
                        onboardcontroller.goto_next_page();
                      } else {
                        onboardcontroller.getstarted();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: Size(307, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.r))),
                    child: Obx(
                      () => onboardcontroller.currentIndex.value ==
                              onboardingcontent.length - 1
                          ? Text(
                              "Get Started",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "Next",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
