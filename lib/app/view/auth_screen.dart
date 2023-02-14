// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:reviewtherapist/app/view/navbar_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({Key? key}) : super(key: key);

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final storage = GetStorage();
//   bool showSpinner = false;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   Widget _renderSignIn() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Image.asset("assets/Add_a_heading__1_-removebg-preview.png",
//                 width: 200),
//           ),
//           const SizedBox(height: 60),
//           TextFormField(
//             controller: _emailController,
//             autofocus: false,
//             autocorrect: false,
//             enableSuggestions: false,
//             decoration: const InputDecoration(
//               filled: true,
//               fillColor: Colors.grey,
//               labelText: 'Email',
//               floatingLabelStyle: TextStyle(color: Colors.black),
//               focusedBorder: InputBorder.none,
//               border: InputBorder.none,
//             ),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter your email';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10.0),
//           TextFormField(
//             controller: _passwordController,
//             obscureText: true,
//             autofocus: false,
//             autocorrect: false,
//             enableSuggestions: false,
//             decoration: const InputDecoration(
//               filled: true,
//               fillColor: Colors.grey,
//               labelText: 'Password',
//               floatingLabelStyle: TextStyle(color: Colors.black),
//               focusedBorder: InputBorder.none,
//               border: InputBorder.none,
//             ),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter your password';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10.0),
//           SizedBox(
//             width: double.infinity,
//             child: OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                 side: const BorderSide(width: 1.0, color: Colors.red),
//               ),
//               child: const Text(
//                 "Sign in",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22.0),
//               ),
//               onPressed: () async {
//                 storage.write('email', _emailController.text);
//                 final SharedPreferences prefs =
//                     await SharedPreferences.getInstance();
//                 final email = _emailController.text;
//                 final password = _passwordController.text;
//                 prefs.setString('email', _emailController.text);
//                 if (_formKey.currentState!.validate()) {
//                   try {
//                     final user = await auth.signInWithEmailAndPassword(
//                       email: email.trim(),
//                       password: password.trim(),
//                     );
//                     toastMessages("Login Successful");
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const NavbarScreen(),
//                       ),
//                     );
//                   } catch (e) {
//                     print(e);
//                     toastMessages(e.toString());
//                   }
//                 }

//                 // await api.login(email, password);
//               },
//             ),
//           ),
//           const SizedBox(height: 20.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Don't have an account?",
//                 style: TextStyle(color: Colors.white),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedIndex = 1;
//                   });
//                 },
//                 child: const Text(
//                   "Sign up",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   void toastMessages(String message) {
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

//   Widget _renderSignUp() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Image.asset(
//                   "assets/Add_a_heading__1_-removebg-preview.png",
//                   width: 200),
//             ),
//             const SizedBox(height: 60),
//             TextFormField(
//               controller: _nameController,
//               autofocus: false,
//               autocorrect: false,
//               enableSuggestions: false,
//               decoration: const InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey,
//                 labelText: 'Your name',
//                 floatingLabelStyle: TextStyle(color: Colors.black),
//                 focusedBorder: InputBorder.none,
//                 border: InputBorder.none,
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter your name';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 10.0),
//             TextFormField(
//               controller: _emailController,
//               autofocus: false,
//               autocorrect: false,
//               enableSuggestions: false,
//               decoration: const InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey,
//                 labelText: 'Email address',
//                 floatingLabelStyle: TextStyle(color: Colors.black),
//                 focusedBorder: InputBorder.none,
//                 border: InputBorder.none,
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter your email';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 10.0),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: true,
//               autofocus: false,
//               autocorrect: false,
//               enableSuggestions: false,
//               decoration: const InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey,
//                 labelText: 'Password',
//                 floatingLabelStyle: TextStyle(color: Colors.black),
//                 focusedBorder: InputBorder.none,
//                 border: InputBorder.none,
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter your password';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 20.0),
//             SizedBox(
//               width: double.infinity,
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                   side: const BorderSide(width: 1.0, color: Colors.red),
//                 ),
//                 child: const Text(
//                   "Sign up",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22.0),
//                 ),
//                 onPressed: () async {
//                   // final api = context.read<AccountProvider>();
//                   final email = _emailController.text;
//                   final password = _passwordController.text;

//                   if (_formKey.currentState!.validate()) {
//                     try {
//                       final newUser = await auth.createUserWithEmailAndPassword(
//                         email: email.trim(),
//                         password: password.trim(),
//                       );
//                       toastMessages("Registration Successful");
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => const NavbarScreen(),
//                       //   ),
//                       // );
//                     } catch (e) {
//                       print(e);
//                       toastMessages(e.toString());
//                     }
//                   }
//                   // await api.register(email, password, name);
//                 },
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Already have an account?",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 TextButton(
//                   child: const Text(
//                     "Sign in",
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _selectedIndex = 0;
//                     });
//                   },
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final current = context.watch<AccountProvider>().current;

//     // _emailController.text = current?.email ?? "";

//     return ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Scaffold(
//           extendBodyBehindAppBar: true,
//           body: IndexedStack(
//             index: _selectedIndex,
//             children: [
//               _renderSignIn(),
//               _renderSignUp(),
//             ],
//           ),
//         ));
//     // child: Scaffold(
//     //     extendBodyBehindAppBar: true,
//     //     body: IndexedStack(
//     //       index: _selectedIndex,
//     //       children: [
//     //         _renderSignIn(),
//     //         _renderSignUp(),
//     //       ],
//     //     ));
//   }
// }
