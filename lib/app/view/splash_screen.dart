import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:reviewtherapist/app/view/navbar_screen.dart';
import 'package:reviewtherapist/app/view/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValidation();
  }

  Future getValidation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getString('email');
    var isPhone = prefs.getString('phone');
    var isGoogle = prefs.getString('google');

    if (isLogin != null || isPhone != null || isGoogle != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NavbarScreen()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitFadingCircle(
      color: Colors.white,
      size: 50.0,
    );
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Add_a_heading__1_-removebg-preview.png'),
          spinkit,
        ],
      )),
    );
  }
}
