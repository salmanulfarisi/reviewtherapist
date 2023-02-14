import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/view/search/widget/topchartdetails.dart';

class MoreContainer extends StatelessWidget {
  const MoreContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TopChartDetails()));
      },
      child: Container(
        width: 80,
        height: 280,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black54,
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "More",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.arrow_right,
              color: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
