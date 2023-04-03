class CheckoutAddress {
  String? categories, streetAddress, city, zipCode, locationType;

  CheckoutAddress({
    required this.categories,
    required this.streetAddress,
    required this.city,
    required this.zipCode,
    required this.locationType,
  });

  CheckoutAddress.fromJson(Map<String, dynamic> json) {
    categories = json['categories'];
    streetAddress = json['streetAddress'];
    city = json['city'];
    zipCode = json['zipCode'];
    locationType = json['locationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories'] = categories;
    data['streetAddress'] = streetAddress;
    data['city'] = city;
    data['zipCode'] = zipCode;
    data['locationType'] = locationType;
    return data;
  }
}
