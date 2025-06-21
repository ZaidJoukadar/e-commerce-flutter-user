import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtitle extends StatelessWidget {
  final String title_text;
  final IconData iconData;
  const Customtitle(
      {super.key, required this.title_text, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title_text,
          style: GoogleFonts.sen(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Appcolor.primary_color),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          iconData,
          color: Appcolor.primary_color,
          size: 30,
        )
      ],
    );
  }
}
