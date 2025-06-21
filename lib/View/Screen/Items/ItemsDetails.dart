import 'package:e_commerce/Controller/ItemsDetails_controller.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/ItemsDetails/Add_to_card_button.dart';
import 'package:e_commerce/View/Widget/ItemsDetails/Description_of_items.dart';
import 'package:e_commerce/View/Widget/ItemsDetails/image_of_items.dart';
import 'package:e_commerce/View/Widget/ItemsDetails/price_and_amount.dart';
import 'package:e_commerce/View/Widget/ItemsDetails/sub_color_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemsdetails extends StatelessWidget {
  const Itemsdetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsdetailsControllerImp controller = Get.put(ItemsdetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: AddToCardButton(
          title_button: "Add to Cart",
          onTap: () {
            controller.go_to_cart();
          },
        ),
        appBar: AppBar(
          title: Text("${controller.itemsModel.itemName.toString()}"),
          actions: [
            Stack(
              children: [
                Positioned(
                  bottom: 1.5,
                  child: Text(
                    '${controller.count_items.toString()}',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cart);
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<ItemsdetailsControllerImp>(
            init: ItemsdetailsControllerImp(),
            builder: (controller) {
              return HandlingDataView(
                  statesRequest: controller.statesRequest,
                  widget: ListView(
                    children: [
                      ImageOfItems(),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PriceAndAmount(
                            onadd: () {
                              controller.add();
                            },
                            onremove: () {
                              controller.delete();
                            },
                            price: controller.itemsModel.itemPrice.toString(),
                            count: "${controller.count_items}",
                            item_price_discount: controller
                                .itemsModel.itemPriceDiscount
                                .toString(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DescriptionOfItems(),
                          Subcolorlist()
                        ],
                      ),
                    ],
                  ));
            },
          ),
        ));
  }
}
