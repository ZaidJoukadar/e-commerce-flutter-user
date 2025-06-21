// ignore_for_file: deprecated_member_use

import 'package:e_commerce/Controller/Auth/SignUp_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/Valid_input.dart';
import 'package:e_commerce/Core/Function/alert_exit.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_body_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_button_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_signin_or_signup.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_textformfield_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.background,
          title: Text('19'.tr,
              style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Appcolor.light_black)),
        ),
        body: GetBuilder(
            init: SignupControllerImp(),
            builder: (controller) {
              return HandlingDataView(
                statesRequest: controller.statesRequest,
                widget: Form(
                  key: controller.formstate,
                  child: WillPopScope(
                    onWillPop: Alert_to_exit,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 20,
                          ),

                          CustomTitleAuth(text_title: '20'.tr),
                          CustomBodyAuth(text_body: '21'.tr),
                          ////////////////////// text feild to username
                          CustomTextformfieldAuth(
                            valid: (val) {
                              return valid_input(val!, 30, 2, 'username');
                            },
                            text_controller: controller.username,
                            hint_text: '26'.tr,
                            label: '22'.tr,
                            icon: Icons.person_outline,
                            type: TextInputType.name,
                            is_scure: false,
                          ),
                          ////////////////////// text feild to email
                          CustomTextformfieldAuth(
                            valid: (Value) {
                              return valid_input(Value!, 100, 12, 'email');
                            },
                            text_controller: controller.email,
                            hint_text: '14'.tr,
                            label: '13'.tr,
                            icon: Icons.email_outlined,
                            type: TextInputType.emailAddress,
                            is_scure: false,
                          ),
                          ////////////////////// text feild to phone
                          CustomTextformfieldAuth(
                            valid: (Value) {
                              return valid_input(Value!, 10, 10, 'phone');
                            },
                            text_controller: controller.phone,
                            hint_text: '24'.tr,
                            label: '23'.tr,
                            icon: Icons.phone_outlined,
                            type: TextInputType.phone,
                            is_scure: false,
                          ),
                          ////////////////////// text feild to password
                          CustomTextformfieldAuth(
                            valid: (Value) {
                              return valid_input(Value!, 255, 6, 'password');
                            },
                            text_controller: controller.password,
                            hint_text: '16'.tr,
                            label: '15'.tr,
                            icon: Icons.lock_outline,
                            type: TextInputType.visiblePassword,
                            is_scure: true,
                          ),
                          ///////////////////////////// button sign in
                          CustomButtonAuth(
                            button_text: '19'.tr,
                            Pressed: () {
                              controller.Signup();
                            },
                          ),
                          CustomSigninOrSignup(
                            onTap: () {
                              controller.go_to_login();
                            },
                            text_body: '25'.tr,
                            text_to_page: '10'.tr,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
