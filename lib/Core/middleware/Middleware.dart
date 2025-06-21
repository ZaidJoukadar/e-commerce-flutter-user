import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Middleware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return RouteSettings(name: Routes.homescreen);
    } else {
      if (myServices.sharedPreferences.getString('step') == '1') {
        return RouteSettings(name: Routes.Login);
      } else
        return null;
    }
  }
}
