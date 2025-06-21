import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class FavoriteData {
  Crud _crud;
  FavoriteData(this._crud);
  getData(String user_id) async {
    var response =
        await _crud.postData(Linkapi.view_favorite_link, {"user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }

  insert_to_favorite(String user_id, String item_id) async {
    var response = await _crud.postData(Linkapi.add_to_favorite_link,
        {"favorite_users": user_id, "favorite_items": item_id});
    return response.fold((l) => l, (r) => r);
  }

  delete_from_favorite(String user_id, String item_id) async {
    var response = await _crud.postData(Linkapi.delete_from_favorite,
        {"favorite_users": user_id, "favorite_items": item_id});
    return response.fold((l) => l, (r) => r);
  }
}
