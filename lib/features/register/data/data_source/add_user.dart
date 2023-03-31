import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app/features/login/data/model/login_model.dart';
import 'package:ecommerce_app/features/register/data/model/user_model.dart';
import 'package:http/http.dart' as http;

addUsers(User userDetail) async {
  const String url = 'http://localhost:3000/users';
  var response = await http.post(
    Uri.parse(url),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    },
    body: jsonEncode(
      userDetail.toJson(),
    ),
  );
  print(jsonDecode(response.body));
  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create User.');
  }
}

getUsers() async {
  const String url = 'http://localhost:3000/users';
  var response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
  } else {
    throw Exception('No Data');
  }
}

