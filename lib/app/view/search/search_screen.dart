import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/view/search/widget/newrealease_container.dart';
import 'package:reviewtherapist/app/view/search/widget/serachcontainer.dart';
import 'package:reviewtherapist/app/view/search/widget/topcharts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SearchContainer(),
                SizedBox(height: 10),
                Text("New Releases",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                SizedBox(height: 10),
                NewReleaseContainer(),
                SizedBox(height: 10),
                Text(
                  "Top Charts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TopCharts()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
