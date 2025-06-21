import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class Paymentmethod extends StatelessWidget {
  final String title;
  final bool isactive;
  final Function()? onTap;
  const Paymentmethod(
      {super.key,
      required this.title,
      required this.isactive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isactive == true ? Appcolor.primary_color : Appcolor.gray,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: isactive == true ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
