import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app/features/login/data/model/login_model.dart';
import 'package:ecommerce_app/features/register/data/model/user_model.dart';
import 'package:http/http.dart' as http;

loginUser(Login loginDetail) async {
  const String url = 'http://localhost:3000/users/signin';
  var response = await http.post(
    Uri.parse(url),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    },
    body: jsonEncode(
      loginDetail.toJson(),
    ),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to Login User.');
  }
}
