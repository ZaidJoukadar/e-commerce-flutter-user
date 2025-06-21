import 'package:e_commerce/Controller/offers_controller.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/View/Screen/Home.dart';
import 'package:e_commerce/View/Widget/Offers/List_item_offer.dart';
import 'package:e_commerce/View/Widget/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder(
            init: OffersController(),
            builder: (controller) {
              return HandlingDataView(
                statesRequest: controller.statesRequest,
                widget: ListView(
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
                    controller.issearch
                        ? List_items_Search(list_data: controller.data_items)
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.list_data.length,
                            itemBuilder: (context, index) {
                              return ListItemOffer(
                                  itemsModel: controller.list_data[index]);
                            }),
                  ],
                ),
              );
            }));
  }
}
