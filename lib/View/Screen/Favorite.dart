import 'package:e_commerce/Controller/favorite_controller.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:e_commerce/View/Widget/Home/CustomTitle.dart';
import 'package:e_commerce/View/Widget/Items/ListFavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(25),
      child: ListView(
        children: [
          Customtitle(title_text: 'Favorite', iconData: Icons.favorite),
          GetBuilder<FavoriteController>(builder: (controller) {
            return HandlingDataView(
                statesRequest: controller.statesRequest,
                widget: GridView.builder(
                    itemCount: controller.data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.70),
                    itemBuilder: (BuildContext, index) {
                      return Listfavorite(
                        itemsModel: ItemsModel.fromJson(controller.data[index]),
                      );
                    }));
          })
        ],
      ),
    ));
  }
}
