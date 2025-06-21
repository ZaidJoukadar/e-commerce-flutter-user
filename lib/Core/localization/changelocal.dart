import 'package:e_commerce/Core/Constant/theme.dart';
import 'package:e_commerce/Core/Function/fcmconfig.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Local_Controller extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData apptheme = English_theme;
  change_language(String language_code) {
    Locale locale = Locale(language_code);
    myServices.sharedPreferences.setString('language', language_code);
    apptheme =
        locale == 'ar' ? apptheme = Arabic_theme : apptheme = English_theme;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

  requestperlocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar('warning', "please turn on location service");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
            'warning', "can't use the application without location serveice");
      }
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestperlocation();
    String? shared_preferences_language =
        myServices.sharedPreferences.getString('language');
    if (shared_preferences_language == 'ar') {
      language = Locale('ar');
      apptheme = Arabic_theme;
    } else if (shared_preferences_language == 'en') {
      language = Locale('en');
      apptheme = English_theme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
