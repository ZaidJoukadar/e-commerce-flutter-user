class DiscountModel {
  int? discountId;
  String? discountTitle;
  String? discountBody;

  DiscountModel({this.discountId, this.discountTitle, this.discountBody});

  DiscountModel.fromJson(Map<String, dynamic> json) {
    discountId = json['discount_id'];
    discountTitle = json['discount_title'];
    discountBody = json['discount_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount_id'] = this.discountId;
    data['discount_title'] = this.discountTitle;
    data['discount_body'] = this.discountBody;
    return data;
  }
}
