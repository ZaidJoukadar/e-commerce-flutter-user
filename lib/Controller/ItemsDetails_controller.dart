import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Cart_data.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsDetails_controller extends GetxController {
  initial_data();
  add();
  delete();
  Add_item(String item_id);
  Delete_item(String item_id);
  Get_item_count(String item_id);
}

class ItemsdetailsControllerImp extends ItemsDetails_controller {
  late ItemsModel itemsModel;

  StatesRequest statesRequest = StatesRequest.none;

  int count_items = 0;

  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  List subcolor = [
    {'name': 'red', 'id': 1, 'active': '1'},
    {'name': 'blue', 'id': 2, 'active': '0'},
    {'name': 'black', 'id': 1, 'active': '1'}
  ];
  @override
  void onInit() {
    count_items;
    initial_data();
    super.onInit();
  }

  go_to_cart() {
    if (count_items == 0) {
      add();
      Get.toNamed(Routes.cart);
    } else {
      Get.toNamed(Routes.cart);
    }
  }

  @override
  initial_data() async {
    statesRequest = StatesRequest.loading;
    itemsModel = Get.arguments['ItemsModel'];
    count_items = await Get_item_count(itemsModel.itemId.toString());
    statesRequest = StatesRequest.success;
    update();
  }

  @override
  add() {
    if (count_items < itemsModel.itemCount!) {
      Add_item(itemsModel.itemId.toString());
      count_items++;
      update();
      return count_items;
    }
  }

  @override
  delete() {
    if (count_items > 0) {
      Delete_item(itemsModel.itemId.toString());
      count_items--;
      update();
      return count_items;
    }
  }

  @override
  Add_item(String item_id) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await cartData.Add_to_cart(
        myServices.sharedPreferences.getInt('user_id').toString(), item_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: 'notification',
            messageText: Text('The product was added to the cart'),
            backgroundColor: Appcolor.primary_color);
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  Delete_item(String item_id) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await cartData.Delete_from_cart(
        myServices.sharedPreferences.getInt('user_id').toString(), item_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: 'notification',
            messageText: Text(
              'The product was removed from the cart',
              style: TextStyle(color: Appcolor.white),
            ),
            backgroundColor: Appcolor.primary_color);
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  Get_item_count(String item_id) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await cartData.Get_item_count_cart(
        myServices.sharedPreferences.getInt('user_id').toString(),
        item_id.toString());
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        count_items = response['data'];
        return count_items;
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }
}
