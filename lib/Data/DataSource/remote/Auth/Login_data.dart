import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  post_data(String email, String password) async {
    var response = await crud.postData(Linkapi.login_link, {
      "user_password": password,
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
