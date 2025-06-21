import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/localization/changelocal.dart';
import 'package:e_commerce/View/Widget/language/Custom_button_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<Local_Controller> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1'.tr, style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(
            height: 20,
          ),
          CustomButtonLanguage(
            button_text: 'English',
            onPressed: () {
              controller.change_language('en');
              Get.toNamed(Routes.onboarding);
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomButtonLanguage(
            button_text: 'عربي',
            onPressed: () {
              controller.change_language('ar');
              Get.toNamed(Routes.onboarding);
            },
          ),
        ],
      ),
    ));
  }
}
