import 'package:e_commerce/Controller/ItemsDetails_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionOfItems extends GetView<ItemsdetailsControllerImp> {
  const DescriptionOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Description:',
            style: GoogleFonts.sen(fontSize: 17, color: Appcolor.black),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 40),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Text(
                '${controller.itemsModel.itemDescription}',
                style: GoogleFonts.actor(fontSize: 18, color: Appcolor.gray),
              ),
            ),
          ),
        )
      ],
    );
  }
}
