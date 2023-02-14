import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/view/home/widget/post_card.dart';
import 'package:reviewtherapist/app/view/home/widget/post_details.dart';

class AllPostwidget extends StatelessWidget {
  const AllPostwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetails(
                    image: gameImagePostCard[index],
                    gameName: gameNamePostCard[index],
                    index: index,
                    title: titlePostCard[index],
                    isSecondImage: numberofImage[index]),
              ),
            );
          },
          child: PostCard(
            title: titlePostCard[index],
            image: gameImagePostCard[index],
            gameName: gameNamePostCard[index],
            totalLike: postLike[index],
            totalSaved: postSave[index],
            totalComment: postComment[index],
          ),
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
