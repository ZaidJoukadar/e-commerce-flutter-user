import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/Notification.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Data/DataSource/remote/Auth/Login_data.dart';

abstract class LoginController extends GetxController {
  login();
  go_to_signup();
  go_to_forgetpassword();
}

LoginData loginData = LoginData(Get.find());

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey();
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  @override
  go_to_signup() {
    Get.offAllNamed(Routes.Signup);
  }

  StatesRequest statesRequest = StatesRequest.none;
  @override
  login() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statesRequest = StatesRequest.loading;
      update();
      var response = await loginData.post_data(email.text, password.text);
      statesRequest = handlingData(response);
      if (StatesRequest.success == statesRequest) {
        if (response['status'] == 'success') {
          if (response['data']['user_approve'] == 1) {
            String user_id = response['data']['user_id'].toString();
            myServices.sharedPreferences
                .setInt('user_id', response['data']['user_id']);
            myServices.sharedPreferences
                .setString('user_email', response['data']['user_email']);
            myServices.sharedPreferences
                .setString('user_password', response['data']['user_password']);
            myServices.sharedPreferences
                .setString('user_phone', response['data']['user_phone']);
            myServices.sharedPreferences.setString('step', '2');
            FirebaseMessaging.instance.subscribeToTopic('all_user');
            FirebaseMessaging.instance.subscribeToTopic('user${user_id}');
            Get.offAllNamed(Routes.homescreen);
          } else {
            Get.toNamed(Routes.verfiy_code_signup,
                arguments: {'email': email.text});
          }
        } else {
          Custom_notification(
              'Warning', 'warning.json', 'Email or password are not correct');
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  go_to_forgetpassword() {
    Get.toNamed(Routes.ForgetPassword);
  }
}
