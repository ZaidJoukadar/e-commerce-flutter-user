class Order_Details_Model {
  String? priceItems;
  String? itemPriceDiscount;
  String? amountOfDiscount;
  int? orderId;
  int? countItem;
  int? cartId;
  int? cartUserId;
  int? cartItemId;
  int? cartOrder;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemDescriptionAr;
  String? itemImage;
  int? itemActive;
  int? itemCount;
  String? itemPrice;
  int? itemDiscount;
  String? itemCreate;
  int? itemCategories;

  Order_Details_Model(
      {this.priceItems,
      this.itemPriceDiscount,
      this.amountOfDiscount,
      this.orderId,
      this.countItem,
      this.cartId,
      this.cartUserId,
      this.cartItemId,
      this.cartOrder,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDescription,
      this.itemDescriptionAr,
      this.itemImage,
      this.itemActive,
      this.itemCount,
      this.itemPrice,
      this.itemDiscount,
      this.itemCreate,
      this.itemCategories});

  Order_Details_Model.fromJson(Map<String, dynamic> json) {
    priceItems = json['priceItems'];
    itemPriceDiscount = json['item_price_discount'];
    amountOfDiscount = json['amount_of_discount'];
    orderId = json['order_id'];
    countItem = json['countItem'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    cartOrder = json['cart_order'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescription = json['item_description'];
    itemDescriptionAr = json['item_description_ar'];
    itemImage = json['item_image'];
    itemActive = json['item_active'];
    itemCount = json['item_count'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemCreate = json['item_create'];
    itemCategories = json['item_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceItems'] = this.priceItems;
    data['item_price_discount'] = this.itemPriceDiscount;
    data['amount_of_discount'] = this.amountOfDiscount;
    data['order_id'] = this.orderId;
    data['countItem'] = this.countItem;
    data['cart_id'] = this.cartId;
    data['cart_user_id'] = this.cartUserId;
    data['cart_item_id'] = this.cartItemId;
    data['cart_order'] = this.cartOrder;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_description'] = this.itemDescription;
    data['item_description_ar'] = this.itemDescriptionAr;
    data['item_image'] = this.itemImage;
    data['item_active'] = this.itemActive;
    data['item_count'] = this.itemCount;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_create'] = this.itemCreate;
    data['item_categories'] = this.itemCategories;
    return data;
  }
}
