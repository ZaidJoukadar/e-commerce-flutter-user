import 'package:e_commerce/Controller/Onboarding_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Data/DataSource/Static/Static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dotcontroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerimp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    OnboardingList.length,
                    (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 900),
                          margin: EdgeInsets.only(right: 5),
                          width: controller.current_page == index ? 30 : 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Appcolor.primary_color,
                              borderRadius: BorderRadius.circular(12)),
                        ))
              ],
            ));
  }
}
