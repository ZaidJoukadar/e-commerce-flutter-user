import 'package:e_commerce/Controller/Cart_controller.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/cart/Custom_bottom_nav_bar.dart';
import 'package:e_commerce/View/Widget/cart/Custom_items_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
        ),
        bottomNavigationBar: GetBuilder(
            init: CartControllerImp(),
            builder: (controller) {
              return CustomBottomNavBar(
                ontaporder: () async {
                  controller.go_to_checkout();
                },
                price: controller.total_price_product.toString(),
                shipping: '100',
                discount: controller.amount_Of_Discount.toString(),
                total_price: controller.get_total_price().toString(),
                coupon_code: controller.coupon_code!,
                onapply_coupon: () {
                  controller.check_coupon();
                },
                coupun_discount: controller.coupon_discount.toString(),
              );
            }),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<CartControllerImp>(
                init: CartControllerImp(),
                builder: (controller) {
                  return HandlingDataView(
                      statesRequest: controller.statesRequest,
                      widget: RefreshIndicator(
                        onRefresh: () async {
                          await controller.Get_data();
                        },
                        child: ListView(
                          children: [
                            ...List.generate(controller.data.length, (index) {
                              return CustomItemsCard(
                                item_name: "${controller.data[index].itemName}",
                                price: "${controller.data[index].itemPrice}",
                                count: "${controller.data[index].countItem}",
                                image: "${controller.data[index].itemImage}",
                                discount:
                                    "${controller.data[index].itemDiscount}",
                                remove_items: () {
                                  controller.Remove(
                                      "${controller.data[index].itemId}");
                                  controller.Reset_page();
                                },
                                add_item: () {
                                  controller.Add(
                                      "${controller.data[index].itemId}");

                                  controller.Reset_page();
                                },
                                delete_item: () {
                                  controller.Delete(
                                      "${controller.data[index].itemId}");
                                  controller.Reset_page();
                                },
                              );
                            })
                          ],
                        ),
                      ));
                })));
  }
}
