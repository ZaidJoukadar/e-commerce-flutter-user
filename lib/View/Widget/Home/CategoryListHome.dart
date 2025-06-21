import 'package:e_commerce/Controller/Home_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Function/translate_request.dart';
import 'package:e_commerce/Data/Model/CategoryModel.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorylistHome extends StatelessWidget {
  const CategorylistHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeControllerImp(),
        builder: (controller) {
          return Container(
            height: 140,
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
        });
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
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        controller.go_to_items(controller.categories, index_of_category);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 10,
        width: 140,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Image.network(
                '${Linkapi.image_categories}/${categoryModel.categoryImage}',
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
              Text(
                translate_request(
                    categoryModel.categoryNameAr, categoryModel.categoryName),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Appcolor.primary_color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
