import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Address_data.dart';
import 'package:e_commerce/Data/DataSource/remote/Order_data.dart';
import 'package:e_commerce/Data/Model/Address_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? payment_method;
  String? delivery_type;
  int address_id = 0;
  late String total_price;
  late String coupon_id;
  late String coupon_discount;
  late String shipping_ptice = '150.00';
  StatesRequest statesRequest = StatesRequest.none;
  AddressData addressData = Get.put(AddressData(Get.find()));
  OrderData orderData = Get.put(OrderData(Get.find()));
  List<Address_Model> list_address = [];
  MyServices myServices = Get.find();

  paymentmethod(String value) {
    payment_method = value;
    update();
  }

  Delivery_type(String value) {
    delivery_type = value;
    if (delivery_type == 'delivery') {
      get_address();
    }
    update();
  }

  Shipping_address(String value) {
    address_id = int.parse(value);
    update();
  }

  get_address() async {
    list_address.clear();
    statesRequest = StatesRequest.loading;
    var response = await addressData.GetData(
        myServices.sharedPreferences.getInt('user_id').toString());
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list_address.addAll(data.map((e) => Address_Model.fromJson(e)));
        address_id = list_address[0].addressId!;
      } else {
        // statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (payment_method == null) {
      return Get.rawSnackbar(
          title: 'Warning',
          messageText: Text('Please choose the payment method!'));
    } else if (delivery_type == null) {
      return Get.rawSnackbar(
          title: 'Warning',
          messageText: Text('Please choose the delivery type!'));
    } else if (delivery_type == 'delivery') {
      //get_address();
      if (address_id == 0) {
        return Get.rawSnackbar(
            title: 'Warning', messageText: Text('Please choose your address'));
      }
    } else
      statesRequest = StatesRequest.loading;
    var response = await orderData.checkout(
        myServices.sharedPreferences.getInt('user_id').toString(),
        delivery_type!,
        coupon_id,
        payment_method!,
        address_id.toString(),
        total_price,
        shipping_ptice,
        coupon_discount);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(Routes.homescreen);
        Get.snackbar('Success', 'The order was successfully',
            backgroundColor: Colors.green);
      } else {
        statesRequest = StatesRequest.failure;
        Get.snackbar('Error', 'Please try again', backgroundColor: Colors.red);
      }
    }
    update();
  }

  @override
  void onInit() {
    coupon_id = Get.arguments['coupon_id'];
    total_price = Get.arguments['total_price_without_coupon'];
    coupon_discount = Get.arguments['discount_coupon'];
    // get_address();
    super.onInit();
  }
}
