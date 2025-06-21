import 'dart:io';

import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> Alert_to_exit() {
  Get.defaultDialog(
      title: 'Alert',
      middleText: 'You want to exit application ?',
      actions: [
        MaterialButton(
          onPressed: () {
            exit(0);
          },
          color: Appcolor.primary_color,
          child: Text(
            'Yes',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: Appcolor.primary_color,
          child: Text(
            'no',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]);
  return Future.value(true);
}
