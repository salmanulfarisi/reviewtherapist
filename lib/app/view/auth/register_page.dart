// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reviewtherapist/app/controller/auth/auth_provider.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/utils/size.dart';
import 'package:reviewtherapist/app/utils/textstyles.dart';
import 'package:reviewtherapist/app/view/auth/firebase_auth_methods.dart';
import 'package:reviewtherapist/app/view/auth/login_page.dart';
import 'package:reviewtherapist/app/view/widget/button_widget.dart';
import 'package:reviewtherapist/app/view/widget/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void signUpUser() async {
    context
        .read<FirebaseAuthMethods>()
        .signup(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        )
        .then((value) {
      Timer(const Duration(seconds: 10), () {
        NavigateFunctions.pushPage(context, const LoginPage());
      });
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    final authProvider = context.watch<AuthProvider>();
    // final registerPov = Provider.of<RegsiterProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hello Again
                  const Text(
                    'Hello There!',
                    style: AppTextStyle.heading1,
                  ),
                  const Text(
                    'Register below with your details!',
                    style: AppTextStyle.heading2,
                  ),
                  AppSize.sizeH20,
                  // Center(
                  //   child: Column(
                  //     children: const [
                  //       // Stack(
                  //       //   children: [
                  //       //     CircleAvatar(
                  //       //       backgroundImage: MemoryImage(
                  //       //           const Base64Decoder().convert(
                  //       //               registerPov.imageToString)),
                  //       //       radius: 64,
                  //       //     ),
                  //       //     Positioned(
                  //       //       bottom: -10,
                  //       //       left: 80,
                  //       //       child: IconButton(
                  //       //         onPressed: registerPov.pickImage,
                  //       //         icon: const Icon(
                  //       //           Icons.add_a_photo,
                  //       //           color: Colors.deepPurple,
                  //       //         ),
                  //       //       ),
                  //       //     ),
                  //       //   ],
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  // AppSize.sizeH20,
                  // TextFieldWidgets(
                  //   controller: registerPov.usernameController,
                  //   text: 'User Name',
                  //   inputType: TextInputType.text,
                  //   isObscure: false,
                  //   isRead: false,
                  // ),
                  AppSize.sizeH20,
                  // email TextFiled
                  TextFieldWidgets(
                    controller: emailController,
                    text: 'E-mail',
                    inputType: TextInputType.emailAddress,
                    isObscure: false,
                    isRead: false,
                    validation: (value) {
                      if (value!.isEmpty) {
                        'Please Enter Your Email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                  AppSize.sizeH10,

                  // AppSize.sizeH10,
                  // password TextField
                  TextFieldWidgets(
                    controller: passwordController,
                    text: 'Password',
                    inputType: TextInputType.text,
                    isObscure: true,
                    isRead: false,
                    validation: (value) {
                      final regex = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return 'Please Enter your Password';
                      }
                      if (!regex.hasMatch(value)) {
                        return "Please Enter valid Password(Min.6 charecter)";
                      }
                      return null;
                    },
                  ),
                  AppSize.sizeH20,
                  // confirm TextField

                  AppSize.sizeH20,
                  // SignIn Button
                  if (authProvider.loading)
                    const CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  if (!authProvider.loading)
                    GestureDetector(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('email', emailController.text.trim());
                          // registerPov.signUp(authProvider, context);
                          signUpUser();
                        }
                      },
                      child: const ButtonWidgets(
                        text: 'Sign Up',
                      ),
                    ),
                  AppSize.sizeH20,
                  // Not a member
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already Join?',
                          style: AppTextStyle.memberText),
                      GestureDetector(
                          onTap: () {
                            NavigateFunctions.pushPage(
                              context,
                              const LoginPage(),
                            );
                            // registerPov.emailcontroller.clear();
                            // registerPov.passwordcontroller.clear();
                            // registerPov.usernameController.clear();
                          },
                          child: const Text(' Login Now',
                              style: AppTextStyle.loginRegsiterText)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
