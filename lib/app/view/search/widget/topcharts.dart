import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/view/search/widget/morecontainer.dart';
import 'package:reviewtherapist/app/view/search/widget/topchartcard.dart';

class TopCharts extends StatelessWidget {
  const TopCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int itemcount = 4;
    return SizedBox(
      height: 350,
      child: ListView.separated(
        itemBuilder: (context, index) => index == 3
            ? const MoreContainer()
            : TopChartCard(
                index: index,
              ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 4,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
