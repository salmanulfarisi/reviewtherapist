import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/utils/size.dart';
import 'package:reviewtherapist/app/view/profile/widget/tab_bar.dart';

import 'profile_edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: user.photoURL == ''
                  ? const NetworkImage(
                      "https://prod.assets.earlygamecdn.com/images/warzone-2-release-date.jpg?mtime=1643176468")
                  : NetworkImage("${user.photoURL}"),
            ),
            AppSize.sizeW10,
            Text(
              user.displayName == '' ? "No Name" : "${user.displayName}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              NavigateFunctions.pushPage(context, const ProfileEdit());
            },
            icon: const Icon(
              Icons.arrow_right,
            ),
          ),
        ],
      ),
      body: const MediaSection(),
    );
  }
}
