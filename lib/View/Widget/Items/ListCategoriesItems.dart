import 'package:e_commerce/Controller/Items_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/translate_request.dart';
import 'package:e_commerce/Data/Model/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoryItems extends GetView<ItemsControllerImp> {
  const ListCategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Container(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoryHome(
              categoryModel:
                  CategoryModel.fromJson(controller.categories[index]),
              index_of_category: index,
            );
          }),
    );
  }
}

class CategoryHome extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index_of_category;
  const CategoryHome(
      {super.key,
      required this.categoryModel,
      required this.index_of_category});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder: (controller) {
      return InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          controller.change_category(index_of_category);
        },
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: controller.selected_categorey == index_of_category
              ? BoxDecoration(
                  color: Appcolor.primary_color,
                  borderRadius: BorderRadius.circular(15))
              : null,
          height: 10,
          width: 100,
          child: Column(
            children: [
              Text(
                translate_request(
                    categoryModel.categoryNameAr, categoryModel.categoryName),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: controller.selected_categorey == index_of_category
                        ? Appcolor.white
                        : Appcolor.dark_gray),
              )
            ],
          ),
        ),
      );
    });
  }
}
