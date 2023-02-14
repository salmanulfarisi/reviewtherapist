import 'package:flutter/material.dart';

class MentionGamesListTile extends StatelessWidget {
  final String image;
  final String gameName;
  const MentionGamesListTile(
      {Key? key, required this.image, required this.gameName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.black54,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
          image,
        ),
      ),
      title: Text(
        gameName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Row(
        children: const [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '4.5',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          FittedBox(
            child: Text(
              'Action, Multiplayer',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.download_rounded,
        color: Colors.red,
      ),
    );
  }
}
