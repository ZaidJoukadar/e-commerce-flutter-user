import 'package:e_commerce/Core/Services/services.dart';
import 'package:get/get.dart';

translate_request(is_arabic, is_english) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString('language') == 'ar') {
    return is_arabic;
  } else {
    return is_english;
  }
}
