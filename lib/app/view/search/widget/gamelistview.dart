import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';

class GameListView extends StatelessWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Material(
        color: Colors.transparent,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            // width: 180,
            // height: 200,
            child: Row(
              children: [
                Text(
                  "${index + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage(
                          newRelease[index],
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newReleaseName[index],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        Text(
                          "9.7",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Action",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
