import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/View/Widget/Setting/Custom_setting_image.dart';
import 'package:flutter/material.dart';

class test_view extends StatelessWidget {
  const test_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
          backgroundColor: Appcolor.primary_color,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [CustomSettingImage()],
          ),
        ));
  }
}
