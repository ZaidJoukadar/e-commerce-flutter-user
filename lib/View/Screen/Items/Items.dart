import 'package:e_commerce/Controller/Items_controller.dart';
import 'package:e_commerce/Controller/favorite_controller.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:e_commerce/View/Screen/Home.dart';
import 'package:e_commerce/View/Widget/Items/ListCategoriesItems.dart';
import 'package:e_commerce/View/Widget/Items/ListItems.dart';
import 'package:e_commerce/View/Widget/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController controller_favorite = Get.put(FavoriteController());
    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(10),
            child: GetBuilder<ItemsControllerImp>(
                init: ItemsControllerImp(),
                builder: (controller) {
                  return ListView(
                    children: [
                      Searchbar(
                        search_text_controller: controller.search,
                        hint_text: 'Search',
                        onSearch: (val) {
                          controller.check_search(val);
                        },
                        onPressed: () {
                          controller.onsearch();
                        },
                        onSubmitted: (val) {
                          controller.check_search(val);
                          controller.onsearch();
                        },
                      ),
                      HandlingDataView(
                          statesRequest: controller.statesRequest,
                          widget: controller.issearch
                              ? List_items_Search(
                                  list_data: controller.data_items)
                              : Column(
                                  children: [
                                    ListCategoryItems(),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    GridView.builder(
                                        itemCount: controller.data.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.66),
                                        itemBuilder: (BuildContext, index) {
                                          controller_favorite.isfavortie[
                                              controller.data[index]
                                                  ['item_id']] = controller
                                              .data[index]['favorite'];
                                          return Listitems(
                                            itemsModel: ItemsModel.fromJson(
                                                controller.data[index]),
                                          );
                                        }),
                                  ],
                                )),
                    ],
                  );
                })));
  }
}
