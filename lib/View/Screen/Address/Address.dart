import 'package:e_commerce/Controller/Address/Address_view_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Widget/Address/CardAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Appcolor.primary_color,
          onPressed: () {
            Get.toNamed(Routes.addaddress);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text('Address'),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: GetBuilder(
                init: AddressViewController(),
                builder: (controller) {
                  return HandlingDataView(
                      statesRequest: controller.statesRequest,
                      widget: ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (BuildContext, index) {
                            return Cardaddress(
                                address_model: controller.data[index],
                                onedit: () {
                                  controller.go_to_edit_address(
                                      controller.data[index]);
                                },
                                ondelete: () {
                                  controller.DeleteAddress(controller
                                      .data[index].addressId!
                                      .toString());
                                });
                          }));
                })));
  }
}
