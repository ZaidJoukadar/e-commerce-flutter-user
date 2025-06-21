import 'dart:async';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/Notification.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Address_data.dart';
import 'package:e_commerce/Data/Model/Address_Model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditAddressController extends GetxController {
  TextEditingController city = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController apartment = TextEditingController();
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;
  Completer<GoogleMapController>? controllerpage;
  Position? position;
  List<Address_Model> data = [];
  late Address_Model address_model;
  StatesRequest statesRequest = StatesRequest.none;
  String? address_id;
  AddressData addressData = AddressData(Get.find());

  Edit_address() async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await addressData.EditData(address_id!, street.text,
        building.text, name.text, apartment.text, lat!, long!, city.text);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(Routes.address);
      } else {
        Custom_notification('Warnning', 'warning.json',
            'somthing wrong please try again later!');
      }
    }
    update();
  }

  oninitData() {
    address_id = address_model.addressId.toString();
    city.text = address_model.addressCity!;
    name.text = address_model.addressName!;
    street.text = address_model.addressStreet!;
    building.text = address_model.addressBuilding!;
    apartment.text = address_model.addressApartment!;
    lat = address_model.addressLat;
    long = address_model.addressLong;
  }

  @override
  void onInit() {
    address_model = Get.arguments['Address_model'];
    oninitData();
    controllerpage = Completer<GoogleMapController>();
    kGooglePlex = CameraPosition(target: LatLng(lat!, long!), zoom: 14.35);
    super.onInit();
  }
}
