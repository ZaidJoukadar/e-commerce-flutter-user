import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  post_data(
      String user_name, String password, String email, String phone) async {
    var response = await crud.postData(Linkapi.signup_link, {
      "user_name": user_name,
      "user_password": password,
      "user_email": email,
      "user_phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
