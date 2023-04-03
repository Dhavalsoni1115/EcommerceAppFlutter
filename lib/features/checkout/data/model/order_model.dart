class Order {
  String? token,
      productId,
      name,
      desc,
      price,
      location,
      address,
      city,
      paymentType,
      quntity;
  Order({
    required this.token,
    required this.productId,
    required this.name,
    required this.desc,
    required this.price,
    required this.location,
    required this.address,
    required this.city,
    required this.paymentType,
    required this.quntity,
  });

  Order.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    productId = json['productId'];
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    location = json['location'];
    address = json['address'];
    city = json['city'];
    paymentType = json['paymentType'];
    quntity = json['quntity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['productId'] = productId;
    data['name'] = name;
    data['desc'] = desc;
    data['price'] = price;
    data['location'] = location;
    data['address'] = address;
    data['city'] = city;
    data['paymentType'] = paymentType;
    data['quntity'] = quntity;
    return data;
  }
}
