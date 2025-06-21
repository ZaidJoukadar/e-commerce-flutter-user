import 'package:e_commerce/Controller/Order/Order_pending_controller.dart';
import 'package:e_commerce/View/Widget/Order/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPending extends StatelessWidget {
  const OrderPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Order'),
        ),
        body: GetBuilder(
            init: OrderPendingController(),
            builder: (controller) {
              return ListView.builder(
                  itemCount: controller.list_data.length,
                  itemBuilder: (context, index) {
                    return OrderCard(
                      order_model: controller.list_data[index],
                    );
                  });
            }));
  }
}
