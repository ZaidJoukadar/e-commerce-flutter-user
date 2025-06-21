import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class TestData {
  Crud _crud;
  TestData(this._crud);
  getData() async {
    var response = await _crud.postData(Linkapi.test_link, {});
    return response.fold((l) => l, (r) => r);
  }
}
