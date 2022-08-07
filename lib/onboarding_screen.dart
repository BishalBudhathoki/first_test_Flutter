import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_page.dart';
import 'intro_screens/intro_page_1.dart';
import 'intro_screens/intro_page_2.dart';
import 'intro_screens/intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen({Key? key}): super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              //   Container(
              //     color: Colors.cyan,
              //   ),
              //   Container(
              //     color: Colors.pinkAccent,
              //   ),
              //   Container(
              //     color: Colors.green,
              //   )
              // ],
            ]),
            Container(
              alignment: const Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                      child: const Text('Skip'),
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastPage
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return const HomePage();
                              }
                          ),
                      );
                    },
                    child: const Text('Done'),
                    )
                  : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn
                      );
                    },
                    child: const Text('Next'),
                    ),
                ]
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}