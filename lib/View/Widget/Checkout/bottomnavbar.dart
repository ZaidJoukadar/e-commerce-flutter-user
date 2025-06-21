import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const Bottomnavbar({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolor.primary_color,
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
