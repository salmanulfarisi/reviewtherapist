// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reviewtherapist/app/controller/auth/auth_provider.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/utils/size.dart';
import 'package:reviewtherapist/app/utils/textstyles.dart';
import 'package:reviewtherapist/app/view/auth/firebase_auth_methods.dart';
import 'package:reviewtherapist/app/view/auth/forget_password.dart';
import 'package:reviewtherapist/app/view/auth/register_page.dart';
import 'package:reviewtherapist/app/view/widget/button_widget.dart';
import 'package:reviewtherapist/app/view/widget/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  // final VoidCallback showRegisterPage;
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final firebaseUser = context.watch<User?>();
    // final loginPov = Provider.of<LoginProvider>(context);

    final formkey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void loginUser() {
      context.read<FirebaseAuthMethods>().loginWithEmail(
            email: emailController.text,
            password: passwordController.text,
            context: context,
          );
    }

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
                    'Hello Again!',
                    style: AppTextStyle.heading1,
                  ),
                  const Text(
                    'Welcome back, you\'ve been Missed!',
                    style: AppTextStyle.heading2,
                  ),
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
                        return "Enter valid Password(Min.6 charecter)";
                      }
                      return null;
                    },
                  ),
                  AppSize.sizeH10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => NavigateFunctions.pushPage(
                              context, const ResetPassWordPage()),
                          child: const Text(
                            'Forget Password?',
                            style: AppTextStyle.forgetText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSize.sizeH10,
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
                          // loginPov.signIn(authProvider, context);
                          loginUser();
                        }

                        // loginPov.signIn(emailcontroller.text.trim(),
                        //     passwordcontroller.text.trim());
                      },
                      child: const ButtonWidgets(
                        text: 'Sign In',
                      ),
                    ),
                  AppSize.sizeH10,
                  // Not a member
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member?',
                          style: AppTextStyle.memberText),
                      GestureDetector(
                          onTap: () {
                            NavigateFunctions.pushPage(
                                context, const RegisterPage());
                            // loginPov.emailcontroller.clear();
                            // loginPov.passwordcontroller.clear();
                          },
                          child: const Text(' Register Now',
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
