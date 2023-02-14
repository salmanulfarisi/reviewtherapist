import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';

class CommentListTile extends StatefulWidget {
  final int index;
  const CommentListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CommentListTile> createState() => _CommentListTileState();
}

class _CommentListTileState extends State<CommentListTile> {
  bool isLiked = false;
  int likeClicked = 10;
  void likeIncrementDecrement() {
    setState(() {
      if (isLiked) {
        isLiked = false;
        likeClicked--;
      } else {
        isLiked = true;
        likeClicked++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            commentUser[widget.index],
          ),
        ),
        title: Text(
          comment[widget.index],
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          commentDate[widget.index],
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: isLiked
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      likeIncrementDecrement();
                    },
                    child: const Icon(
                      Icons.thumb_up_rounded,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    '$likeClicked',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            : GestureDetector(
                onTap: () {
                  likeIncrementDecrement();
                },
                child: const Icon(
                  Icons.thumb_up_off_alt_outlined,
                  color: Colors.white,
                ),
              ));
  }
}
