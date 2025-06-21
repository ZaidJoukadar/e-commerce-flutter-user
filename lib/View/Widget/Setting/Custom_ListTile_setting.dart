import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class CustomListtileSetting extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onTap;
  const CustomListtileSetting(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Card(
        child: ListTile(
            title: Text(title),
            trailing: Icon(
              iconData,
              size: 40,
              color: Appcolor.primary_color,
            )),
      ),
    );
  }
}
