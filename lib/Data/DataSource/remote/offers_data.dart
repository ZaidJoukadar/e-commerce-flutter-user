import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class OffersData {
  Crud _crud;
  OffersData(this._crud);
  getData() async {
    var response = await _crud.postData(Linkapi.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
