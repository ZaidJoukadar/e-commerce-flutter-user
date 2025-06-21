import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  final String text_title;
  const CustomTitleAuth({super.key, required this.text_title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Text(
        text_title,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: Appcolor.primary_color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
