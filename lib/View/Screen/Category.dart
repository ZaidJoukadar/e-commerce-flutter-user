import 'package:e_commerce/Controller/Category_controller.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/Data/Model/CategoryModel.dart';
import 'package:e_commerce/View/Widget/Categories/List_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImp());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ListView(
        children: [
          GetBuilder<CategoryControllerImp>(builder: (controller) {
            return HandlingDataView(
                statesRequest: controller.statesRequest,
                widget: GridView.builder(
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext, index) {
                      return ListCategory(
                        categories: CategoryModel.fromJson(
                            controller.categories[index]),
                        index: index,
                      );
                    }));
          })
        ],
      ),
    );
  }
}
