import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SucssesSignup extends StatelessWidget {
  const SucssesSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolor.background,
        title: Text('Sucsses',
            style: GoogleFonts.montserrat(
                fontSize: 30,
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
                  'sucsses to verification your email and check your indentification',
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
