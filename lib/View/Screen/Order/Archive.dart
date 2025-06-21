import 'package:e_commerce/Controller/Order/Order_Archive_controller.dart';
import 'package:e_commerce/View/Widget/Order/order_archive_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderArchive extends StatelessWidget {
  const OrderArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Archive'),
        ),
        body: GetBuilder(
            init: OrderArchiveController(),
            builder: (controller) {
              return ListView.builder(
                  itemCount: controller.list_data.length,
                  itemBuilder: (context, index) {
                    return OrderArchiveCard(
                      order_model: controller.list_data[index],
                    );
                  });
            }));
  }
}
