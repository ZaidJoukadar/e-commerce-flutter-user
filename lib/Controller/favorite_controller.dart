import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List data = [];
  StatesRequest statesRequest = StatesRequest.none;
  late String user_id;
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  Map isfavortie = {};

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  getData(user_id) async {
    data.clear();
    statesRequest = StatesRequest.loading;
    update();
    var response = await favoriteData.getData(user_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  initialData() {
    user_id = myServices.sharedPreferences.getInt('user_id').toString();
    getData(user_id);
    update();
  }

  go_to_favorite() {
    Get.toNamed(Routes.favorite);
  }

  go_to_item_details(items_model) {
    Get.toNamed(Routes.itemsdetails, arguments: {'ItemsModel': items_model});
  }

  set_favorite(id, val) {
    isfavortie[id] = val;
    update();
  }

  insert_to_favorite(item_id) async {
    var response = await favoriteData.insert_to_favorite(user_id, item_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "ADD",
            message: 'This product added to favorite',
            backgroundColor: Appcolor.primary_color,
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ));
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  delete_from_favorite(item_id) async {
    var response = await favoriteData.delete_from_favorite(user_id, item_id);
    statesRequest = handlingData(response);
    update();
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        getData(user_id);
        Get.rawSnackbar(
            title: "Remove",
            message: 'This product Removed to favorite',
            backgroundColor: Appcolor.primary_color,
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ));
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
