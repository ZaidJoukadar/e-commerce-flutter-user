import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Search_data.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  check_search(String val);
  search_data();
  onsearch();
}

class SearchControllerImp extends SearchController {
  bool issearch = false;

  List<ItemsModel> data_items = [];

  late TextEditingController search;

  late StatesRequest statesRequest;

  SearchData searchData = SearchData(Get.find());

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  check_search(String val) {
    if (val == "") {
      statesRequest = StatesRequest.none;
      issearch = false;
      update();
    }
  }

  search_data() async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await searchData.searchData(search.text);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        data_items.clear();
        List response_data = response['data'];
        data_items.addAll(response_data.map((e) => ItemsModel.fromJson(e)));
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  onsearch() {
    if (search.text == "") {
      issearch = false;
    } else {
      issearch = true;
      search_data();
      update();
    }
  }

  go_to_item_details(item_model) {
    Get.toNamed(Routes.itemsdetails, arguments: {'ItemsModel': item_model});
  }
}
