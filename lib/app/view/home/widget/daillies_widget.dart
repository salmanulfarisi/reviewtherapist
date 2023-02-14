import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/constants.dart';
import 'package:reviewtherapist/app/view/home/widget/daillies_card.dart';

class DailliesWidget extends StatelessWidget {
  final String? month;
  final String? day;
  final String? posterPath;
  final String? movieName;
  final String? description;
  const DailliesWidget({
    Key? key,
    this.month = 'JAN',
    this.day = '01',
    this.posterPath =
        'https://prod.assets.earlygamecdn.com/images/warzone-2-release-date.jpg?mtime=1643176468',
    this.movieName = 'Worzone Mobile Android Optimization is Worse Now?!',
    this.description = 'Call of Duty Mobile',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month!,
                style: const TextStyle(
                  fontSize: 16,
                  color: kColorGrey,
                ),
              ),
              Text(
                day!,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 70,
          height: 400,
          child: const DialliesCard(),
        ),
        // SizedBox(
        //   width: size.width - 100,
        //   height: 400,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       VideoWidget(
        //         url: posterPath!,
        //       ),
        //       Row(
        //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Expanded(
        //             child: Text(
        //               movieName!,
        //               maxLines: 1,
        //               overflow: TextOverflow.ellipsis,
        //               style: const TextStyle(
        //                   color: Colors.white,
        //                   // letterSpacing: -5,
        //                   fontSize: 35,
        //                   fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //           // const Spacer(),
        //           const CustomWidgetButton(
        //             icon: Icons.notifications,
        //             title: 'Remind Me',
        //             iconsize: 20,
        //             fontsize: 12,
        //           ),
        //           kwidth,
        //           const CustomWidgetButton(
        //             icon: Icons.info,
        //             title: 'Info',
        //             iconsize: 20,
        //             fontsize: 12,
        //           ),
        //           kwidth,
        //         ],
        //       ),
        //       Text("Coming on $day $month",
        //           style: const TextStyle(
        //             color: kColorGrey,
        //           )),
        //       kHeight,
        //       Text(
        //         movieName!,
        //         style: const TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white,
        //         ),
        //       ),
        //       Text(
        //         description!,
        //         maxLines: 5,
        //         overflow: TextOverflow.ellipsis,
        //         style: const TextStyle(
        //           color: kColorGrey,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
