import 'package:flutter/material.dart';

import '../../components/onboarding_content.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Onboardingcontent(),
      ),
    );
  }
}
