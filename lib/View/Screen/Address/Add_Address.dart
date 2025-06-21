import 'package:e_commerce/Controller/Address/Add_Address_contorller.dart';
import 'package:e_commerce/Core/Function/Valid_input.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/Address/CustomButton.dart';
import 'package:e_commerce/View/Widget/Auth/Custom_textformfield_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Address'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            GetBuilder(
                init: AddAddressContorller(),
                builder: (controller) {
                  return HandlingDataView(
                      statesRequest: controller.statesRequest,
                      widget: Column(
                        children: [
                          ////////////////// Map /////////////////////
                          controller.kGooglePlex == null
                              ? CircularProgressIndicator()
                              : Container(
                                  height: 350,
                                  width: double.infinity,
                                  child: //FlutterMap(
                                      // mapController: controller.mapController,
                                      // options: MapOptions(
                                      //     initialCenter:
                                      //         controller.tapPosition!,
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
                                      // ])
                                      GoogleMap(
                                    mapType: MapType.normal,
                                    initialCameraPosition:
                                        controller.kGooglePlex!,
                                    markers: controller.markers.toSet(),
                                    onTap: (latlng) {
                                      return controller.addmarker(latlng);
                                    },
                                    onMapCreated:
                                        (GoogleMapController controllermap) {
                                      controller.controllerpage!
                                          .complete(controllermap);
                                    },
                                  ),
                                ),
                          ////////////// city text feild ///////////////
                          CustomTextformfieldAuth(
                            hint_text: 'Enter your city name',
                            label: 'City',
                            icon: Icons.location_history_outlined,
                            text_controller: controller.city,
                            type: TextInputType.name,
                            is_scure: false,
                            valid: (Value) {
                              return valid_input(Value!, 50, 2, 'username');
                            },
                          ),
                          ////////////// street text feild ///////////////
                          CustomTextformfieldAuth(
                            hint_text: 'Enter your street name',
                            label: 'Street',
                            icon: Icons.roundabout_right_outlined,
                            text_controller: controller.street,
                            type: TextInputType.name,
                            is_scure: false,
                            valid: (Value) {
                              return valid_input(Value!, 50, 2, 'username');
                            },
                          ),
                          ////////////// building text feild ///////////////
                          CustomTextformfieldAuth(
                            hint_text: 'Enter your building name',
                            label: 'Building',
                            icon: Icons.add_home_work_outlined,
                            text_controller: controller.building,
                            type: TextInputType.name,
                            is_scure: false,
                            valid: (Value) {
                              return valid_input(Value!, 50, 1, 'username');
                            },
                          ),
                          ////////////// apartment text feild ///////////////
                          CustomTextformfieldAuth(
                            hint_text: 'Enter your apartment name',
                            label: 'Apartment',
                            icon: Icons.apartment_outlined,
                            text_controller: controller.apartment,
                            type: TextInputType.name,
                            is_scure: false,
                            valid: (Value) {
                              return valid_input(Value!, 50, 1, 'username');
                            },
                          ),
                          ////////////// address name text feild ///////////////
                          CustomTextformfieldAuth(
                            hint_text: 'Enter your Address name',
                            label: 'Name',
                            icon: Icons.edit,
                            text_controller: controller.name,
                            type: TextInputType.name,
                            is_scure: false,
                            valid: (Value) {
                              return valid_input(Value!, 50, 1, 'username');
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 300,
                            child: CustomButton(
                              button_text: 'Save',
                              Pressed: () {
                                controller.Add_address();
                              },
                            ),
                          )
                        ],
                      ));
                })
          ],
        ),
      ),
    );
  }
}
