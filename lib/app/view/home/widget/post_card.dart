import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/view/home/widget/gameprofile.dart';
import 'package:reviewtherapist/app/view/home/widget/icon_text_row.dart';

class PostCard extends StatefulWidget {
  final String title;
  final String image;
  final String gameName;
  int? totalLike;
  int? totalSaved;
  int? totalComment;
  PostCard({
    Key? key,
    required this.title,
    required this.image,
    required this.gameName,
    this.totalLike,
    this.totalSaved,
    this.totalComment,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isSaved = false;
  bool isLiked = false;
  bool isCommented = false;
  int likeClicked = 0;
  int savedClicked = 0;
  int commentClicked = 0;

  void likeIncrementDecrement() {
    setState(() {
      if (isLiked) {
        likeClicked--;
        widget.totalLike! - likeClicked;
        isLiked = false;
      } else {
        likeClicked++;
        widget.totalLike! + likeClicked;
        isLiked = true;
      }
    });
  }

  void savedIncrementDecrement() {
    setState(() {
      if (isSaved) {
        savedClicked--;
        widget.totalSaved! - savedClicked;
        isSaved = false;
      } else {
        savedClicked++;
        widget.totalSaved! + savedClicked;
        isSaved = true;
      }
    });
  }

  void commentIncrementDecrement() {
    setState(() {
      if (isCommented) {
        commentClicked--;
        widget.totalComment! - commentClicked;
        isCommented = false;
      } else {
        commentClicked++;
        widget.totalComment! + commentClicked;
        isCommented = true;
      }
    });
  }

  String after1000(int total) {
    if (total >= 1000000) {
      return (total / 1000000).toStringAsFixed(1) + 'M';
    } else if (total >= 1000) {
      return (total / 1000).toStringAsFixed(1) + 'K';
    } else {
      return total.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(
                  widget.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GameProfile(
            gameName: widget.gameName,
            image: widget.image,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconTextwidget(
                  icon: CupertinoIcons.hand_thumbsup,
                  iconPressed: CupertinoIcons.hand_thumbsup_fill,
                  text: widget.totalLike! + likeClicked >= 1000
                      ? after1000(widget.totalLike! + likeClicked)
                      : "${widget.totalLike! + likeClicked}",
                  // : "${widget.totalLike + likeClicked}",
                  isPressed: isLiked,
                  onPressed: () {
                    likeIncrementDecrement();
                  },
                ),
                IconTextwidget(
                  icon: CupertinoIcons.bookmark,
                  iconPressed: CupertinoIcons.bookmark_fill,
                  text: widget.totalSaved! >= 1000
                      ? after1000(widget.totalSaved! + savedClicked)
                      : "${widget.totalSaved! + savedClicked}",
                  isPressed: isSaved,
                  onPressed: () {
                    savedIncrementDecrement();
                  },
                ),
                IconTextwidget(
                  icon: CupertinoIcons.chat_bubble_text,
                  iconPressed: CupertinoIcons.chat_bubble_text_fill,
                  text: widget.totalComment! >= 1000
                      ? after1000(widget.totalComment! + commentClicked)
                      : "${widget.totalComment! + commentClicked}",
                  isPressed: isCommented,
                  onPressed: () {
                    commentIncrementDecrement();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
