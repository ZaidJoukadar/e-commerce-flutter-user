class Order_Model {
  int? orderId;
  int? userId;
  String? orderType;
  int? orderCouponId;
  int? orderCouponDiscount;
  String? orderPaymentMethod;
  String? orderDate;
  String? orderPrice;
  int? orderShippingPrice;
  double? orderTotalPrice;
  int? orderAddressId;
  String? orderStatus;
  int? orderRating;
  String? orderRatingComment;
  int? addressId;
  String? addressName;
  String? addressStreet;
  String? addressBuilding;
  String? addressApartment;
  double? addressLat;
  double? addressLong;
  String? addressCity;

  Order_Model(
      {this.orderId,
      this.userId,
      this.orderType,
      this.orderCouponId,
      this.orderCouponDiscount,
      this.orderPaymentMethod,
      this.orderDate,
      this.orderPrice,
      this.orderShippingPrice,
      this.orderTotalPrice,
      this.orderAddressId,
      this.orderStatus,
      this.orderRating,
      this.orderRatingComment,
      this.addressId,
      this.addressName,
      this.addressStreet,
      this.addressBuilding,
      this.addressApartment,
      this.addressLat,
      this.addressLong,
      this.addressCity});

  Order_Model.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    orderType = json['order_type'];
    orderCouponId = json['order_coupon_id'];
    orderCouponDiscount = json['order_coupon_discount'];
    orderPaymentMethod = json['order_payment_method'];
    orderDate = json['order_date'];
    orderPrice = json['order_price'];
    orderShippingPrice = json['order_shipping_price'];
    orderTotalPrice = json['order_total_price'];
    orderAddressId = json['order_address_id'];
    orderStatus = json['order_status'];
    orderRating = json['order_rating'];
    orderRatingComment = json['order_rating_comment'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressBuilding = json['address_building'];
    addressApartment = json['address_apartment'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressCity = json['address_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['order_type'] = this.orderType;
    data['order_coupon_id'] = this.orderCouponId;
    data['order_coupon_discount'] = this.orderCouponDiscount;
    data['order_payment_method'] = this.orderPaymentMethod;
    data['order_date'] = this.orderDate;
    data['order_price'] = this.orderPrice;
    data['order_shipping_price'] = this.orderShippingPrice;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_address_id'] = this.orderAddressId;
    data['order_status'] = this.orderStatus;
    data['order_rating'] = this.orderRating;
    data['order_rating_comment'] = this.orderRatingComment;
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_street'] = this.addressStreet;
    data['address_building'] = this.addressBuilding;
    data['address_apartment'] = this.addressApartment;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_city'] = this.addressCity;
    return data;
  }
}
