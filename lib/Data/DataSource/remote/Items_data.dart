import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class ItemsData {
  Crud _crud;
  ItemsData(this._crud);
  getData(String category_id, String user_id) async {
    var response = await _crud.postData(Linkapi.view_item_link,
        {'category_id': category_id.toString(), 'user_id': user_id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
