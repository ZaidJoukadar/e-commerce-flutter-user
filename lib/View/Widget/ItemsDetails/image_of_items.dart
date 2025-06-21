import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Controller/ItemsDetails_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageOfItems extends GetView<ItemsdetailsControllerImp> {
  const ImageOfItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 50),
          height: 270,
          width: 270,
          child: Hero(
            tag: controller.itemsModel.itemId!,
            child: CachedNetworkImage(
              imageUrl:
                  Linkapi.image_items + '/' + controller.itemsModel.itemImage!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                3,
                (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 900),
                      margin: EdgeInsets.only(right: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Appcolor.primary_color,
                          borderRadius: BorderRadius.circular(12)),
                    )),
          ],
        ),
      ],
    );
  }
}
