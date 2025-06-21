import 'package:e_commerce/Controller/ForgetPassword/verfiyCode_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_body_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerfiyCodeToResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(verfiyCode_contorllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.background,
          title: Text('Verification code',
              style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Appcolor.light_black)),
        ),
        body: GetBuilder<verfiyCode_contorllerImp>(builder: (controller) {
          return HandlingDataView(
            statesRequest: controller.statesRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTitleAuth(text_title: 'Check Code'),
                  CustomBodyAuth(text_body: 'Please Enter verification code'),
                  OtpTextField(
                    borderWidth: 20,
                    borderRadius: BorderRadius.circular(15),
                    fillColor: Appcolor.gray,
                    numberOfFields: 5,
                    focusedBorderColor: Appcolor.gray,
                    showFieldAsBox: true,
                    onSubmit: (String verfiycode) {
                      controller.go_to_reset_password(verfiycode);
                    }, // end onSubmit
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
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
                          MaterialStateProperty.all<Color>(
                              Appcolor.primary_color),
                    ),
                    child: Text(
                      controller.isButtonDisabled == true
                          ? controller.start.toString()
                          : 'Resend Code',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
