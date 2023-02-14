import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/view/home/widget/alldaillies_widget.dart';
import 'package:reviewtherapist/app/view/home/widget/allpost_widget.dart';
import 'package:reviewtherapist/app/view/home/widget/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Text('Review Therapist'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell),
            ),
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 30,
                child: Icon(CupertinoIcons.person),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: const [
              SafeArea(
                child: SingleChildScrollView(
                  child: AllPostwidget(),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: AllDailliesWidget(),
                ),
              ),
              Text('Arcade'),
              Text('Action'),
              Text('Adventure'),
              Text('Casual'),
            ]),
      ),
    );
  }
}
