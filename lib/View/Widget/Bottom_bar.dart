import 'package:e_commerce/Controller/HomeScreen_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:e_commerce/View/Widget/Home/CustomBottunAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color.fromRGBO(215, 215, 215, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? Spacer()
                  : Custombuttonappbar(
                      button_title: controller.list_name_page_bottom_bar[i],
                      icon: controller.list_icon_page_bottom_bar[i],
                      color_selected: Appcolor.dark_gray,
                      press: () {
                        controller.changePage(i);
                      },
                      acive_button: controller.index == i ? true : false,
                    );
            })
          ],
        ),
      );
    });
  }
}
