import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class NotificationData {
  Crud _crud;
  NotificationData(this._crud);
  getData(String user_id) async {
    var response =
        await _crud.postData(Linkapi.notification, {"user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }
}
