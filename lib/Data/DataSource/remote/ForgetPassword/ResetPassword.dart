import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class ResetpasswordData {
  Crud crud;
  ResetpasswordData(this.crud);
  post_data(String email, String password) async {
    var response = await crud.postData(Linkapi.reset_password, {
      "user_email": email,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
