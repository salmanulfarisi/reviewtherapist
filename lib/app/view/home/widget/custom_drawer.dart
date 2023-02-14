import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/view/onboarding_screen.dart';
import 'package:reviewtherapist/app/view/widget/dialogebox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    void logout() async {
      await auth.signOut();
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    CupertinoIcons.person,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: const Text('Home'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.person,
              color: Colors.white,
            ),
            title: const Text('Profile'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.info,
              color: Colors.white,
            ),
            title: const Text('About'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.square_arrow_left,
              color: Colors.white,
            ),
            title: const Text('Logout'),
            onTap: () async {
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

              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              prefs.remove('phone');
              prefs.remove('google');
            },
          ),
        ],
      ),
    );
  }
}
