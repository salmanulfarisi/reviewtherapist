import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/view/home/widget/daillies_widget.dart';

class AllDailliesWidget extends StatelessWidget {
  const AllDailliesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: ListView.separated(
        itemBuilder: (context, index) => DailliesWidget(
          month: monthDaillies[index],
          day: dayDaillies[index],
          movieName: gameNamePostCard[index],
          posterPath: gameImagePostCard[index],
          description: titlePostCard[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
