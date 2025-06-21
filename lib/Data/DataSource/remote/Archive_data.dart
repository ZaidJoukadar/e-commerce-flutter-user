import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class ArchiveData {
  Crud _crud;
  ArchiveData(this._crud);
  getData(String user_id) async {
    var response = await _crud.postData(Linkapi.archive, {"user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }

  rating(
      String order_id, String order_rating, String order_rating_comment) async {
    var response = await _crud.postData(Linkapi.rating, {
      "order_id": order_id,
      "order_rating": order_rating,
      "order_rating_comment": order_rating_comment
    });
    return response.fold((l) => l, (r) => r);
  }
}
