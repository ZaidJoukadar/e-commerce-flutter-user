class Address_Model {
  int? addressId;
  int? userId;
  String? addressName;
  String? addressStreet;
  String? addressBuilding;
  String? addressApartment;
  double? addressLat;
  double? addressLong;
  String? addressCity;

  Address_Model(
      {this.addressId,
      this.userId,
      this.addressName,
      this.addressStreet,
      this.addressBuilding,
      this.addressApartment,
      this.addressLat,
      this.addressLong,
      this.addressCity});

  Address_Model.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    userId = json['user_id'];
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
    data['address_id'] = this.addressId;
    data['user_id'] = this.userId;
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
