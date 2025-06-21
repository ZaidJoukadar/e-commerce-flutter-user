import 'package:e_commerce/Controller/ItemsDetails_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Subcolorlist extends GetView<ItemsdetailsControllerImp> {
  const Subcolorlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Color:',
          style: GoogleFonts.sen(fontSize: 17, color: Appcolor.black),
        ),
        ...List.generate(
          controller.subcolor.length,
          (index) => InkWell(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10),
              height: 35,
              width: 60,
              decoration: BoxDecoration(
                  color: controller.subcolor[index]['active'] == '1'
                      ? Appcolor.primary_color
                      : Appcolor.gray,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                controller.subcolor[index]['name'],
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
