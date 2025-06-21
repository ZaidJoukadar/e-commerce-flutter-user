import 'package:e_commerce/Controller/search_controller.dart';
import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Items_data.dart';
import 'package:e_commerce/Data/Model/Item_Model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  change_category(int index);
  get_items(String category_id, String user_id);
  go_to_item_details(ItemsModel items_model);
}

class ItemsControllerImp extends SearchControllerImp {
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  List categories = [];
  int? selected_categorey;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  StatesRequest statesRequest = StatesRequest.none;
  int? page_index;
  MyServices myServices = Get.find();
  String? user_id;

  intialData() {
    user_id = myServices.sharedPreferences.getInt('user_id').toString();
    categories = Get.arguments['categories'];
    selected_categorey = Get.arguments['selected_categorey'];
    page_index = selected_categorey! + 1;
    get_items(page_index.toString(), user_id!);
  }

  change_category(index) {
    selected_categorey = index;
    page_index = index + 1;
    get_items(page_index.toString(), user_id!);
    update();
  }

  get_items(category_id, user_id) async {
    data.clear();
    statesRequest = StatesRequest.loading;
    update();
    var response = await itemsData.getData(category_id, user_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  go_to_item_details(item_model) {
    Get.toNamed(Routes.itemsdetails, arguments: {'ItemsModel': item_model});
  }
}
