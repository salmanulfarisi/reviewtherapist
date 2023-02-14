import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/view/search/widget/newrealeasecard.dart';

import 'newreleasedetails.dart';

class NewReleaseContainer extends StatelessWidget {
  const NewReleaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewReleaseDetails()));
          },
          child: NewRealeaseCard(
            image: newRelease[index],
            gameName: newReleaseName[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 10,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
