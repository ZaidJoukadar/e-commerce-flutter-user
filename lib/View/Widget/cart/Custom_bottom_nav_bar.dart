import 'package:e_commerce/Controller/Cart_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/View/Widget/ItemsDetails/Add_to_card_button.dart';
import 'package:e_commerce/View/Widget/cart/Apply_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String price;
  final String shipping;
  final String discount;
  final String coupun_discount;
  final String total_price;
  final TextEditingController coupon_code;
  final Function()? onapply_coupon;
  final Function()? ontaporder;
  const CustomBottomNavBar(
      {super.key,
      required this.price,
      required this.shipping,
      required this.discount,
      required this.total_price,
      required this.coupon_code,
      required this.onapply_coupon,
      required this.coupun_discount,
      required this.ontaporder});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartControllerImp>(builder: (controller) {
          return controller.coupon_code_name == null
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: coupon_code,
                            decoration: InputDecoration(
                                hintText: 'Coupon Code',
                                prefixIcon: Icon(Icons.card_giftcard),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )),
                      Expanded(
                          flex: 1,
                          child: ApplyButton(
                            title_button: 'Check Code',
                            onTap: onapply_coupon,
                          )),
                    ],
                  ),
                )
              : Container(
                  child: Text(
                    'Your Coupon  ${controller.coupon_code_name}',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                );
        }),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2.5, color: Appcolor.primary_color)),
          margin: EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Price',
                        style: TextStyle(color: Appcolor.primary_color),
                      ),
                    ),
                    Container(
                      child: Text(
                        '+ $price\$',
                        style: GoogleFonts.sen(
                            color: Appcolor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'shipping',
                        style: TextStyle(color: Appcolor.primary_color),
                      ),
                    ),
                    Container(
                      child: Text(
                        '+ $shipping\$',
                        style: GoogleFonts.sen(
                            color: Appcolor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Discount',
                        style: TextStyle(color: Appcolor.primary_color),
                      ),
                    ),
                    Container(
                      child: Text(
                        '- $discount\$',
                        style: GoogleFonts.sen(
                            color: Appcolor.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Coupon Discount',
                        style: TextStyle(color: Appcolor.primary_color),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$coupun_discount\%',
                        style: GoogleFonts.sen(
                            color: Appcolor.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Appcolor.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Total Price',
                        style: TextStyle(color: Appcolor.primary_color),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$total_price\$',
                        style: GoogleFonts.sen(
                            color: Appcolor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AddToCardButton(title_button: 'Order Now', onTap: ontaporder)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
