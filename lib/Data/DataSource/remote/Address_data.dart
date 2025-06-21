import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  AddData(
      String user_id,
      String address_street,
      String address_building,
      String address_name,
      String address_apartment,
      String lat,
      String long,
      String city) async {
    var response = await crud.postData(Linkapi.add_address, {
      "user_id": user_id,
      "address_street": address_street,
      "address_building": address_building,
      "address_apartment": address_apartment,
      "address_name": address_name,
      "address_lat": lat,
      "address_long": long,
      "address_city": city,
    });
    return response.fold((l) => l, (r) => r);
  }

  EditData(
      String address_id,
      String address_street,
      String address_building,
      String address_name,
      String address_apartment,
      double lat,
      double long,
      String city) async {
    var response = await crud.postData(Linkapi.edit_address, {
      "address_id": address_id,
      "address_street": address_street,
      "address_building": address_building,
      "address_apartment": address_apartment,
      "address_lat": lat,
      "address_long": long,
      "address_city": city,
    });
    return response.fold((l) => l, (r) => r);
  }

  DeleteData(String address_id) async {
    var response = await crud.postData(Linkapi.delete_address, {
      "address_id": address_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  GetData(String user_id) async {
    var response =
        await crud.postData(Linkapi.view_address, {"user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }
}
