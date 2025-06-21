import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Category_data.dart';
import 'package:e_commerce/Data/Model/CategoryModel.dart';
import 'package:get/get.dart';

abstract class CategoryController extends GetxController {
  get_data();
  go_to_item(List categories, int selected_categorey);
}

class CategoryControllerImp extends CategoryController {
  CategoryData categoryData = CategoryData(Get.find());
  StatesRequest statesRequest = StatesRequest.none;
  late CategoryModel categoryModel;
  List categories = [];
  @override
  get_data() async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await categoryData.getData();
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['data']);
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    get_data();
    super.onInit();
  }

  @override
  go_to_item(categories, selected_categorey) {
    Get.toNamed(Routes.items, arguments: {
      'categories': categories,
      'selected_categorey': selected_categorey,
    });
  }
}
