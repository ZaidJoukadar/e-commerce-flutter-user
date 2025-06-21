import 'dart:async';

import 'package:e_commerce/Controller/search_controller.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  go_to_items(List categories, int selected_categorey);
}

class HomeControllerImp extends SearchControllerImp {
  final PageController pageController = PageController();
  Timer? timer;
  int currentPage = 0;
  MyServices myServices = Get.find();
  List categories = [];
  List items = [];
  List discount = [];
  HomeData homeData = HomeData(Get.find());
  StatesRequest statesRequest = StatesRequest.none;
  String? username;
  String? id;

  @override
  void onInit() {
    getdata();
    startAutoScroll();
    super.onInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  getdata() async {
    statesRequest = StatesRequest.loading;
    var response = await homeData.get_data();
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        discount.addAll(response['discount']['data']);
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  go_to_items(categories, selected_categorey) {
    Get.toNamed(Routes.items, arguments: {
      'categories': categories,
      'selected_categorey': selected_categorey,
    });
  }

  go_to_item_details(item_model) {
    Get.toNamed(Routes.itemsdetails, arguments: {'ItemsModel': item_model});
  }

  void startAutoScroll() {
    timer = Timer.periodic(Duration(seconds: 6), (timer) {
      if (currentPage < discount.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
