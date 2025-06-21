import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class CategoryData {
  Crud _crud;
  CategoryData(this._crud);
  getData() async {
    var response = await _crud.postData(Linkapi.category, {});
    return response.fold((l) => l, (r) => r);
  }
}
