import 'package:e_commerce/Controller/ForgetPassword/ResetPassword_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/Valid_input.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_body_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_button_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_textformfield_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordImp());
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
        body: GetBuilder<ResetPasswordImp>(builder: (controller) {
          return HandlingDataView(
            statesRequest: controller.statesRequest,
            widget: Form(
              key: controller.formstate,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    CustomTitleAuth(text_title: 'Check Email'),
                    CustomBodyAuth(
                        text_body:
                            'We send to you an email to check you account'),
                    ////////////////text feild to password
                    CustomTextformfieldAuth(
                      valid: (value) {
                        return valid_input(value!, 255, 6, 'password');
                      },
                      text_controller: controller.password,
                      hint_text: '16'.tr,
                      label: '15'.tr,
                      icon: Icons.lock_outline,
                      type: TextInputType.visiblePassword,
                      is_scure: false,
                    ),
                    ////////////////text feild to re_password
                    CustomTextformfieldAuth(
                      valid: (value) {
                        return valid_input(value!, 255, 6, 'password');
                      },
                      text_controller: controller.re_password,
                      hint_text: '27'.tr,
                      label: '28'.tr,
                      icon: Icons.lock_outline,
                      type: TextInputType.visiblePassword,
                      is_scure: false,
                    ),
                    CustomButtonAuth(
                      button_text: 'Reset',
                      Pressed: () {
                        controller.resetpassword();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
