import 'package:e_commerce/Controller/ForgetPassword/Forgetpassword_controller.dart';
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

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPassword_ControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.background,
          title: Text('Forget Password',
              style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Appcolor.light_black)),
        ),
        body: GetBuilder<ForgetPassword_ControllerImp>(builder: (controller) {
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
                              'Enter your email to send you code to check your auth.'),
                      ////////////////text feild to email
                      CustomTextformfieldAuth(
                        valid: (value) {
                          return valid_input(value!, 100, 12, 'email');
                        },
                        text_controller: controller.email,
                        hint_text: '14'.tr,
                        label: '13'.tr,
                        icon: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        is_scure: false,
                      ),
                      /////////////////// button check
                      CustomButtonAuth(
                        button_text: 'Check',
                        Pressed: () {
                          controller.check_email();
                        },
                      ),
                    ],
                  ),
                ),
              ));
        }));
  }
}
