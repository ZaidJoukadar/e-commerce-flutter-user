import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Controller/Items_controller.dart';
import 'package:e_commerce/Controller/favorite_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/translate_request.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Listitems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const Listitems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        controller.go_to_item_details(itemsModel);
      },
      child: Card(
        color: Color.fromARGB(255, 239, 231, 231),
        child: Stack(
          children: [
            Padding(
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
                    height: 5,
                  ),
                  Text(
                    translate_request(
                        itemsModel.itemBrandAr, itemsModel.itemBrand),
                    style: TextStyle(
                        fontSize: 16,
                        color: Appcolor.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    translate_request(
                        itemsModel.itemNameAr, itemsModel.itemName),
                    style: TextStyle(
                        fontSize: 18,
                        color: Appcolor.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${itemsModel.itemPrice} |',
                                  style: GoogleFonts.sen(
                                      color: itemsModel.itemDiscount != 0
                                          ? Appcolor.black
                                          : Appcolor.primary_color,
                                      fontWeight: FontWeight.bold,
                                      decorationThickness: 2.5,
                                      decorationColor: Colors.black,
                                      decoration: itemsModel.itemDiscount != 0
                                          ? TextDecoration.lineThrough
                                          : null,
                                      fontSize: 18),
                                ),
                                Icon(
                                  Icons.price_change_outlined,
                                  color: Appcolor.dark_gray,
                                )
                              ],
                            ),
                            if (itemsModel.itemDiscount != 0)
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${itemsModel.itemPriceDiscount}\$',
                                  style: GoogleFonts.sen(
                                      color: Appcolor.primary_color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: GetBuilder<FavoriteController>(
                            builder: (controller) {
                          return Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (controller
                                          .isfavortie[itemsModel.itemId] ==
                                      1) {
                                    controller.delete_from_favorite(
                                        itemsModel.itemId.toString());
                                    controller.set_favorite(
                                        itemsModel.itemId, 0);
                                  } else {
                                    controller.insert_to_favorite(
                                        itemsModel.itemId.toString());
                                    controller.set_favorite(
                                        itemsModel.itemId, 1);
                                  }
                                },
                                icon: Icon(
                                    controller.isfavortie[itemsModel.itemId] ==
                                            1
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined),
                                color: const Color.fromARGB(255, 217, 21, 7),
                              ),
                              Container(
                                // height: 34,
                                // width: 10,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Appcolor.primary_color),
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        controller
                                            .go_to_item_details(itemsModel);
                                      },
                                      icon: Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      )),
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (itemsModel.itemDiscount != 0)
              Image.asset(
                'assets/icons/discount_logo.png',
                height: 50,
                width: 50,
              )
          ],
        ),
      ),
    );
  }
}
