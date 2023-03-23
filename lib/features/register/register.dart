// import 'package:ecommerce_app/common/widgets/text_form_field_common.dart';
// import 'package:flutter/material.dart';

// import '../../constants.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final GlobalKey<FormState> _registerKey = GlobalKey();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController mobileNumberController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   String? email,
//       password,
//       firstName,
//       lastName,
//       address,
//       mobileNumber,
//       confirmPassword;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       body: SingleChildScrollView(
//         child: Form(
//           key: _registerKey,
//           child: Column(
//             children: [
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 //margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
//                 decoration: const BoxDecoration(
//                   color: appBarColor,
//                   borderRadius:
//                       BorderRadius.only(bottomLeft: Radius.circular(200)),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.only(
//                       top: 60, left: 100, bottom: 10, right: 10),
//                   child: Image(
//                     image: AssetImage('assets/images/T973DText.png'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CommonTextFormField(
//                   icon: Icons.person,
//                   labelText: 'First Name',
//                   obscureText: false,
//                   controller: firstNameController,
//                   onChanged: (firstNameValue) {
//                     setState(() {
//                       firstName = firstNameValue;
//                     });
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CommonTextFormField(
//                   icon: Icons.person,
//                   labelText: 'Last Name',
//                   obscureText: false,
//                   controller: lastNameController,
//                   onChanged: (lastNameValue) {
//                     setState(() {
//                       lastName = lastNameValue;
//                     });
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CommonTextFormField(
//                   icon: Icons.home,
//                   labelText: 'Address',
//                   obscureText: false,
//                   controller: addressController,
//                   onChanged: (addressValue) {
//                     setState(() {
//                       address = addressValue;
//                     });
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CommonTextFormField(
//                   icon: Icons.call,
//                   labelText: 'Mobile Number',
//                   obscureText: false,
//                   controller: mobileNumberController,
//                   onChanged: (mobileNumberValue) {
//                     setState(() {
//                       mobileNumber = mobileNumberValue;
//                     });
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CommonTextFormField(
//                   icon: Icons.email,
//                   labelText: 'Email',
//                   obscureText: false,
//                   controller: emailController,
//                   onChanged: (emailValue) {
//                     setState(() {
//                       email = emailValue;
//                     });
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CommonTextFormField(
//                   icon: Icons.lock,
//                   labelText: 'Password',
//                   obscureText: true,
//                   controller: passwordController,
//                   onChanged: (passwordValue) {
//                     setState(() {
//                       password = passwordValue;
//                     });
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CommonTextFormField(
//                   icon: Icons.key,
//                   labelText: 'ConfirmPassword',
//                   obscureText: true,
//                   controller: confirmPasswordController,
//                   onChanged: (confirmPasswordValue) {
//                     setState(() {
//                       confirmPassword = confirmPasswordValue;
//                     });
//                   },
//                 ),
//               ),
//               Container(
//                 height: 131,
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(top: 30),
//                 decoration: const BoxDecoration(
//                   color: appBarColor,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(200),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 50,
//                       width: 150,
//                       child: MaterialButton(
//                         color: Colors.white,
//                         onPressed: () {},
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: const Text(
//                           'Register',
//                           style: TextStyle(
//                             color: appBarColor,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'You have an account?',
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             //print(email);
//                           },
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                                 fontSize: 20, color: Colors.blue.shade900),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
