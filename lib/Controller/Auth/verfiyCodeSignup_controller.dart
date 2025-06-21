import 'dart:async';

import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/Notification.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Auth/VerfiyCode_data.dart';
import 'package:get/get.dart';

abstract class verfiyCodeSignup_controller extends GetxController {
  check_code();
  go_to_sucsses_signup(String verifycode);
  startTimer();
  resendCode();
}

String? email;

class verfiyCodeSignup_controllerImp extends verfiyCodeSignup_controller {
  StatesRequest statesRequest = StatesRequest.none;
  verfiyCode_signupData verfiycodedata = verfiyCode_signupData(Get.find());
  Timer? timer;
  int start = 60;
  bool isButtonDisabled = false;

  @override
  go_to_sucsses_signup(verifycode) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await verfiycodedata.post_data(email!, verifycode);
    print('/////////////////$response');
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(Routes.sucsses_signup);
      } else {
        Custom_notification(
            'Warning', 'warning.json', 'Verification code was not correct');
      }
    }
    update();
  }

  @override
  check_code() {}
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          isButtonDisabled = false;
          start = 60;
          update();
        } else {
          start--;
          update();
        }
      },
    );
  }

  @override
  resendCode() {
    verfiycodedata.resend_Data(email!);
  }
}
