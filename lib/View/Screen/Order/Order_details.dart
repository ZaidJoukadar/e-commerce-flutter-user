import 'package:e_commerce/Controller/Order/Order_Details_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: GetBuilder(
              init: OrderDetailsController(),
              builder: (controller) {
                return HandlingDataView(
                    statesRequest: controller.statesRequest,
                    widget: ListView(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Appcolor.light_gray,
                          ),
                          child: Table(
                            children: [
                              TableRow(children: [
                                Text(
                                  'Product',
                                  style: TextStyle(
                                      color: Appcolor.primary_color,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Quantity',
                                  style: TextStyle(
                                      color: Appcolor.primary_color,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Appcolor.primary_color,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Discount',
                                  style: TextStyle(
                                      color: Appcolor.primary_color,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ]),

                              /////////////////////////////////////////////////////
                              ...List.generate(controller.list_data.length,
                                  (index) {
                                return TableRow(children: [
                                  Text(
                                    "${controller.list_data[index].itemName}",
                                    style: TextStyle(
                                        color: Appcolor.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.list_data[index].countItem}",
                                    style: TextStyle(
                                        color: Appcolor.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.list_data[index].itemPriceDiscount}\$",
                                    style: GoogleFonts.sen(
                                        color: Appcolor.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.list_data[index].amountOfDiscount}\$",
                                    style: GoogleFonts.sen(
                                        color: Appcolor.red,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ]);
                              }),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                          child: Text(
                            'Shipping Price: ${controller.order_model.orderShippingPrice}\$',
                            style: GoogleFonts.sen(
                                color: Appcolor.primary_color,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Total Price: ${controller.order_model.orderTotalPrice}\$',
                            style: GoogleFonts.sen(
                                color: Appcolor.primary_color,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (controller.order_model.orderType == "delivery")
                          Text(
                            'Address:',
                            style: TextStyle(
                                color: Appcolor.primary_color,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        if (controller.order_model.orderType == "delivery")
                          Card(
                            child: ListTile(
                              title: Text(
                                "${controller.order_model.addressName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Appcolor.second_colors,
                                    fontSize: 23),
                              ),
                              subtitle: Text(
                                "${controller.order_model.addressCity}/${controller.order_model.addressStreet}/${controller.order_model.addressBuilding}/${controller.order_model.addressApartment}",
                                style: GoogleFonts.sen(color: Appcolor.black),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        if (controller.order_model.orderType == "delivery")
                          Container(
                            height: 350,
                            width: 350,
                            child: //FlutterMap(
                                // mapController: controller.mapController,
                                // options: MapOptions(
                                //     initialCenter: controller.tapPosition!,
                                //     initialZoom: 15,
                                //     minZoom: 3,
                                //     maxZoom: 100),
                                // children: [
                                //   controller.openStreetMapTileLeter,
                                //   MarkerLayer(markers: [
                                //     Marker(
                                //         point: controller.tapPosition!,
                                //         child: Icon(
                                //           Icons.location_on,
                                //           color: Colors.red,
                                //         ))
                                //   ])
                                // ]),

                                GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: controller.kGooglePlex,
                              markers: controller.markers.toSet(),
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                controller.controllerpage!
                                    .complete(controllermap);
                              },
                            ),
                          )
                      ],
                    ));
              })),
    );
  }
}
