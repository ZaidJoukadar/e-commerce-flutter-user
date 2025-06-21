import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/Function/handlingData.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:e_commerce/Data/DataSource/remote/Address_data.dart';
import 'package:e_commerce/Data/Model/Address_Model.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  List<Address_Model> data = [];
  late Address_Model address_model;
  late StatesRequest statesRequest;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  GetData() async {
    statesRequest = StatesRequest.loading;
    update();
    data.clear();
    var response = await addressData.GetData(
        myServices.sharedPreferences.getInt('user_id').toString());
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Address_Model.fromJson(e)));
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  DeleteAddress(String address_id) async {
    statesRequest = StatesRequest.loading;
    update();
    var response = await addressData.DeleteData(address_id);
    statesRequest = handlingData(response);
    if (StatesRequest.success == statesRequest) {
      if (response['status'] == 'success') {
        data.removeWhere((element) => element.addressId == address_id);
        GetData();
      } else {
        statesRequest = StatesRequest.failure;
      }
    }
    update();
  }

  go_to_edit_address(address_modell) {
    Get.toNamed(Routes.editaddress,
        arguments: {"Address_model": address_modell});
  }

  @override
  void onInit() {
    GetData();
    super.onInit();
  }
}
