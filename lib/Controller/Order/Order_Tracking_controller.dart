import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Core/Function/Get_polyline.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/Model/Order_Model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  Completer<GoogleMapController>? controllerpage;
  GoogleMapController? gmc;
  late CameraPosition kGooglePlex;
  StatesRequest statesRequest = StatesRequest.loading;
  List<Marker> markers = [];
  late Order_Model order_model;
  double? target_lat;
  double? target_long;
  double? current_lat;
  double? current_long;
  Set<Polyline> polylineset = {};
  final firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'ecom',
  );

  initial_polyline() async {
    current_lat = order_model.addressLat!;
    current_long = order_model.addressLong!;
    await Future.delayed(Duration(seconds: 2));
    polylineset =
        await getpolyline(current_lat, current_long, target_lat, target_long);
    statesRequest = StatesRequest.success;
    update();
  }

  Target_Location() {
    markers.add(Marker(
        markerId: MarkerId("target"),
        position: LatLng(target_lat!, target_long!)));
    kGooglePlex = CameraPosition(
      target: LatLng(target_lat!, target_long!),
      zoom: 15.8746,
    );
  }

  getlocationDelivery() {
    firestore
        .collection('delivery')
        .doc(order_model.orderId.toString())
        .snapshots()
        .listen((event) {
      if (event.exists) {
        current_lat = event.get('lat');
        current_long = event.get('long');
        updateMarkerDelivery(current_lat!, current_long!);
      }
    });
  }

  updateMarkerDelivery(double newlat, double newlong) {
    markers.removeWhere((element) => element.markerId.value == 'current');
    markers.add(
      Marker(markerId: MarkerId('current'), position: LatLng(newlat, newlong)),
    );
    update();
  }

  @override
  void onInit() {
    order_model = Get.arguments['Order_Model'];
    target_lat = order_model.addressLat!;
    target_long = order_model.addressLong!;
    Target_Location();
    getlocationDelivery();
    initial_polyline();
    super.onInit();
  }

  @override
  void onClose() {
    //  gmc!.dispose();
    super.onClose();
  }
}
