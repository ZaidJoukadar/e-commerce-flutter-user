import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  get_data() async {
    var response = await crud.postData(Linkapi.home_link, {});
    return response.fold((l) => l, (r) => r);
  }
}
