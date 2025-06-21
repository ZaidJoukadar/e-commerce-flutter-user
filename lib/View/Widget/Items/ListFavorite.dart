import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Controller/favorite_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/translate_request.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Listfavorite extends GetView<FavoriteController> {
  final ItemsModel itemsModel;
  const Listfavorite({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(builder: (controller) {
      return InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          controller.go_to_item_details(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Hero(
                  tag: itemsModel.itemId!,
                  child: CachedNetworkImage(
                    imageUrl:
                        Linkapi.image_items + '/' + '${itemsModel.itemImage}',
                    height: 110,
                    width: 110,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  translate_request(itemsModel.itemNameAr, itemsModel.itemName),
                  style: TextStyle(
                      fontSize: 18,
                      color: Appcolor.black,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      'Rating:',
                      style: TextStyle(fontSize: 15, color: Appcolor.gray),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ...List.generate(3, (index) {
                      return Icon(
                        Icons.star,
                        size: 15,
                        color: Appcolor.gold,
                      );
                    })
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${itemsModel.itemPrice}\$',
                      style: GoogleFonts.sen(
                          color: Appcolor.primary_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        controller
                            .delete_from_favorite(itemsModel.itemId.toString());
                      },
                      icon: Icon(Icons.remove_circle_outline),
                      color: const Color.fromARGB(255, 217, 21, 7),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
