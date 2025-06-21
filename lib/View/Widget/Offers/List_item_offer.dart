import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Controller/offers_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/translate_request.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItemOffer extends GetView<OffersController> {
  final ItemsModel itemsModel;
  const ListItemOffer({super.key, required this.itemsModel});

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
                      height: 180,
                      width: 180,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    translate_request(
                        itemsModel.itemBrandAr, itemsModel.itemBrand),
                    style: TextStyle(
                        fontSize: 18,
                        color: Appcolor.black,
                        fontWeight: FontWeight.w600),
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
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${itemsModel.itemPrice}',
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
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              if (itemsModel.itemDiscount != 0)
                                Text(
                                  '${itemsModel.itemPriceDiscount}\$',
                                  style: GoogleFonts.sen(
                                      color: Appcolor.primary_color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // Expanded(
                      //   child: GetBuilder<FavoriteController>(
                      //       builder: (controller) {
                      //     return IconButton(
                      //       onPressed: () {
                      //         if (controller.isfavortie[itemsModel.itemId] ==
                      //             1) {
                      //           controller.delete_from_favorite(
                      //               itemsModel.itemId.toString());
                      //           controller.set_favorite(itemsModel.itemId, 0);
                      //         } else {
                      //           controller.insert_to_favorite(
                      //               itemsModel.itemId.toString());
                      //           controller.set_favorite(itemsModel.itemId, 1);
                      //         }
                      //       },
                      //       icon: Icon(
                      //           controller.isfavortie[itemsModel.itemId] == 1
                      //               ? Icons.favorite
                      //               : Icons.favorite_border_outlined),
                      //       color: const Color.fromARGB(255, 217, 21, 7),
                      //     );
                      //   }),
                      // )
                    ],
                  )
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
