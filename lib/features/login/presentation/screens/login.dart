import 'dart:convert';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/login/data/model/login_model.dart';
import 'package:ecommerce_app/features/register/presentation/widget/text_form_field_common.dart';
import 'package:flutter/material.dart';

import '../../data/data_source/check_login.dart';
import '../../data/data_source/login_shared_prefrance.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email, password;

  LoginSharedPrefrance sharedPref = LoginSharedPrefrance();

  @override
  void initState() {
    super.initState();
    sharedPref.getLoginToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Form(
          key: _loginKey,
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                //margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
                decoration: const BoxDecoration(
                  color: appBarColor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(200)),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                      top: 60, left: 100, bottom: 10, right: 10),
                  child: Image(
                    image: AssetImage('assets/images/T973DText.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: CommonTextFormField(
                  icon: Icons.mail,
                  labelText: 'Email',
                  obscureText: false,
                  controller: emailController,
                  onChanged: (emailValue) {
                    setState(() {
                      email = emailValue;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: CommonTextFormField(
                  icon: Icons.lock,
                  labelText: 'Password',
                  obscureText: true,
                  controller: passwordController,
                  onChanged: (passwordValue) {
                    setState(() {
                      password = passwordValue;
                    });
                  },
                ),
              ),
              Container(
                height: 131,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 195),
                decoration: const BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () async {
                          Login loginData =
                              Login(email: email, password: password);
                          // print(loginData.toJson());
                          // String data;
                          var loginUserToken = await loginUser(loginData);
                          print('========data======');
                          print(loginUserToken);

                          sharedPref.storeLoginToken(loginUserToken.toString());
                          setState(() {
                            emailController.clear();
                            passwordController.clear();
                            Navigator.pop(context);
                          });
                        },
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: appBarColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
