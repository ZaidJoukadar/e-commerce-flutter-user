import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchData(String search) async {
    var response = await crud.postData(Linkapi.search_link, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
