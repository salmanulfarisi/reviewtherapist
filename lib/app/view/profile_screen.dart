import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Screen'),
            TextButton(
              onPressed: () async {},
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
