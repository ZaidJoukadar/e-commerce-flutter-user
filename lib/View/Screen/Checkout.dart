import 'package:e_commerce/Controller/Checkout_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/Checkout/bottomnavbar.dart';
import 'package:e_commerce/View/Widget/Checkout/deleiverytype.dart';
import 'package:e_commerce/View/Widget/Checkout/paymentmethod.dart';
import 'package:e_commerce/View/Widget/Checkout/shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends GetView<CheckoutController> {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(
          onPressed: () {
            controller.checkout();
          },
          title: 'CheckOut'),
      appBar: AppBar(
        title: Text('CheckOut'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            GetBuilder(
                init: CheckoutController(),
                builder: (controller) {
                  return HandlingDataView(
                      statesRequest: controller.statesRequest,
                      widget: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Choose Your payment method :',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Appcolor.second_colors,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Paymentmethod(
                                title: 'Cash on Delivery',
                                isactive: controller.payment_method == 'cash'
                                    ? true
                                    : false,
                                onTap: () {
                                  controller.paymentmethod('cash');
                                }),
                            SizedBox(
                              height: 8,
                            ),
                            Paymentmethod(
                                title: 'Credit card',
                                isactive: controller.payment_method == 'credit'
                                    ? true
                                    : false,
                                onTap: () {
                                  controller.paymentmethod('credit');
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Choose Your Delivery type :',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Appcolor.second_colors,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Deleiverytype(
                                    title: 'Delivery',
                                    onTap: () {
                                      controller.Delivery_type('delivery');
                                    },
                                    image: 'assets/icons/delivery.png',
                                    isactive:
                                        controller.delivery_type == 'delivery'
                                            ? true
                                            : false),
                                Deleiverytype(
                                    title: 'Take from store',
                                    onTap: () {
                                      controller.Delivery_type('take a way');
                                    },
                                    image: 'assets/icons/shop.png',
                                    isactive:
                                        controller.delivery_type == 'take a way'
                                            ? true
                                            : false),
                              ],
                            ),
                            SizedBox(height: 10),
                            if (controller.delivery_type == 'delivery')
                              Column(
                                children: [
                                  Text(
                                    'Choose Your Delivery type :',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Appcolor.second_colors,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  if (controller.address_id == 0)
                                    Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            'You don not have an address record in your account',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Appcolor.gray),
                                          ),
                                        ),
                                        MaterialButton(
                                          color: Appcolor.primary_color,
                                          onPressed: () {
                                            Get.toNamed(Routes.addaddress);
                                          },
                                          child: Text('Add New Address'),
                                        )
                                      ],
                                    )
                                  else
                                    ...List.generate(
                                      controller.list_address.length,
                                      (index) {
                                        return ShippingAddress(
                                            address_name:
                                                '${controller.list_address[index].addressName}',
                                            onTap: () {
                                              controller.Shipping_address(
                                                  controller.list_address[index]
                                                      .addressId
                                                      .toString());
                                            },
                                            isactive: controller.address_id ==
                                                    controller
                                                        .list_address[index]
                                                        .addressId
                                                ? true
                                                : false,
                                            address_details:
                                                '${controller.list_address[index].addressCity} / ${controller.list_address[index].addressStreet} / ${controller.list_address[index].addressBuilding} / ${controller.list_address[index].addressApartment}');
                                      },
                                    )
                                ],
                              )
                          ],
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
