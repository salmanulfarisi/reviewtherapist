import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/utils/size.dart';

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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Row(
            children: const [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
              ),
              AppSize.sizeW10,
              Text('User Name', style: TextStyle(fontSize: 16)),
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
          bottom: TabBar(
            controller: _controller,

            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            // indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.red,
            ),
            tabs: [
              Tab(
                text: chipText[0],
              ),
              Tab(
                text: chipText[1],
              ),
              Tab(
                text: chipText[2],
              ),
              Tab(
                text: chipText[3],
              ),
              Tab(
                text: chipText[4],
              ),
              Tab(
                text: chipText[5],
              ),
            ],
          )),
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
