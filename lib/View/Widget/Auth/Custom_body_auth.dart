import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  final String text_body;
  const CustomBodyAuth({super.key, required this.text_body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        text_body,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
