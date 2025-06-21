import 'package:e_commerce/Controller/Order/Order_Archive_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/View/Widget/Order/order_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce/Data/Model/Order_Model.dart';
import 'package:jiffy/jiffy.dart';

class OrderArchiveCard extends GetView<OrderArchiveController> {
  final Order_Model order_model;
  const OrderArchiveCard({super.key, required this.order_model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolor.light_gray,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Number: # ${order_model.orderId}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Appcolor.second_colors),
                ),
                Text(Jiffy.parse("${order_model.orderDate}").fromNow(),
                    style: GoogleFonts.sen(
                        color: Appcolor.second_colors,
                        fontWeight: FontWeight.w400,
                        fontSize: 18))
              ],
            ),
            Divider(),
            Text("Order Type: ${order_model.orderType}",
                style: GoogleFonts.sen(
                    color: Appcolor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            Text("Payment Method: ${order_model.orderPaymentMethod}",
                style: GoogleFonts.sen(
                    color: Appcolor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            Text("Order price:  ${order_model.orderPrice} \$",
                style: GoogleFonts.sen(
                    color: Appcolor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            Text("Delivery Price:  ${order_model.orderShippingPrice} \$",
                style: GoogleFonts.sen(
                    color: Appcolor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            Text("Order status: ${order_model.orderStatus}",
                style: GoogleFonts.sen(
                    color: Appcolor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            Divider(),
            Row(
              children: [
                Text("Total Price: ${order_model.orderTotalPrice}\$",
                    style: GoogleFonts.sen(
                        color: Appcolor.primary_color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(Routes.order_details,
                        arguments: {'OrderModel': order_model});
                  },
                  color: Appcolor.second_colors,
                  child: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                if (order_model.orderRating == 0)
                  MaterialButton(
                    onPressed: () {
                      showDialogRating(context, order_model.orderId.toString());
                    },
                    color: Appcolor.second_colors,
                    child: Text(
                      'Rating',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
