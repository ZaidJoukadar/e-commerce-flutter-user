class Coupon_Model {
  int? couponId;
  String? couponCode;
  int? couponDiscount;
  int? couponCount;
  String? couponExpireDate;

  Coupon_Model(
      {this.couponId,
      this.couponCode,
      this.couponDiscount,
      this.couponCount,
      this.couponExpireDate});

  Coupon_Model.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponCode = json['coupon_code'];
    couponDiscount = json['coupon_discount'];
    couponCount = json['coupon_count'];
    couponExpireDate = json['coupon_expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_code'] = this.couponCode;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_count'] = this.couponCount;
    data['coupon_expire_date'] = this.couponExpireDate;
    return data;
  }
}
