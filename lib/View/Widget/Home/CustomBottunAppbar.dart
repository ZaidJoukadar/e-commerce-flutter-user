import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class Custombuttonappbar extends StatelessWidget {
  final String button_title;
  final IconData icon;
  final Color color_selected;
  final Function()? press;
  final bool acive_button;
  const Custombuttonappbar(
      {super.key,
      required this.button_title,
      required this.icon,
      required this.color_selected,
      required this.press,
      required this.acive_button});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: acive_button == true
                  ? Appcolor.primary_color
                  : color_selected,
              size: 28,
            ),
            Text(
              button_title,
              style: TextStyle(
                  fontSize: 18,
                  color: acive_button == true
                      ? Appcolor.primary_color
                      : color_selected),
            )
          ],
        ),
      ),
    );
  }
}
