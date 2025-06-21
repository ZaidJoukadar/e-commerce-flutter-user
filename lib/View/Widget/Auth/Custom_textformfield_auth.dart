import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class CustomTextformfieldAuth extends StatelessWidget {
  final String hint_text;
  final String label;
  final IconData icon;
  final TextInputType type;
  final TextEditingController? text_controller;
  final bool is_scure;
  final String? Function(String?) valid;
  const CustomTextformfieldAuth(
      {super.key,
      required this.hint_text,
      required this.label,
      required this.icon,
      required this.text_controller,
      required this.type,
      required this.is_scure,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: TextFormField(
        validator: valid,
        controller: text_controller,
        obscureText: is_scure,
        keyboardType: type,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            hintText: hint_text,
            hintStyle: TextStyle(fontSize: 14),
            suffixIcon: Icon(icon),
            label: Text(label),
            labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Appcolor.primary_color),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
