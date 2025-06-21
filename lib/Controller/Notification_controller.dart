import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/notification_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List data = [];
  StatesRequest statesRequest = StatesRequest.none;
  MyServices myServices = Get.find();
  getData() async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getInt('user_id').toString());
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

  go_to_notification() {
    Get.toNamed(Routes.notification);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
