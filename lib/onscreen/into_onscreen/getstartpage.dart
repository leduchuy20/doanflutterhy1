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
        title: 'Chào Mừng Đến Với TCH Spa',
        description: 'Dịch Vụ Spa Tốt Nhất Hiện Nay.',
      ),
      _buildPage(
        image: 'assets/images/spa2.png',
        title: 'Kỹ Thuật Spa Tiên Tiến',
        description: 'Hãy Đến Và Trải Nghiệm Dịch Vụ Của Chúng Tôi.',
      ),
      _buildPage(
        image: 'assets/images/spa3.png',
        title: 'Nhân Viên Chăm Sóc Tận Tình',
        description:
            'Đảm Bảo Bạn Sẽ Có 1 Trải Nghiệm Tốt Hơn Bất Cứ Nơi Nào Khác.',
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
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to home screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SinginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade200,
                        shape: StadiumBorder()),
                    child: Text(
                      'Get Started',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
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
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.pink.shade200,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.pink.shade200,
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                            shape: StadiumBorder(),
                            foregroundColor: Colors.redAccent),
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
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.pink.shade200, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
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
        color: active ? Colors.pink.shade200 : Colors.grey,
      ),
    );
  }
}
