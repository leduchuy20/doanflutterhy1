import 'package:doan_flutter/onscreen/into_onscreen/page1.dart';
import 'package:doan_flutter/onscreen/into_onscreen/page2.dart';
import 'package:doan_flutter/onscreen/into_onscreen/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:doan_flutter/onscreen/into_onscreen/intro.dart';
import 'package:doan_flutter/uidata.dart';

class OnScreen extends StatefulWidget {
  const OnScreen({super.key});

  @override
  State<OnScreen> createState() => _OnScreenState();
}

class _OnScreenState extends State<OnScreen> {
  final PageController _controller = PageController();
  //check is last page?
  bool checkLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (value) {
            setState(() {
              checkLastPage = (value == 2);
            });
          },
          controller: _controller,
          children: const [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///SKIP

              GestureDetector(
                child: Text("Skip"),
              ),

              ///
              SmoothPageIndicator(controller: _controller, count: 3),

              ///check last page if last page is done
              checkLastPage
                  ? GestureDetector(
                      child: Text("Done"),
                      onTap: () {
                        // _controller.nextPage(
                        //   duration: Duration(milliseconds: 500),
                        //   curve: Curves.easeIn,
                        // );
                        Navigator.pushNamed(context, UIData.introPageRoute);
                        duration:
                        Duration(milliseconds: 500);
                        curve:
                        Curves.easeIn;
                      },
                    )
                  : GestureDetector(
                      child: Text("Next"),
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
            ],
          ),
        )
      ],
    ));
  }
}
