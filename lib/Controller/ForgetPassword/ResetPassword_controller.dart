import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/Notification.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/ForgetPassword/ResetPassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPassword extends GetxController {
  resetpassword();
}

class ResetPasswordImp extends ResetPassword {
  GlobalKey<FormState> formstate = GlobalKey();
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  StatesRequest statesRequest = StatesRequest.none;
  late TextEditingController password;
  late TextEditingController re_password;
  String? email;

  @override
  resetpassword() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      if (password.text != re_password.text) {
        return Custom_notification(
            'Warning', 'warning.json', 'password are not match');
      } else {
        statesRequest = StatesRequest.loading;
        update();
        var response = await resetpasswordData.post_data(email!, password.text);
        statesRequest = handlingData(response);
        if (StatesRequest.success == statesRequest) {
          if (response['status'] == 'success') {
            Get.offAllNamed(Routes.sucsses_reset_password);
          } else {
            Custom_notification(
                'Warning', 'warning.json', 'Email are not Exist');
          }
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    re_password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    re_password.dispose();
    super.dispose();
  }
}
