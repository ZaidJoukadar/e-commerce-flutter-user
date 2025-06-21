import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();
Logout() {
  myServices.sharedPreferences.clear();
  Get.offAllNamed(Routes.Login);
}
