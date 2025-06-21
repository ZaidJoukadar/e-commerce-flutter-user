import 'package:e_commerce/Controller/search_controller.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/offers_data.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchControllerImp {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> list_data = [];
  StatesRequest statesRequest = StatesRequest.none;
  getData() async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await offersData.getData();
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list_data.addAll(data.map((e) => ItemsModel.fromJson(e)));
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
