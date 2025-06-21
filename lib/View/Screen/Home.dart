import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Controller/Home_controller.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/class/handling_Data_view.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:e_commerce/LinkApi.dart';
import 'package:e_commerce/View/Widget/Home/CategoryListHome.dart';
import 'package:e_commerce/View/Widget/Home/CustomTitleHome.dart';
import 'package:e_commerce/View/Widget/Home/DiscountCard.dart';
import 'package:e_commerce/View/Widget/Home/ItemListHome.dart';
import 'package:e_commerce/View/Widget/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        init: HomeControllerImp(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.getdata();
              },
              child: ListView(
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
                  SizedBox(
                    height: 10,
                  ),
                  HandlingDataView(
                      statesRequest: controller.statesRequest,
                      widget: controller.issearch
                          ? List_items_Search(list_data: controller.data_items)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Discount(),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomtitleHome(
                                  title_text: 'Categories',
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CategorylistHome(),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomtitleHome(
                                  title_text: 'Top Selling:',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Itemlisthome()
                              ],
                            )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class List_items_Search extends StatelessWidget {
  final List<ItemsModel> list_data;
  const List_items_Search({super.key, required this.list_data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list_data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.itemsdetails,
                  arguments: {'ItemsModel': list_data[index]});
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl:
                            "${Linkapi.image_items}/${list_data[index].itemImage}",
                      )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text("${list_data[index].itemName}"),
                            subtitle: Text("${list_data[index].categoryName}"),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
