class ItemsModel {
  int? itemId;
  String? itemBrand;
  String? itemBrandAr;
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
  int? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryCreate;
  int? favorite;
  String? itemPriceDiscount;
  String? amountOfDiscount;

  ItemsModel(
      {this.itemId,
      this.itemBrand,
      this.itemBrandAr,
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
      this.itemCategories,
      this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryImage,
      this.categoryCreate,
      this.favorite,
      this.itemPriceDiscount,
      this.amountOfDiscount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemBrand = json['item_brand'];
    itemBrandAr = json['item_brand_ar'];
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
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryImage = json['category_image'];
    categoryCreate = json['category_create'];
    favorite = json['favorite'];
    itemPriceDiscount = json['item_price_discount'];
    amountOfDiscount = json['amount_of_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_brand'] = this.itemBrand;
    data['item_brand_ar'] = this.itemBrandAr;
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
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_image'] = this.categoryImage;
    data['category_create'] = this.categoryCreate;
    data['favorite'] = this.favorite;
    data['item_price_discount'] = this.itemPriceDiscount;
    data['amount_of_discount'] = this.amountOfDiscount;
    return data;
  }
}
