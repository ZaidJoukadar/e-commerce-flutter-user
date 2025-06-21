import 'package:e_commerce/Controller/Notification_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: GetBuilder(
              init: NotificationController(),
              builder: (controller) {
                return HandlingDataView(
                    statesRequest: controller.statesRequest,
                    widget: ListView(
                      children: [
                        Center(
                          child: Text(
                            'Notification',
                            style: TextStyle(
                                color: Appcolor.primary_color,
                                fontWeight: FontWeight.bold,
                                fontSize: 33),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ...List.generate(controller.data.length, (index) {
                          return Card(
                            child: ListTile(
                                title: Text(
                                    "${controller.data[index]['notification_title']}"),
                                subtitle: Text(
                                    "${controller.data[index]['notification_body']}"),
                                trailing: Text(
                                    Jiffy.parse(
                                            "${controller.data[index]['notification_date']}")
                                        .fromNow(),
                                    style: GoogleFonts.sen(
                                        color: Appcolor.second_colors,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 15))),
                          );
                        })
                      ],
                    ));
              })),
    );
  }
}
