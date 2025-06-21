import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SucssesResetPassword extends StatelessWidget {
  const SucssesResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolor.background,
        title: Text('Sucsses Reset password',
            style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Appcolor.light_black)),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: Appcolor.primary_color,
                  size: 300,
                ),
                Text(
                  'sucsses to reset your password and create new password to your account',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  width: double.infinity,
                  child: CustomButtonAuth(
                    button_text: 'Go to Sign IN',
                    Pressed: () {
                      Get.offAllNamed(Routes.Login);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
