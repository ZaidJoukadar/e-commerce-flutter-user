import 'package:e_commerce/Controller/Onboarding_controller.dart';
import 'package:e_commerce/Data/DataSource/Static/Static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customslider extends GetView<OnboardingControllerimp> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) => controller.onchanged(value),
        itemCount: OnboardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  OnboardingList[i].image!,
                  height: 300,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(OnboardingList[i].title!,
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(OnboardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ));
  }
}
