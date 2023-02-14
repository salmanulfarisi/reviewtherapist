import 'package:flutter/material.dart';
import 'package:reviewtherapist/app/model/rive_asset.dart';
import 'package:reviewtherapist/app/utils/animated_bar.dart';
import 'package:reviewtherapist/app/utils/constants.dart';
import 'package:reviewtherapist/app/utils/rive_utils.dart';
import 'package:reviewtherapist/app/view/home/home_screen.dart';
import 'package:reviewtherapist/app/view/notification_screen.dart';
import 'package:reviewtherapist/app/view/profile_screen.dart';
import 'package:reviewtherapist/app/view/search/search_screen.dart';
import 'package:reviewtherapist/app/view/timer_screen.dart';
import 'package:rive/rive.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  List pages = [
    const HomeScreen(),
    const SearchScreen(),
    const TimerScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  SMIBool? homeTrigger;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          pages[currentIndex],
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index] != selectedBottomNav) {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                          changePage(index);
                        });
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                            isActive: bottomNavs[index] == selectedBottomNav),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity: bottomNavs[index] == selectedBottomNav
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);

                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
