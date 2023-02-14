import 'package:flutter/material.dart';

class GameProfile extends StatelessWidget {
  final String gameName;
  final String image;
  const GameProfile({Key? key, required this.gameName, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          gameName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
