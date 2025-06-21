import 'package:e_commerce/Controller/Order/Order_Tracking_controller.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: GetBuilder(
              init: OrderTrackingController(),
              builder: (controller) {
                return HandlingDataView(
                    statesRequest: controller.statesRequest,
                    widget: Column(
                      children: [
                        Expanded(
                          child: Container(
                            //  height: 350,
                            width: 410,
                            child: GoogleMap(
                              polylines: controller.polylineset,
                              mapType: MapType.normal,
                              initialCameraPosition: controller.kGooglePlex,
                              markers: controller.markers.toSet(),
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                controller.gmc = controllermap;
                              },
                            ),
                          ),
                        ),
                      ],
                    ));
              })),
    );
  }
}
