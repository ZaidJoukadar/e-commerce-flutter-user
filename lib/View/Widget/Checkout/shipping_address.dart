import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  final String address_name;
  final String address_details;
  final Function()? onTap;
  final bool isactive;
  const ShippingAddress(
      {super.key,
      required this.address_name,
      required this.onTap,
      required this.isactive,
      required this.address_details});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Card(
          color:
              isactive == true ? Appcolor.primary_color : Appcolor.light_gray,
          child: ListTile(
            title: Text(
              address_name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isactive == true ? Colors.white : Colors.black),
            ),
            subtitle: Text(
              address_details,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isactive == true ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
