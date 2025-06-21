import 'package:e_commerce/Controller/Home_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemlisthome extends StatelessWidget {
  const Itemlisthome({super.key});

  @override
  Widget build(BuildContext context) {
    //  HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder(
        init: HomeControllerImp(),
        builder: (controller) {
          return Container(
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return ItemHome(
                    itemsModel: ItemsModel.fromJson(controller.items[index]),
                  );
                }),
          );
        });
  }
}

class ItemHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = HomeControllerImp();
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 10,
      width: 140,
      child: InkWell(
        onTap: () {
          controller.go_to_item_details(itemsModel);
        },
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Image.network(
                '${Linkapi.image_items}/${itemsModel.itemImage}',
                height: 100,
                width: 110,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${itemsModel.itemName}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Appcolor.primary_color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
