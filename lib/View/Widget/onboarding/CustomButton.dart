import 'package:e_commerce/Controller/Onboarding_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custombutton extends GetView<OnboardingControllerimp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerimp>(
        builder: (controller) => Container(
              width: 300,
              height: 40,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 8),
              child: MaterialButton(
                onPressed: () {
                  controller.next();
                },
                color: Appcolor.primary_color,
                child: Text(
                  '${controller.button_name}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ));
  }
}
