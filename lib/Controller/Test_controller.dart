import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/TestData.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData _testData = TestData(Get.find());
  List data = [];
  late StatesRequest statesRequest;
  getData() async {
    statesRequest = StatesRequest.loading;
    var response = await _testData.getData();
    print('/////////////////$response');
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
  void onInit() {
    getData();
    super.onInit();
  }
}
