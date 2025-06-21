import 'package:e_commerce/Core/class/Crud.dart';
import 'package:e_commerce/LinkApi.dart';

class OrderData {
  Crud _crud;
  OrderData(this._crud);
  checkout(
    String user_id,
    String order_type,
    String order_coupon_id,
    String order_payment_method,
    String order_address_id,
    String order_price,
    String order_shipping_price,
    String order_coupon_discount,
  ) async {
    var response = await _crud.postData(Linkapi.check_out, {
      "user_id": user_id,
      "order_type": order_type,
      "order_coupon_id": order_coupon_id,
      "order_payment_method": order_payment_method,
      "order_address_id": order_address_id,
      "order_price": order_price,
      "order_shipping_price": order_shipping_price,
      "order_coupon_discount": order_coupon_discount,
    });
    return response.fold((l) => l, (r) => r);
  }

  pending(String user_id) async {
    var response = await _crud.postData(Linkapi.pending, {"user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }

  getorderdetails(String order_id) async {
    var response =
        await _crud.postData(Linkapi.details, {"order_id": order_id});
    return response.fold((l) => l, (r) => r);
  }

  delete(String order_id) async {
    var response = await _crud.postData(Linkapi.delete, {"order_id": order_id});
    return response.fold((l) => l, (r) => r);
  }
}
