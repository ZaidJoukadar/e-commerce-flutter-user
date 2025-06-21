import 'package:e_commerce/Controller/Onboarding_controller.dart';
import 'package:e_commerce/View/Widget/onboarding/CustomButton.dart';
import 'package:e_commerce/View/Widget/onboarding/CustomSlider.dart';
import 'package:e_commerce/View/Widget/onboarding/Dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerimp());
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(flex: 3, child: Customslider()),
        Expanded(
            flex: 1,
            child: Column(
              children: [Dotcontroller(), Custombutton()],
            ))
      ],
    )));
  }
}
