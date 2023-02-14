import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/view/onboarding_screen.dart';
import 'package:reviewtherapist/app/view/widget/dialogebox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    void logout() async {
      await auth.signOut();
    }

    final storage = GetStorage();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Screen'),
            TextButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => dialogeBox(
                    context,
                    'Logout',
                    'Are you sure you want to logout?',
                    Colors.red,
                    logout,
                    'Logout',
                  ),
                ).whenComplete(() {
                  NavigateFunctions.pushReplacePage(
                      context, const OnboardingScreen());
                });
                storage.remove('email');
                storage.erase();

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                prefs.remove('phone');
                prefs.remove('google');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
