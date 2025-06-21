import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Auth/Signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  Signup();
  go_to_login();
}

class SignupControllerImp extends SignupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey();
  SignupData signupData = SignupData(Get.find());
  StatesRequest statesRequest = StatesRequest.none;

  @override
  go_to_login() {
    Get.offAllNamed(Routes.Login);
  }

  @override
  Signup() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statesRequest = StatesRequest.loading;
      var response = await signupData.post_data(
          username.text, password.text, email.text, phone.text);
      statesRequest = handlingData(response);
      if (StatesRequest.success == statesRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(Routes.verfiy_code_signup,
              arguments: {'email': email.text});
        } else {
          statesRequest = StatesRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
