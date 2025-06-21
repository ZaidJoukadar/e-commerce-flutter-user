import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Cart_data.dart';
import 'package:e_commerce/Data/Model/Cart_Model.dart';
import 'package:e_commerce/Data/Model/Coupon_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  Add(String item_id);
  Delete(String item_id);
  Get_item_count(String item_id);
  Get_data();
  Remove(String item_id);
  Reset_variable();
  Reset_page();
}

class CartControllerImp extends CartController {
  StatesRequest statesRequest = StatesRequest.none;

  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  TextEditingController? coupon_code;

  List<Cart_Model> data = [];

  int total_count = 0;

  double total_price_product = 0.0;

  double amount_Of_Discount = 0.0;

  double total_price_without_coupun = 0.0;

  double total_price = 0.0;

  int count_item = 0;

  int coupon_discount = 0;

  String? coupon_code_name;

  Coupon_Model? coupon_model;

  String? coupon_id;

  @override
  void onInit() {
    coupon_code = TextEditingController();
    Get_data();
    super.onInit();
  }

  @override
  Add(String item_id) async {
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
  Delete(String item_id) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await cartData.Delete_from_cart(
        myServices.sharedPreferences.getInt('user_id').toString(), item_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get_data();
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
        count_item = response['data'];
        return count_item;
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  Get_data() async {
    statesRequest = StatesRequest.loading;
    update();
    data.clear();
    var response = await cartData.View_data(
        myServices.sharedPreferences.getInt('user_id').toString());
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        List data_cart = response['data'];
        Map data_price_and_count = response['count_price'];
        data.addAll(data_cart.map((e) => Cart_Model.fromJson(e)));
        print(data);
        total_count = int.parse(data_price_and_count['total_count']);
        total_price_product = double.parse(
            data_price_and_count['total_price_product'].toString());
        amount_Of_Discount =
            double.parse(data_price_and_count['total_discount'].toString());
        total_price_without_coupun = double.parse(
            data_price_and_count['total_price_after_discount'].toString());
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  Remove(String item_id) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await cartData.Remove_from_cart(
        myServices.sharedPreferences.getInt('user_id').toString(), item_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get_data();
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  check_coupon() async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await cartData.Check_coupon(coupon_code!.text);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> coupon_response = response['data'];
        coupon_model = Coupon_Model.fromJson(coupon_response);
        coupon_code_name = coupon_model!.couponCode!;
        coupon_discount = coupon_model!.couponDiscount!;
        coupon_id = coupon_model!.couponId.toString();
      } else {
        coupon_discount = 0;
        coupon_id = null;
        coupon_code_name = null;
        Get.snackbar('Wrong', 'this coupon was not found',
            backgroundColor: Colors.red);
      }
    }
    update();
  }

  get_total_price() {
    total_price = (total_price_without_coupun -
        total_price_without_coupun * coupon_discount / 100);
    return total_price.toStringAsFixed(2);
  }

  @override
  Reset_variable() {
    data.clear();
    total_count = 0;
    total_price = 0;
  }

  Reset_page() {
    Reset_variable();
    Get_data();
  }

  go_to_checkout() async {
    if (data.isEmpty) return Get.snackbar('Warning', 'The cart was empty');
    Get.toNamed(Routes.checkout, arguments: {
      "total_price_without_coupon": total_price.toString(),
      "coupon_id": coupon_id ?? '0',
      "discount_coupon": coupon_discount.toString()
    });
  }
}
