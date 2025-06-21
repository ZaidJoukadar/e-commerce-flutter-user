import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Order_data.dart';
import 'package:e_commerce/Data/Model/Order_Model.dart';
import 'package:get/get.dart';

class OrderPendingController extends GetxController {
  StatesRequest statesRequest = StatesRequest.none;
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  List<Order_Model> list_data = [];

  Getorder() async {
    list_data.clear();
    statesRequest = StatesRequest.loading;
    update();
    var response = await orderData
        .pending(myServices.sharedPreferences.getInt('user_id').toString());
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list_data.addAll(data.map((e) => Order_Model.fromJson(e)));
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  go_to_tracking(Order_Model order_model) {
    Get.toNamed(Routes.order_tracking, arguments: {"Order_Model": order_model});
  }

  delete(String order_id) async {
    list_data.clear();
    statesRequest = StatesRequest.loading;
    update();
    var response = await orderData.delete(order_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        refreshpage();
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  refreshpage() {
    Getorder();
  }

  @override
  void onInit() {
    Getorder();
    super.onInit();
  }
}
