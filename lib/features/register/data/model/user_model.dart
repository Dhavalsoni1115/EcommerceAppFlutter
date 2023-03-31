class User {
  String? firstname, lastname, address, mobileNumber, email, password;
  User({
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.mobileNumber,
    required this.email,
    required this.password,
  });
  User.fromJson(Map<String, dynamic> json) {
    firstname = json['firstName'];
    lastname = json['lastName'];
    address = json['address'];
    mobileNumber = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstname;
    data['lastName'] = lastname;
    data['address'] = address;
    data['phone'] = mobileNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
