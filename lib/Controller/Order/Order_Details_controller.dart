import 'dart:async';

import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Order_data.dart';
import 'package:e_commerce/Data/Model/Order_Details_Model.dart';
import 'package:e_commerce/Data/Model/Order_Model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends GetxController {
  StatesRequest statesRequest = StatesRequest.none;
  OrderData orderData = OrderData(Get.find());
  late Order_Model order_model;
  List<Order_Details_Model> list_data = [];
  Completer<GoogleMapController>? controllerpage;
  late CameraPosition kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;
  // LatLng? tapPosition;
  // MapController mapController = MapController();

  GetData() async {
    list_data.clear();
    statesRequest = StatesRequest.loading;
    update();
    var response =
        await orderData.getorderdetails(order_model.orderId.toString());
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list_data.addAll(data.map((e) => Order_Details_Model.fromJson(e)));
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  // TileLayer get openStreetMapTileLeter => TileLayer(
  //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  //     );

  initial() {
    if (order_model.orderType == "delivery") {
      // tapPosition = LatLng(order_model.addressLat!, order_model.addressLong!);
      lat = order_model.addressLat!;
      long = order_model.addressLong!;
      kGooglePlex = CameraPosition(
        target: LatLng(lat!, long!),
        zoom: 16.4746,
      );
      markers
          .add(Marker(markerId: MarkerId("1"), position: LatLng(lat!, long!)));
    }
  }

  @override
  void onInit() {
    order_model = Get.arguments['OrderModel'];
    GetData();
    initial();
    controllerpage = Completer<GoogleMapController>();
    print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
    super.onInit();
  }
}
