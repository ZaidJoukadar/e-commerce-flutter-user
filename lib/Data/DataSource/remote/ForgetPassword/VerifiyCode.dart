import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class VerifiycodeData {
  Crud crud;
  VerifiycodeData(this.crud);
  post_data(String email, String user_verify_code) async {
    var response = await crud.postData(Linkapi.verifiyCodeResetPassword_link, {
      "user_email": email,
      "user_verify_code": user_verify_code,
    });
    return response.fold((l) => l, (r) => r);
  }

  resend_Data(String email) async {
    var response = await crud.postData(Linkapi.Resend_link, {
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
