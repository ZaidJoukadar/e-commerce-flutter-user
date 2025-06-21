import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Controller/Cart_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomItemsCard extends GetView<CartControllerImp> {
  final String item_name;
  final String price;
  final String count;
  final String discount;
  final String image;
  final void Function()? remove_items;
  final void Function()? delete_item;
  final void Function()? add_item;
  const CustomItemsCard(
      {super.key,
      required this.item_name,
      required this.image,
      required this.price,
      required this.count,
      required this.discount,
      this.remove_items,
      this.delete_item,
      this.add_item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child:
                CachedNetworkImage(imageUrl: "${Linkapi.image_items}/${image}"),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    item_name,
                    style: TextStyle(color: Appcolor.black, fontSize: 20),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        '$price\$',
                        style: GoogleFonts.sen(
                            color: Appcolor.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Discount: $discount \%',
                    style: TextStyle(
                        color: Appcolor.primary_color,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      onPressed: add_item,
                      icon: Icon(Icons.add_circle),
                      color: Appcolor.primary_color,
                      iconSize: 28,
                    ),
                    Text(
                      count,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Appcolor.black),
                      textAlign: TextAlign.justify,
                    ),
                    IconButton(
                      highlightColor: Colors.transparent,
                      onPressed: delete_item,
                      icon: Icon(Icons.remove_circle),
                      color: Appcolor.primary_color,
                      iconSize: 28,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                highlightColor: Colors.transparent,
                onPressed: remove_items,
                icon: Icon(Icons.delete_outline_outlined),
                iconSize: 30,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
