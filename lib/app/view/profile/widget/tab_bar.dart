import 'package:flutter/material.dart';

class MediaSection extends StatefulWidget {
  const MediaSection({Key? key}) : super(key: key);

  @override
  State<MediaSection> createState() => _MediaSectionState();
}

class _MediaSectionState extends State<MediaSection> {
  List<String> tabs = [
    "Liked Posts",
    "Saved Posts",
  ];
  int current = 0;
  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 96;
      case 2:
        return 192;
      case 3:
        return 263;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 50;
      case 2:
        return 50;
      case 3:
        return 50;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.45,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: size.width,
            height: size.height * 0.04,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.04,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 23, top: 7),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Text(
                                  tabs[index],
                                  style: TextStyle(
                                    fontSize: current == index ? 16 : 14,
                                    fontWeight: current == index
                                        ? FontWeight.w400
                                        : FontWeight.w300,
                                    color: current == index
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ));
                        }),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.fastLinearToSlowEaseIn,
                  bottom: 0,
                  left: changePositionedOfLine(),
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(left: 10),
                    width: changeContainerWidth(),
                    height: size.height * 0.008,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          current == 0 ? const Text('data') : Container(),
          current == 1 ? const Text('save') : Container(),
        ],
      ),
    );
  }
}
