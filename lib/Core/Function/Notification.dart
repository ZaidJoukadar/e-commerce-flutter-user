import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Custom_notification(String title, String image_path, String middle_text) {
  String image = 'assets/lottie/$image_path';
  Get.defaultDialog(
    title: title,
    content: Column(
      children: [
        Lottie.asset(image, height: 150, width: 150, repeat: false),
        SizedBox(
          height: 25,
        ),
        Text(middle_text)
      ],
    ),
    onConfirm: () {
      Get.back();
    },
  );
}
