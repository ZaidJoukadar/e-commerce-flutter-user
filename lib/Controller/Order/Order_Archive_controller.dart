import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Archive_data.dart';
import 'package:e_commerce/Data/Model/Order_Model.dart';
import 'package:get/get.dart';

class OrderArchiveController extends GetxController {
  StatesRequest statesRequest = StatesRequest.none;
  ArchiveData archiveData = ArchiveData(Get.find());
  MyServices myServices = Get.find();
  List<Order_Model> list_data = [];

  Getorder() async {
    list_data.clear();
    statesRequest = StatesRequest.loading;
    update();
    var response = await archiveData
        .getData(myServices.sharedPreferences.getInt('user_id').toString());
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

  submit_rating(String order_id, String rating, String comment) async {
    list_data.clear();
    statesRequest = StatesRequest.loading;
    update();
    var response = await archiveData.rating(order_id, rating, comment);
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
