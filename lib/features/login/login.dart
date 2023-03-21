import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              //margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
              decoration: BoxDecoration(
                color: appBarColor,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(200)),
                // image: DecorationImage(
                //   image: AssetImage('assets/images/T973DText.png'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 60, left: 100, bottom: 10, right: 10),
                  child: Image(
                    image: AssetImage('assets/images/T973DText.png'),
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    //borderSide: const BorderSide(color: appBarColor),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: appBarColor,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: appBarColor,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Container(
              height: 131,
              width: double.infinity,
              margin: EdgeInsets.only(top: 195),
              decoration: BoxDecoration(
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
                      onPressed: () {},
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
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
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Create',
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue.shade900),
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
    );
  }
}
