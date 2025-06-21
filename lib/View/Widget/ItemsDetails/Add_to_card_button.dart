import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCardButton extends StatelessWidget {
  final String title_button;
  final Function()? onTap;
  const AddToCardButton({super.key, required this.title_button, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Appcolor.primary_color,
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(8),
        height: 40,
        child: Center(
          child: Text(
            title_button,
            style: GoogleFonts.sen(
                color: Appcolor.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
