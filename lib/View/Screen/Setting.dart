import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/Logout.dart';
import 'package:e_commerce/View/Widget/Setting/Custom_ListTile_setting.dart';
import 'package:e_commerce/View/Widget/Setting/Custom_setting_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  State<Setting> createState() => _setting();
}

class _setting extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          CustomSettingImage(),
          SizedBox(
            height: 20,
          ),
          /////////////// Address ////////////////
          CustomListtileSetting(
            title: 'Address',
            iconData: Icons.location_on_outlined,
            onTap: () {
              Get.toNamed(Routes.address);
            },
          ),
          Divider(),
          /////////////// Order ////////////////
          CustomListtileSetting(
            title: 'Order',
            iconData: Icons.shopping_bag_outlined,
            onTap: () {
              Get.toNamed(Routes.order_pending);
            },
          ),
          Divider(),
          /////////////// Archive ////////////////
          CustomListtileSetting(
            title: 'Archive',
            iconData: Icons.archive_outlined,
            onTap: () {
              Get.toNamed(Routes.order_archive);
            },
          ),
          Divider(),
          /////////////// About us ////////////////
          CustomListtileSetting(
            title: 'About Us',
            iconData: Icons.help_outline_outlined,
            onTap: () {
              Get.toNamed(Routes.aboutus);
            },
          ),
          Divider(),
          /////////////// support ////////////////
          CustomListtileSetting(
            title: 'Support',
            iconData: Icons.support_agent_outlined,
            onTap: () async {
              await launchUrl(Uri.parse("tel:+963952142264"));
            },
          ),
          Divider(),
          /////////////// logout ////////////////
          CustomListtileSetting(
            title: 'LogOut',
            iconData: Icons.exit_to_app_outlined,
            onTap: () {
              Logout();
            },
          ),
        ],
      ),
    );
  }
}
