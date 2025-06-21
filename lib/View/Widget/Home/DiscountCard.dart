import 'package:e_commerce/Controller/Home_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Data/Model/Discount_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        width: 600,
        decoration: BoxDecoration(
            color: Appcolor.primary_color,
            borderRadius: BorderRadius.circular(15)),
        child: GetBuilder(
            init: HomeControllerImp(),
            builder: (controller) {
              return PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.discount.length,
                  itemBuilder: (context, index) {
                    return Discount_card(
                        discountModel:
                            DiscountModel.fromJson(controller.discount[index]));
                  });
            }));
  }
}

class Discount_card extends StatelessWidget {
  final DiscountModel discountModel;
  const Discount_card({super.key, required this.discountModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/icons/discount_logo.png',
                    height: 120,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    "${discountModel.discountTitle}",
                    style: TextStyle(
                        fontSize: 18,
                        color: Appcolor.white,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${discountModel.discountBody}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Appcolor.light_gray,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
