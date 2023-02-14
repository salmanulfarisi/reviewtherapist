import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';

class DialliesCard extends StatefulWidget {
  const DialliesCard({Key? key}) : super(key: key);

  @override
  State<DialliesCard> createState() => _DialliesCardState();
}

class _DialliesCardState extends State<DialliesCard> {
  // int _itemCount = 0;

  // bool _loop = false;

  // bool _autoplay = false;

  // int _autoplayDely = 0;

  // double _padding = 0;

  // bool _outer = false;

  // double _radius = 0;

  // double _viewportFraction = 0;

  // late SwiperLayout _layout;

  // int _currentIndex = 0;

  // late double _scale;

  late Axis _scrollDirection;

  // late Curve _curve;

  late bool _autoplayDisableOnInteraction;

  late SwiperController _controller;

  late CustomLayoutOption customLayoutOption;

  @override
  void didUpdateWidget(DialliesCard oldWidget) {
    customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3)
        .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate(
            [Offset(-370.0, -40.0), Offset(0.0, 0.0), Offset(370.0, -40.0)]);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3)
        .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate(
            [Offset(-350.0, 0.0), Offset(0.0, 0.0), Offset(350.0, 0.0)]);

    // _currentIndex = 0;
    // _curve = Curves.ease;
    // _scale = 0.8;
    _controller = SwiperController();
    // _layout = SwiperLayout.TINDER;
    // _radius = 10.0;
    // _padding = 0.0;
    // _loop = true;
    // _itemCount = 3;
    // _autoplay = false;
    // _autoplayDely = 3000;
    // _viewportFraction = 0.8;
    // _outer = false;
    _scrollDirection = Axis.horizontal;
    _autoplayDisableOnInteraction = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) => Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                gameImagePostCard[index],
                width: 400,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      image: NetworkImage(gameImagePostCard[index]),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      gameNamePostCard[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Call of Duty: Warzone[b] is a free-to-play battle royale video game released on March 10, 2020, for PlayStation 4, Xbox One, and Microsoft Windows. The game is a part of 2019\'s Call of Duty: Modern Warfare and is connected to 2020\'s Call of Duty: Black Ops: Cold War and 2021\'s Call of Duty: Vanguard, but does not require purchase of any of the aforementioned titles, and was introduced during Season 2 of Modern Warfare content',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      customLayoutOption: customLayoutOption,
      fade: 1.0,
      curve: Curves.ease,
      scale: 0.8,
      controller: _controller,
      // itemWidth: 300.0,
      layout: SwiperLayout.TINDER,
      outer: false,
      viewportFraction: 0.8,
      autoplayDelay: 10000,
      // loop: true,
      autoplay: false,
      scrollDirection: _scrollDirection,
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplayDisableOnInteraction: _autoplayDisableOnInteraction,
      pagination: const SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          size: 5.0,
          activeSize: 10.0,
          space: 5.0,
          activeColor: Colors.white,
        ),
      ),
    );
  }
}
