import 'package:flutter/material.dart';

class Iconbar extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  const Iconbar({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
