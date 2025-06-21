import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Controller/Category_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Data/Model/CategoryModel.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategory extends GetView<CategoryControllerImp> {
  final CategoryModel categories;
  final int index;
  const ListCategory(
      {super.key, required this.categories, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        controller.go_to_item(controller.categories, index);
      },
      child: Card(
        color: Colors.grey[50],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: Linkapi.image_categories +
                    '/' +
                    '${categories.categoryImage}',
                height: 130,
                width: 130,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                categories.categoryName!,
                style: TextStyle(
                    fontSize: 20,
                    color: Appcolor.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
