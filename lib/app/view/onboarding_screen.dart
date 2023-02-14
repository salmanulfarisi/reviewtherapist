import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:reviewtherapist/app/utils/navigate_funtions.dart';
import 'package:reviewtherapist/app/utils/samble_strings.dart';
import 'package:reviewtherapist/app/utils/size.dart';
import 'package:reviewtherapist/app/view/auth/login_page.dart';
import 'package:reviewtherapist/app/view/auth/phone/phone_auth.dart';
import 'package:reviewtherapist/app/view/widget/dot_indicator.dart';
import 'package:reviewtherapist/app/view/widget/get_started.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(newRelease[currentPage]),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          PageView(
            controller: pageController,
            children: <Widget>[
              _buildPageContent(
                context,
                'Reviews of All Games',
                'Find the best games and read reviews from ReviewTherapist.',
                newRelease[0],
              ),
              _buildPageContent(
                context,
                'Game Updations',
                'Get the latest updates of your favorite games.',
                newRelease[1],
              ),
              _buildPageContent(
                context,
                'Review Therapist',
                'Get the latest updates of your favorite games.',
                newRelease[2],
              ),
              _lastPage()
            ],
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 10.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: currentPage,
                  ),
                ),
                Center(
                  child: currentPage == 3
                      // ? TextButton(
                      //     onPressed: () {
                      //       // Navigator.pushReplacement(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) => const LoginPage()));
                      //     },
                      //     child: const Text(
                      //       '',
                      //       style: TextStyle(color: Colors.red),
                      //     ),
                      //   )
                      ? Container()
                      : TextButton(
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.red),
                          )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(
    BuildContext context,
    String title,
    String description,
    String image,
  ) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  height: 450.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0,
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 10.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
            // const SizedBox(
            //   height: 20.0,
            // ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18.0,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lastPage() {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Review Therapist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Get the latest updates of your favorite games.',
              style: TextStyle(
                fontSize: 18.0,
                height: 1.5,
              ),
            ),
            const Spacer(),
            const Text("Let's Get Started with"),
            AppSize.sizeH20,
            GetStartedWidget(
              text: "Get started with Google",
              icon: LineIcons.googleLogo,
              onTap: () {
                log('Google');
              },
            ),
            AppSize.sizeH20,
            GetStartedWidget(
              text: "Get started with Email",
              icon: Icons.mail_outline_rounded,
              onTap: () {
                NavigateFunctions.pushReplacePage(context, const LoginPage());
              },
            ),
            AppSize.sizeH20,
            GetStartedWidget(
              text: "Get started with phone",
              icon: LineIcons.phone,
              onTap: () {
                log('phone');
                NavigateFunctions.pushPage(context, const PhoneAuthPage());
              },
            ),
            AppSize.sizeH20,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
