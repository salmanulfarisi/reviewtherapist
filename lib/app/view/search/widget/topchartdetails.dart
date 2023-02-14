import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';

class TopChartDetails extends StatefulWidget {
  const TopChartDetails({Key? key}) : super(key: key);

  @override
  State<TopChartDetails> createState() => _TopChartDetailsState();
}

class _TopChartDetailsState extends State<TopChartDetails>
    with TickerProviderStateMixin {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Top Charts"),
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
        ),
      ),
    );
  }
}
