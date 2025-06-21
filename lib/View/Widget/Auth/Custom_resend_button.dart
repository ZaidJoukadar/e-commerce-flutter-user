import 'package:e_commerce/Controller/Auth/verfiyCodeSignup_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomResendButton extends GetView<verfiyCodeSignup_controllerImp> {
  const CustomResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: controller.isButtonDisabled
          ? null
          : () {
              controller.resendCode();
              controller.isButtonDisabled = true;
              controller.startTimer();
            },
      // ignore: deprecated_member_use
      style: ButtonStyle(
        backgroundColor:
            // ignore: deprecated_member_use
            MaterialStateProperty.all<Color>(Appcolor.primary_color),
      ),
      child: Text(
        controller.isButtonDisabled == true
            ? controller.start.toString()
            : 'Resend Code',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
