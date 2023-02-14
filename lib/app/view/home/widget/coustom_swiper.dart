// import 'package:flutter/material.dart';
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
// import 'package:review_games/app/view/widget/daillies_card.dart';

// class CoustomSwiperWidget extends StatefulWidget {
//   const CoustomSwiperWidget({Key? key}) : super(key: key);

//   @override
//   State<CoustomSwiperWidget> createState() => _CoustomSwiperWidgetState();
// }

// class _CoustomSwiperWidgetState extends State<CoustomSwiperWidget> {
//   int _itemCount = 0;

//   bool _loop = false;

//   bool _autoplay = false;

//   int _autoplayDely = 0;

//   double _padding = 0;

//   bool _outer = false;

//   double _radius = 0;

//   double _viewportFraction = 0;

//   late SwiperLayout _layout;

//   int _currentIndex = 0;

//   late double _scale;

//   late Axis _scrollDirection;

//   late Curve _curve;

//   late double _fade;

//   late bool _autoplayDisableOnInteraction;

//   late CustomLayoutOption customLayoutOption;
//   @override
//   void didUpdateWidget(CoustomSwiperWidget oldWidget) {
//     customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3)
//         .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
//       const Offset(-370.0, -40.0),
//       const Offset(0.0, 0.0),
//       const Offset(370.0, -40.0)
//     ]);
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void initState() {
//     customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3)
//         .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
//       const Offset(-350.0, 0.0),
//       const Offset(0.0, 0.0),
//       const Offset(350.0, 0.0)
//     ]);
//     _fade = 1.0;
//     _currentIndex = 0;
//     _curve = Curves.ease;
//     _scale = 0.8;
//     _controller = SwiperController();
//     _layout = SwiperLayout.TINDER;
//     _radius = 10.0;
//     _padding = 0.0;
//     _loop = true;
//     _itemCount = 3;
//     _autoplay = false;
//     _autoplayDely = 3000;
//     _viewportFraction = 0.8;
//     _outer = false;
//     _scrollDirection = Axis.horizontal;
//     _autoplayDisableOnInteraction = false;
//     super.initState();
//   }

//   Widget buildSwiper() {
//     return Swiper(
//       onTap: (int index) {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text("New page"),
//             ),
//             body: Container(),
//           );
//         }));
//       },
//       customLayoutOption: customLayoutOption,
//       fade: _fade,
//       index: _currentIndex,
//       onIndexChanged: (int index) {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//       curve: _curve,
//       scale: _scale,
//       itemWidth: 300.0,
//       controller: _controller,
//       layout: _layout,
//       outer: _outer,
//       itemHeight: 200.0,
//       viewportFraction: _viewportFraction,
//       autoplayDelay: _autoplayDely,
//       loop: _loop,
//       autoplay: _autoplay,
//       itemBuilder: dailliesCard,
//       itemCount: _itemCount,
//       scrollDirection: _scrollDirection,
//       indicatorLayout: PageIndicatorLayout.COLOR,
//       autoplayDisableOnInteraction: _autoplayDisableOnInteraction,
//       pagination: const SwiperPagination(
//           builder: DotSwiperPaginationBuilder(
//               size: 20.0, activeSize: 20.0, space: 10.0)),
//     );
//   }

//   late SwiperController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
