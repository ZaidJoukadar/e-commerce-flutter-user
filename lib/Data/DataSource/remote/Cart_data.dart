import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  View_data(String user_id) async {
    var response =
        await crud.postData(Linkapi.view_cart_link, {"cart_user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }

  Add_to_cart(String user_id, String item_id) async {
    var response = await crud.postData(Linkapi.add_to_cart_link,
        {"cart_user_id": user_id, "cart_item_id": item_id});
    return response.fold((l) => l, (r) => r);
  }

  Delete_from_cart(String user_id, String item_id) async {
    var response = await crud.postData(Linkapi.delete_from_cart_link,
        {"cart_user_id": user_id, "cart_item_id": item_id});
    return response.fold((l) => l, (r) => r);
  }

  Get_item_count_cart(String user_id, String item_id) async {
    var response = await crud.postData(Linkapi.get_items_count_cart_link,
        {"cart_user_id": user_id, "cart_item_id": item_id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  Remove_from_cart(String user_id, String item_id) async {
    var response = await crud.postData(Linkapi.remove_from_cart_link,
        {"cart_user_id": user_id, "cart_item_id": item_id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  Check_coupon(String coupon_code) async {
    var response =
        await crud.postData(Linkapi.check_coupon, {"coupon_code": coupon_code});
    return response.fold((l) => l, (r) => r);
  }
}
