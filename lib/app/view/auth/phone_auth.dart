import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reviewtherapist/app/view/auth/firebase_auth_methods.dart';
import 'package:reviewtherapist/app/view/widget/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final TextEditingController phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFieldWidgets(
                controller: phoneController,
                text: 'Phone Number',
                inputType: TextInputType.phone,
                isObscure: false,
                isRead: false,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid phone number';
                  } else if (value.length < 10) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  _phoneNumber = '+91${phoneController.text}';
                  context
                      .read<FirebaseAuthMethods>()
                      .phoneSignIn(context, phoneController.text);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('phone', _phoneNumber!);
                }
              },
              child: const Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }

  void _showOTPPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('OTP'),
          content: Text('An OTP has been sent to $_phoneNumber'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
