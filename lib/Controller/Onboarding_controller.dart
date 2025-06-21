import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Data/DataSource/Static/Static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onchanged(int index);
}

class OnboardingControllerimp extends OnboardingController {
  int current_page = 0;
  String? button_name = '8'.tr;
  late PageController pageController;
  MyServices _myServices = Get.find();
  update_name() {
    if (current_page == OnboardingList.length - 1) {
      button_name = '9'.tr;
      update();
    } else {
      button_name = '8'.tr;
    }
  }

  @override
  next() {
    current_page++;
    update_name();
    if (current_page > OnboardingList.length - 1) {
      _myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(Routes.Login);
    }
    pageController.animateToPage(current_page,
        duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  onchanged(int index) {
    current_page = index;
    update_name();
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
