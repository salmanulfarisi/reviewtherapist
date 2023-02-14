import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/view/home/widget/comment_listtile.dart';
import 'package:reviewtherapist/app/view/home/widget/containers.dart';

import 'mention_gamelist.dart';

class PostDetails extends StatelessWidget {
  final String image;
  final String gameName;
  final int index;
  final String title;
  final bool isSecondImage;
  const PostDetails({
    Key? key,
    required this.image,
    required this.gameName,
    required this.index,
    this.title = 'Post Title',
    this.isSecondImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> line = postBlog[index].split('\n');
    return Scaffold(
      appBar: CoustomAppBar(
        image: image,
        gameName: gameName,
        index: index,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                postDate[index],
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              imageContainer(image: image),
              const SizedBox(
                height: 10,
              ),
              isSecondImage
                  ? Column(
                      children: [
                        Text(
                          line.sublist(0, 2).join("\n"),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        isSecondImage
                            ? imageContainer(image: image)
                            : const SizedBox(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          line.sublist(2, line.length).join("\n"),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      postBlog[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Mentioned Games',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => MentionGamesListTile(
                    image: image,
                    gameName: gameName,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CommentListTile(
                        index: index,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: commentUser.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  final String gameName;
  final int index;
  const CoustomAppBar(
      {Key? key,
      required this.image,
      required this.gameName,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        backgroundColor: Colors.black45,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameName,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  userCount[index],
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
              color: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('Report'),
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    const PopupMenuItem(
                      child: Text('Share'),
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ]),
        ],
      ),
      preferredSize: const Size.fromHeight(50),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
