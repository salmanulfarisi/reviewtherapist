import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: const [
          CircleAvatar(),
          Text(
            'Games, Posts ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Spacer(),
          Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
