// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/view/auth/otp_dialogue.dart';
import 'package:reviewtherapist/app/view/navbar_screen.dart';
import 'package:reviewtherapist/app/view/widget/dialogebox.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  User get currentUser => _auth.currentUser!;
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  // EMAIL SIGN UP
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      showDialog(
          context: context,
          builder: (context) => dialogeBox(
                context,
                "Email Verification",
                "Please verify your email first",
                Colors.red,
                () => sendEmailVerification(context),
                "Open Mail",
              ));

      // .then((value) => Fluttertoast.showToast(msg: 'Account created'));
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!currentUser.emailVerified) {
        showDialog(
          context: context,
          builder: (context) => dialogeBox(
            context,
            "Email Verification",
            "Please verify your email first",
            Colors.red,
            () => sendEmailVerification(context),
            "Resend & Open Mail",
          ),
        );

        // restrict access to certain things using provider
        // transition to another page instead of home screen
      } else {
        Fluttertoast.showToast(msg: 'Login Successful');
        NavigateFunctions.pushReplacePage(context, const NavbarScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      // ActionCodeSettings();
      var result = await OpenMailApp.openMailApp();

      // If no mail apps found, show error
      if (!result.didOpen && !result.canOpen) {
        showNoMailAppsDialog(context);

        // iOS: if multiple mail apps found, show dialog to select.
        // There is no native intent/default app system in iOS so
        // you have to do it yourself.
      } else if (!result.didOpen && result.canOpen) {
        showDialog(
          context: context,
          builder: (_) {
            return MailAppPickerDialog(
              mailApps: result.options,
            );
          },
        );
      }

      // Fluttertoast.showToast(
      //     msg: 'Please check your email for verification link');
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  // PHONE SIGN IN
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    TextEditingController codeController = TextEditingController();
    // if (kIsWeb) {
    //   // // !!! Works only on web !!!
    //   // ConfirmationResult result =
    //   //     await _auth.signInWithPhoneNumber(phoneNumber);

    //   // // Diplay Dialog Box To accept OTP
    //   // showOTPDialog(
    //   //   codeController: codeController,
    //   //   context: context,
    //   //   onPressed: () async {
    //   //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //   //       verificationId: result.verificationId,
    //   //       smsCode: codeController.text.trim(),
    //   //     );

    //   //     await _auth.signInWithCredential(credential);
    //   //     Navigator.of(context).pop(); // Remove the dialog box
    //   //   },
    //   // );
    // } else {
    // FOR ANDROID, IOS
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      //  Automatic handling of the SMS code
      verificationCompleted: (PhoneAuthCredential credential) async {
        // !!! works only on android !!!
        await _auth.signInWithCredential(credential);
      },
      // Displays a message when verification fails
      verificationFailed: (e) {
        // showSnackBar(context, e.message!);
        log(e.message.toString());
        Fluttertoast.showToast(msg: e.message.toString());
      },
      // Displays a dialog box when OTP is sent
      codeSent: ((String verificationId, int? resendToken) async {
        showOTPDialog(
          codeController: codeController,
          context: context,
          onPressed: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: codeController.text.trim(),
            );
            if (verificationId.isEmpty) {
              Fluttertoast.showToast(msg: 'Please enter OTP');
            } else {
              await _auth.signInWithCredential(credential);
              Navigator.of(context).pop(); // Remove the dialog box
              if (currentUser.phoneNumber != null) {
                Fluttertoast.showToast(msg: 'Login Successful');
                NavigateFunctions.pushReplacePage(
                    context, const NavbarScreen());
              }
            }
          },
        );
      }),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }
}
