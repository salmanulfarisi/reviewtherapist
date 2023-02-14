import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/view/search/widget/gamelistview.dart';

class TopChartCard extends StatelessWidget {
  final int index;
  const TopChartCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                gameImagePostCard[index],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: Text(
            index == 0
                ? "Upcoming"
                : index == 1
                    ? "Popular"
                    : "Beta",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          right: 5,
          bottom: 20,
          child: const GameListView(),
        ),
      ],
    );
  }
}
