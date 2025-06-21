import 'package:e_commerce/Controller/Auth/Login_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/Valid_input.dart';
import 'package:e_commerce/Core/Function/alert_exit.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_body_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_button_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_logo_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_signin_or_signup.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_textformfield_auth.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.background,
          title: Text('10'.tr,
              style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Appcolor.light_black)),
        ),
        body: GetBuilder<LoginControllerImp>(builder: (controller) {
          return HandlingDataView(
            statesRequest: controller.statesRequest,
            widget: Form(
              key: controller.formstate,
              // ignore: deprecated_member_use
              child: WillPopScope(
                onWillPop: Alert_to_exit,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomLogoAuth(),
                      CustomTitleAuth(text_title: '11'.tr),
                      CustomBodyAuth(text_body: '12'.tr),
                      ////////////////text feild to email
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
                      ////////////////text feild to password
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
                      //////////////// forget password
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          controller.go_to_forgetpassword();
                        },
                        child: Container(
                          width: 50,
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            '17'.tr,
                            style: TextStyle(
                                fontSize: 16, color: Appcolor.light_black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      CustomButtonAuth(
                        button_text: '10'.tr,
                        Pressed: () {
                          controller.login();
                        },
                      ),
                      CustomSigninOrSignup(
                        onTap: () {
                          controller.go_to_signup();
                        },
                        text_body: '18'.tr,
                        text_to_page: '19'.tr,
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
