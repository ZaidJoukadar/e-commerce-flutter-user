import 'package:e_commerce/View/Screen/Category.dart';
import 'package:e_commerce/View/Screen/Home.dart';
import 'package:e_commerce/View/Screen/Offers.dart';
import 'package:e_commerce/View/Screen/Setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomescreenController extends GetxController {
  changePage(int current_page);
}

class HomescreenControllerImp extends HomescreenController {
  int index = 0;
  List list_name_page_bottom_bar = ["Home", "Category", "Offers", "Setting"];
  List<IconData> list_icon_page_bottom_bar = [
    Icons.home,
    Icons.category,
    Icons.shopping_bag,
    Icons.settings
  ];
  List<Widget> listPage = [Home(), Category(), Offers(), Setting()];
  @override
  changePage(int current_page) {
    index = current_page;
    update();
  }
}
