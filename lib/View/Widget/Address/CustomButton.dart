import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String button_text;
  final void Function()? Pressed;
  const CustomButton({super.key, required this.button_text, this.Pressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: MaterialButton(
        onPressed: Pressed,
        padding: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Appcolor.primary_color,
        child: Text(
          button_text,
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Appcolor.white),
        ),
      ),
    );
  }
}
