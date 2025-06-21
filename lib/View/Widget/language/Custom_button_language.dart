import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String button_text;
  final void Function()? onPressed;
  const CustomButtonLanguage(
      {super.key, required this.button_text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Appcolor.primary_color),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            button_text,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ));
  }
}
