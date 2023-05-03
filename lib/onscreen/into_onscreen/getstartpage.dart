import 'package:doan_flutter/btnavigator/bottom.dart';
import 'package:doan_flutter/home/home.dart';
import 'package:doan_flutter/onscreen/into_onscreen/intro.dart';
import 'package:doan_flutter/sign_in/sgininpage.dart';
import 'package:doan_flutter/sign_in/siginform.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool checkLastPage = false;

  List<Widget> _buildPages() {
    return [
      _buildPage(
        image: 'assets/images/spa1.png',
        title: 'Welcome to My App',
        description: 'This is the description of the app.',
      ),
      _buildPage(
        image: 'assets/images/spa3.png',
        title: 'Features',
        description: 'This is the description of the features.',
      ),
      _buildPage(
        image: 'assets/images/spa3.png',
        title: 'Get Started',
        description: 'This is the description of how to get started.',
      ),
    ];
  }

  Widget _buildPage(
      {required String image,
      required String title,
      required String description}) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image, width: 300.0),
          SizedBox(height: 48.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
                checkLastPage = (page == 2);
              });
            },
            children: _buildPages(),
          ),
          Positioned(
            bottom: 64.0,
            left: 32.0,
            right: 32.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Navigate to home screen
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SinginPage()),
                    );
                  },
                  child: Text('Get Started'),
                ),
                SizedBox(height: 16.0),
                checkLastPage
                    ? TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => SinginPage()),
                          );
                        },
                        child: Text('Done'),
                      )
                    : TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Text('Next'),
                      ),
              ],
            ),
          ),
          Positioned(
            top: 32.0,
            right: 32.0,
            child: TextButton(
              onPressed: () {
                // Navigate to home screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SinginPage()),
                );
              },
              child: Text('Skip'),
            ),
          ),
          Positioned(
            bottom: 32.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < _buildPages().length; i++)
                  if (i == _currentPage)
                    _buildPageIndicator(active: true)
                  else
                    _buildPageIndicator(active: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator({required bool active}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: active ? 16.0 : 8.0,
      height: active ? 16.0 : 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.blue : Colors.grey,
      ),
    );
  }
}
