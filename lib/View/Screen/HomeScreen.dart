import 'dart:io';

import 'package:e_commerce/Controller/HomeScreen_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/View/Widget/Bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerImp());
    return GetBuilder<HomescreenControllerImp>(builder: (controller) {
      return Scaffold(
          backgroundColor: Appcolor.white,
          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Appcolor.primary_color,
            onPressed: () {
              Get.toNamed(Routes.cart);
            },
            child: Icon(Icons.shopping_bag_outlined,
                size: 35, color: Appcolor.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomBar(),
          // ignore: deprecated_member_use
          body: WillPopScope(
              child: controller.listPage.elementAt(controller.index),
              onWillPop: () {
                Get.defaultDialog(
                  title: "Warning",
                  titleStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Appcolor.primary_color),
                  middleText: "Do You Want To Exit",
                  middleTextStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Appcolor.black),
                  buttonColor: Appcolor.selver,
                  confirmTextColor: Appcolor.second_colors,
                  onConfirm: () => exit(0),
                  cancelTextColor: Appcolor.second_colors,
                  onCancel: () {},
                );
                return Future.value(false);
              }));
    });
  }
}
