import 'package:e_commerce/Controller/ItemsDetails_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceAndAmount extends GetView<ItemsdetailsControllerImp> {
  final Function()? onadd;
  final Function()? onremove;
  final String item_price_discount;
  final String price;
  final String count;
  PriceAndAmount(
      {super.key,
      required this.price,
      required this.item_price_discount,
      required this.count,
      this.onadd,
      this.onremove});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                highlightColor: Colors.transparent,
                onPressed: onadd,
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Appcolor.primary_color,
                  size: 35,
                )),
            SizedBox(
              width: 15,
            ),
            Container(
              alignment: Alignment.center,
              height: 35,
              width: 50,
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Text(
                count,
                style: TextStyle(color: Appcolor.black),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            IconButton(
                highlightColor: Colors.transparent,
                onPressed: onremove,
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Appcolor.primary_color,
                  size: 35,
                )),
          ],
        ),
        Column(
          children: [
            Text(
              '$price\$',
              style: GoogleFonts.sen(
                  color: controller.itemsModel.itemDiscount != 0
                      ? Appcolor.black
                      : Appcolor.primary_color,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 2.5,
                  decorationColor: Colors.red,
                  decoration: controller.itemsModel.itemDiscount != 0
                      ? TextDecoration.lineThrough
                      : null,
                  fontSize: 25),
            ),
            if (controller.itemsModel.itemDiscount != 0)
              Text(
                '$item_price_discount\$',
                style: GoogleFonts.sen(
                    color: Appcolor.primary_color,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              )
          ],
        ),
      ],
    );
  }
}
