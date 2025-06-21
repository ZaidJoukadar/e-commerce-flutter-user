import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/Notification.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/ForgetPassword/CheckEmail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPassword_Controller extends GetxController {
  check_email();
}

class ForgetPassword_ControllerImp extends ForgetPassword_Controller {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey();
  CheckemailData checkemailData = CheckemailData(Get.find());

  StatesRequest statesRequest = StatesRequest.none;
  @override
  check_email() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statesRequest = StatesRequest.loading;
      update();
      var response = await checkemailData.post_data(email.text);
      statesRequest = handlingData(response);
      print('//////////////////////////$response');
      if (StatesRequest.success == statesRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(Routes.verfiy_codeToResetpassword,
              arguments: {'email': email.text});
          print('////////////');
        } else {
          Custom_notification('Warning', 'warning.json', 'Email are not Exist');
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
