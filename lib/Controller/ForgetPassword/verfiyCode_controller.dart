import 'dart:async';

import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/Notification.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/ForgetPassword/VerifiyCode.dart';
import 'package:get/get.dart';

abstract class verfiyCode_contorller extends GetxController {
  go_to_reset_password(String verfiycode);
  startTimer();
  resendCode();
}

class verfiyCode_contorllerImp extends verfiyCode_contorller {
  String? email;
  StatesRequest statesRequest = StatesRequest.none;
  VerifiycodeData verfiycodedata = VerifiycodeData(Get.find());
  Timer? timer;
  int start = 60;
  bool isButtonDisabled = false;

  @override
  go_to_reset_password(verfiycode) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await verfiycodedata.post_data(email!, verfiycode);
    statesRequest = handlingData(response);
    print('//////////////////////////$response');
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(Routes.ResetPassword, arguments: {'email': email});
      } else {
        Custom_notification('Warning', 'warning.json', 'Email are not Exist');
      }
    }
    update();
  }

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
