import 'dart:async';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Address_data.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressContorller extends GetxController {
  TextEditingController? city;
  TextEditingController? name;
  TextEditingController? street;
  TextEditingController? building;
  TextEditingController? apartment;
  Position? position;
  double? lat;
  double? long;
  String? user_id;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  StatesRequest statesRequest = StatesRequest.loading;
  Completer<GoogleMapController>? controllerpage;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];

  // MapController mapController = MapController();
  // LatLng? tapPosition;

  // getmarker(tapPosition, LatLng newLatLng) {
  //   tapPosition = newLatLng;
  //   update();
  // }

  // getCurrentLocation() async {
  //   try {
  //     position = await Geolocator.getCurrentPosition();
  //     tapPosition = LatLng(position!.latitude, position!.longitude);
  //     lat = position!.latitude;
  //     long = position!.longitude;
  //     statesRequest = StatesRequest.none;
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition();
      lat = position!.latitude;
      long = position!.longitude;
      kGooglePlex = CameraPosition(
        target: LatLng(lat!, long!),
        zoom: 16.4746,
      );
      markers
          .add(Marker(markerId: MarkerId("1"), position: LatLng(lat!, long!)));

      statesRequest = StatesRequest.none;
      update();
    } catch (e) {
      print(e);
    }
  }

  addmarker(LatLng latlng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latlng));
    update();
  }

  Add_address() async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await addressData.AddData(
        user_id!,
        street!.text,
        building!.text,
        name!.text,
        apartment!.text,
        lat.toString(),
        long.toString(),
        city!.text);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(Routes.homescreen);
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  // TileLayer get openStreetMapTileLeter => TileLayer(
  //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  //     );

  initialData() {
    user_id = myServices.sharedPreferences.getInt('user_id').toString();
    city = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    apartment = TextEditingController();
    name = TextEditingController();
    controllerpage = Completer<GoogleMapController>();
  }

  @override
  void onInit() {
    initialData();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void dispose() {
    city = TextEditingController();
    street = TextEditingController();
    building = TextEditingController();
    apartment = TextEditingController();
    name = TextEditingController();
    // mapController = MapController();
    controllerpage = Completer<GoogleMapController>();
    super.dispose();
  }
}
