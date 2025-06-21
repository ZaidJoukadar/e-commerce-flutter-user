import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class CustomtitleHome extends StatelessWidget {
  final String title_text;
  const CustomtitleHome({super.key, required this.title_text});

  @override
  Widget build(BuildContext context) {
    return Text(
      title_text,
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Appcolor.primary_color),
    );
  }
}
