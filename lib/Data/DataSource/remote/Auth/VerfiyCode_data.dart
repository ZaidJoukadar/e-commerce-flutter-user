import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class verfiyCode_signupData {
  Crud crud;
  verfiyCode_signupData(this.crud);
  post_data(String email, String verifycode) async {
    var response = await crud.postData(Linkapi.verifiyCode_signup_link, {
      "user_email": email,
      "user_verify_code": verifycode,
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
