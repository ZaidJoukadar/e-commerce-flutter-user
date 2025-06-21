import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class CheckemailData {
  Crud crud;
  CheckemailData(this.crud);
  post_data(String email) async {
    var response = await crud.postData(Linkapi.check_email, {
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
