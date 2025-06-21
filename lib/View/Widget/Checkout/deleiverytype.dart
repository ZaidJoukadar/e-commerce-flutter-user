import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class Deleiverytype extends StatelessWidget {
  final String title;
  final String image;
  final Function()? onTap;
  final bool isactive;
  const Deleiverytype(
      {super.key,
      required this.title,
      required this.onTap,
      required this.image,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: isactive == true ? Appcolor.primary_color : null,
          border: Border.all(width: 2, color: Appcolor.second_colors),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 80,
              color: isactive == true ? Colors.white : null,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  color: isactive == true ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
