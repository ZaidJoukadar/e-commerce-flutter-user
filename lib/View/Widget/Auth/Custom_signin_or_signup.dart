import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSigninOrSignup extends StatelessWidget {
  final String text_body;
  final String text_to_page;
  final void Function()? onTap;
  const CustomSigninOrSignup(
      {super.key,
      required this.text_body,
      required this.text_to_page,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text_body,
            style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Appcolor.light_black)),
        InkWell(
          onTap: onTap,
          child: Text(text_to_page,
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Appcolor.primary_color)),
        ),
      ],
    );
  }
}
